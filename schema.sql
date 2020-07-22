CREATE DATABASE ratethatagent;

CREATE TABLE houses (
    id SERIAL PRIMARY KEY,
    number_street TEXT,
    suburb TEXT,
    postcode INTEGER,
    image_url TEXT,
    agent TEXT,
    review TEXT,
    user_id INTEGER 
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    password_digest TEXT
);