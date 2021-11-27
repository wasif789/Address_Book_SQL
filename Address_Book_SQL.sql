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




