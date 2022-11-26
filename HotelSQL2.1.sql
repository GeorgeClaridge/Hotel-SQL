-- Title Hotel
-- User George Claridge
-- Version 2.1

--DROP TABLE Guest;

--DROP TABLE Booking;

--DROP TABLE Extra;

--DROP TABLE Rate;


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
(1,'George','Claridge','123 Place'),
(2,'Name','Again','43243 Not Place'),
(3,'Brain','Hotel','1A Street Name');

-- CONFIRM THAT THE DATA HAS BEEN LOADED CORRECTLY
SELECT * FROM Guest;
GO

CREATE TABLE Booking
(
BookingID SMALLINT PRIMARY KEY,
BookingDate DATE,
RoomNo INT,
GuestID SMALLINT,
Foreign Key (GuestID) references Guest(GuestID),
Occupants INT,
RoomTypeRequested VARCHAR(30),
Nights INT,
ArrivalTime TIME,
);

insert into Booking values
(1,'3/11/2016',101,1,3,'single',2,'13:00'),
(2,'5/10/2021',121,2,3,'double',1,'12:00'),
(3,'6/8/2017',131,3,3,'single',7,'8:00');


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

--ROOM TYPE
CREATE TABLE Rate
(
RoomType VARCHAR(15),
Occupancy INT,
Amount INT,
PRIMARY KEY(RoomType,Occupancy)
);

CREATE TABLE RoomType
(
RoomTypeID VARCHAR(8) PRIMARY KEY,
RoomDescription VARCHAR(35),
);

CREATE TABLE Room
(
RoomID SMALLINT PRIMARY KEY,
RoomType VARCHAR(8),
Foreign Key (RoomType) references RoomType(RoomTypeID),
MaxOccupancy INT,
);