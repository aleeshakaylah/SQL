SELECT DISTINCT p.name
FROM Persons p, Teams t
WHERE p.personID = t.coachID and t.teamID IN (

    SELECT DISTINCT g.visitorTeam
    FROM Games g, Teams t
    WHERE t.teamColor = 'red' AND t.teamID = g.homeTeam AND g.homePoints < g.visitorPoints

    UNION

    SELECT DISTINCT g.homeTeam
    FROM Games g, Teams t
    WHERE t.teamColor = 'red' AND t.teamID = g.visitorTeam AND g.visitorPoints < g.homePoints
)