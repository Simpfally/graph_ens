// Count the number of paths of at most length 11
// starting from Clint Eastwood ignoring edge direction.

MATCH path = (n:ShowbizPerson)-[*1..11]-(m)
WHERE n.name="Clint Eastwood"
RETURN count(distinct path);

// Result : 2054494
