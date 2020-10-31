// Find average age of youngest actors in movie casts at time of release

MATCH (n:ShowbizPerson)-[:ACTED_IN]-> (m:Movie)
WITH m,min(m.released-n.born) as mage
RETURN avg(mage);

// Interpretation : returns the average of all movies' youngest actor's age.
// Using the command "WITH", for each movie, we only keep the minimum age of the cast.
// Hence the average of age is the average age of the youngest actor of all movies.
