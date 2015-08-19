CREATE DATABASE restfulgalaxies;
\c restfulgalaxies

CREATE TABLE galaxies (id SERIAL PRIMARY KEY, name VARCHAR(255), stars VARCHAR(255), distance VARCHAR(255));
