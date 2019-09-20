DROP TABLE exhibits;
DROP TABLE artists;

CREATE TABLE artists(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE exhibits(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255)
  year INT4
  description VARCHAR(255)
  category VARCHAR(255)
  artist_id SERIAL8 REFERENCES artists(id) ON DELETE CASCADE
);
