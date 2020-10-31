// Extend Q5 to find all other movies in which the actors computed by Q5 also acted in.

MATCH (n1:ShowbizPerson)-[:ACTED_IN]->
(m:Movie) <-[:ACTED_IN]-(n2:ShowbizPerson)
WHERE m.released >= 2005
AND n1.name < n2.name
with n1, n2
MATCH (n1)-[:ACTED_IN]-> (m1:Movie)
WHERE m1.released >= 2005
with n1, n2, collect(m1.title) as m1x
MATCH (n2)-[:ACTED_IN]-> (m2:Movie)
WHERE m2.released >= 2005
with n1, n2, m1x + collect(m2.title) as mx
unwind mx as mxs
with distinct n1, n2, mxs
RETURN DISTINCT [n1.name,n2.name], collect(mxs);

// Interpretation : For each unique pair of actors (that have acted in a movie together after 2005), we return all the movies they have done on their own or together.
// Here we match n1 and n2 as before, and then we collect the titles of the movie of n1 in a list and we append to that list the movies' title of n2. Then we unwind this list to create a unique list of movies and this concludes the query.
