--Create a new Database
CREATE DATABASE Books;
GO

-- Start working with the database by calling it
USE Books;
GO

-- Creating the various tables used in the database
CREATE TABLE [Authors](
    [Author_id] INT NOT NULL PRIMARY KEY 
    ,[Author_Name] NVARCHAR(200) NOT NULL
    ,[Co_Author_Name] NVARCHAR(500) NULL
    ,[Author_Email] NVARCHAR(100) NULL UNIQUE
);

CREATE TABLE [Book] (
    [Book_Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY
    ,[Author_id] INT NOT NULL 
        FOREIGN KEY REFERENCES Authors(Author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE 
    ,[Title] NVARCHAR(500) NOT NULL
    ,[Sub_Title] NVARCHAR(500) NULL
    ,[ISBN_Number] NVARCHAR(50) NOT NULL UNIQUE

);

CREATE TABLE [Category](
    [Book_Id] INT NOT NULL PRIMARY KEY REFERENCES Book(Book_Id)
    ,[Category] NVARCHAR(500) NOT NULL
    
);

CREATE TABLE [Resume](
    [Book_Id] INT NOT NULL PRIMARY KEY REFERENCES [Book]([Book_Id])
    ,[Book_Resume] NVARCHAR(1000) NOT NULL
);

-- Inserting data into the table Authors
INSERT INTO [Books].[dbo].[Authors]
( -- Columns to insert data into
 Author_Id, Author_Name, Co_Author_Name, Author_Email
)
VALUES
( 
 1, 'William Shakespeare', NULL, 'williamshakespeare@gmail.com'
 ),
( 
 2, 'Christian Church', 'A lot of other folks', 'thevatican@vatican.com'
),
( 
 3, 'Miguel de Cervantes', NULL, 'migueldecervantes@hotmail.com'
),
( 
 4, 'Homer', 'The Drunk Greek', 'homer@odysen.gr' 
),
( 
 5, 'J.K Rowling', NULL, 'jkr@hp.com'
),
(
 6, 'Ovid', NULL, 'ovid@mailbox.com'
),
(
 7, 'James Joyce', NULL, 'jj@nsa.com'
),
(
 8, 'Aeschylus', NULL, 'Aeschylus@gmail.com'
),
(
 9, 'Lao Tsu', 'Tsu Lao' , 'laotheman@jubii.dk'
),
(
 10, 'Fyodor Dostoyevsky', 'The Vodka Gang', 'fyodor@awfullsmell.ru'
),
(
 11, 'Lewis Carroll', NULL, 'absinthabstinence@cybercity.com'
),
(
 12, 'Virginia Woolf', NULL, 'thewoolf@mail.com'
)
GO

-- Inserting data into the table Book
INSERT INTO [Books].[dbo].[Book]
( 
 Author_id, Title, Sub_Title, ISBN_Number
)
VALUES
( 
 1, 'First Folio', NULL, '978-0-7493-8655-9'
 ),
( 
 2, 'The Bible', 'Yep - That one', '978-3-7487-8655-9'
),
( 
 3, 'Don Quixote', NULL, '978-4-7493-8987-9'
),
( 
 4, 'The Iliad', 'Stories from anciant times', '978-5-7493-9999-9' 
),
( 
 5, 'Harry Potter', 'And the Order of the Phoenix', '978-6-7493-8655-9'
),
(
 6, 'Metamorphoses', NULL, '978-0-8888-8699-9'
),
(
7, 'Finnegans Wake', 'Old Stuff', '999-0-7493-8699-9'
),
(
8, 'Oresteia', NULL, '978-0-7493-9989-9'
),
(
9, 'Tao Te Ching', NULL , '878-0-7493-8699-9'
),
(
10, 'The Brothers Karamazov', 'Dostoyevsky Greatest Hits', '978-3-7492-8699-9'
),
(
11, 'Alices Adventures in Wonderland', 'The Johnny Deep Version', '978-2-0093-8699-9'
),
(
12, 'To the Lighthouse ', NULL, '978-1-7493-8699-9'
)
GO

-- Inserting data into the table Category
INSERT INTO [Books].[dbo].[Category]
( -- Columns to insert data into
 Book_Id, Category
)
VALUES
( 
 1, 'Fiction'
 ),
( 
 2, 'Non-Fiction'
),
( 
 3, 'Science Fiction'
),
( 
 4, 'Adventure' 
),
( 
 5, 'Fantasy'
),
(
 6, 'Cooking'
),
(
 7, 'Amusement'
),
(
 8, 'Greek Lit'
),
(
 9, 'Decorating'
),
(
 10, 'Russian Lit'
),
(
 11, 'Christmas'
),
(
 12, 'Animals'
)
GO

-- Inserting data into the table resume
INSERT INTO [Books].[dbo].[Resume]
( 
 Book_Id, Book_Resume
)
VALUES
( 
 1, 'Mr. William Shakespeares Comedies, Histories, & Tragedies is the 1623 published collection of William Shakespeares plays. Modern scholars commonly refer to it as the First Folio. Printed in folio..'
 ),
( 
 2, 'The Authorized King James Version is an English translation of the Christian Bible begun in 1604 and completed in 1611 by the Church of England. Printed by the Kings Printer, Robert Barker, the fi...'
),
( 
 3, 'Alonso Quixano a retired country gentleman in his fifties, lives in an unnamed section of La Mancha with his niece and a housekeeper. He has become obsessed with books of chivalry, and believes th...'
),
( 
 4, 'The Iliad is an epic poem in dactylic hexameters, traditionally attributed to Homer. Set in the Trojan War, the ten-year siege of Ilium by a coalition of Greek states, it tells of the battles and e...' 
),
( 
 5, 'Harry spends another boring summer on Privet between his fourth and fifth years of wizarding school at his terrible aunt and uncles house. He is angry and fed up with the fact that none of his friends are sending him any news about the war against Voldemort.'
),
(
 6, 'The Metamorphoses by the Roman poet Ovid is a narrative poem in fifteen books that describes the creation and history of the world. Completed in 8 AD, it has remained one of the most popular works ...'
),
(
 7, 'Having done the longest day in literature with his monumental Ulysses (1922), James Joyce set himself an even greater challenge for his next book — the night. A nocturnal state.... That is what I ...'
),
(
 8, 'The Oresteia is a trilogy of Greek tragedies written by Aeschylus which concerns the end of the curse on the House of Atreus. When originally performed it was accompanied by Proteus, a satyr play t...'
),
(
 9, 'The Tao Te Ching or Dao De Jing, originally known as Laozi, a record-keeper at the Zhou Dynasty court, by whose name the text is known in China. The texts true authorship and date of composition o...'
),
(
 10, 'Dostoevskys last and greatest novel, The Karamazov Brothers, is both a brilliantly told crime story and a passionate philosophical debate. The dissolute landowner Fyodor Pavlovich Karamazov is mur...'
),
(
 11, 'In 1862 Charles Lutwidge Dodgson, a shy Oxford mathematician with a stammer, created a story about a little girl tumbling down a rabbit hole. Thus began the immortal adventures of Alice, perhaps th...'
),
(
 12, 'A landmark novel of high modernism, the text, centering on the Ramsay family and their visits to the Isle of Skye in Scotland between 1910 and 1920, skillfully manipulates temporality and psycholog..'
)
GO








