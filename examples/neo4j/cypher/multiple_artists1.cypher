MATCH(n) DETACH DELETE n;

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

CREATE(lynda)-[:SINGS]-> (ciao)
CREATE(imen_es)-[:FEATURES]-> (ciao)
MERGE(lynda)-[:SINGS]-> (introspection)
MERGE(imen_es)-[:FEATURES]-> (introspection)
