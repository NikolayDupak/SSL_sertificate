#!/usr/bin/python3
import argparse
import os
import yaml
import ssl_check

file_config = "demo.yaml"


def load(conf_file):
    with open(conf_file) as file:
        sert_dict = yaml.load(file)
    return sert_dict


def save(sert_dict, conf_file):
    with open(conf_file, 'w') as file:
        yaml.dump(sert_dict, file)


def check_sert(file_name):
    # print(f'{file_name}')
    date_not_before, date_not_after = ssl_check.get_ssl_dates(file_name)
    res = f'{file_name}|{date_not_before}|{date_not_after}'
    return res


def all_sert():
    res = ''
    di = load(file_config)
    for sert in di['files']:
        res += check_sert(sert) + '\n'
    return res


def print_check_sert(file_name):
    # print(f'{file_name}')
    date_not_before, date_not_after = ssl_check.get_ssl_dates(file_name)
    print(f'File {file_name}')
    print(f'Not before {date_not_before} \n')
    print(f'Not after {date_not_after}')


def check_all_serts():
    di = load(file_config)
    for sert in di['files']:
        print_check_sert(sert)


def add_sert(file_name):
    di = load(file_config)
    print(f'Add - {file_name}')
    di['files'].append(file_name)
    save(di, file_config)


def remove_sert(remove_sert):
    di = load(file_config)
    if di['files'].index(remove_sert) == -1:
        return
    print(f'Remove - {remove_sert}')
    di['files'].remove(remove_sert)
    save(di, file_config)


def list_sert():
    di = load(file_config)
    for sert in di['files']:
        print(f'- {sert}')


parser = argparse.ArgumentParser()
parser.add_argument("--add", action="store", help="Add certificates to control")
parser.add_argument("--remove", action="store", help="remove certificates")
parser.add_argument("--list", action="store_true", help="list certificates")
parser.add_argument("--check", action="store", help="list certificates")
parser.add_argument("--checkall", action="store_true", help="list certificates")

args = parser.parse_args()
# print(args)
if args.add is not None:
    check_file = os.path.exists(args.add)
    if check_file:
        add_sert(args.add)
    else:
        print('File not found.')
if args.remove is not None:
    remove_sert(args.remove)

if args.list is not None:
    list_sert()
if args.check is not None:
    check_file = os.path.exists(args.add)
    if check_file:
        check_sert(args.check)
    else:
        print('File not found.')

if args.checkall:
    check_all_serts()
