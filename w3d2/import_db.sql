
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id integer PRIMARY KEY NOT NULL,
  fname varchar(50) NOT NULL,
  lname varchar(50) NOT NULL
);


DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id integer PRIMARY KEY NOT NULL,
  title varchar(50) NOT NULL,
  body varchar(255) NOT NULL,
  author_id integer NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id integer PRIMARY KEY NOT NULL,
  user_id integer NOT NULL,
  question_id integer NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES question_follows(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id integer PRIMARY KEY NOT NULL,
  question_id integer NOT NULL,
  parent_reply_id integer,
  user_id integer NOT NULL,
  body varchar(255) NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id integer PRIMARY KEY NOT NULL,
  user_id integer NOT NULL,
  question_id integer NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Mike', 'Cleary'),
  ('Justin', 'Black'),
  ('John', 'Doe'),
  ('Hannah', 'Montana');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Sample question 1', 'What are these questions about?', 1),
  ('Favorite Color ', 'What is your favorite color?', 2),
  ('Q3 ', 'What is your favorite color?', 1),
  ('Q4', 'What is your favorite color?', 1);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (1, 2),
  (2, 2),
  (3, 2),
  (4, 2),
  (1, 3),
  (2, 3),
  (1, 4);

INSERT INTO
  replies (question_id, parent_reply_id, user_id, body)
VALUES
  (1, NULL, 1, 'My first reply on question 1!'),
  (1, 1, 2, 'Reply number 2 on question 1'),
  (2, NULL, 1, 'My first reply on question 2!'),
  (2, 3, 2, 'Reply number 2 on question 2');

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (2, 1),
  (3, 1),
  (1, 2),
  (2, 2),
  (3, 2),
  (4, 2),
  (1, 3),
  (2, 3),
  (1, 4);
