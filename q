/q
\q
CREATE TABLE famous_people (
  id BIGSERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  birthdate DATE
);
INSERT INTO famous_people (first_name, last_name, birthdate)
  VALUES ('Abraham', 'Lincoln', '1809-02-12');
INSERT INTO famous_people (first_name, last_name, birthdate)
  VALUES ('Mahatma', 'Gandhi', '1869-10-02');
INSERT INTO famous_people (first_name, last_name, birthdate)
  VALUES ('Paul', 'Rudd', '1969-04-06');
SELECT * FROM famous_people;
SELECT * FROM famous_people WHERE birthday >= '1920-01-01'
SELECT * FROM famous_people WHERE birthdate >= '1920-01-01';
SELECT * FROM famous_people WHERE birthdate >= '1920-01-01';
SELECT * FROM famous_people WHERE birthdate < '1920-01-01';
\q
psql < navy_schema.sql
;
psql < navy_schema.sql;
\q
psql < navy_schema.sql
;
\q
\d
DROP TABLE famous_people
;
\d
\d fleets
\q
\d
CREATE TABLE famous_people (
  id BIGSERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  birthdate DATE
);
INSERT INTO famous_people (first_name, last_name, birthdate)
  VALUES ('Abraham', 'Lincoln', '1809-02-12');
INSERT INTO famous_people (first_name, last_name, birthdate)
  VALUES ('Mahatma', 'Gandhi', '1869-10-02');
INSERT INTO famous_people (first_name, last_name, birthdate)
  VALUES ('Paul', 'Rudd', '1969-04-06');
/d famous_people
/d
\d
\d famous_people
\q
SELECT first_name FROM famous_people WHERE first_name = 'Abraham Lincoln'
;
SELECT first_name FROM famous_people WHERE first_name = 'Abraham'
;
\q
SELECT first_name FROM famous_people WHERE first_name = 'Abraham'
;
\q
INSERT INTO famous_people (first_name, last_name, birthdate)
  VALUES ('Abraham', 'Rudd', '1999-04-06');
\q
\d
\q
\d milestones
\q
\d milestones
\q
CREATE ROLE labber WITH LOGIN password 'labber';
CREATE DATABASE midterm OWNER labber;
\q
\connect midterm
\d
\q
\connect midterm
select * from orders
;
\q
\connect midterm
\d
\d orderitems
select * from items join orderitems on items.id=item_id
;
\q
\connect midterm
\d
\d orderitems
select * from items join orderitems on items.id=item_id;
\q
\connect midterm
\d
\d orderitems
select * from items join orderitems on items.id=items_id;
select * from items join orderitems on items.id=orderitems.items_id;
;
select * from items join orderitems on items.id=orderitems.item_id;
select * from items join orderitems on items.id=orderitems.\q\q_id;
select * from items join orderitems on items.id=orderitems.item_id join orders on orders.id=orderitems.order_id;
select * from items join orderitems on items.id=orderitems.item_id join orders on orders.id=orderitems.order_id;
\connect midterm
select * from items join orderitems on items.id=orderitems.item_id join orders on orders.id=orderitems.order_id;
\q
create database ar_exercises;
bundle install
;
quit
q
:q
quit;
\q
\d
sqlite3 db/development.sqlite3
;
\q
\d
select * from orders
;
select * from line_items;
\d
select * from users
;
select * from orders
;
\q
\d
select * from users
;
\q
\d
select * from reviews
;
select * from products
;
\q
\d
select * from products
;
\q
\d
select * from reviews
;
\q
\s
