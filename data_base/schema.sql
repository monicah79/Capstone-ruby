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

CREATE TABLE genre (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255)
);