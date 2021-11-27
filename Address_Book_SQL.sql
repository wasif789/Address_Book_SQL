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

---------------UC3 Inserting the values to fields-----------------
Insert into Address_Book_Table values('Harish','Krishnan','Jew Town','Cochin','Kerala',60035,8657323789,'harsh@gmail.com'),
('Kishore','Kumar','ECR','Chennai','TamilNadu',60025,9845672378,'kishore2000@gmail.com'),
('Swetha','Raju','P.N.Pudhur','Coimbatore','TamilNadu',600082,8967245870,'swetha123@gmail.com');
Insert into Address_Book_Table values('Vedhashni','Velmurugan','Madipakkam','Chennai','TamilNadu',60091,8939620291,'vedha39@gmail.com');
Insert into Address_Book_Table values('Ashok','Kumar','ECR','Chennai','TamilNadu',600024,9867423567,'ashok32@gmail.com');

--------------UC4 Editing the existing contact------------------------
update Address_Book_Table set EmailId='harsh32@gmail.com' where FirstName='Harish';

update Address_Book_Table set Address='Mambakkam' where FirstName='Kishore';

update Address_Book_Table set Phonenum=7390802345 where FirstName='Swetha';

select * from Address_Book_Table;

------------------UC5 Delete the contact-------------------

delete from Address_Book_Table where FirstName='Harish' and LastName='Krishnan';

--------------------UC6 Retrive the data by city or state ---------------------

Select FirstName,LastName from Address_Book_Table where City='Chennai' or StateName='TamilNadu';
--------------------UC7 Count of city and state---------------------

Select Count(*) As Count,StateName,City from Address_Book_Table group by StateName,City;
-------------------UC8 Sort the name by alphebatically----------------------

select FirstName,LastName from Address_Book_Table where City='Chennai' order by FirstName;

-------------------UC9 Adding name and relationtype columns------------------------------

alter table Address_Book_Table
add AddressBookName varchar(50),
RelationType varchar(50);


update Address_Book_Table
set AddressBookName='FriendName',RelationType='Friend'
where FirstName='Ashok';

update Address_Book_Table
set AddressBookName='Cousin',RelationType='Family'
where Address='Madipakkam';

update Address_Book_Table
set AddressBookName='Manager',RelationType='Profession'
where ZipCode=600082;

update Address_Book_Table
set AddressBookName='Cousin',RelationType='Family'
where Address='Mambakkam';


select * from Address_Book_Table;

------------------------UC10 Count of person by relationtype --------------

Select count(*)as CountType, RelationType  from Address_Book_Table group by RelationType;

--------UC11 Create Contact for both Family and Friends Type --------
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Address_Book
Full JOIN Contact_Person on Address_Book.AddressBookID=Contact_Person.AddressBook_ID 
Full JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
Full JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID;

--------------------------UC12 ER-Diagram-------------------

--Create Address_Book table
create table Address_Book(
AddressBookID int identity(1,1) primary key,
AddressBookName varchar(100)
);
---Insert the values in Address_Book
Insert into Address_Book values ('Swetha'),('Kishore');
---Retrieve the data
select * from Address_Book;
--Create Contact_Person
create table Contact_Person(
AddressBook_ID int,
ContactID int identity(1,1) primary key,
FirstName varchar(100),
LastName varchar(100),
Address varchar(250),
City varchar(100),
StateName varchar(100),
ZipCode BigInt,
PhoneNum BigInt,
EmailId varchar(200),
foreign key (AddressBook_ID) references Address_Book(AddressBookID));
--Insert the values 
Insert into Contact_Person values
(1,'Dinesh','Sankar','Fort Road','Bangalore','Karnataka',600158,8939478157,'dinesh456@gmail.com'),
(2,'Raj','Kumar','Adam Street','Chennai','Tamil Nadu',600015,9847581547,'raj23@gmail.com'),
(2,'Akshaya','Raju','South Marret Street.','Coimbatore','Tamil Nadu',600145,874875197,'akshaya@23gmail.com'),
(1,'Atchaya','Vishal','Gandhi Bazaar','Cochin','Kerala',601454,7847595157,'atchu2000@gmail,com');
--Retrieve the data
select * from Contact_Person;
---Create contact_type table
create table Contact_Type
(ContactTypeID int identity(1,1) primary key,
ContactTypeName varchar(100)
);
---Insert the values in contat_type
Insert into Contact_Type values
('Family'),('Friends'),('Profession');
--Retrieve the data
Select * from Contact_Type;
---Create relation type table
create Table Relation_Type(
ContactType_ID int,
Contact_ID int,
foreign key (ContactType_ID) references Contact_Type(ContactTypeID),
foreign key (Contact_ID) references Contact_Person(ContactID)
);
---Insert the values in relation_type
insert into Relation_Type values
(1,3),
(2,3),
(3,1),
(1,2),
(2,4);
--Retrieve the data
Select * from Relation_Type;

-----UC13 Ensure all retrieve queries done----
----UC6--->Retrieve Person Belonging to  City or State
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=Contact_Person.AddressBook_ID and (City='Chennai' or StateName='TamilNadu')
INNER JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID;
----UC7--->Size of state and city
select Count(*)As CountOfStateAndCity ,StateName,City
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=AddressBook_ID 
Group by StateName,City;
-----UC8--->Retrieve the person data entries sorted alphabetically
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=AddressBook_ID 
INNER JOIN Relation_Type on Relation_Type.Contact_Id=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
order by(FirstName);
---	UC9--->Get Number Of contact persons by type
select Count(*) as NumberOfContacts,Contact_Type.ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=Contact_Person.AddressBook_ID
INNER JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
Group by ContactTypeName;



