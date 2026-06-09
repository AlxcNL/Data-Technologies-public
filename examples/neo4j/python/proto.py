#!/usr/bin/env python3

# https://coderivers.org/blog/neo4j-python/

from neo4j import GraphDatabase, RoutingControl

URI = "neo4j://localhost:7687"
AUTH = ("neo4j", "secret319")
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
        
if __name__ == "__main__":    
    with GraphDatabase.driver(URI, auth=AUTH) as driver:

        cleanDB(driver)

        artists = list()
        artists.append( {'name': "Eva Queen"} )
        artists.append( {'name': "Imen Es"} )
        artists.append( {'name': "Lynda" } )
        artists.append( {'name': "Lyna Mahyem"} )

        for artist in artists:
            addArtist( driver, artist ) 

        getAllArtists(driver)

        songs = list()
        songs.append( {'title': "Dinero" } )
        songs.append( {'title': "Instrospection"} )

        addSong( driver, songs[0], artists[0], artists[2] )
        addSong( driver, songs[1], artists[2], artists[1] )
        
        getAllSongs(driver)
        
        
