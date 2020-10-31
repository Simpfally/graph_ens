// Find all reviewer pairs, one following the other and both reviewing the same movie.
//Return the entire subgraphs.

MATCH p=(m:Movie)<-[:REVIEWED]-(n1:MoviegoerPerson)-[:FOLLOWS]->
(n2)-[:REVIEWED]->(m)
RETURN p;

// Similarly, we can match the exact pattern.
