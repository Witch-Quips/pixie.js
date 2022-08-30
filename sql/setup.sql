DROP TABLE if exists users CASCADE;
DROP TABLE if exists cards CASCADE;

CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email VARCHAR NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    username TEXT NOT NULL
);
INSERT into users (username, email, password_hash) values
('Amanda', 'amanda@hecht.com', 'crowley'),
('Amaya', 'amaya@maya.com','trout'),
('David', 'david@lol.com', 'lol'),
('niki', 'niki@hite.com', 'pink');

CREATE TABLE cards (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    position_id TEXT NOT NULL,
    arcana TEXT NOT NULL,
    suit_id TEXT NOT NULL,
    image TEXT NOT NULL
);
INSERT into cards (name, position_id, arcana, suit_id, image) values
('the fool', '0', 'major', 'major','m00.jpg'),
('the magician', '1', 'major', 'major','m01.jpg'),
('the high preistess', '2', 'major', 'major','m02.jpg'),
('the empress', '3', 'major', 'major','m03.jpg'),
('the emperor', '4', 'major', 'major','m04.jpg'),
('the hierophant', '5', 'major', 'major','m05.jpg'),
('the lovers', '6', 'major', 'major','m06.jpg'),
('the chariot', '7', 'major', 'major','m07.jpg'),
('strength', '8', 'major', 'major','m08.jpg'),
('the hermit', '9', 'major', 'major','m09.jpg'),
('wheel of fortune', '10', 'major', 'major','m010.jpg'),
('justice', '11', 'major', 'major','m011.jpg'),
('the hanged man', '12', 'major', 'major','m012.jpg'),
('death', '13', 'major', 'major','m05.jpg'),
('temperance', '14', 'major', 'major','m014.jpg'),
('the devil', '15', 'major', 'major','m015.jpg'),
('the tower', '16', 'major', 'major','m016.jpg'),
('the star', '17', 'major', 'major','m017.jpg'),
('the moon', '18', 'major', 'major','m018.jpg'),
('the sun', '19', 'major', 'major','m019.jpg'),
('the judgement', '2', 'major', 'major','m20.jpg'),
('the world', '5', 'major', 'major','m05.jpg')