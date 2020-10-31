// Return degree distribution ordered by ascending degree.

MATCH (k)
WITH k, size((k)--()) as degree
order by degree ASC
return degree;

// Simple modification from Q2 to not take into account directionality of arrows.
