CREATE OR REPLACE FUNCTION fireSomePlayersFunction (maxFired INTEGER) RETURNS INTEGER 
AS $$
    DECLARE player INTEGER;
    DECLARE count INTEGER;

    -- DECLARE NotFound CONDITION FOR SQLSTATE '02000';

    DECLARE c CURSOR FOR 
        SELECT p.personID 
        FROM Players pl, GamePlayers gp, Persons p
        WHERE pl.teamID IS NOT NULL 
            AND pl.rating = 'L' 
            AND gp.playerID = pl.playerID 
            AND p.personID = pl.playerID
        GROUP BY p.personID 
        HAVING SUM(gp.minutesPlayed) > 60
        ORDER BY p.salary DESC;
BEGIN
    OPEN c;
    count := 0;
    LOOP
        -- Fetch cursor data and check if tuple found
        FETCH FROM c INTO player;
        IF NOT FOUND THEN RETURN count; END IF;

        UPDATE Players 
        SET teamID = NULL
        WHERE player = playerID;
        count := count + 1;

        -- If count is equal to maxFired, return count 
        IF count = maxFired THEN RETURN count; END IF;

    END LOOP;
    CLOSE c;
END
$$ LANGUAGE plpgsql;