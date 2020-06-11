DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
PRAGMA foreign_keys = ON;


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);


CREATE TABLE questions (

  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body VARCHAR(255) NOT NULL,
  user_id VARCHAR NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (

    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
  );

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body VARCHAR(255),

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)

  );
  
CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)

);

-- INSERT INTO
--   users
--     (fname, lname)
-- VALUES
--     ('Albert', 'Einstein'),
--     ('Kurt', 'Godel');

-- INSERT INTO
--   questions
--     (title, body, user_id)
-- VALUES
--     ('How do you use sqlite', 'Sqlite is hard someone helpppp!!!?', (SELECT id FROM users WHERE fname = 'Albert')),
--     ('I can help', 'Wait no sqlite is trash!?', (SELECT id FROM users WHERE fname = 'Kurt')),
--     ('Why are there no TAs?', '68 minutes!?', (SELECT id FROM users WHERE fname = 'Kurt'));
-- -- question follows: user_id (from users) && question_id  (from questions)
-- INSERT INTO
--   question_follows
--   (user_id, question_id)
--   VALUES
--     ((SELECT id FROM users WHERE lname = 'Godel'), (SELECT id FROM questions WHERE title = 'I can help')),
--     ((SELECT id FROM users WHERE lname = 'Einstein'), (SELECT id FROM questions WHERE title = 'How do you use sqlite')),
-- ((SELECT id
-- FROM users
-- WHERE lname = 'Einstein')
-- ,
-- (SELECT id
-- FROM questions
-- WHERE title = 'I can help')
-- );
    

-- INSERT INTO
--   replies
--     (question_id, parent_id, body, user_id)
--     VALUES
--     ((SELECT id FROM questions WHERE title = 'I can help'), NULL, 'Nobody can help you', (SELECT id FROM users WHERE lname = 'Einstein'));
-- INSERT INTO 
--     replies
--       (question_id, parent_id, body, user_id)
--     VALUES
--     ((SELECT id FROM questions WHERE title = 'I can help'), (SELECT id FROM replies WHERE body = 'Nobody can help you'), 'Shutup Einstein', (SELECT id FROM users WHERE lname = 'Godel'));


-- INSERT INTO 
--     question_likes
--         (user_id, question_id)
--     VALUES
--     ((SELECT id FROM users WHERE lname = 'Godel'), (SELECT id FROM questions WHERE title = 'I can help'));


  --((SELECT users_id FROM questions WHERE questions(users_id) = users(id) AND ), 
  --(SELECT id FROM questions));

  INSERT INTO
  users
  (fname, lname)
VALUES
  ("Ned", "Ruggeri"),
  ("Kush", "Patel"),
  ("Earl", "Cat");


-- QUESTIONS

INSERT INTO
  questions
  (title, body, user_id)
SELECT
  "Ned Question", "NED NED NED", 1
FROM
  users
WHERE
  users.fname = "Ned" AND users.lname = "Ruggeri";

INSERT INTO
  questions
  (title, body, user_id)
SELECT
  "Kush Question", "KUSH KUSH KUSH", users.id
FROM
  users
WHERE
  users.fname = "Kush" AND users.lname = "Patel";

INSERT INTO
  questions
  (title, body, user_id)
SELECT
  "Earl Question", "MEOW MEOW MEOW", users.id
FROM
  users
WHERE
  users.fname = "Earl" AND users.lname = "Cat";


-- QUESTION_FOLLOWS

INSERT INTO
  question_follows
  (user_id, question_id)
VALUES
  ((SELECT id
    FROM users
    WHERE fname = "Ned" AND lname = "Ruggeri"),
    (SELECT id
    FROM questions
    WHERE title = "Earl Question")),

  ((SELECT id
    FROM users
    WHERE fname = "Kush" AND lname = "Patel"),
    (SELECT id
    FROM questions
    WHERE title = "Earl Question")
);


-- REPLIES


INSERT INTO
  replies
  (question_id, parent_id, user_id, body)
VALUES
  ((SELECT id
    FROM questions
    WHERE title = "Earl Question"),
    NULL,
    (SELECT id
    FROM users
    WHERE fname = "Ned" AND lname = "Ruggeri"),
    "Did you say NOW NOW NOW?"
);

INSERT INTO
  replies
  (question_id, parent_id, user_id, body)
VALUES
  ((SELECT id
    FROM questions
    WHERE title = "Earl Question"),
    (SELECT id
    FROM replies
    WHERE body = "Did you say NOW NOW NOW?"),
    (SELECT id
    FROM users
    WHERE fname = "Kush" AND lname = "Patel"),
    "I think he said MEOW MEOW MEOW."
);


-- QUESTION_LIKES


INSERT INTO
  question_likes
  (user_id, question_id)
VALUES
  ((SELECT id
    FROM users
    WHERE fname = "Kush" AND lname = "Patel"),
    (SELECT id
    FROM questions
    WHERE title = "Earl Question")
);

-- and here is the lazy way to add some seed data:
INSERT INTO question_likes
  (user_id, question_id)
VALUES
  (1, 1);
INSERT INTO question_likes
  (user_id, question_id)
VALUES
  (1, 2);

