// Get the set of all distinct node labels.

MATCH (n) RETURN DISTINCT labels(n);

// The command labels return the labels of n. 
// The command DISTINCT is used so that we returned each label only once.
// Notice that if another label for node is allowed but do not appeared in the graph, it won't be returned by this query.
