CREATE DATABASE Library;

USE Library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(300),
    Contact_no VARCHAR(20)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(40),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(300),
    Reg_date DATE
);

CREATE TABLE Books (
    ISBN VARCHAR(50) PRIMARY KEY,
    Book_title VARCHAR(200),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(200),
    Issue_date DATE,
    Isbn_book VARCHAR(50),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(200),
    Return_date DATE,
    Isbn_book2 VARCHAR(50),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);


-- Inserting values into tables

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, 'Thenjipalam St, Calicut', '9895989596'),
(2, 102, 'Vadakkunnathan St, Trissur', '9798654789'),
(3, 103, 'MG St, Trivandrum', '9564125478'),
(4, 104, 'Palarivattom St, Ernamkulam', '9654874585'),
(5, 105, 'Shanthinagar St, Malappuram','9785451564');


INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(201, 'Vishnu E', 'Librarian', 50000.00, 1),
(202, 'Aswathi K', 'Assistant Librarian', 40000.00, 1),
(203, 'Akshay K', 'Librarian', 55000.00, 2),
(204, 'Anjali K', 'Assistant Librarian', 45000.00, 2),
(205, 'Ammu EK', 'Librarian', 57000.00, 2),
(206, 'Arun Kumar', 'Librarian', 50000.00, 1),
(207, 'Anu Nair', 'Assistant Librarian', 40000.00, 1),
(208, 'Manoj Menon', 'Librarian', 55000.00, 2),
(209, 'Deepa Pillai', 'Assistant Librarian', 45000.00, 2),
(210, 'Suresh Krishnan', 'Librarian', 52000.00, 1),
(211, 'Saranya Mohan', 'Assistant Librarian', 42000.00, 5),
(212, 'Rajesh Kumar', 'Librarian', 53000.00, 3),
(213, 'Anjali Rajan', 'Assistant Librarian', 43000.00, 3),
(214, 'Harish Gopalan', 'Librarian', 54000.00, 4),
(215, 'Smitha Nair', 'Assistant Librarian', 44000.00, 1);


INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(301, 'Raman Kutty', 'Thenjipalam St, Calicut', '2022-06-11'),
(302, 'Riju Dane', 'Kumbalangi St, Trissur', '2021-04-10'),
(303, 'Amal Davis', 'Palarivattom St, Ernakulam', '2021-01-21'),
(304, 'Radha Mani', 'Thenjippalam St, Calicut', '2022-11-08'),
(305, 'Sakkria Pothan', 'Melppalam St, Malappuram', '2022-04-30'),
(306, 'Abraham Ozler', 'Thekkekkara St, Malappuram', '2021-09-03');


INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('9780141182636', 'The Great Gatsby', 'Fiction', 10.99, 'yes', 'F. Scott Fitzgerald', 'Penguin Books'),
('9780061120084', 'To Kill a Mockingbird', 'Fiction', 12.99, 'no', 'Harper Lee', 'Harper Perennial'),
('9780061120096', 'Ode to a Nightingale', 'Poem', 8.49, 'no', 'John Keats', 'DC Books'),
('9780061120103', 'Discovery of India', 'History', 15.99, 'yes', 'Jawaharlal Nehru', 'DC Books'),
('9780061120179', 'A Million Mutinies Now', 'Non Fiction', 10.99, 'yes', 'V.S. Naipaul', 'DC Books');


INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(401, 301, 'The Great Gatsby', '2023-01-10', '9780141182636'),
(402, 302, 'To Kill a Mockingbird', '2023-02-15', '9780061120084'),
(403, 303, 'Ode to a Nightingale', '2023-02-18', '9780061120096'),
(404, 304, 'Discovery of India', '2023-02-24', '9780061120103'),
(405, 305, 'A Million Mutinies Now', '2023-06-11', '9780061120179');


INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(501, 301, 'The Great Gatsby', '2023-02-28', '9780141182636'),
(502, 302, 'To Kill a Mockingbird', '2023-03-20', '9780061120084'),
(503, 304, 'Discovery of India', '2023-03-10', '9780061120103');



# 1. Retrieve the book title, category, and rental price of all available books.

SELECT Book_title,Category, Rental_Price FROM Books Where Status = 'yes';

# 2. List the employee names and their respective salaries in descending order of salary.

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT Books.Book_title, Customer.Customer_name FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

# 4. Display the total count of books in each category.

SELECT Category, COUNT(Category) AS Total_Count FROM Books GROUP BY Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN ( SELECT Issued_cust FROM IssueStatus);

# 7. Display the branch numbers and the total count of employees in each branch.

SELECT Branch_no, count(Emp_name) AS Total_Count_Of_Employees FROM Employee GROUP BY Branch_no;

# 8. Display the names of customers who have issued books in the month of June 2023.

SELECT DISTINCT Customer.Customer_name FROM Customer JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE MONTH(IssueStatus.Issue_date) = 6 AND YEAR(IssueStatus.Issue_date) = 2023;

# 9. Retrieve book_title from book table containing history.

SELECT Book_title FROM Books WHERE Category = 'History';

# 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

SELECT Branch_no, Count(*) AS Count_Of_Employees From Employee GROUP BY Branch_no HAVING Count(*) > 5;

