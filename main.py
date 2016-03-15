import sys
import logging
from flask import Flask, request

app = Flask(__name__)
# So Flask errors log to stdout - nice for deploy logs and CI
app.logger.addHandler(logging.StreamHandler(sys.stdout))
app.logger.setLevel(logging.ERROR)


@app.route('/')
def index():
    return "Welcome to Musicmunchie Splash Page!"

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=5000)

