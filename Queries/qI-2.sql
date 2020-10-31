// Get the set of all distinct relationship types in the dataset.

MATCH (n)-[r]-(m) RETURN DISTINCT type(r);

// The command type return the labels of r. 
// The command DISTINCT is used so that we returned each type only once.
