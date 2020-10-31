//U1. Add Meryl Streep as a node.
//U2. Add the movie The River Wild as a node .
//U3. Add an ACTED\_IN relationship including Meryl’s role between the two.
//U4. Add an ACTED\_IN relationship including the role between Kevin Bacon and The River Wild.
//U5. For The Bridges of Madison County, add nodes corresponding to the movie, to its three main actors, and to its director, as well as ACTED\_IN/DIRECTED edges.

MATCH (Kevin:ShowbizPerson),(Clint:ShowbizPerson)
WHERE Kevin.name="Kevin Bacon"
AND Clint.name="Clint Eastwood"
CREATE (Streep:ShowbizPerson {name:'Meryl Streep', born:1949})
CREATE (Annie:ShowbizPerson {name:'Annie Corley', born:1952})
CREATE (River:Movie {title:'The River Wild', released:1995, tagline:'Rafting expert Gail takes on a pair of armed killers while navigating a spectacularly violent river.'})
CREATE (Madison:Movie {title:'The Bridges of Madison County', released:1995, tagline:'Photographer Robert Kincaid (Clint Eastwood) wanders into the life of housewife Francesca Johnson (Meryl Streep) for four days in the 1960s.'})
CREATE (Streep)-[:ACTED_IN {roles:['Gail Hartman']}]->(River)
CREATE (Kevin)-[:ACTED_IN {roles:['Wade']}]->(River)
CREATE (Clint)-[:ACTED_IN {roles:['Robert Kincaid']}]->(Madison)
CREATE (Annie)-[:ACTED_IN {roles:['Carolyn Johnson']}]->(Madison)
CREATE (Streep)-[:ACTED_IN {roles:['Francesca Johnson']}]->(Madison)
CREATE (Clint)-[:DIRECTED]->(Madison);

// We apply the same thing that what is done in the given sql file.
// Notice that we collected already existing nodes through matching.
