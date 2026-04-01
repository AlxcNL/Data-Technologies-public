## Import Data

Import nodes
```cypher
LOAD CSV WITH HEADERS FROM 'file:///users.csv' AS row CREATE (:Person {name: row.name, age: toInteger(row.age), city: row.city});
```

Import relationships
```cypher
LOAD CSV WITH HEADERS FROM 'file:///relationships.csv' AS row MATCH (a:Person {name: row.person1}), (b:Person {name: row.person2}) CREATE (a)-[:FRIENDS_WITH]->(b);
```

## Resources
[How to Import CSV Files into Neo4j: A Step-by-Step Tutorial](https://learnwithyan.com/neo4j/how-to-import-csv-files-into-neo4j-a-step-by-step-tutorial/)