create database [Virtual Art Gallery]



CREATE TABLE Artwork (
    ArtworkID INT PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX),
    CreationDate DATE,
    Medium NVARCHAR(100),
    ImageURL NVARCHAR(255),
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);

CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Biography NVARCHAR(MAX),
    BirthDate DATE,
    Nationality NVARCHAR(100),
    Website NVARCHAR(255),
    ContactInformation NVARCHAR(255)
);


CREATE TABLE Users(
    UserID INT PRIMARY KEY,
    Username NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL UNIQUE,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    DateOfBirth DATE,
    ProfilePicture NVARCHAR(255)
);


CREATE TABLE Gallery (
    GalleryID INT PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX),
    Location NVARCHAR(255),
    Curator INT,
    OpeningHours NVARCHAR(100),
    FOREIGN KEY (Curator) REFERENCES Artist(ArtistID)
);


CREATE TABLE User_Favorite_Artwork (
    UserID INT,
    ArtworkID INT,
    PRIMARY KEY (UserID, ArtworkID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID)
);


CREATE TABLE Artwork_Gallery (
    ArtworkID INT,
    GalleryID INT,
    PRIMARY KEY (ArtworkID, GalleryID),
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID),
    FOREIGN KEY (GalleryID) REFERENCES Gallery(GalleryID)
);
