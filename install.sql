USING PERIODIC COMMIT

LOAD CSV WITH HEADERS FROM "file:///users.csv" AS users
	CREATE (u:User {id : toInteger(users.id), sex : users.sex, age : toInteger(users.age), occupation : users.occupation, zip_code : users.zip_code});

LOAD CSV WITH HEADERS FROM "file:///movies.csv" AS movies
	CREATE (m:Movie {id : toInteger(movies.id), title : movies.title, date:movies.date});

LOAD CSV WITH HEADERS FROM "file:///genres.csv" AS genres
	CREATE (g:Genre {id : toInteger(genres.id), name :genres.name});

LOAD CSV WITH HEADERS FROM "file:///mov_genre.csv" AS mov_genre
	MERGE (m : Movie { id : toInteger(mov_genre.mov_id) })
	MERGE (g : Genre { id : toInteger(mov_genre.genre) })
	CREATE (m)-[:CATEGORIZED_AS]->(g);

LOAD CSV WITH HEADERS FROM "file:///ratings.csv" AS ratings
	MERGE (u : User { id : toInteger(ratings.user_id) })
	MERGE (m : Movie { id : toInteger(ratings.mov_id) })
	CREATE (u)-[:RATED{rating : toInteger(ratings.rating), time : toInteger(ratings.timestamp)}]->(m);

LOAD CSV WITH HEADERS FROM "file:///friends.csv" AS friends
	MERGE (u1 : User { id : toInteger(friends.user1_id) })
	MERGE (u2 : User { id : toInteger(friends.user2_id) })
	CREATE (u1)-[:FRIEND_OF]->(u2);
