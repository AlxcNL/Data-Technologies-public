#!/usr/bin/env python

# https://coderivers.org/blog/neo4j-python/

from neo4j import GraphDatabase

class Neo4jApp:
    def __init__(self, uri, user, password):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))

    def close(self):
        self.driver.close()

    def run_query(self, query, parameters=None):
        with self.driver.session() as session:
            result = session.run(query, parameters)
            return list(result)


# Replace with your Neo4j server details
uri = "bolt://localhost:7687"
user = "neo4j"
password = "secret"

app = Neo4jApp(uri, user, password)
try:
    query = "MATCH (n) RETURN n LIMIT 10"
    results = app.run_query(query)
    for record in results:
        print(record)
finally:
    app.close()