CREATE DATABASE GuestHousesIoginName;
GO

USE GuestHousesIoginName;
GO

SELECT COUNT(BookingID) AS NumberOfBooking
FROM [dbo].[Booking]
GO

SELECT COUNT(GuestID) AS NumberOfGuests
FROM [dbo].[Guest]
GO

SELECT *
FROM [dbo].[Booking]
ORDER BY [RoomTypeRequested];
GO