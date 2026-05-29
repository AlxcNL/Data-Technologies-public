#!/usr/bin/env python3

# https://coderivers.org/blog/neo4j-python/

from neo4j import GraphDatabase, RoutingControl

URI = "neo4j://localhost:7687"
AUTH = ("neo4j", "secret26")
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

def addSong(driver, song, artist):
    driver.execute_query(
        "MERGE (a:Artist {name: $name})"
        "MERGE (s:Song {title: $title, album: $album, lyrics_url: $lyrics_url} )"
        "MERGE (a)-[:SINGS]->(s)",
        name=artist['name'],
        lyrics_url=song['lyrics_url'],
        title=song['title'], 
        video_url=song['video_url'],
        album = song['album'],
        database_=DB
    )
        
if __name__ == "__main__":    
    with GraphDatabase.driver(URI, auth=AUTH) as driver:

        cleanDB(driver)

        addArtist( driver, {'name': "Eva Queen"} ) 
        addArtist( driver, {'name': "Imen Es"} ) 
        addArtist( driver, {'name': "Lynda"} ) 
        addArtist( driver, {'name': "Lyna Mahyem"} ) 

        getAllArtists(driver)

        song = {
                'lyrics_url': "https://lyricstranslate.com/en/lynda-france-introspection-lyrics",
                'title': "Introspection",
                'video_url': "https://youtu.be/cpMzPCFgTwE",
                'album': "L’album du mâle",                
                'languages': "French"
            } 

        artist = {'name': "Eva Queen"}

        addSong( driver, song, artist )
        
        getAllSongs(driver)
        
        
