//  Find the movies with the top-10 oldest cast at the time of the movie’s release
//  Return movie and average age rounded to two decimal ordered by descending age



MATCH (n:ShowbizPerson)-[:ACTED_IN]-> (m:Movie)
RETURN m,round(100*avg(m.released-n.born))/100 as mean
ORDER BY mean DESC
LIMIT 10;

// The command "order by ... desc" returns the result sorted in decreasing order.
// The command LIMIT 10 return the first 10 results.
