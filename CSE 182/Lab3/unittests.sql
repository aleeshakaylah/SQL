-- Unit Test 1: PersonsFK Insert Violation
INSERT INTO Teams(teamID, coachID)
    VALUES(5, 35);

-- Unit Test 2: GamesFK Insert Violation
INSERT INTO GamePlayers(gameID, playerID)
    VALUES(1, 5);

-- Unit Test 3: PlayersFK Insert Violation
INSERT INTO GamePlayers(gameID, playerID)
    VALUES(10001, 35);

-- Unit Test 4: Reasonable_Salary Valid Update
UPDATE GamePlayers
    SET minutesPlayed = 60
    WHERE minutesPlayed > 60;

-- Unit Test 5: Reasonable_Salary Update Violation
UPDATE GamePlayers
    SET minutesPlayed = -1
    WHERE minutesPlayed = 60;

-- Unit Test 6: Legal_Rating Valid Update
UPDATE Players
    SET rating = NULL
    WHERE rating = 'L';

-- Unit Test 7: Legal_Rating Update Violation
UPDATE Players
    SET rating = 'X'
    WHERE rating = 'M';

-- Unit Test 8: Null_Twice Valid Update
UPDATE Games
    SET homePoints = NULL, visitorPoints = NULL 
    WHERE visitorPoints IS NULL;

-- Unit Test 9: Null_Twice Update Violation
UPDATE Games
    SET homePoints = NULL 
    WHERE homePoints IS NOT NULL;