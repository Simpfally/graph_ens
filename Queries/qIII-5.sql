// Find all pairs of actors where both acted in a movie together after 2005.
// Return the actor names and movie node with every pair of actors occurring just once 


MATCH (n1:ShowbizPerson)-[:ACTED_IN]->(m:Movie) <-[:ACTED_IN]-(n2:ShowbizPerson)
WHERE m.released >= 2005
AND n1.name < n2.name
RETURN DISTINCT [n1.name,n2.name],collect(m)[0];

// We return unique pairs of actors that have acted in the same movie released after 2005.
// We match two actors nodes that have both an arrow [ACTED\_IN] toward the same movie node.
// The test "n2.name<n1.name" assures that for all pairs of actors (a,b) one will only get the pair (min(a,b),max(a,b)) where the order used is the one used by cypher on strings.
// Then, we only show the distinct pairs by aggregating the movies names, thus removing the duplicates pairs. Then we only show the first movie node with [0]
