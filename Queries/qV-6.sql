// Determine the movie with youngest and movie with oldest cast and their age difference rounded to two decimals.

MATCH (n:ShowbizPerson)-[:ACTED_IN]-> (m:Movie)
WITH m.title as oldest, avg(m.released - n.born) as age 
WITH oldest, max(age) as maxage
MATCH (n:ShowbizPerson)-[:ACTED_IN]-> (m:Movie)
WITH oldest, m as youngest, 
round((maxage - avg(m.released - n.born))*100)/100 as age
ORDER BY age DESC LIMIT 1
return oldest, youngest.title as youngest, age as age_difference;

// We first retrieve the maximum average age of a movie's cast then we again list movies with their average cast age subtracted by the maximum.
// The movie with the youngest cast is the one associated with the biggest difference so we simply sort the results and take the first result.
// This gives us the age difference between the youngest and oldest cast.
