// Determine the average age of the Apollo 13 cast at the time of the movie’s release

MATCH (n:ShowbizPerson)-[:ACTED_IN]-> (m:Movie)
WHERE m.title = "Apollo 13"
RETURN avg(m.released-n.born);

// The age for each actors when the movie was released is computed by m.released-n.born where n.born is the actor's birth year and m.released the date the movie was released.
// The command avg compute the average of all rows.
