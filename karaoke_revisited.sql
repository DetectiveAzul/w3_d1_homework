DROP TABLE songs_and_playlists_relationships;
DROP TABLE playlists;
DROP TABLE customers;
DROP TABLE songs;
DROP TABLE rooms;

CREATE TABLE rooms (
  id SERIAL8 PRIMARY KEY,
  size INT,
  entry_fee INT
);

CREATE TABLE playlists (
  id SERIAL8 PRIMARY KEY,
  genre VARCHAR(255),
  room_id INT8 REFERENCES rooms(id)
);

CREATE TABLE songs (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE songs_and_playlists_relationships (
  id SERIAL8 PRIMARY KEY,
  playlist_id INT8 REFERENCES playlists(id),
  song_id INT8 REFERENCES songs(id)
);

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  cash INT,
  fave_song INT8 REFERENCES songs(id),
  room_id INT8 REFERENCES rooms(id)
);

-- Adding rooms
INSERT INTO rooms (size, entry_fee)
  VALUES (12, 5);
INSERT INTO rooms (size, entry_fee)
  VALUES (12, 10);
INSERT INTO rooms (size, entry_fee)
  VALUES (12, 15);
INSERT INTO rooms (size, entry_fee)
  VALUES (12, 20);

-- Adding playlists
INSERT INTO playlists (genre, room_id)
  VALUES ('Movie OST', 1);
INSERT INTO playlists (genre, room_id)
  VALUES ('Disney songs', 2);
INSERT INTO playlists (genre, room_id)
  VALUES ('Rock songs', 3);
INSERT INTO playlists (genre, room_id)
  VALUES ('Lady Gaga songs', 4);

-- Adding songs
INSERT INTO songs (name)
  VALUES ('Duel Of The Fates');
INSERT INTO songs (name)
  VALUES ('Heart Will Go On');
INSERT INTO songs (name)
  VALUES ('A Friend Like Me');
INSERT INTO songs (name)
  VALUES ('I Will Make a Man Out Of You');
INSERT INTO songs (name)
  VALUES ('Rock You Like a Hurricane');
INSERT INTO songs (name)
  VALUES ('Mirror Mirror');
INSERT INTO songs (name)
  VALUES ('Telephone');
INSERT INTO songs (name)
  VALUES ('Bad Romance');

-- Adding relationship between songs and playlists
INSERT INTO songs_and_playlists_relationships(playlist_id, song_id)
  VALUES (1, 1);
INSERT INTO songs_and_playlists_relationships(playlist_id, song_id)
  VALUES (1, 2);
INSERT INTO songs_and_playlists_relationships(playlist_id, song_id)
  VALUES (2, 1);
INSERT INTO songs_and_playlists_relationships(playlist_id, song_id)
  VALUES (2, 3);
INSERT INTO songs_and_playlists_relationships(playlist_id, song_id)
  VALUES (2, 4);
INSERT INTO songs_and_playlists_relationships(playlist_id, song_id)
  VALUES (3, 7);
INSERT INTO songs_and_playlists_relationships(playlist_id, song_id)
  VALUES (3, 8);
INSERT INTO songs_and_playlists_relationships(playlist_id, song_id)
  VALUES (3, 5);
INSERT INTO songs_and_playlists_relationships(playlist_id, song_id)
  VALUES (3, 6);
INSERT INTO songs_and_playlists_relationships(playlist_id, song_id)
  VALUES (4, 7);
INSERT INTO songs_and_playlists_relationships(playlist_id, song_id)
  VALUES (4, 8);

-- Adding Customers
INSERT INTO customers (name, cash, fave_song, room_id)
  VALUES ('Craig', 30, 1, 1);
INSERT INTO customers (name, cash, fave_song, room_id)
  VALUES ('Pawel', 25, 2, 1);
INSERT INTO customers (name, cash, fave_song, room_id)
  VALUES ('Keith', 50, 3, 2);
INSERT INTO customers (name, cash, fave_song, room_id)
  VALUES ('Sandy', 34, 4, 2);
INSERT INTO customers (name, cash, fave_song, room_id)
  VALUES ('Sian', 90, 5, 3);
INSERT INTO customers (name, cash, fave_song, room_id)
  VALUES ('Kat', 110, 6, 3);
INSERT INTO customers (name, cash, fave_song, room_id)
  VALUES ('Morag', 20, 7, 4);
INSERT INTO customers (name, cash, fave_song, room_id)
  VALUES ('Steph', 250, 8, 4);

-- Updating information
UPDATE customers
  SET cash = cash - 5
  WHERE room_id = 1;

UPDATE customers
  SET cash = cash - 10
  WHERE room_id = 2;

UPDATE customers
  SET cash = cash - 15
  WHERE room_id = 3;

UPDATE customers
  SET cash = cash - 20
  WHERE room_id = 4;

UPDATE playlists
  SET genre = 'Pop/Rock songs'
  WHERE id = 3;

-- Querying information
-- Printing everything from a table order by a value
SELECT * FROM rooms ORDER BY entry_fee;

-- Printing only some rows from a table ordered by a value
SELECT * FROM customers WHERE room_id = 4 ORDER BY name;

-- Printing only some columns
SELECT size, entry_fee FROM rooms;

-- Many to Many querying
SELECT name, genre FROM songs, playlists, songs_and_playlists_relationships
  WHERE song_id = songs.id AND playlist_id = playlists.id;
