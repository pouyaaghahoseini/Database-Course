CREATE DATABASE bank;
USE bank;
CREATE TABLE Bank
(
  Bank_Code INT NOT NULL,
  Bank_Name VARCHAR(20) NOT NULL ,
  Bank_Address VARCHAR(20) NOT NULL ,
  PRIMARY KEY (Bank_Code)
);

CREATE TABLE Client
(
  Client_ID INT NOT NULL,
  Client_Name VARCHAR(20) NOT NULL ,
  Client_Phone INT NOT NULL,
  Client_Address VARCHAR(20) NOT NULL ,
  PRIMARY KEY (Client_ID)
);

CREATE TABLE Account
(
  Account_Number INT NOT NULL,
  Account_Type VARCHAR(20) NOT NULL ,
  Account_Deposit INT NOT NULL,
  PRIMARY KEY (Account_Number)
);

CREATE TABLE Branch
(
  Branch_ID INT NOT NULL,
  Branch_Address VARCHAR(20) NOT NULL ,
  PRIMARY KEY (Branch_ID)
);

CREATE TABLE Loan
(
  Loan_ID INT NOT NULL,
  Loan_Type VARCHAR(20) NOT NULL ,
  Loan_Credit INT NOT NULL,
  PRIMARY KEY (Loan_ID)
);

CREATE TABLE Has_Branch
(
  Bank_Code INT NOT NULL,
  Branch_ID INT NOT NULL,
  FOREIGN KEY (Bank_Code) REFERENCES Bank(Bank_Code),
  FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);

CREATE TABLE Has_Account
(
  Account_Number INT NOT NULL,
  Client_ID INT NOT NULL,
  FOREIGN KEY (Account_Number) REFERENCES Account(Account_Number),
  FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID)
);

CREATE TABLE Manages_Account
(
  Branch_ID INT NOT NULL,
  Account_Number INT NOT NULL,
  FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID),
  FOREIGN KEY (Account_Number) REFERENCES Account(Account_Number)
);

CREATE TABLE Has_Loan
(
  Client_ID INT NOT NULL,
  Loan_ID INT NOT NULL,
  FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID),
  FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID)
);

CREATE TABLE Manages_Loan
(
  Branch_ID INT NOT NULL,
  Loan_ID INT NOT NULL,
  FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID),
  FOREIGN KEY (Branch_ID) REFERENCES Branch(Branch_ID)
);
