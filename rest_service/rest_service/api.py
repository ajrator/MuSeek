import sys
import logging
from flask import Flask, request
# import redis
# r = redis.StrictRedis(host='127.0.0.1', port=6379, db=0)

app = Flask(__name__)
# So Flask errors log to stdout - nice for deploy logs and CI
app.logger.addHandler(logging.StreamHandler(sys.stdout))
app.logger.setLevel(logging.ERROR)

@app.route('/', methods=['POST'])
def post():
    text = request.form
    return "Aha, a POST request. You sent {}.".format(dict(request.form))

@app.route('/')
def index():
    return "Welcome to Musicmunchie API, v-0.1. You'll need to specify a service, " \
           "a key passed through GET, and data sent through POST."



if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=8000)
