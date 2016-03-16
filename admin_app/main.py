import sys
import logging
from flask import Flask, send_from_directory

app = Flask(__name__)
# So Flask errors log to stdout - nice for deploy logs and CI
app.logger.addHandler(logging.StreamHandler(sys.stdout))
app.logger.setLevel(logging.ERROR)

@app.route('/')
def index():
    return send_from_directory('dist', 'index.html')


if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=5000)
