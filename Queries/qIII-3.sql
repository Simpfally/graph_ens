// Find all reviewer pairs, such that one follows the other.
// Return the two reviewers and a movie they may have reviewed both

MATCH (n1:MoviegoerPerson)-[:FOLLOWS]->(n2:MoviegoerPerson)
OPTIONAL MATCH (n1)-[:REVIEWED]->(m1:Movie)
OPTIONAL MATCH (n2)-[:REVIEWED]->(m2:Movie)
RETURN [n1.name, n2.name], collect(COALESCE(m1.title, m2.title))[0];

// Interpretation : for each pair, we return a movie reviewed by at least one of the two reviewers. (they both may have reviewed the movie)
// OPTIONAL MATCH will replace missing instances (for example m1) with NULL in case no instances exists that fits the pattern.
// If n1 has not reviewed any movie, m1 will be NULL.
// COALESCE(a, b) will return a if a is not NULL. Otherwise it will return b. This ensures that if n1 has not reviewed any movie, but n2 did, we can still assign them a movie. Then we simply collect the movies and only take the first one.
