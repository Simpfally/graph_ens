// Return the whole graph as a simple adjacency list of vertex ids ordered in descending order.

MATCH (a)-[e]->(b)
with id(a) as ida, id(b) as idb
order by ida DESC, idb DESC
return ida, collect(idb);

// We simply collect all the IDs.
