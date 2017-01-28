DROP USER IF EXISTS has_many_user;

CREATE USER has_many_user;

DROP DATABASE IF EXISTS has_many_blogs;

CREATE DATABASE has_many_blogs OWNER has_many_user;

\c has_many_blogs;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id serial PRIMARY KEY NOT NULL,
  username varchar(90) NOT NULL,
  first_name varchar(90) NULL DEFAULT NULL,
  last_name varchar(90) NULL DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id serial PRIMARY KEY NOT NULL,
  title varchar(180) NULL DEFAULT NULL,
  url varchar(510) NULL DEFAULT NULL,
  content text NULL DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  users_id integer REFERENCES users(id) NOT NULL
);

DROP TABLE IF EXISTS comments;

CREATE TABLE comments (
  id serial PRIMARY KEY NOT NULL,
  body varchar(510) NULL DEFAULT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NOT NULL DEFAULT now(),
  users_id integer REFERENCES users(id) NOT NULL,
  posts_id integer REFERENCES posts(id) NOT NULL 
);

\i scripts/blog_data.sql