#!/usr/bin/env python3

'''A Python module that provides stats about nginx'''

from pymongo import MongoClient

if __name__ == '__main__':
    '''Prints the log stats in nginx collection'''
    con = MongoClient('mongodb://localhost:27017')
    collection = con.logs.nginx

    print(f'{collection.estimated_document_count()} logs')

    methods = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE']
    print('Methods:')

    for req in methods:
        print(f'\tmethod {req}: {collection.count_documents({"method": req})}')

    print(f'{collection.count_documents({"method": "GET", "path": "/status"})} status check')
