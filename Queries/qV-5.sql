// Find ACTED\_IN subgraph of the movie with the youngest cast at the time of the movie’s release

MATCH (n:ShowbizPerson)-[:ACTED_IN]-> (m:Movie)
WITH m.title as title, avg(m.released - n.born) as age 
WITH min(age) as avgage 
MATCH (n:ShowbizPerson)-[:ACTED_IN]-> (m:Movie)
WITH m, avgage, avg(m.released - n.born) as age 
WHERE age = avgage
MATCH p= (a)-[:ACTED_IN]-> (m1:Movie)
WHERE m1.title = m.title
return p;

// We first compute the age of the youngest cast, then we match the movie which has the youngest cast. Then we simply match the path from an actor to this movie and return the named paths, this defines the ACTED\_IN subgraph.
