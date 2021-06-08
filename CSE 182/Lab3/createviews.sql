-- DROP VIEW WinsDisagree;
-- DROP VIEW LossesDisagree;

CREATE VIEW WinsDisagree AS
    SELECT DISTINCT t.teamID, t.name, t.totalWins, COUNT(*) AS computedWins
    FROM Teams t, Games g
    WHERE (t.teamID = g.homeTeam AND g.homePoints > g.visitorPoints) OR (t.teamID = g.visitorTeam AND g.visitorPoints > g.homePoints)
    GROUP BY t.teamID
    HAVING t.totalWins != COUNT(*);

CREATE VIEW LossesDisagree AS
    SELECT DISTINCT t.teamID, t.name, t.totalLosses, COUNT(*) AS computedLosses
    FROM Teams t, Games g
    WHERE (t.teamID = g.homeTeam AND g.homePoints < g.visitorPoints) OR (t.teamID = g.visitorTeam AND g.visitorPoints < g.homePoints)
    GROUP BY t.teamID
    HAVING t.totalLosses != COUNT(*);