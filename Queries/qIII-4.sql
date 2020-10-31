// Restrict the previous query so that the name of the followed reviewer is 12 characters long.
// Try a different position for the where clause. Explain why this gives a different result.


MATCH (n1:MoviegoerPerson)-[:FOLLOWS]->(n2:MoviegoerPerson)
OPTIONAL MATCH (n1)-[:REVIEWED]->(m1:Movie)
OPTIONAL MATCH (n2)-[:REVIEWED]->(m2:Movie)
RETURN [n1.name, n2.name], collect(COALESCE(m1.title, m2.title))[0];


// We use a optional match to replace missing part of the match by NULL
// If WHERE is right after the first match, we only get one result because Angela Scope is the only followed reviewer with length 12
// If the WHERE is placed after the first or second optional match, we get as many results as without any WHERE clause. Indeed, the WHERE applies to the optional match, and not the first one. Thus all reviewers are matched.
// On the second optional match, the where will apply, but since it's an optional match, all the matched movie m2 will simply be NULL, and because of the coalesce command, we will always take the movie reviewed by n1.
