DROP TABLE if exists users;
DROP TABLE if exists cards;

CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email VARCHAR NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    username TEXT NOT NULL
);

CREATE TABLE cards (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    position_id TEXT NOT NULL,
    arcana TEXT NOT NULL,
    suit_id TEXT NOT NULL,
    image TEXT NOT NULL
);

INSERT into users (username, email, password_hash) values
('Amanda', 'amanda@hecht.com', 'crowley'),
('Amaya', 'amaya@maya.com','trout'),
('David', 'david@lol.com', 'lol'),
('niki', 'niki@hite.com', 'pink');

INSERT into cards (name, position_id, arcana, suit_id, image) values
('a', 'a', 'a', 'a','a'),
('b', 'a', 'a', 'a','a'),
('c', 'a', 'a', 'a','a'),
('d', 'a', 'a', 'a','a')

