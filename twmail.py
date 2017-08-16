#!/usr/bin/env python3
from flask import Flask
from flask import request


app = Flask(__name__)


@app.route('/', methods=['GET'])
def hello_world():
    return 'Hi there'


if __name__ == '__main__':
    app.run()
