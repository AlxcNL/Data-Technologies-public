#!/usr/bin/env python3

# https://coderivers.org/blog/neo4j-python/
# https://neo4j.com/docs/python-manual/current/transformers/ 

from neo4j import GraphDatabase, RoutingControl, Result
import pyvis

URI = "neo4j://localhost:7687"
AUTH = ("neo4j", "")
DB = "neo4j"

def cleanDB(driver):
    driver.execute_query("MATCH(n) DETACH DELETE n")

def addArtist(driver, artist):
    driver.execute_query(
        "MERGE (a:Artist {name: $name})",
        name=artist['name'], database_=DB
    )

def getAllArtists(driver):
    results, _, _ = driver.execute_query(
        "MATCH (a:Artist) RETURN a.name",
        database_=DB, routing_=RoutingControl.READ
    )

    for record in results:
        print( record["a.name"] )
            
def getAllSongs(driver):
    results, _, _ = driver.execute_query(
        "MATCH (s:Song) RETURN s",
        database_=DB, routing_=RoutingControl.READ
    )

    for record in results:
        print( record["s"] )

def addSong(driver, song, artist, fartist):
    params = {
        'artist': artist['name'],
        'featured_artist': fartist['name'],
        'title': song['title'], 
    }
    
    driver.execute_query(
        "MERGE (a:Artist {artist: $artist})"
        "MERGE (f:Artist {artist: $featured_artist})"
        "MERGE (s:Song {title: $title} )"
        "MERGE (a)-[:SINGS]->(s)"
        "MERGE (f)-[:FEATURES]->(s)",
        parameters_ = params,
        database_= DB
    )
    
def visualize_result(query_graph, nodes_text_properties):
    visual_graph = pyvis.network.Network()

    for node in query_graph.nodes:
        node_label = list(node.labels)[0]
        node_text = node[nodes_text_properties[node_label]]
        visual_graph.add_node(node.element_id, node_text, group=node_label)

    for relationship in query_graph.relationships:
        visual_graph.add_edge(
            relationship.start_node.element_id,
            relationship.end_node.element_id,
            title=relationship.type
        )


    visual_graph.show('featured_artists.html', notebook=False)

        
if __name__ == "__main__":    
    with GraphDatabase.driver(URI, auth=AUTH) as driver:        
    
        # Query to get a graphy result
        graph_result = driver.execute_query("""
            MATCH p=(a:Artist)-[:SINGS]->()<-[:FEATURES]-(f:Artist)
            WHERE f.name IN ['Amel Bent', 'Camelia Jordana', 'Vitaa']
            RETURN p LIMIT 500""",
            database_= DB,
            result_transformer_ = Result.graph
        )
    
            # Draw graph
        nodes_text_properties = {  # what property to use as text for each node
            "Artist": "name",
            "Song": "title",
        }
        
        visualize_result(graph_result, nodes_text_properties)
