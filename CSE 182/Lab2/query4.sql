SELECT DISTINCT t1.teamID as team1, t1.teamCity as team1City, t2.teamID as team2, t2.teamCity as team2City
FROM Teams t1, Teams t2, Games g
WHERE t1.teamID = g.homeTeam AND t2.teamID = g.visitorTeam AND g.homeTeam IN
(
    SELECT DISTINCT t.teamID
    FROM Teams t, Games g
    WHERE t.totalLosses = 0 AND t.teamID IN
    (
        SELECT DISTINCT g.homeTeam
        FROM Games g
        WHERE g.homePoints > g.visitorPoints 
    )
)