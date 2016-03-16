import sys
import logging
from flask import Flask, request, abort, jsonify


# Instead of a database we use a global list of events and bands
# before the app is instantiated
events = []
bands = []


app = Flask(__name__)
# So Flask errors log to stdout - nice for deploy logs and CI
app.logger.addHandler(logging.StreamHandler(sys.stdout))
app.logger.setLevel(logging.ERROR)


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
        # print band
    except KeyError:
        abort(400)
        print "NOT REACHED"
    bands.append(band)
    print bands
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

@app.route('/', methods=['POST'])
def post():
    events.append(dict(request.form))
    return "Aha, a POST request. You sent {}.\n The global events dict is {}.\n".format(dict(request.form), events)

@app.route('/')
def index():
    return "Welcome to Musicmunchie API, v-0.1. You'll need to specify a service, " \
           "a key passed through GET, and data sent through POST."


if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=8000)
