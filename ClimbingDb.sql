#CREATE DATABASE ClimbingDb;

DROP TABLE IF EXISTS Takes;
DROP TABLE IF EXISTS Class;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Buys;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Subscription;
DROP TABLE IF EXISTS Gym;


USE ClimbingDb;


CREATE TABLE Gym
(
    GymAddress VARCHAR(100) PRIMARY KEY,
    Capacity INT,
    OpenTime TIME,
    CloseTime TIME
);

CREATE TABLE Subscription
(
    SubName VARCHAR(50) PRIMARY KEY,
    Price DECIMAL(10,2),
    Duration INT
);

CREATE TABLE Members
(
    MemberID VARCHAR(15) PRIMARY KEY,
    FullName VARCHAR(50),
    DateOfBirth DATE,
    Gender ENUM('Male','Female'),
    Address VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50)
);

CREATE TABLE Buys
(
	MemberID VARCHAR(15),
	SubName VARCHAR(50),
    StartDate Date,
    PRIMARY KEY(MemberID, SubName),
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE,
    FOREIGN KEY(SubName) REFERENCES Subscription(SubName) ON DELETE CASCADE
);

CREATE TABLE Staff
(
    StaffID VARCHAR(15) PRIMARY KEY,
    FullName VARCHAR(50),
    DateOfBirth DATE,
    Gender ENUM('Male','Female'),
    Address VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50),
    Role ENUM('Manager','Instructor','Receptionist'),
    Salary DECIMAL(10,2),
    GymAddress VARCHAR(100) NULL,
    FOREIGN KEY(GymAddress) REFERENCES Gym(GymAddress) ON DELETE SET NULL
);

CREATE TABLE Class
(
    ClassId VARCHAR(10) PRIMARY KEY,
    StartTime DATETIME,
    Duration INT,
    Price DECIMAL(10,2),
    Capacity INT,
    GymAddress VARCHAR(100) NULL,
    Staff      VARCHAR(15)  NULL,
    FOREIGN KEY (GymAddress) REFERENCES Gym(GymAddress) ON DELETE SET NULL,
    FOREIGN KEY (Staff)      REFERENCES Staff(StaffID) ON DELETE CASCADE

);


CREATE TABLE Takes
(
    MemberId VARCHAR(15),
    ClassId VARCHAR(10),
    PRIMARY KEY(MemberId, ClassId),
    FOREIGN KEY(MemberId) REFERENCES Members(MemberId) ON DELETE CASCADE,
    FOREIGN KEY(ClassId) REFERENCES Class(ClassId) ON DELETE CASCADE
);

INSERT INTO Members (MemberID, FullName, DateOfBirth, Gender, Address, PhoneNumber, Email, SubDate)
VALUES
('1', 'Alice Johnson', '2005-06-12', 'Female', '123 Main St', '0123456789', 'alice@gmail.com', '2026-03-19'),
('2', 'Bob King', '2004-11-23', 'Male', '456 Oak Rd', '0987654321', 'bob@gmail.com', '2026-03-19');