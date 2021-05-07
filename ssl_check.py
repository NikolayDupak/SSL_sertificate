from datetime import datetime
from OpenSSL import crypto as c


def get_ssl_dates(file_name: str):
    """
    :param file_name:
    :return: date_not_before, date_not_after
    """
    # file_name = 'worker-0.pem'
    cert = c.load_certificate(c.FILETYPE_PEM, open(file_name).read())
    not_before = cert.get_notBefore().decode()
    not_after = cert.get_notAfter().decode()

    date_not_before = datetime.strptime(not_before, "%Y%m%d%H%M%SZ")
    date_not_after = datetime.strptime(not_after, "%Y%m%d%H%M%SZ")
    # print(date_not_before, date_not_after)
    return date_not_before, date_not_after
