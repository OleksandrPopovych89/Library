DROP SCHEMA IF EXISTS library;
CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE IF NOT EXISTS library.author
(
    author_id   INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS library.publisher
(
    publisher_id         INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name       VARCHAR(50),
    publisher_tel_number VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS library.books
(
    book_id             INT PRIMARY KEY AUTO_INCREMENT,
    book_name           VARCHAR(50),
    author_id           INT,
    FOREIGN KEY (author_id) REFERENCES author (author_id),
    publisher_id        INT,
    FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
    isbn                VARCHAR(30),
    date_of_publication INT,
    quantity            INT CHECK (quantity >= 0)
);


INSERT INTO library.author(author_name)
VALUES ('Редярд Кіплінг'),
       ('Джонсон Борис'),
       ('Роберт С. Мартін'),
       ('Мацуда Джюко');

INSERT INTO library.publisher(publisher_name, publisher_tel_number)
VALUES ('Фоліо', '+38 050 344 40 54'),
       ('Vivat', '0-800-201-102'),
       ('Фабула', '+38 067 573 53 83'),
       ('Ранок', '+38 057 701 11 22');


INSERT INTO library.books (isbn, book_name, author_id, publisher_id, date_of_publication, quantity)
VALUES ('978-966-03-6330-4', 'Книга джунглів', 1, 1, 2013, 5),
       ('978-966-942-796-0', 'Фактор Черчилля: Як одна людина змінила історію', 2, 2, 2019, 4),
       ('978-617-095-285-1', 'Чистий код', 3, 3, 2019, 8),
       ('978-617-095-286-8', 'Чиста архітектура', 3, 3, 2019, 6),
       ('978-617-09-7933-9', 'Привид Києва', 4, 4, 2022, 16);

SELECT book_name, author_name, publisher_name, isbn, date_of_publication, quantity
FROM library.books
         JOIN library.author a on books.author_id = a.author_id
         JOIN library.publisher b on books.publisher_id = b.publisher_id
WHERE author_name = 'Роберт С. Мартін';
