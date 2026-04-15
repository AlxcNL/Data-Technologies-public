#!/usr/bin/env python

# Author: J.A.Boogaard@hr.nl

# https://kb.objectrocket.com/mongo-db/python-mongoclient-examples-1050
# https://www.geeksforgeeks.org/python/sending-data-from-a-flask-app-to-mongodb-database/

from flask import Flask, render_template, request
from pymongo import MongoClient
from bson import json_util
import json

app = Flask(__name__)

# Set up MongoDB connection and collection
client = MongoClient('mongodb://root:password@localhost:27017')

# Create database named demo if they don't exist already
db = client['demo']

# Create collection named data if it doesn't exist already
collection = db['data']

# GET /search
@app.route("/search", methods=["GET", "POST"])
def search():
    
    if request.method == "POST":
        query = request.form.get("query")
        return query

    else:
        return render_template("index.html")

# GET /info
@app.route('/info')
def info_route():
    return client.server_info()

# /dbs
@app.route('/dbs')
def get_dbs():
    return client.list_database_names()

# /docs
@app.route('/docs')
def get_docs():
    docs = collection.find_one()
    return json.loads(json_util.dumps(docs))

# POST add_data
@app.route('/add_data', methods=['POST'])
def add_data():
    # Get data from request
    data = request.json

    # Insert data into MongoDB
    collection.insert_one(data)

    return "Data added to MongoDB"

if __name__ == '__main__':
    app.run()