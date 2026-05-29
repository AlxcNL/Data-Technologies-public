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

MERGE(lynda)-[:SONG {
    lyrics_url: "https://lyricstranslate.com/en/lynda-france-ciao-lyrics", 
    video_url: "https://youtube.com/watch?v=a4fETDIAdqI",
    title: "Ciao",
    album: "Papillon (Réédition)",
    languages: "French"
}]-> (imen_es)

MERGE(lynda)-[:SONG {
    lyrics_url: "https://lyricstranslate.com/en/lynda-france-introspection-lyrics",
    artist: "Lynda",
    title: "Introspection",
    video_url: "https://youtu.be/cpMzPCFgTwE",
    featured_artists: "Imen Es",
    album: "L’album du mâle",
    languages: "French"
}]-> (imen_es)

