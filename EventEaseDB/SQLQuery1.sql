CREATE TABLE Venues (
    VenueID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Location NVARCHAR(255) NOT NULL,
    Capacity INT NOT NULL,
    Availability BIT DEFAULT 1,
    ImageURL NVARCHAR(255) DEFAULT 'https://via.placeholder.com/150'
);

CREATE TABLE Events (
    EventID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    Description NVARCHAR(500)
);

CREATE TABLE Bookings (
    BookingID INT IDENTITY(1,1) PRIMARY KEY,
    VenueID INT NOT NULL,
    EventID INT NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    Status NVARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID),
    CONSTRAINT UniqueBooking UNIQUE (VenueID, StartDate, EndDate)
);
