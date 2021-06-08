ALTER TABLE Teams
    ADD CONSTRAINT PersonsFK FOREIGN KEY(coachID)
        REFERENCES Persons(personID);

ALTER TABLE GamePlayers
    ADD CONSTRAINT GamesFK FOREIGN KEY(gameID)
        REFERENCES Games(gameID);

ALTER TABLE GamePlayers
    ADD CONSTRAINT PlayersFK FOREIGN KEY(playerID)
        REFERENCES Players(playerID);