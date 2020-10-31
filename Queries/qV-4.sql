// Return for each movie the name of the youngest actor, order by movie title and actor name.

MATCH (n:ShowbizPerson)-[:ACTED_IN]-> (m:Movie)
WITH m.title as title, max(n.born) as maxx
MATCH (n:ShowbizPerson)-[:ACTED_IN]-> (m:Movie)
WHERE m.title = title AND n.born = maxx
return m.title, n.name
order by m.title, n.name;

// First we get the youngest actor (highest born year) for each movie. 
// Then we get the movie title and the youngest actor name associated with the birth-date computed in the first MATCH.
