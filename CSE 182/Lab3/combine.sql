BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
UPDATE Persons p
    SET name = pc.name, address = pc.address, salary = pc.salary, canBePlayer = FALSE, canBeCoach = FALSE
    FROM PersonChanges pc
    WHERE pc.personID = p.personID;

INSERT INTO Persons(personID, name, address, salary, canBePlayer, canBeCoach)
    SELECT pc.personID, pc.name, pc.address, pc.salary, TRUE, NULL
    FROM PersonChanges pc
    WHERE pc.personID NOT IN
        (SELECT p.personID
        FROM Persons p);
COMMIT;