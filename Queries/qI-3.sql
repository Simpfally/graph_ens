// Get the set of all properties for different node labels and relationship types.

MATCH (n)
WITH (labels(n))[0] as name,  keys(n) as kn
UNWIND kn as keyn
RETURN DISTINCT name,COLLECT(DISTINCT keyn) as properties 

UNION

MATCH (n)-[r]-(m) 
WITH type(r) as name, keys(r) as kr
UNWIND kr as keyr
RETURN DISTINCT name ,COLLECT(DISTINCT keyr) as properties;

// We make two queries to get the labels/types and properties of nodes as well as arrows. We then concatenate them with UNION.
// For the first query we do : for each node in the graph, we get its label and list of properties. Then we break the list into rows (with the command unwind).
// This allows us to then regroup for all label, all the properties that have been encountered with it in a single list. This is done with the command "COLLECT", to regroup all properties.
// The command DISTINCT is used so that properties do not appears more than once in the same list.
// The second query is similar to the first one.
