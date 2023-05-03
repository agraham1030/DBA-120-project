CREATE DATABASE MusicLib;

USE MusicLib;

CREATE TABLE album (
  album_title VARCHAR(255) NOT NULL,
  studio_name VARCHAR(255),
  label_name VARCHAR(255),
  artist_name VARCHAR(255),
  album_release_date DATE,
  album_genre VARCHAR(255),
  album_num_awards INT,
  PRIMARY KEY (album_title)
);

CREATE TABLE artist (
  artist_name VARCHAR(255) NOT NULL,
  artist_member_names VARCHAR(255),
  PRIMARY KEY (artist_name)
);

CREATE TABLE label (
  label_name VARCHAR(255) NOT NULL,
  label_ownership VARCHAR(255),
  PRIMARY KEY (label_name)
);

CREATE TABLE song (
  song_title VARCHAR(255) NOT NULL,
  artist_name VARCHAR(255),
  album_title VARCHAR(255),
  song_length TIME,
  PRIMARY KEY (song_title),
);

CREATE TABLE studio (
  studio_name VARCHAR(255) NOT NULL,
  studio_street_address VARCHAR(255),
  studio_city VARCHAR(255),
  studio_state VARCHAR(255),
  studio_short_zip VARCHAR(255),
  PRIMARY KEY (studio_name)
);

ALTER TABLE album (
  ADD FOREIGN KEY (studio_name) REFERENCES studio(studio_name),
  ADD FOREIGN KEY (label_name) REFERENCES label(label_name),
  ADD FOREIGN KEY (artist_name) REFERENCES artist(artist_name)
);

ALTER TABLE song (
  ADD FOREIGN KEY (artist_name) REFERENCES artist(artist_name),
  ADD FOREIGN KEY (album_title) REFERENCES album(album_title)
 );
