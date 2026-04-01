SELECT translationId  
FROM translations AS t
WHERE ( 
    t.from_language = 'French' AND     
    (t.to_language = "Dutch" OR t.to_language = "German")        
);

SELECT title, artistId
FROM songs AS s
INNER JOIN translations AS t
ON s.translationId = t.translationId

SELECT s.title, a.name, a.picture, t.from_language, t.to_language
FROM translations AS t
INNER JOIN songs AS s
ON t.translationId = s.translationId
INNER JOIN artists AS a
ON s.artistId = a.artistId
WHERE ( 
    t.from_language = 'French' AND     
    (t.to_language = "Dutch" OR t.to_language = "German")        
)

