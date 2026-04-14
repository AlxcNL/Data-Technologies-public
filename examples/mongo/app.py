#!/usr/bin/env python

import scrapy                                  
import pymongo                                 
from flask_pymongo import PyMongo              
import flask                                   

app = flask.Flask(__name__)                    

mongodb_client = PyMongo(app, uri="mongodb://localhost:27017/todo_db")
db = mongodb_client.db

app.config["MONGO_URI"] = "mongodb://localhost:27017/todo_db"
mongodb_client = PyMongo(app)
db = mongodb_client.db

@app.route("/add_one")                         
def add_one():                                 
    db.todos.insert_one({'title': "todo title", 'body': "todo body"})

    return flask.json(message="succes")   

@app.route("/")
def home():
    todos = db.todos.find()
    return flask.jsonify([todo for todo in todos])    