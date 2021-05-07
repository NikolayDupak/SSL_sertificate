from flask import Flask
from ssl_check import get_ssl_dates

app = Flask(__name__)

all_certificates = ""


@app.route('/')
def certificates():
    file_name = "worker-0.pem"
    d1, d2 = get_ssl_dates(file_name)
    return f'{file_name} {d1} {d2}'


if __name__ == '__main__':

    app.run()
