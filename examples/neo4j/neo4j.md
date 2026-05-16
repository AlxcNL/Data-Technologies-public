# Neo4j

## Import Data

### Import CSV

Import nodes
```cypher
LOAD CSV WITH HEADERS FROM 'file:///users.csv' AS row CREATE (:Person {name: row.name, age: toInteger(row.age), city: row.city});
```

Import relationships
```cypher
LOAD CSV WITH HEADERS FROM 'file:///relationships.csv' AS row MATCH (a:Person {name: row.person1}), (b:Person {name: row.person2}) CREATE (a)-[:FRIENDS_WITH]->(b);
```

### Import Cypher

<p>Create a local DB and copy-and-paste Cypher code</p>

## Cypher Queries

```cypher
MATCH(n)
RETURN n
```

```cypher
MATCH(coach:COACH)
RETURN coach
```

```cypher
MATCH(player:PLAYER)
RETURN player.name AS PlayerName
```

```cypher
MATCH(player:PLAYER)
WHERE player.name = "LeBron James"
RETURN player.name AS PlayerName
```

```cypher
MATCH (player:PLAYER) -[:PLAYS_FOR]-> (team:TEAM)
WHERE team.name = "LA Lakers"
RETURN player
```


## Resources
[How to Import CSV Files into Neo4j: A Step-by-Step Tutorial](https://learnwithyan.com/neo4j/how-to-import-csv-files-into-neo4j-a-step-by-step-tutorial/)<br>
[YouTube: Neo4j (Graph Database) Crash Course](https://youtu.be/8jNPelugC2s)<br>
[Installation](https://neo4j.com/docs/operations-manual/current/installation/linux/)