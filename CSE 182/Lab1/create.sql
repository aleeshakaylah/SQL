-- Aleesha Nageer
-- Lab 1: Volleyball Database Schema

-- Create Tables
CREATE TABLE Persons (
personID INT,
name VARCHAR(30),
address VARCHAR(50),
salary NUMERIC(7,2), 
canBePlayer BOOLEAN, 
canBeCoach BOOLEAN,
PRIMARY KEY (personID)
);

CREATE TABLE Teams (
teamID INT,
name VARCHAR(30),
coachID INT,
teamCity VARCHAR(30), 
teamColor CHAR(6), 
totalWins INT,
totalLosses INT,
PRIMARY KEY (teamID),
FOREIGN KEY (coachID) REFERENCES Persons(personID)
);

CREATE TABLE Players (
playerID INT,
teamID INT,
joinDate DATE,
rating CHAR(1), 
isStarter BOOLEAN, 
PRIMARY KEY (playerID)
FOREIGN KEY (playerID) REFERENCES Persons(personID),
FOREIGN KEY (teamID) REFERENCES Teams
);

CREATE TABLE Games (
gameID INT,
gameDate DATE,
homeTeam INT,
visitorTeam INT, 
homePoints INT, 
visitorPoints INT,
PRIMARY KEY (gameID)
FOREIGN KEY (homeTeam) REFERENCES Teams(teamID),
FOREIGN KEY (visitorTeam) REFERENCES Teams(teamID)
);

CREATE TABLE GamePlayers (
gameID INT,
playerID INT,
minutesPlayed INT,
PRIMARY KEY (gameID, playerID),
FOREIGN KEY (gameID) REFERENCES Games,
FOREIGN KEY (playerID) REFERENCES Players
);