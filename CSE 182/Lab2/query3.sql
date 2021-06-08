SELECT DISTINCT p.personID, p.name, p.salary
FROM Persons p
WHERE p.canBePlayer AND p.personID NOT IN
(
    SELECT DISTINCT p.personID
    FROM GamePlayers gp
    WHERE p.personID = gp.playerID
)
ORDER BY p.name, p.salary DESC;