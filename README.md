# Introduction
AS a database developer we normalize and denormalize database to organize a given database efficiently. It is a systematic approach to decompose a larger dataset into smaller ones that would  help us in from data redundancy.


According to wikipidea 
"Database normalization is the process of structuring a relational database in accordance with a series of so-called normal forms in order to reduce data redundancy and improve data integrity. It was first proposed by Edgar F. Codd as part of his relational model."


# Database Normalization
The following database normalization process are widely used for normalization,

-First Normal Form (1NF)
-Second Normal Form (2NF)
-Third Normal Form (3NF)
-Boyce-Codd Normal Form or Fourth Normal Form (BCNF of 4NF)
-Fifth Normal Form (5NF)
-Sixth Normal Form (6NF)

In this article, we will only focus on the the concepts of 1NF, 2NF and 3NF, and 
First Normal Form (1NF)
Data is stored in tables with rows that can be uniquely identified by a Primary Key.
Data within each table is stored in individual columns in its most reduced form
There are no repeating groups.


# Objective:
In this project we will focus on the first three normalizing process in database, and other forms are out of the scope of this projects.
# Methodology
## First Normal Form
- Data is stored in tables with rows that can be uniquely identified by a Primary Key
- Each column within tables would be reduced form
- There are no repetition of the grouping 
## Second Normal Form
- all the rules from first normal form must be satisfied
- Keeping those columns in a table that are directly related to the primary key 
## Third Normal Form
- all the rules from second normal form must be satisfied
- Between columns dependency within table must be avoided
# Overview of the examples Database
Let us consider the following data base diagrams, there is existing data base with four tables- Projects, Employees, ProjectsEmployees, and JobOrders. Besides, a new table (Customers) for customer information is added with existing database. But, if you observe in diagram, you can see customers tables has not been designed in proper way to support the normal form. Our main objective to update the customers tables so that it can follow the rules of normalization

<img src="image/Fig 1.png" width="600"/>

# Normalizing Examples Database and Discussion
## First Normal Form
### Identification of Problems
Following first normal rules are violated by customers table

- There is no primary key (id)
- Data is not in redundant form. For example, the column ContactPersonAndRole can be divided into two individuals column for example: ContactPerson and ContactPersonRole
- There are two repeating groups of columns in the table. For example, (Project1_ID, Project1_FeedBack) and (Project2_ID, Project2_Feedback). We need to get these removed from this table.
### Steps For First Normalization
- The first thing that I need to do is to add a primary key (id) to this table
- Secondly, I need to split the column ContactPersonAndRole into two individual columns. This can be done in two steps as follows:
  - Rename the original column from ContactPersonAndRole to ContactPerson.
  - Add a new column for ContactPersonRole.
- Finally, in order to satisfy the third rule of the First Normal Form, I need to move the columns Project1_ID, Project1_Feedback, Project2_ID, and Project2_Feedback into a new table. This can be done by creating a new table ProjectFeedbacks and link it back with the Customers and the Projects table. Here, new table ProjectFeedbacks use Foreign Key references to the Customers and Projects table.
The following database diagram will appear after applying all the rules of the first normal form.

