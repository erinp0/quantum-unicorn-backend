USE available_beds;

CREATE TABLE BedAvailability (
    date DATE,
    location VARCHAR(255),
    number_of_beds INT
);


USE available_beds; -- Ensure you're in the correct database

-- Inserting sample data into the BedAvailability table
INSERT INTO BedAvailability (date, location, number_of_beds)
VALUES
    ('2023-11-28', 'London', 10),
    ('2023-11-28', 'Manchester', 15),
    ('2023-11-29', 'Edinburgh', 8),
    ('2023-11-29', 'London', 12);


CREATE TABLE HostAvailability (
    date DATE,
    hostid INT,
    available INT CHECK (available IN (0, 1)),
    emergency INT CHECK (emergency IN (0, 1)),
);

USE available_beds; -- Ensure you're in the correct database

-- Inserting sample data into the BedAvailability table
INSERT INTO HostAvailability (date, hostid, available,emergency)
VALUES
    ('2023-11-28', '1', 1,1),
    ('2023-11-28', '2', 0,1),
    ('2023-11-28', '3', 1,0),
    ('2023-11-28', '4', 1,0),
    ('2023-11-28', '5', 0,0),
    ('2023-11-29', '1', 1,0),
    ('2023-11-29', '2', 1,0),
    ('2023-11-29', '3', 1,1),
    ('2023-11-29', '4', 1,1),
    ('2023-11-29', '5', 1,0),
    ('2023-11-30', '1', 0,0),
    ('2023-11-30', '2', 1,0),
    ('2023-11-30', '3', 1,1),
    ('2023-11-30', '4', 1,0),
    ('2023-11-30', '5', 1,0),
    ('2023-12-01', '1', 0,0),
    ('2023-12-01', '2', 0,0),
    ('2023-12-01', '3', 0,1),
    ('2023-12-01', '4', 1,1),
    ('2023-12-01', '5', 1,0),
    ('2023-12-02', '1', 1,0),
    ('2023-12-02', '2', 1,0),
    ('2023-12-02', '3', 1,1),
    ('2023-12-02', '4', 1,1),
    ('2023-12-02', '5', 1,0),
    ('2023-12-03', '1', 1,0),
    ('2023-12-03', '2', 1,0),
    ('2023-12-03', '3', 0,1),
    ('2023-12-03', '4', 0,1),
    ('2023-12-03', '5', 1,1),
    ('2023-12-04', '1', 1,1),
    ('2023-12-04', '2', 1,1),
    ('2023-12-04', '3', 1,1),
    ('2023-12-04', '4', 1,1),
    ('2023-12-04', '5', 1,1);

SELECT * FROM HostAvailability


--SELECT date, SUM(available)
--FROM HostAvailability
--GROUP BY date;

