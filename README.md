# DBA-120-project

## ERD for the MusicLib Database

![ERD](album_db_erd.png)

## How To Create the Database

[dba_final.sql](dba_final.sql)

```
CREATE DATABASE MusicLib;

USE MusicLib;

CREATE TABLE album (
  album_title VARCHAR(255) PRIMARY KEY,
  studio_name VARCHAR(255),
  label_name VARCHAR(255),
  artist_name VARCHAR(255),
  album_release_date DATE,
  album_genre VARCHAR(255),
  album_num_awards INT(3),
  FOREIGN KEY (studio_name) REFERENCES studio(studio_name),
  FOREIGN KEY (label_name) REFERENCES label(label_name),
  FOREIGN KEY (artist_name) REFERENCES artist(artist_name)
);

CREATE TABLE artist (
  artist_name VARCHAR(255) PRIMARY KEY,
  artist_member_names VARCHAR(255)
);

CREATE TABLE label (
  label_name VARCHAR(255) PRIMARY KEY,
  label_ownership VARCHAR(255)
);

CREATE TABLE song (
  song_title VARCHAR(255) PRIMARY KEY,
  artist_name VARCHAR(255),
  album_title VARCHAR(255),
  song_length TIME,
  FOREIGN KEY (artist_name) REFERENCES artist(artist_name),
  FOREIGN KEY (album_title) REFERENCES album(album_title)
);

CREATE TABLE studio (
  studio_name VARCHAR(255) PRIMARY KEY,
  studio_street_address VARCHAR(255),
  studio_city VARCHAR(255),
  studio_state VARCHAR(255),
  studio_short_zip INT(5)
);

ALTER TABLE album
ADD CONSTRAINT fk_album_label
FOREIGN KEY (label_name) REFERENCES label(label_name);

ALTER TABLE album
ADD CONSTRAINT fk_album_studio
FOREIGN KEY (studio_name) REFERENCES studio(studio_name);

ALTER TABLE album
ADD CONSTRAINT fk_album_artist
FOREIGN KEY (artist_name) REFERENCES artist(artist_name);

ALTER TABLE song
ADD CONSTRAINT fk_song_album
FOREIGN KEY (album_title) REFERENCES album(album_title);

ALTER TABLE song
ADD CONSTRAINT fk_song_artist
FOREIGN KEY (artist_name) REFERENCES artist(artist_name);

```
