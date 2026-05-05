#!/usr/bin/env python

# Author: J.A.Boogaard@hr.nl

from flask import Flask, render_template, request
from pymongo import MongoClient

# TODO Read credentials from .env
connectionString="mongodb://user:s3cret@localhost:27017/"

app = Flask(__name__)

# @app.route("/", methods=["GET", "POST"])
# def search():
    
#     if request.method == "POST":
#         query = request.form.get("query")
#         return query

#     else:
#         return render_template("index.html")
        
# Set up MongoDB connection and collection

client = MongoClient(connectionString)

# Create database named demo if they don't exist already
db = client['demo']

# Create collection named data if it doesn't exist already
collection = db['data']

# # GET /search
# @app.route("/search", methods=["GET", "POST"])
# def search():
    
#     if request.method == "POST":
#         query = request.form.get("query")
#         return query

#     else:
#         return render_template("index.html")

# GET /info
@app.route('/info')
def info_route():
    return client.server_info()

# # /dbs
# @app.route('/dbs')
# def get_dbs():
#     return client.list_database_names()

# # /docs
# @app.route('/docs')
# def get_docs():
#     docs = collection.find_one()
#     return json.loads(json_util.dumps(docs))

# # POST add_data
# @app.route('/add_data', methods=['POST'])
# def add_data():
#     # Get data from request
#     data = request.json

#     # Insert data into MongoDB
#     collection.insert_one(data)

#     return "Data added to MongoDB"

if __name__ == "__main__":
    app.run()        