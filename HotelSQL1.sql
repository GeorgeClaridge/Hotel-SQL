-- Title Hotel
-- User George Claridge
-- Version 1

CREATE DATABASE Hotel;
GO 

USE Hotel;
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
(1,'George','Claridge','123 Place'),
(2,'Name','Again','43243 Not Place'),
(3,'Brain','Hotel','1A Street Name');

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Guest;
GO

CREATE TABLE Booking
(
BookingID SMALLINT PRIMARY KEY,
BookingDate VARCHAR(30),
RoomNo INT,
Occupants INT,
RoomTypeRequested VARCHAR(30),
Nights INT,
ArrivalTime TIME,
);

CREATE TABLE Extra
(
ExtraID SMALLINT PRIMARY KEY,
ExtraDescription VARCHAR(37),
Amount INT,
);

CREATE TABLE Rate
(
Foreign Key (RoomTypeID) references RoomType (RoomTypeID),
Foreign Key (Occupancy) references Booking (Occupants),
Amount INT,
);

CREATE TABLE Room
(
RoomID SMALLINT PRIMARY KEY,
RoomType VARCHAR(30),
MaxOccupancy INT,
);

CREATE TABLE RoomType
(
RoomID SMALLINT PRIMARY KEY,
RoomDescription VARCHAR(30),
);