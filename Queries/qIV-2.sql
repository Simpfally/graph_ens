// Count the number of paths of at most length 4
// starting from Clint Eastwood ignoring edge direction.

MATCH path = (n:ShowbizPerson)-[*1..4]-(m)
WHERE n.name="Clint Eastwood"
RETURN count(distinct path);

// The command "[*1..4]" will match paths of length 1 to 4 that start with n and end with  m.
// The command count counts the numbers of path.
// The command distinct make sure we won't count same path twice.
// Result : 182
