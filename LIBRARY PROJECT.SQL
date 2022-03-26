
Create table branch(
branch_name Varchar(10),
branch_num number(10),
branch_location Varchar(10) ,
branch_Phone int ,
CONSTRAINT branchnum_pk PRIMARY KEY(branch_num)
);

Create table Employee (
Fname Varchar(10),
Lname Varchar(10),
Emp_salary Varchar(10),
Emp_id number(10) ,
brith_Date date ,
phone int  ,
CONSTRAINT Empid_pk PRIMARY KEY (Emp_id),
Id_branch Int ,
Foreign Key (Id_branch) References branch (branch_num) On Delete Cascade
 );

Create table member(
Fname Varchar(10),
Lname Varchar(10),
mem_type Varchar(10),
mem_id number(10) ,
DateJoin date ,
DateExpiry date ,
phone int  ,
CONSTRAINT memid_pk PRIMARY KEY (mem_id) ,
Id_branch Int ,
Foreign Key (Id_branch) References branch (branch_num) On Delete Cascade
);

Create table Room (
number number PRIMARY KEY,
 Status Varchar(10),
 duration Varchar(10),
  type Varchar(10),
Id_branch Int ,
Foreign Key (Id_branch) References branch (branch_num) On Delete Cascade
);
Create Table Book (
Book_id Char(10) Not Null Primary Key,
Book_Name Varchar (50) Not Null,
Book_Authorid Varchar (50) Not Null,
Book_Publisher Varchar (50) Not Null,
Book_State Varchar (50) Not Null, 
Id_branch Int ,
Foreign Key (Id_branch) References branch (branch_num) On Delete Cascade
);


Create Table Loan (
Loan_Id Int Not Null Primary Key ,
Loan_Status Varchar(50),
Loan_Starttime Date Not Null,
Loan_Endtime Date Not Null , 
Id_branch Int ,
Foreign Key (Id_branch) References branch (branch_num) On Delete Cascade
)

Create Table short_loan ( 
SLoan_Id Int Not Null Primary Key ,
SLoan_time Varchar(50) ,
SLoan_Status Varchar(50) ,
Loanid Int ,
Foreign Key (Loanid) References Loan(Loan_Id) On Delete Cascade
);

Create Table Fine ( 
Fine_Id Int Not Null Primary Key ,
Fine_Descrip Varchar(50) ,
Fine_Status Varchar(50) ,
Loanid Int ,
Foreign Key (Loanid) References Loan(Loan_Id) On Delete Cascade
);



Create Table Privilege (
Num Int Not Null Primary Key, 
Name Varchar(50) Not Null , 
Max_Num Varchar(50),
Loanid Int ,
Foreign Key (Loanid) References Loan(Loan_Id) On Delete Cascade

);


Create Table Video_Sound (
Id Int Not Null Primary Key,
Name Varchar(50)Not Null,
Rec_Type   Varchar(50) Not Null,
Rec_Description Varchar(50) Not Null,
Id_branch Int ,
Foreign Key (Id_branch) References branch (branch_num) On Delete Cascade
);
Create Table Thesis( 
Id Char(9) Not Null Primary Key, 
title Varchar(50) Not Null, 
status Varchar(50) Not Null, 
Id_branch Int ,
Foreign Key (Id_branch) References branch (branch_num) On Delete Cascade
);

Create Table journal ( 
Num int Not Null Primary Key, 
Title Varchar(50) Not Null, 
Status Varchar(50),
Id_branch Int ,
Foreign Key (Id_branch) References branch (branch_num) On Delete Cascade
);

Create View Vbookstatus As 
Select * From Book

Create User User1
Identified By 1234
Default Tablespace Users
Temporary Tablespace Temp
Quota 500k On Users;

Grant Connect To User1;
Grant Select On Vbookstatus To User1;


