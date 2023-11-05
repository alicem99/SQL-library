
CREATE DATABASE Library;
total_books_borrowedUSE Library;


CREATE TABLE Books(
BOOK_ID INT NOT NULL,
Title VARCHAR (60),
Author_Name VARCHAR (50) NOT NULL,
Author_ID INT,
Publisher VARCHAR (50),
Genre VARCHAR (20),
Available_Copies INT,
PRIMARY KEY(BOOK_ID)
);

ALTER TABLE Books
ADD INDEX idx_title (Title);

INSERT INTO Books
(BOOK_ID, Title, Author_Name, Author_ID, Publisher, Genre, Available_Copies)
VALUES
    (1, 'To Kill a Mockingbird', 'Harper Lee', 1, 'Publisher A', 'Fiction', 5),
    (2, '1984', 'George Orwell', 2, 'Publisher B', 'Science Fiction', 3),
    (3, 'Pride and Prejudice', 'Jane Austen', 3, 'Publisher C', 'Romance', 2),
    (4, 'The Great Gatsby', 'F. Scott Fitzgerald', 4, 'Publisher A', 'Fiction', 1),
    (5, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 5, 'Publisher D', 'Fantasy', 6),
    (6, 'The Catcher in the Rye', 'J.D. Salinger', 6, 'Publisher E', 'Fiction', 4),
    (7, 'To Kill a Kingdom', 'Alexandra Christo', 7, 'Publisher F', 'Fantasy', 2),
    (8, 'The Alchemist', 'Paulo Coelho', 8, 'Publisher G', 'Philosophy', 3),
    (9, 'The Hobbit', 'J.R.R. Tolkien', 9, 'Publisher H', 'Fantasy', 6),
    (10, 'The Da Vinci Code', 'Dan Brown', 10, 'Publisher I', 'Mystery', 1),
    (11, 'The Lord of the Rings', 'J.R.R. Tolkien', 9, 'Publisher H', 'Fantasy', 5),
    (12, 'The Chronicles of Narnia', 'C.S. Lewis', 11, 'Publisher J', 'Fantasy', 3),
    (13, 'Moby-Dick', 'Herman Melville', 12, 'Publisher K', 'Adventure', 2),
    (14, 'Jane Eyre', 'Charlotte Bronte', 13, 'Publisher L', 'Romance', 4),
    (15, 'The Adventures of Tom Sawyer', 'Mark Twain', 14, 'Publisher M', 'Adventure', 6),
    (16, 'The Picture of Dorian Gray', 'Oscar Wilde', 15, 'Publisher N', 'Fiction', 1),
    (17, 'The Hunger Games', 'Suzanne Collins', 16, 'Publisher O', 'Science Fiction', 5),
    (18, 'The Catch-22', 'Joseph Heller', 17, 'Publisher P', 'Satire', 2),
    (19, 'The Odyssey', 'Homer', 18, 'Publisher Q', 'Epic', 3),
    (20, 'Brave New World', 'Aldous Huxley', 19, 'Publisher R', 'Science Fiction', 4);

    SELECT * FROM Books;
    
    CREATE TABLE MEMBERS(
    MEMBER_ID INT NOT NULL,
    First_Name VARCHAR (20),
    Last_Name VARCHAR (20),
    Address VARCHAR(80),
    CITY VARCHAR (20) NOT NULL DEFAULT 'Valencia',
    Email VARCHAR (30),
    Telephone INT,
    PRIMARY KEY (Member_ID)
    );
    
    INSERT INTO MEMBERS (MEMBER_ID, First_Name, Last_Name, Address, Email, Telephone)
VALUES
    (1, 'Johnny', 'Doeson', '123 Main St', 'john.doe@hotmail.com', 123456789),
    (2, 'Janet', 'Smithy', '456 Elm St', 'jane.smith@yahoo.com', 987654321),
    (3, 'Alice', 'Johnson', '789 Oak St', 'alice.johnson@outlook.com', 555555555),
    (4, 'Michael', 'Johnson', '321 Pine St', 'michael.johnson@example.com', 111222333),
    (5, 'Emily', 'Davis', '789 Maple St', 'emily.davis@hotmail.com', 444555666),
    (6, 'Daniel', 'Wilson', '567 Oak St', 'daniel.wilson@yahoo.com', 777888999),
    (7, 'Sophia', 'Brown', '987 Elm St', 'sophia.brown@hotmail.com', 222333444),
    (8, 'Oliver', 'Anderson', '654 Cedar St', 'oliver.anderson@example.com', 555444333),
    (9, 'Sally', 'Smith', '754 Main St', 'sally.smith@example.com', 123455789),
     (10, 'Bob', 'Hobson', '24 Traflgar Rd', 'Bob.Hobsonh@example.com', 1234356889),
     (11, 'Ted', 'Elliot', '3 Sandson Ave', 'Ted.Elliot@example.com', 999646889),
      (12, 'Ali', 'Walker', '86 Ailson Rd', 'sally.walker@example.com', 0987777889),
       (13, 'Ange', 'Davidson', '72 Stellar Rd', 'ange.davidson@example.com', 12776889),
        (14, 'Katy', 'Watson', '1 Newton Ave', 'katy.watson@example.com', 7794889),
         (15, 'Samuel', 'Jackson', '7 Ronny Rd', 'samuel.jackson@example.com', 11356889);
         
    SELECT * FROM Members;

CREATE TABLE Borrowed_Books (
  Borrowing_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Book_Name VARCHAR (100),
  Book_ID INT,
  Member_ID INT,
  Date_Borrowed DATE,
  Return_date DATE,
  FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
  FOREIGN KEY (Book_ID) REFERENCES Books(BOOK_ID)
);

SELECT * FROM Borrowed_Books;

INSERT INTO Borrowed_Books (Book_ID, Member_ID, Date_Borrowed, Return_date, Book_Name)
VALUES
    (1, 2, '2023-06-28', '2023-07-05', 'To Kill a Mockingbird'),
    (2, 5, '2023-06-29', '2023-07-06', '1984'),
    (3, 3, '2023-06-30', '2023-07-07', 'Pride and Prejudice'),
    (4, 1, '2023-07-01', '2023-07-08', 'The Great Gatsby'),
    (5, 6, '2023-07-02', '2023-07-09', 'Harry Potter and the Sorcerers Stone'),
	(1, 2, '2023-06-28', '2023-07-05', 'To Kill a Mockingbird'),
    (2, 5, '2023-06-29', '2023-07-06', '1984'),
    (3, 3, '2023-06-30', '2023-07-07', 'Pride and Prejudice'),
    (4, 1, '2023-07-01', '2023-07-08', 'The Great Gatsby'),
    (5, 6, '2023-07-02', '2023-07-09', 'Harry Potter and the Sorcerer\'s Stone');

CREATE TABLE Overdue_Books (
  Book_ID INT,
  Member_ID INT,
  Due_Date DATE,
  Days_Overdue INT,
  Date_returned DATE,
  FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
  FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

INSERT INTO Overdue_Books (Book_ID, Member_ID, Due_Date, Days_Overdue, Date_returned)
VALUES
  (1, 2, '2023-06-30', 2, '2023-07-02'),
  (2, 4, '2023-06-28', 4, '2023-07-02'),
  (3, 6, '2023-07-01', 1, NULL);
  
 INSERT INTO Borrowed_Books (Book_ID, Date_Borrowed, Return_date)
SELECT BOOK_ID, CURRENT_DATE(), DATE_ADD(CURRENT_DATE(), INTERVAL 14 DAY)
FROM Books
LIMIT 5;


CREATE TABLE Authors (
  Author_ID INT PRIMARY KEY,
  Title VARCHAR(100),
  Book_ID INT,
  INDEX idx_title (Title),
  FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
  FOREIGN KEY (Title) REFERENCES Books(Title)
);

INSERT INTO Authors (Author_ID, Title, Book_ID, Author_name)
SELECT DISTINCT Author_ID, Title, Book_ID, Author_name
FROM Books;


SELECT * FROM Authors;

--Using any type of the joins create a view that combines multiple tables in a logical way

We cant find Pride and Prejudice. Is it overdue?

SELECT b.title
FROM books AS b
INNER JOIN overdue_books as od
ON b.book_id = od.book_id
WHERE title = 'pride and prejudice';

Which books are borrowed by members with the surname 'Johnson'?
SELECT DISTINCT m.first_name, m.last_name 
FROM members AS m
INNER JOIN borrowed_books AS bb 
ON m.member_ID = bb.member_ID
WHERE m.last_name = 'Johnson';

Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis 
Which books have not been borrowed by any member?
SELECT m.first_name, m.last_name
FROM members m
WHERE member_ID NOT IN(
SELECT member_ID
From borrowed_books);

What authors have written in different genres?
SELECT DISTINCT b.author_name, b.genre
FROM Books b
WHERE b.genre IN (
    SELECT DISTINCT genre
    FROM Books
    GROUP BY author_name
);


Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis 
What is the most popular genre?

SELECT DISTINCT a.author_name, b.genre
FROM authors AS a
JOIN books AS b ON a.author_id = b.author_id
WHERE b.genre IN (
    SELECT genre
    FROM books
    GROUP BY genre
    HAVING COUNT(DISTINCT author_id) > 1
);

In your database, create a stored function that can be applied to a query in your DB
How many members are there at the library?

DELIMITER //

CREATE FUNCTION GetTotalMembers() RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE totalMembers INT;

    SELECT COUNT(*) INTO totalMembers
    FROM Members;

    RETURN totalMembers;
END //

DELIMITER ;

SELECT GetTotalMembers() AS TotalMembers;

Create a store procedure and show how it runs
Total books borrowed
DELIMITER $$
CREATE PROCEDURE total_books_borrowed()
BEGIN
SELECT COUNT(*) FROM borrowed_books;
END $$
DELIMITER ;

CALL total_books_borrowed();

In your database, create a trigger and demonstrate how it runs
This trigger will update the book availability status in the 'Books' table after an insertion is made into the 'borrowed_books' table.

DELIMITER //
CREATE TRIGGER update_book_availability
AFTER INSERT ON borrowed_books
FOR EACH ROW
BEGIN
    UPDATE Books
    SET Available_Copies = Available_Copies - 1
    WHERE BOOK_ID = NEW.Book_ID;
END;
DELIMITER //

SELECT * FROM Books;

INSERT INTO borrowed_books (Book_ID, Date_Borrowed, Return_Date)
VALUES (6, '2023-07-13', '2023-07-20');

SELECT * FROM Books;

--Create a view that uses at least 3-4 base tables, produce a logically arranged result set for analysis.
Calculate the total number of books borrowed for each author in descending order to see which authors have the most books borrowed and are therefore the most popular authors.

CREATE VIEW LibraryAnalysis AS
SELECT b.book_name, a.Author_Name, m.First_Name, m.Last_Name, bb.Date_Borrowed, bb.Return_Date
FROM Books b
INNER JOIN Authors a ON b.Author_ID = a.Author_ID
INNER JOIN Borrowed_Books bb ON b.Book_ID = bb.Book_ID
INNER JOIN Members m ON bb.Member_ID = m.Member_ID;

SELECT Author_Name, COUNT(*) AS TotalBorrowed
FROM LibraryAnalysis
GROUP BY Author_Name
ORDER BY TotalBorrowed DESC;



