```cypher
// Create a new 'Software' node
CREATE (s:Software {name: "GraphQueryTool", version: "1.0", license: "MIT"});

// Create two nodes and a 'WROTE_ARTICLE_FOR' relationship between them
CREATE (author:TechWriter {name: "Dr. Graph"})
CREATE (topic:Subject {name: "Cypher Query Language"})
CREATE (author)-[:WROTE_ARTICLE_FOR {publishedDate: date()}]->(topic);
```