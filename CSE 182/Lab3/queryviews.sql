DELETE FROM Games
    WHERE gameID = 10001 OR gameID = 10005;

SELECT t.teamID, t.name AS teamName, (t.totalWins - w.computedWins) AS winDiff, (t.totalLosses - l.computedLosses) AS lossDiff, COUNT(*) AS numPlayers 
FROM Teams t, WinsDisagree w, LossesDisagree l, Players pl
WHERE t.teamID = w.teamID AND t.teamID = l.teamID AND t.teamID = pl.teamID
GROUP BY t.teamID, w.computedWins, l.computedLosses

-- Messy Statistics Results: 
--  teamid |  teamname  | windiff | lossdiff | numplayers 
-- --------+------------+---------+----------+------------
--     209 | Lone Stars |      -1 |       -2 |          2
--     203 | Peaches    |       1 |       -1 |          3
-- (2 rows)

-- Messy Statistics Results (After Deletion):
--  teamid |  teamname  | windiff | lossdiff | numplayers 
-- --------+------------+---------+----------+------------
--     209 | Lone Stars |      -1 |       -2 |          2
--     201 | Birds      |       1 |        1 |          2
-- (2 rows)