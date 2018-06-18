DROP TABLE loans;
DROP TABLE members;
DROP TABLE books;
DROP TABLE genres;
DROP TABLE authors;


CREATE TABLE authors
(
  id SERIAL8 primary key,
  author VARCHAR(255)
);

CREATE TABLE genres
(
  id SERIAL8 primary key,
  genre VARCHAR(255)
);

CREATE TABLE books
(
  id SERIAL8 primary key,
  title VARCHAR(255),
  author_id INT8 references authors(id),
  genre_id INT8 references genres(id)
);

CREATE TABLE members
(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  post_code VARCHAR(255),
  email_address VARCHAR(255),
  active_membership BOOLEAN
);

CREATE TABLE loans
(
  id SERIAL8 primary key,
  member_id INT8 references members(id),
  book_id INT8 references books(id),
  loan_start_date DATE,
  loan_length INT8,
  book_returned BOOLEAN
);
