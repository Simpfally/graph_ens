// Return edge types with corresponding number of instances ordered by descending order.

MATCH p = (a)-[e]->(b)
with type(e) as edge_type, count(p) as number_instances
order by number_instances DESC
return edge_type, number_instances;

// We simply count how many instances we have of each edge type.
