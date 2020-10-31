// Find all actors that directed a movie they also acted in. 
// Return actor and movie nodes.

MATCH (n:ShowbizPerson)-[:ACTED_IN]->(m:Movie)<-[:DIRECTED]-(n)
RETURN n,m;

// We simply match the pattern to get the results.
