// Match all reviewers and the one they are following directly or via another, third reviewer.

MATCH (r:MoviegoerPerson)-[:FOLLOWS]->(r2)
RETURN r as reviewer, r2 as followed
UNION
MATCH (r:MoviegoerPerson)-[:FOLLOWS]->(r1:MoviegoerPerson)-[:FOLLOWS]->(r2)
RETURN r as reviewer, r2 as followed;

// We join the two queries that return couples of people where :
// a) for the first query : the first person in the each couple follow the other ;
// b) for the second query : the first person in the couple follow the other via a third one.
