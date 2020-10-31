// Count the number of nodes reachable
// in at most 4 hops starting from Clint Eastwood ignoring edge direction.

MATCH (n:ShowbizPerson)-[*1..4]-(m)
WHERE n.name="Clint Eastwood"
RETURN count(distinct m);

// The command "[*1..4]" will match paths of length 1 to 4 that start with n and end with  m.
// The command count counts the numbers of path.
// The command distinct makes sure we won't count same path twice.
// Result : 48
