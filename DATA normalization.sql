create database ProjNormalization;
 use ProjNormalization;
CREATE TABLE Projects(
ID INT PRIMARY KEY,
NAME VARCHAR (100),
Value DECIMAL (5,2),
StartDate Date,
EndDate DATE
);
CREATE TABLE Employees(
ID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
HourlyWage DECIMAL(5,2),
HireDate DATE
);
CREATE TABLE ProjectEmployees(
ID INT PRIMARY KEY,
ProjectID INT,
EmployeeID INT,
Hours DECIMAL(5,2),
CONSTRAINT FK_ProjectEmployees_Projects FOREIGN KEY (ProjectID) REFERENCES  Projects (ID),
CONSTRAINT FK_ProjectEmployees_Employees FOREIGN KEY (EmployeeID) REFERENCES  Employees (ID)
);

CREATE TABLE JobOrders(
ID INT PRIMARY KEY,
EmployeeID INT,
ProjectID INT,
Description TEXT,
OrderDateTime DATETIME,
Quantity INT,
Price DECIMAL(5,2),
CONSTRAINT FK_JobOrders_Projects FOREIGN KEY (ProjectID) REFERENCES  Projects (ID),
CONSTRAINT FK_JobOrders_Employees FOREIGN KEY (EmployeeID) REFERENCES  Employees (ID)
);

CREATE TABLE customers (
    Name VARCHAR(100),
    Industry VARCHAR(100),
    Project1_ID INT,
    Project1_Feedback TEXT,
    Project2_ID INT,
    Project2_Feedback TEXT,
    ContactPersonID INT,
    ContactPersonAndRole VARCHAR(255),
    PhoneNumber VARCHAR(12),
    Address VARCHAR(255),
    City VARCHAR(255),
    Zip VARCHAR(5)
);

--- 1st Normal Form----
ALTER TABLE customers
ADD PRIMARY KEY (ID);

ALTER TABLE Customers CHANGE COLUMN ContactPersonAndRole ContactPerson varchar(100);
ALTER TABLE Customers 
ADD ContactPersonRole varchar(100);

ALTER TABLE Customers DROP COLUMN Project1_ID;
ALTER TABLE Customers DROP COLUMN Project1_Feedback;
ALTER TABLE Customers DROP COLUMN Project2_ID;
ALTER TABLE Customers DROP COLUMN Project2_Feedback;

CREATE TABLE ProjectFeedback (
ID INT PRIMARY KEY,
ProjectID INT,
CustomerID INT,
Feedback TEXT,
CONSTRAINT FK_ProjectFeedbacks_Projects FOREIGN KEY (ProjectID) REFERENCES  Projects (ID),
CONSTRAINT FK_ProjectFeedbacks_Customers FOREIGN KEY (CustomerID) REFERENCES  Customers (ID)
);
---- 2nd Normal Form-----
ALTER TABLE Customers 
DROP COLUMN ContactPerson,
DROP COLUMN ContactPersonRole,
DROP COLUMN PhoneNumber;

CREATE TABLE ContactPersons (
ID INT PRIMARY KEY,
ContactPerson varchar(100),
ContactPersonRole varchar(100),
PhoneNumber varchar(20)
);

ALTER TABLE Customers
ADD constraint FK_Customers_Contactpersons FOREIGN KEY (ContactPersonID) references ContactPersons(ID);
--- 3rd Normal Form----
ALTER TABLE Customers
DROP COLUMN City;

CREATE TABLE ZipCodes(
ZipID VARCHAR(5) PRIMARY KEY,
City VARCHAR(255)
);

ALTER TABLE Customers
ADD CONSTRAINT FK_Customers_ZipCodes FOREIGN KEY (Zip)
REFERENCES ZipCodes(ZipID);