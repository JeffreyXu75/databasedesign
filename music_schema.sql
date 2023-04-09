CREATE SCHEMA IF NOT EXISTS `music` ;

CREATE TABLE IF NOT EXISTS `artists` (
ArtistID int NOT NULL,
first_name varchar(255),
last_name varchar(255),
birthday date,
primary key (ArtistID)
);

CREATE TABLE IF NOT EXISTS `genre` (
GenreID int NOT NULL,
genre_name varchar(255),
primary key (GenreID)
);

CREATE TABLE IF NOT EXISTS `users` (
UserID int NOT NULL,
email varchar(255) unique,
first_name varchar(255),
last_name varchar(255),
pass varchar(255),
primary key (UserID)
);
CREATE TABLE IF NOT EXISTS `songs` (
SongID int NOT NULL,
ArtistID int NOT NULL,
title varchar(255),
duration int,
explicit bool,
link varchar(255),
primary key (SongID),
foreign key (ArtistID) references artists(ArtistID)
);

CREATE TABLE IF NOT EXISTS `songgenres` (
SongID int NOT NULL,
GenreID int NOT NULL,
foreign key (SongID) references songs(SongID),
foreign key (GenreID) references genre(GenreID)
);
CREATE TABLE IF NOT EXISTS `favorites` (
UserID int NOT NULL,
SongID int NOT NULL,
foreign key (SongID) references songs(SongID),
foreign key (UserID) references users(UserID)
);

CREATE TABLE IF NOT EXISTS `playlists` (
UserID int NOT NULL,
SongID int NOT NULL,
ranking int,
foreign key (SongID) references songs(SongID),
foreign key (UserID) references users(UserID)
);
