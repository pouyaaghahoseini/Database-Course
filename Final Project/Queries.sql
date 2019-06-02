DROP DATABASE dbfinal;
CREATE DATABASE dbfinal;
USE dbfinal;
CREATE TABLE Politician (
  Full_Name varchar(100) NOT NULL ,
  Gender varchar(10),
  FarsiLabel varchar(50),
  primary key (Full_Name)
);
CREATE TABLE Country(
  Country_Name VARCHAR(60) NOT NULL ,
  PRIMARY KEY (Country_Name)
);
CREATE TABLE City(
  City_Name VARCHAR(60) NOT NULL ,
  PRIMARY KEY (City_Name)
);
CREATE TABLE Place(
  Place_Name VARCHAR(60) NOT NULL ,
  PRIMARY KEY (Place_Name)
);
CREATE TABLE Event(
  Event_Name VARCHAR(60),
  PRIMARY KEY (Event_Name)
);
CREATE TABLE Field(
  Field_Name VARCHAR(60),
  PRIMARY KEY (Field_Name)
);
CREATE TABLE `Group`(
  Group_Name VARCHAR(60),
  PRIMARY KEY (Group_Name)
);
CREATE TABLE Book(
  Book_Name VARCHAR(60),
  PRIMARY KEY (Book_Name)
);
CREATE TABLE NickName(
  NickName_Name VARCHAR(60),
  PRIMARY KEY (NickName_Name)
);
CREATE TABLE University(
  University_Name VARCHAR(100),
  PRIMARY KEY (University_Name)
);
CREATE TABLE Club(
  Club_Name VARCHAR(60),
  PRIMARY KEY (Club_Name)
);
CREATE TABLE Prize(
  Prize_Name VARCHAR(60),
  PRIMARY KEY (Prize_Name)
);
CREATE TABLE Website(
    Website_Name VARCHAR(100),
  PRIMARY KEY (Website_Name)
);
CREATE TABLE wasBornIn(
  Person VARCHAR(100),
  City VARCHAR(60),
  PRIMARY KEY (Person),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (City) REFERENCES City(City_Name)
) ;
CREATE TABLE LivesInPlace(
  Person VARCHAR(100),
  Place VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Place) REFERENCES Place(Place_Name)
) ;
CREATE TABLE LivesInCountry(
  Person VARCHAR(100),
  Country VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Country) REFERENCES Country(Country_Name)
) ;
CREATE TABLE LivesInCity(
  Person VARCHAR(100),
  City VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (City) REFERENCES City(City_Name)
) ;

CREATE TABLE DiedIn(
  Person VARCHAR(100),
  City VARCHAR(60),
  PRIMARY KEY (Person),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (City) REFERENCES City(City_Name)
) ;
CREATE TABLE isPoliticianOf(
  Person VARCHAR(100),
  Country VARCHAR(60),
  PRIMARY KEY (Person),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Country) REFERENCES Country(Country_Name)
) ;
CREATE TABLE isCitizenOf(
  Person VARCHAR(100),
  Country VARCHAR(60),
  PRIMARY KEY (Person),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Country) REFERENCES Country(Country_Name)
) ;
CREATE TABLE participatedIn(
  Person VARCHAR(100),
  Event VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Event) REFERENCES Event(Event_Name)
) ;
CREATE TABLE isKnownFor(
  Person VARCHAR(100),
  NickName VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (NickName) REFERENCES NickName(NickName_Name)
) ;
CREATE TABLE isLeaderOf(
  Person VARCHAR(100),
  `Group` VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (`Group`) REFERENCES `Group`(Group_Name)
) ;
CREATE TABLE isLeaderOfCountry(
  Person VARCHAR(100),
  Country VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Country) REFERENCES Country(Country_Name)
) ;
CREATE TABLE isLeaderOfCity(
  Person VARCHAR(100),
  City VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (City) REFERENCES City(City_Name)
) ;
CREATE TABLE isAffiliatedTo(
  Person VARCHAR(100),
  `Group` VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (`Group`) REFERENCES `Group`(Group_Name)
) ;

CREATE TABLE isAffiliatedToClub(
  Person VARCHAR(100),
  Club VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Club) REFERENCES Club(Club_Name)
) ;

CREATE TABLE Created(
  Person VARCHAR(100),
  `Group` VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (`Group`) REFERENCES `Group`(Group_Name)
) ;
CREATE TABLE Wrote(
  Person VARCHAR(100),
  Book VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Book) REFERENCES Book(Book_Name)
) ;
CREATE TABLE isInterestedIn(
  Person VARCHAR(100),
  Field VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Field) REFERENCES Field(Field_Name)
) ;
CREATE TABLE PlaysFor(
  Person VARCHAR(100),
  Club VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Club) REFERENCES Club(Club_Name)
) ;
CREATE TABLE graduatedFrom(
  Person VARCHAR(100),
  University VARCHAR(100),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (University) REFERENCES University(University_Name)
) ;
CREATE TABLE hasWonPrize(
  Person VARCHAR(100),
  Prize VARCHAR(60),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Prize) REFERENCES Prize(Prize_Name)
) ;
CREATE TABLE Influences(
  Influencer VARCHAR(100),
  Follower VARCHAR(100),
  FOREIGN KEY (Influencer) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Follower) REFERENCES Politician(Full_Name)
);

CREATE TABLE hasChild(
  Parent VARCHAR(100),
  Child VARCHAR(100),
  FOREIGN KEY (Parent) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Child) REFERENCES Politician(Full_Name)
);

CREATE TABLE isMarriedTo(
  Husband VARCHAR(100),
  Wife VARCHAR(100),
  FOREIGN KEY (Husband) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Wife) REFERENCES Politician(Full_Name)
);

CREATE TABLE hasWebsite(
  Person VARCHAR(100),
  Website VARCHAR(100),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Website) REFERENCES Website(Website_Name)
) ;
CREATE TABLE Subject(
  Subject_Name VARCHAR(200),
  PRIMARY KEY (Subject_Name)
);
CREATE TABLE isInSubject(
  Person VARCHAR(100),
  Subject VARCHAR(100),
  FOREIGN KEY (Person) REFERENCES Politician(Full_Name) ,
  FOREIGN KEY (Subject) REFERENCES Subject(Subject_Name)
) ;
