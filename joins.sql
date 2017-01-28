SELECT *
  FROM users;

SELECT *
  FROM posts
  WHERE posts.users_id = 100;

SELECT posts.*, first_name, last_name
  FROM users
  INNER JOIN posts ON posts.users_id = users.id
  WHERE users_id = 200;

SELECT posts.*, username
  FROM users
  INNER JOIN posts ON posts.users_id = users.id
  WHERE first_name = 'Norene' AND last_name = 'Schmitt';

SELECT username
  FROM users
  INNER JOIN posts ON posts.users_id = users.id
  WHERE posts.created_at > '2015-01-01';

SELECT posts.title, posts.content, username
  FROM users
  INNER JOIN posts ON posts.users_id = users.id
  WHERE users.created_at < '2015-01-01';

SELECT comments.*, title AS "Post Title"
  FROM posts
  INNER JOIN comments ON comments.posts_id = posts.id;

SELECT comments.*, title AS post_title, url AS post_url, comments.body AS comment_body
  FROM posts
  INNER JOIN comments ON comments.posts_id = posts.id
  WHERE posts.created_at < '2015-01-01';

SELECT comments.*, title AS post_title, url AS post_url, comments.body AS comment_body
  FROM posts
  INNER JOIN comments ON comments.posts_id = posts.id
  WHERE posts.created_at > '2015-01-01';

SELECT comments.*, title AS post_title, url AS post_url, comments.body AS comment_body
  FROM posts
  INNER JOIN comments ON comments.posts_id = posts.id
  WHERE body::text LIKE '%USB%';

SELECT posts.title AS post_title, first_name, last_name, comments.body AS comment_body
  FROM users
  INNER JOIN posts ON posts.users_id = users.id
  INNER JOIN comments ON comments.posts_id = posts.id
  WHERE body::text LIKE '%matrix%';

SELECT first_name, last_name, comments.body AS comment_body
  FROM users
  INNER JOIN posts ON posts.users_id = users.id
  INNER JOIN comments ON comments.posts_id = posts.id
  WHERE body::text LIKE '%SSL%' AND content::text LIKE '%dolorum%';

SELECT first_name AS post_author_first_name, last_name AS post_author_last_name, posts.title AS post_title, username AS comment_author_username, comments.body AS comment_body
  FROM users
  INNER JOIN posts ON posts.users_id = users.id
  INNER JOIN comments ON comments.posts_id = posts.id
  WHERE (body::text LIKE '%SSL%' OR body::text LIKE '%firewall%') AND content::text LIKE '%nemo%';