CREATE DATABASE catalog;

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
	publisher VARCHAR(250),
	cover_state VARCHAR(250),
  publish_date DATE,
  archived BOOLEAN
)

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(150),
  color VARCHAR(150)
);

CREATE TABLE genres (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE items (
  id INTEGER PRIMARY KEY,
  genre_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  label_id INTEGER NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE music_albums (
  id INTEGER PRIMARY KEY,
  item_id INTEGER NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  multiplayer BOOLEAN,
  last_played_at DATE,
  genre_id INT,
  label_id INT,
  publish_date DATE,
  author_id INT,
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(label_id),
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id),
  PRIMARY KEY(id)
);

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name  VARCHAR(100),
  last_name   VARCHAR(100)
);
