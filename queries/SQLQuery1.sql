CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender CHAR(1),
    Earnings DECIMAL(10, 2),
    MotherID INT,
    FatherID INT,
    SpouseID INT,
    FOREIGN KEY (MotherID) REFERENCES Person(PersonID),
    FOREIGN KEY (FatherID) REFERENCES Person(PersonID),
    FOREIGN KEY (SpouseID) REFERENCES Person(PersonID)
);

CREATE TABLE Enterprise (
    EnterpriseID INT PRIMARY KEY,
    Name VARCHAR(100),
    PresidentID INT,
    FOREIGN KEY (PresidentID) REFERENCES Person(PersonID)
);

CREATE TABLE Employment (
    EmploymentID INT PRIMARY KEY,
    PersonID INT,
    EnterpriseID INT,
    ContractType VARCHAR(20),
    Salary DECIMAL(10, 2),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
    FOREIGN KEY (EnterpriseID) REFERENCES Enterprise(EnterpriseID)
);
