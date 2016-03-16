import requests
import urllib
import json
import rides

CLIENT_ID = '82uAvOdn6kpD'
CLIENT_SECRET = '2Xju8uFKHrqn4AaSamlcCExeQXMoVjlA'
# REDIRECT_URI = "http://localhost:65010/reddit_callback"

from flask import Flask
app = Flask(__name__)


@app.route('/api/eta')
def eta():
    return rides.main()


@app.route('/')
def homepage():
    text = '<a href="%s">Authenticate with reddit</a>'
    return text % make_authorization_url()

def make_authorization_url():
    # Generate a random string for the state parameter
    # Save it for use later to prevent xsrf attacks
    from uuid import uuid4
    state = str(uuid4())
    save_created_state(state)
    params = {
              "grant_type"
              
              "scope": "public"}
    url = "https://api.lyft.com/oauth/token" + urllib.urlencode(params)
    return url

# Left as an exercise to the reader.
# You may want to stoimport requests
import requests.auth
def get_token(code):
    client_auth = requests.auth.HTTPBasicAuth(CLIENT_ID, CLIENT_SECRET)
    post_data = {"grant_type": "authorization_code",
                 "code": code,
                 "redirect_uri": REDIRECT_URI}
    response = requests.post("https://ssl.reddit.com/api/v1/access_token",
                             auth=client_auth,
                             data=post_data)
    token_json = response.json()
    return token_json["access_token"] #re valid states in a database or memcache,
# or perhaps cryptographically sign them and verify upon retrieval.
def save_created_state(state):
    pass
def is_valid_state(state):
    return True

# auth = request.auth.


# auth = requests.authhtttbasicauuth (client{id}, secret)


# response= request.post(
    # localhost+/oauth/token
    # auth=auth ^above
    # headers = application/jason
    # data=json.dumps({
        # grant type, client cridentals
        # scope: public })
# )


# save response.json['access_token']

# ^this is header for next request
#
# headers ("ahthorization: bearrer{}".format(((access_token))
    
if __name__ == '__main__':
    app.run(debug=True, port=5000)
