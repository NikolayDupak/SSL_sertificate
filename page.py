#!/usr/bin/python3
from flask import Flask
from ssl_check import get_ssl_dates
import main

app = Flask(__name__)

all_certificates = ""


@app.route('/')
def certificates():
    file_name = "worker-0.pem"
    d1, d2 = get_ssl_dates(file_name)
    return f'{file_name} {d1} {d2}'


@app.route('/all')
def certificates():
    res = main.all_sert()
    return res


if __name__ == '__main__':
    app.run()
