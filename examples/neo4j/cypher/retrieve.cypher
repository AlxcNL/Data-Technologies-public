MATCH (a:Artist)-[:SINGS]-> (s:Song) RETURN s

MATCH p=(a:Artist)-[:SINGS]->()<-[:FEATURES]-(f:Artist)
WHERE f.name IN ['Imen Es', 'Lynda', 'Eva Queen', 'Lyna Mahyem']
RETURN p LIMIT 50;