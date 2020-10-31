// Return the out degree distribution ordered by ascending degree.
MATCH (k)
WITH k, size((k)-->()) as degree
order by degree ASC
return degree;

// Here we have to use size in the WITH to catch vertices with 0 out degree.
