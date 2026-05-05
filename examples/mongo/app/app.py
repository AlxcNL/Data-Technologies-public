#!/usr/bin/env python

# Author: J.A.Boogaard@hr.nl

from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def search():
    
    if request.method == "POST":
        query = request.form.get("query")
        return query

    else:
        return render_template("index.html")
        
if __name__ == "__main__":
    app.run()        