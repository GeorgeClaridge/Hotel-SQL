-- Title Hotel
-- User George Claridge
-- Version 2.2

DROP TABLE Guest;

DROP TABLE Booking;

DROP TABLE Extra;

DROP TABLE Rate;

DROP TABLE Room;

DROP TABLE RoomType;


CREATE DATABASE Hotel2;
GO 

USE Hotel2;
GO

CREATE TABLE Calender
(
CalendarID SMALLINT PRIMARY KEY,
);

CREATE TABLE Guest
(
GuestID SMALLINT PRIMARY KEY,
FirstName VARCHAR(15),
LastName VARCHAR(15),
GuestAddress VARCHAR(30),
);

-- LOAD TEST DATA INTO THE TABLE Guest
insert into Guest values
(1001,'Jim','Dowd','Lewisham West and Penge'),
(1002,'Lyn','Brown','West Ham'),
(1003,'Ann','Clwyd','Cynon Valley');

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Guest;
GO

CREATE TABLE RoomType
(
RoomTypeID VARCHAR(8) PRIMARY KEY,
RoomDescription VARCHAR(50),
);

-- LOAD TEST DATA INTO THE TABLE RoomType
insert into RoomType values
('Double','Fabulously appointed double room.'),
('Family','Superior appartment for up to 3 people.'),
('Single','Luxury accomodation suitable for one person.'),
('Twin','Superb room with two beds.');

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM RoomType;
GO

CREATE TABLE Rate
(
RoomType VARCHAR(8),
Occupancy INT,
Amount INT,
PRIMARY KEY(RoomType,Occupancy),
Foreign Key (RoomType) references RoomType(RoomTypeID),
);

-- LOAD TEST DATA INTO THE TABLE RoomType
insert into Rate values
('Double',1,56),
('Double',2,72),
('Family',1,56);

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Rate;
GO

CREATE TABLE Room
(
RoomID SMALLINT PRIMARY KEY,
RoomType VARCHAR(8),
Foreign Key (RoomType) references RoomType(RoomTypeID),
MaxOccupancy INT,
);

-- LOAD TEST DATA INTO THE TABLE Room
insert into Room values
(101,'single',1),
(102,'double',2),
(103,'double',1);

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Room;
GO

CREATE TABLE Booking
(
BookingID SMALLINT PRIMARY KEY,
BookingDate DATE,
RoomNo SMALLINT,
Foreign Key (RoomNo) references Room(RoomID),
GuestID SMALLINT,
Foreign Key (GuestID) references Guest(GuestID),
Occupants INT,
RoomTypeRequested VARCHAR(8),
Foreign Key (RoomTypeRequested) references RoomType(RoomTypeID),
Nights INT,
ArrivalTime TIME,
);

insert into Booking values
(5001,'3/11/2016',101,1001,1,'single',7,'13:00'),
(5002,'3/11/2016',102,1002,1,'double',2,'18:00'),
(5003,'3/11/2016',103,1003,2,'double',2,'21:00');


-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Booking;
GO

CREATE TABLE Extra
(
ExtraID SMALLINT PRIMARY KEY,
BookingID SMALLINT,
Foreign Key (BookingID) references Booking(BookingID),
ExtraDescription VARCHAR(37),
Amount INT,
);

insert into Extra values
(500101,5001,'Breakfast',63.00),
(500201,5002,'Breakfast',18.00),
(500301,5003,'Phone Call',36.00);