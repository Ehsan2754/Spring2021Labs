CREATE DATABASE movie;
CREATE TABLE gener (
    id  SERIAL PRIMARY KEY,
    title TEXT NOT NULL
);
CREATE TABLE person (
    id  SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    bd DATE
);
CREATE TABLE movie (
    id  SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    length INTEGER,
    pr_year DATE
);
CREATE TABLE company (
    id  SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT
);
CREATE TABLE actor (
    id  SERIAL PRIMARY KEY,
    movie_id INTEGER,
    person_id INTEGER,
    CONSTRAINT movie_actor_fk
    FOREIGN KEY (movie_id) REFERENCES movie(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);
CREATE TABLE quote (
    id  SERIAL PRIMARY KEY,
    var TEXT,
    actor_id INTEGER,
    movie_id INTEGER,
    CONSTRAINT movie_qoute_fk
    FOREIGN KEY (actor_id) REFERENCES actor(id),
    FOREIGN KEY (movie_id) REFERENCES movie(id)
);
CREATE TABLE production (
    id  SERIAL PRIMARY KEY,
    movie_id INTEGER,
    company_id INTEGER,
    CONSTRAINT production_actor_fk
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (movie_id) REFERENCES movie(id)
);
CREATE TABLE director (
    id  SERIAL PRIMARY KEY,
    director_id INTEGER,
    movie_id INTEGER,
    CONSTRAINT movie_director_fk
    FOREIGN KEY (director_id) REFERENCES person(id),
    FOREIGN KEY (movie_id) REFERENCES movie(id)
);

