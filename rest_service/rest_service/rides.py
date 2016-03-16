import requests
import json
from requests.auth import HTTPBasicAuth 
import requests.auth
import requests.packages.urllib3

#get rid of warnings
requests.packages.urllib3.disable_warnings() 

#Globals
CLIENT_ID = '82uAvOdn6kpD'
CLIENT_SECRET = '2Xju8uFKHrqn4AaSamlcCExeQXMoVjlA'
client_auth = ""

def get_token():
    global client_auth
    client_auth = requests.auth.HTTPBasicAuth(CLIENT_ID, CLIENT_SECRET)
    url = 'https://api.lyft.com/oauth/token'
    headers = {'content-type': 'application/json'}
    post_data = {"grant_type": "client_credentials",
                 "scope": "public"}
    response = requests.post(url, auth=client_auth, data=post_data)
    token_json = response.json()
    # print token_json 
    return token_json["access_token"]

def findEta(toke,lat,lon):
    global client_auth
    url = 'https://api.lyft.com/v1/eta?lat={0}&lng={1}'.format(lat,lon)
    header = {"Authorization": "Bearer {}".format(toke)}
    response = requests.get(url, headers=header)
    # print response.json()
    return response.json()


def findCost(toke,lat,lon, elat,elon):
    global client_auth
    url = 'https://api.lyft.com/v1/cost?start_lat={0}&start_lng={1}&end_lat={2}&end_lng={3}'.format(lat,lon, elat,elon)
    
    header = {"Authorization": "Bearer {}".format(toke)}
    response = requests.get(url, headers=header)
    # print response.json()
    return response.json()


def main():
    token = get_token()
    # this does not work in the hotel 
    # send_url = 'http://freegeoip.net/json'
    # r = requests.get(send_url)
    # j = json.loads(r.text)
    # lat = j['latitude']
    # lon = j['longitude']
    lat=30.2839947
    lon=-97.7441264
    eta = findEta(token,lat,lon)
    
    group = [] #get the fastest ride
    for ride in eta['eta_estimates']:
        group.append(ride['eta_seconds'])

    lats = [30.2625758,30.270285,30.2674095,30.2594127]
    lons = [-97.7270603,-97.7490023,-97.7360569,-97.7383437]

    static_locations= zip(lats,lons)
    formatter = ""
    
    # static_locations=[(30.2625758,30.270285),(30.2674095,30.2594127),(-97.7270603,-97.7490023),(-97.736059,-97.7383437)]
    for x in static_locations:
        cost = findCost(token,lat,lon,x[0],x[1])
        for ride in cost['cost_estimates']:
            formatter += "{} ${:.2f}\n".format(ride['ride_type'], ((ride['estimated_cost_cents_min']+ride['estimated_cost_cents_max'])/2.0)/100.0)
            # formatter +=str(ride['ride_type'],"$", ((ride['estimated_cost_cents_min']+ride['estimated_cost_cents_max'])/2.0)/100.0)
        # print "\n"
        formatter+="\n"
            
        
    
    m, s = divmod(min(group), 60)
    fastest = "Fastest ride: %02d:%02d min:sec" % (m, s)
    formatter +=fastest
    # print fastest
    # print formatter
    return formatter

if __name__ == "__main__":
    main()
