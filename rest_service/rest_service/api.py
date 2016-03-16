import sys
import logging
from flask import Flask, request, abort, jsonify
import requests
import urllib
import json
import rides
import requests.auth
from uuid import uuid4

# Instead of a database we use a global list of events and bands
# before the app is instantiated
events = []
bands = []

CLIENT_ID = '82uAvOdn6kpD'
CLIENT_SECRET = '2Xju8uFKHrqn4AaSamlcCExeQXMoVjlA'

app = Flask(__name__)

@app.route('/api/eta')
def eta():
    return rides.main()

def make_authorization_url():
    # Generate a random string for the state parameter
    # Save it for use later to prevent xsrf attacks
    state = str(uuid4())
    save_created_state(state)
    params = {
              "grant_type"

              "scope": "public"}
    url = "https://api.lyft.com/oauth/token" + urllib.urlencode(params)
    return url

def get_token(code):
    client_auth = requests.auth.HTTPBasicAuth(CLIENT_ID, CLIENT_SECRET)
    post_data = {"grant_type": "authorization_code",
                 "code": code,
                 "redirect_uri": REDIRECT_URI}
    response = requests.post("https://ssl.reddit.com/api/v1/access_token",
                             auth=client_auth,
                             data=post_data)
    token_json = response.json()
    return token_json["access_token"]

def save_created_state(state):
    pass

def is_valid_state(state):
    return True

@app.route('/clear', methods=['GET'])
def clear_everything():
    """Drop every record in the datastore.
    Useful to ensure consistency during testing.
    """
    global events, bands
    events = []
    bands = []
    return "All bands and events data deleted."

### Band Routes ###

@app.route('/bands', methods=['GET'])
def get_bands():
    """Get all the bands in the datastore
    """
    return jsonify({'bands': bands})

@app.route('/bands', methods=['POST'])
def add_band():
    """Add a band to the datastore
    """
    try:
        if not request.json or 'name' not in request.json['data']['attributes']:
            abort(400)
        band = {
            'id': bands[-1]['id'] + 1 if len(bands) != 0 else 0,
            'name': request.json['data']['attributes']['name'],
            'imageUrl': request.json['data']['attributes']['imageUrl']
        }
    except KeyError:
        abort(400)
        print "NOT REACHED"
    bands.append(band)
    return jsonify({'band': bands[-1]}), 201

@app.route('/bands/<int:band_id>', methods=['GET'])
def get_band(band_id):
    """Get a band from the datastore
    """
    band = [band for band in bands if band['id'] == band_id]
    if len(band) == 0:
        abort(404)
    return jsonify({'band': band[0]})

@app.route('/bands/<int:band_id>', methods=['DELETE'])
def remove_band(band_id):
    """Remove a band from the datastore
    """
    band = [band for band in bands if band['id'] == band_id]
    if len(band) == 0:
        abort(404)
    bands.remove(band[0])
    return jsonify({'bands': bands})

### Event Routes ###

@app.route('/events', methods=['GET'])
def get_events():
    """Get all the events in the datastore
    """
    return jsonify({'events': events})

@app.route('/events', methods=['POST'])
def add_event():
    """Add an event to the datastore
    """
    try:
        if not request.json or 'name' not in request.json['data']['attributes']:
            abort(400)
        event = {
            'id': events[-1]['id'] + 1 if len(events) != 0 else 0,
            'name': request.json['data']['attributes']['name'],
            'start': request.json['data']['attributes']['start'],
            'end': request.json['data']['attributes']['end'],
            'venue': request.json['data']['attributes']['venue'],
            # Band "foreign key"
            'band_id': request.json['relationships']['band']['data']['id']
        }
    except KeyError:
        abort(400)
        print "NOT REACHED"
    events.append(event)
    return jsonify({'event': events[-1]}), 201

@app.route('/events/<int:event_id>', methods=['GET'])
def get_event(event_id):
    """Get an event from the datastore
    """
    event = [event for event in events if event['id'] == event_id]
    if len(event) == 0:
        abort(404)
    return jsonify({'event': event[0]})

@app.route('/events/<int:event_id>', methods=['DELETE'])
def remove_event(event_id):
    """Remove a event from the datastore
    """
    event = [event for event in events if event['id'] == event_id]
    if len(event) == 0:
        abort(404)
    events.remove(event[0])
    return jsonify({'events': events})

@app.route('/', methods=['POST'])
def post():
    events.append(dict(request.form))
    return "Aha, a POST request. You sent {}.\n The global events dict is {}.\n".format(dict(request.form), events)

@app.route('/')
def index():
    return "Welcome to Museek API, v-0.1. You'll need to specify a service, " \
           "a key passed through GET, and data sent through POST."


if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=8000)

