# _*_ coding: Utf-8 _*_

# Author: J.A.Boogaard@hr.nl

# from bson import json_util
from flask import Flask, render_template, request
from flask_bootstrap import Bootstrap
from pymongo import MongoClient

def connect2MongoDB(connectionString):
    return MongoClient(connectionString)

def createApp():
    app = Flask(__name__)
    Bootstrap( app )
    return app
    
def addEndpoints(app):        
    # TODO Read credentials from .env
    host = "mongodb"
    port = 27017
    connectionString = f"mongodb://root:password@{host}:{port}"
    client = MongoClient(connectionString)
    db = client['lyrics']
    collection = db['songs']
    
    @app.route('/', methods=["GET"])
    def home():
        return render_template("index.html")

    @app.route('/hello', methods=["GET"])
    def hello_world():
        return 'Hello, World!'

    @app.route("/test", methods=["GET", "POST"])
    def test():
        return render_template('test.html')

    @app.route('/dbs', methods=["GET"])
    def show_dbs():
        allDatabases = client.list_database_names()
        return render_template('databases.html', databases=allDatabases)

    @app.route('/docs', methods=["GET"])
    def get_docs():
        allDocs = collection.find()
        return render_template('docs.html', docs=allDocs)

    @app.route("/search", methods=["GET", "POST"])
    def search():
        
        if request.method == "POST":
            query = request.form.get("query")
            
            if query:
                return render_template(
                    "search.html", 
                    query=query, 
                    results=["A", "B"]
                )
    
        return render_template("search.html")
    
    return app

if __name__ == "__main__":    
    app = createApp()
    addEndpoints(app).run(
        host="0.0.0.0", 
        port=5000,
        debug=True
    )        