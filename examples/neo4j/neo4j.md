# Neo4j

## Getting Started

<ul>

<li>Install Neo4j Desktop</li><br>

<li>Install Neo4j Server</li><br>

<li>Start Neo4j Server</li><br>

<li>Open http://localhost:7474/browser/ and create login credentials</li><br>

<li>Open Neo4j Desktop</li><br>

<li>
In Neo4j Desktop, create a remote connection to the local server

```
neo4j://localhost:7474
```

</li>

</ul>
## Remote Access
<p>Enable the following line in /etc/neo4j/neo4j.conf</p>

```
dbms.connectors.default_listen_address=0.0.0.0
```

Configure the firewall to enable remote access through ports 7687 and 7474

<ul>
<li>Connect with Neo4j Destop via neo4j://{IP}:7687</li>
<li>Connect with the browser via http://{IP}:7474/browser/</li>

</ul


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
MATCH (player:PLAYER)
RETURN player.name AS PlayerName
```

```cypher
MATCH(player:PLAYER)
WHERE player.name = "LeBron James"
RETURN player.name AS PlayerName
```

```cypher
MATCH(player:PLAYER) -[:PLAYS_FOR]-> (team:TEAM)
WHERE team.name = "LA Lakers"
RETURN player
```


## Resources
[How to Import CSV Files into Neo4j: A Step-by-Step Tutorial](https://learnwithyan.com/neo4j/how-to-import-csv-files-into-neo4j-a-step-by-step-tutorial/)<br>
[YouTube: Neo4j (Graph Database) Crash Course](https://youtu.be/8jNPelugC2s)<br>
[Installation](https://neo4j.com/docs/operations-manual/current/installation/linux/)

