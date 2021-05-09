#!/usr/bin/python3
from flask import Flask
import main

app = Flask(__name__)

all_certificates = ""


@app.route('/')
def hello():
    return f'Hello'


@app.route('/all/')
def all_certificates():
    res = main.all_sert()
    return res


if __name__ == '__main__':
    app.run()
