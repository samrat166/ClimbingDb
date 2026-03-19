CREATE DATABASE ClimbingDb;

USE ClimbingDb;

CREATE TABLE Gym
(
    GymAddress VARCHAR(100) PRIMARY KEY,
    Capacity INT,
    Budget DECIMAL(10,2),
    OpenTime TIME,
    CloseTime TIME
);

CREATE TABLE Subscriptions
(
    SubName VARCHAR(50) PRIMARY KEY,
    Price DECIMAL(10,2),
    Duration INT
);

CREATE TABLE Member
(
    MemberID VARCHAR(15) PRIMARY KEY,
    FullName VARCHAR(50),
    DateOfBirth DATE,
    Gender ENUM('Male','Female'),
    Address VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50),
    GymAddress VARCHAR(100) NULL,
    SubName VARCHAR(50) NULL,
    SubDate DATE,
    FOREIGN KEY(GymAddress) REFERENCES Gym(GymAddress) ON DELETE SET NULL,
    FOREIGN KEY(SubName) REFERENCES Subscription(SubName) ON DELETE SET NULL
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
    FOREIGN KEY (Staff)      REFERENCES Staff(StaffID) ON DELETE SET NULL

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

CREATE TABLE Takes
(
    MemberId VARCHAR(15),
    ClassId VARCHAR(10),
    PRIMARY KEY(MemberId, ClassId),
    FOREIGN KEY(MemberId) REFERENCES Member(MemberId) ON DELETE CASCADE,
    FOREIGN KEY(ClassId) REFERENCES Class(ClassId) ON DELETE CASCADE
);

INSERT INTO Member (MemberID, FullName, DateOfBirth, Gender, Address, PhoneNumber, Email, SubDate)
VALUES
('1', 'Alice Johnson', '2005-06-12', 'Female', '123 Main St', '0123456789', 'alice@gmail.com', '2026-03-19'),
('2', 'Bob King', '2004-11-23', 'Male', '456 Oak Rd', '0987654321', 'bob@gmail.com', '2026-03-19');