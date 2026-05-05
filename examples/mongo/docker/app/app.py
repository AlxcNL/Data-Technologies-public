#!/usr/bin/env python

# Author: J.A.Boogaard@hr.nl

# https://kb.objectrocket.com/mongo-db/python-mongoclient-examples-1050
# https://www.geeksforgeeks.org/python/sending-data-from-a-flask-app-to-mongodb-database/
# https://www.digitalocean.com/community/tutorials/how-to-use-mongodb-in-a-flask-application

from bson import json_util
from flask import Flask, render_template, request
from pymongo import MongoClient

# TODO Read credentials from .env
connectionString="mongodb://user:s3cret@mongodb:27017/"

app = Flask(__name__)
        
# Set up MongoDB connection and collection

client = MongoClient(connectionString)

# Create database named demo if they don't exist already
db = client['demo']

# Create collection named data if it doesn't exist already
collection = db['songs']

@app.route("/search", methods=["GET", "POST"])
def search():
    
    if request.method == "POST":
        query = request.form.get("query")
        return query

    else:
        return render_template("search.html")

@app.route('/hello', methods=["GET"])
def hello_world():
    return 'Hello, World!'

@app.route('/info', methods=["GET"])
def info_route():
    return client.server_info()

@app.route('/dbs', methods=["GET"])
def show_dbs():
    allDatabases = client.list_database_names()
    return render_template('databases.html', databases=allDatabases)

@app.route('/docs', methods=["GET"])
def get_docs():
    allDocs = collection.find()
    return render_template('docs.html', docs=allDocs)

if __name__ == "__main__":
    app.run()        