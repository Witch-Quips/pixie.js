DROP TABLE if exists users;

CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email VARCHAR NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    username TEXT NOT NULL,
    birthday TEXT NOT NULL,
    birthmonth TEXT NOT NULL
);

INSERT into users (username, birthday, birthmonth, email, password_hash) values
('Amanda', 'november', '19', 'amanda@hecht.com', 'crowley'),
('Amaya', 'april', '29', 'amaya@maya.com','trout'),
('David', 'september', '22', 'david@lol.com', 'lol'),
('niki', 'june', '11', 'niki@hite.com', 'pink')

