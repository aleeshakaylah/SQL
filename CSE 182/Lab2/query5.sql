SELECT DISTINCT p.name,  pl.joinDate
FROM Persons p, Players pl, Teams t
WHERE p.personID = pl.playerID AND pl.joinDate < '20190131' AND p.salary > 78765.43 
                   AND pl.isStarter AND p.name LIKE '%er%' AND pl.teamID IN
(
    SELECT DISTINCT t.teamID
    FROM Teams t
    WHERE t.teamCity != 'New York'
)