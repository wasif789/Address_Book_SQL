------------------UC1 Create Database------------------

create database AddressBookSystem;

use AddressBookSystem;
-----------------UC2 Create Table---------------

create table Address_Book_Table
(
FirstName varchar(50) not null,
LastName varchar(20),
Address varchar(100),
City varchar(50),
StateName varchar(55),
ZipCode int,
Phonenum bigint,
EmailId varchar(100)
);