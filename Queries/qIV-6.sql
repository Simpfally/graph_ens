// Count the number of nodes reachable
// in at most 10 hops starting from Clint Eastwood ignoring edge direction.

MATCH (n)-[*1..10]-(m)
WHERE n.name="Clint Eastwood"
RETURN count(distinct m);

// Result : 175
