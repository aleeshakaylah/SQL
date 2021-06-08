SELECT DISTINCT p.name, p.address, p.salary
FROM Persons p, Players pl, Teams t
WHERE p.personID = t.coachID AND p.personID = pl.playerID