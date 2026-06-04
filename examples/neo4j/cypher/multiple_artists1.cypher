MATCH(n) DETACH DELETE n;

# Artist Nodes

CREATE(imen_es:Artist
{
    lyrics_url: "https://lyricstranslate.com/en/imen-es-lyrics.html",
    name: "Imen Es",
    country: "France"
} )

CREATE(lynda:Artist
{
    lyrics_url: "https://lyricstranslate.com/en/lynda-france-lyrics.html",
    name: "Lynda",
    country: ["Algeria", "France" ],
    style: "Pop"
} )

# Song Nodes

CREATE(ciao:Song 
{
    lyrics_url: "https://lyricstranslate.com/en/lynda-france-ciao-lyrics", 
    video_url: "https://youtube.com/watch?v=a4fETDIAdqI",
    artist: "Lynda (France)",
    title: "Ciao",
    featured_artists: "Imen Es",
    album: "Papillon (Réédition)",
    languages: "French"
} )

CREATE(introspection:Song
{
    lyrics_url: "https://lyricstranslate.com/en/lynda-france-introspection-lyrics",
    artist: "Lynda",
    title: "Introspection",
    video_url: "https://youtu.be/cpMzPCFgTwE",
    featured_artists: "Imen Es",
    album: "L’album du mâle",
    languages: "French"
} )

CREATE(facile:Song
{
    lyrics_url: "https://lyricstranslate.com/en/imen-es-facile-lyrics",
    video_url: "https://youtu.be/jJa_CGDcJic",
    title: "Facile",
    album: "Es",
    languages: "French"
} )

# Sings Relationships

MERGE(lynda)-[:SINGS]-> (ciao)
MERGE(lynda)-[:SINGS]-> (introspection)
MERGE(imen_es)-[:SINGS]-> (facile)

# Features Relationships

MERGE(imen_es)-[:FEATURES]-> (ciao)
MERGE(imen_es)-[:FEATURES]-> (introspection)
MERGE()

