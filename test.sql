select count(*) from Track;
select count(*) from Artist;
select * from Track;
select Name from MediaType;
select FirstName, LastName from Customer;
select * from Track where Composer = 'U2';
select * from Album where AlbumId = 232;
select FirstName, LastName, Title from Employee where Title = 'IT Staff';
select * from Track INNER JOIN Album on Track.AlbumId = Album.AlbumId;

select Track.Name as Track, Title as Album, Album.ArtistId, Artist.Name as Artist from Track
INNER JOIN Album on Track.AlbumId = Album.AlbumId
INNER JOIN Artist on Album.ArtistId = Artist.ArtistId;

select Track.Name, MediaType.Name from Track INNER JOIN MediaType on Track.MediaTypeId = MediaType.MediaTypeId;
select Track.Name, Genre.Name from Track INNER JOIN Genre on Genre.GenreId = Track.GenreId where Genre.Name = 'Jazz';

select Track.Name, MediaType.Name, Genre.Name from Track
INNER JOIN MediaType on Track.MediaTypeId = MediaType.MediaTypeId
INNER JOIN Genre on Track.GenreId = Genre.GenreId
where MediaType.Name = 'Protected AAC audio file' AND Genre.Name = 'Soundtrack';

SELECT Playlist.Name AS Playlist, Track.Name AS Track, Album.Title AS Album, Artist.Name AS Artist FROM Playlist
INNER JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist on Album.ArtistId = Artist.ArtistId
WHERE Playlist.Name = 'Grunge';

SELECT Playlist.Name as Playlist, COUNT(*) From Playlist INNER JOIN PlaylistTrack on Playlist.PlaylistId = PlaylistTrack.PlaylistId  GROUP BY Playlist HAVING count(*) = 1;

show keys from Album;

SELECT * FROM Album ORDER BY Title desc;

SELECT InvoiceDate, BillingCity, Total from Invoice ORDER BY total DESC LIMIT 5;

SELECT InvoiceDate, BillingAddress, Total from Invoice ORDER BY InvoiceDate DESC;
SELECT EmployeeId, LastName, FirstName, HireDate from Employee ORDER BY HireDate DESC LIMIT 3;

SELECT EmployeeId, LastName, FirstName, HireDate FROM Employee
ORDER BY HireDate DESC, EmployeeId DESC
LIMIT 3;

SELECT FirstName, LastName, InvoiceDate, Total from Invoice INNER JOIN Customer on Invoice.CustomerId = Customer.CustomerId
ORDER BY Total DESC LIMIT 10;

SELECT 
    concat(Customer.FirstName, " ", Customer.LastName) as Name,
    Invoice.InvoiceDate as Date,
    Invoice.Total
FROM Invoice
INNER JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
ORDER BY Total DESC
LIMIT 10;

SELECT COUNT(*) FROM Customer;

SELECT COUNT(FirstName) FROM Customer WHERE SupportRepId = 4;

SELECT Employee.FirstName AS Employee, COUNT(Customer.FirstName) AS Customer FROM Employee
JOIN Customer ON Customer.SupportRepId = Employee.EmployeeId
WHERE Employee.FirstName = 'Jane';

SELECT MIN(BirthDate) from Employee;
SELECT MAX(HireDate) FROM Employee;
SELECT AVG(Total) FROM Invoice;
SELECT ROUND(AVG(Total),2) FROM Invoice;

SELECT Album.Title, COUNT(*) FROM Track INNER JOIN Album ON Track.AlbumId = Album. AlbumId GROUP BY Track.AlbumId;
SELECT COUNT(City) FROM Customer WHERE City = 'Berlin';
SELECT COUNT(Total) FROM Track 

SELECT SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity), Track.Name AS Track FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
WHERE Track.Name = "The Woman King";

SELECT Artist.Name, COUNT(Track.TrackId) from Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId
JOIN Track ON Album.AlbumId = Track.AlbumId
GROUP BY Artist.Name
ORDER BY COUNT(Artist.Name)
DESC LIMIT 5;

INSERT INTO MediaType (Name)
VALUES ("Test Media 1");
SELECT AlbumId FROM Album WHERE Title = "Boy";
SELECT MediaTypeId FROM MediaType WHERE Name = "Protected AAC audio file";
SELECT GenreId FROM Genre WHERE Name = "Rock";

INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES ("I Will Follow", 348, 2, 1, "U2", 220000, 1234, 0.99);

INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Twilight", 348, 2, 1, "U2", 210000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("An Cat Dubh", 348, 2, 1, "U2", 110000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Into the Heart", 348, 2, 1, "U2", 200000, 1234, 0.99);
INSERT INTO Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES ("Out of Control", 348, 2, 1, "U2", 100000, 1234, 0.99);
