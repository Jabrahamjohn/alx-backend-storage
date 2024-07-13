#!/usr/bin/env python3

'''A Python module tha provides stats about nginx'''

from pymongo import MongoClient

def get_nginx_stats():
    # Connect to MongoDB
    client = MongoClient("mongodb://localhost:27017/")
    
    # Access the logs database and the nginx collection
    db = client.logs
    collection = db.nginx
    
    # Get the total number of logs
    total_logs = collection.count_documents({})
    print(f"{total_logs} logs")
    
    # Define the HTTP methods we are interested in
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    
    # Print the Methods section
    print("Methods:")
    for method in methods:
        count = collection.count_documents({"method": method})
        print(f"\tmethod {method}: {count}")
    
    # Count documents with method GET and path /status
    get_status_count = collection.count_documents({"method": "GET", "path": "/status"})
    print(f"{get_status_count} status check")

if __name__ == "__main__":
    get_nginx_stats()
