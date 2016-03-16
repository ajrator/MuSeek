import math
import operator
from googleplaces import GooglePlaces, lang

# Should put this in a .gitignored config file or env var
API_KEY = 'AIzaSyBAJpWDwC7qnRwdhglSluIBr2cBucQqkxI'

# Connection handle for Google Places API
conn = GooglePlaces(API_KEY)

def get_distance(a, b):
    return math.sqrt(((float(b[1]) - float(a[1])) ** 2) + float((float(b[0])- float(a[0])) ** 2))

def nearest_match(user_lat, user_long, events, city='Austin, TX'):
    """Given a user location, event results, and a city, returns the nearest event.
    """
    names_and_distances = []
    for event in events:
        query_str = events['venue']
        query_result = conn.nearby_search(location=city, keyword=query_str,
                                    radius=20000)
        for place in query_result.places:
            adversarial_coordinate = [place.geo_location['lat'], place.geo_location['lng']]
            names_and_distances.append((place.name, get_distance([user_lat, user_long], adversarial_coordinate)))
    return min(names_and_distances, key=operator.itemgetter(1))
