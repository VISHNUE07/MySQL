# Library Management System
------------

## Overview

The Library Management System is a database-driven project developed using MySQL to efficiently manage book inventory, rental records, and customer transactions. This system streamlines library operations by tracking books, monitoring customer activity, and managing employee distributions across branches.

## Features

* Book Inventory Management: Maintain records of available books, their categories, and rental prices.

* Customer Transactions: Track books borrowed by customers and manage their rental status.

* Branch & Employee Management: Monitor employee distribution across library branches.

* Issue & Return Tracking: Manage book issues and returns, ensuring a smooth library operation.

* Data Analysis & Insights: Generate reports on customer activity, book rentals, and resource allocation to enhance decision-making.

## Database Structure

The project includes a MySQL database named Library, containing the following tables:

* Branch - Stores branch details.

* Employee - Tracks library employees and their assigned branches.

* Customer - Maintains customer records.

* IssueStatus - Records books issued to customers.

* ReturnStatus - Tracks book returns and overdue status.

* Books - Stores book details such as title, category, and rental price.

## SQL Queries Implemented

* Retrieve book titles, categories, and rental prices.

* Link customers with the books they have borrowed.

* Analyze employee distribution across branches.

* Provide insights into customer activity and book rentals.

## Technologies Used

* Database: MySQL

* SQL Queries: Data retrieval, joins, aggregation, and filtering
