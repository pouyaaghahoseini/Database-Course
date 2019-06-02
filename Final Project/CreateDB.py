import pymysql
file = open("D:\\AUT\\Term 4\\DB\\Yago\\Answer\\EveryFact.tsv",'r',encoding='utf-8')
connection = pymysql.connect(host='localhost',
                             user='root',
                             password='root',
                             db='dbfinal',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
with connection.cursor() as cursor:
    for line in file:
        fields = line.split()
        cursor.execute("INSERT INTO Politician (Full_Name) "
                       "VALUES (%s) ON DUPLICATE KEY UPDATE Full_Name=%s ;",
                       (fields[1], fields[1]))
        if fields[2] == '<hasGender>':
            cursor.execute("INSERT INTO Politician (Full_Name, Gender) "
                           "VALUES (%s, %s) ON DUPLICATE KEY UPDATE Gender=%s ;",
                           (fields[1], fields[3], fields[3]))

        if fields[2] == '<wasBornIn>':
            cursor.execute("INSERT INTO City (City_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE City_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO wasBornIn (Person, City) "
                           "VALUES (%s, %s) ON DUPLICATE KEY UPDATE Person=%s;",
                           (fields[1], fields[3], fields[1]))
        if fields[2] == '<diedIn>':
            cursor.execute("INSERT INTO City (City_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE City_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO diedIn (Person, City) "
                           "VALUES (%s, %s) ON DUPLICATE KEY UPDATE Person=%s;",
                           (fields[1], fields[3], fields[1]))
        if fields[2] == '<isPoliticianOf>':
            cursor.execute("INSERT INTO Country (Country_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE Country_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO isPoliticianOf (Person, Country) "
                           "VALUES (%s, %s) ON DUPLICATE KEY UPDATE Person=%s;",
                           (fields[1], fields[3], fields[1]))
        if fields[2] == '<isCitizenOf>':
            cursor.execute("INSERT INTO Country (Country_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE Country_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO isCitizenOf (Person, Country) "
                           "VALUES (%s, %s) ON DUPLICATE KEY UPDATE Person=%s;",
                           (fields[1], fields[3], fields[1]))
        if fields[2] == '<participatedIn>':
            cursor.execute("INSERT INTO Event (Event_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE Event_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO participatedIn (Person, Event) "
                           "VALUES (%s, %s)",
                           (fields[1], fields[3]))
        if fields[2] == '<isKnownFor>':
            cursor.execute("INSERT INTO NickName (NickName_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE NickName_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO isKnownFor (Person, NickName) "
                           "VALUES (%s, %s)",
                           (fields[1], fields[3]))
        if fields[2] == '<hasWebsite>':
            cursor.execute("INSERT INTO Website (Website_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE Website_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO hasWebsite (Person, Website) "
                           "VALUES (%s, %s)",
                           (fields[1], fields[3]))

        if fields[2] == '<hasWonPrize>':
            cursor.execute("INSERT INTO Prize (Prize_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE Prize_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO hasWonPrize (Person, Prize) "
                           "VALUES (%s, %s)",
                           (fields[1], fields[3]))
        if fields[2] == '<graduatedFrom>':
            cursor.execute("INSERT INTO University (University_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE University_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO graduatedFrom (Person, University) "
                           "VALUES (%s, %s)",
                           (fields[1], fields[3]))
        if fields[2] == '<playsFor>':
            cursor.execute("INSERT INTO Club (Club_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE Club_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO playsFor (Person, Club) "
                           "VALUES (%s, %s)",
                           (fields[1], fields[3]))
        if fields[2] == '<isInterestedIn>':
            cursor.execute("INSERT INTO Field (Field_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE Field_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO isInterestedIn (Person, Field) "
                           "VALUES (%s, %s)",
                           (fields[1], fields[3]))
        if fields[2] == '<livesIn>':
            if cursor.execute("SELECT Country_Name From Country WHERE Country_Name= %s "
                              "OR Country_Name='<United_States>' "
                              "OR Country_Name='<England>' "
                              "OR Country_Name='<Switzerland>';",fields[3]):
                cursor.execute("INSERT INTO LivesInCountry (Person, Country) "
                               "VALUES (%s, %s)",
                               (fields[1], fields[3]))
            elif cursor.execute("SELECT City_Name From City WHERE City_Name= %s "
                                "OR City_Name='<Vancouver>' "
                                "OR City_Name='<Houston>'; ", fields[3]):
                cursor.execute("INSERT INTO LivesInCity (Person, City) "
                               "VALUES (%s, %s)",
                               (fields[1], fields[3]))
            else:
                cursor.execute("INSERT INTO Place (Place_Name) "
                               "VALUES (%s) ON DUPLICATE KEY UPDATE Place_Name=%s;",
                               (fields[3], fields[3]))
                cursor.execute("INSERT INTO LivesInPlace (Person, Place) "
                               "VALUES (%s, %s)",
                               (fields[1], fields[3]))
        if fields[2] == '<isLeaderOf>':
            if cursor.execute("SELECT Country_Name From Country WHERE Country_Name= %s;",fields[3]):
                cursor.execute("INSERT INTO isLeaderOfCountry (Person, Country) "
                               "VALUES (%s, %s)",
                               (fields[1], fields[3]))
            elif cursor.execute("SELECT City_Name From City WHERE City_Name= %s; ", fields[3]):
                cursor.execute("INSERT INTO isLeaderOfCity (Person, City) "
                               "VALUES (%s, %s)",
                               (fields[1], fields[3]))
            else:
                cursor.execute("INSERT INTO `Group` (Group_Name) "
                               "VALUES (%s) ON DUPLICATE KEY UPDATE Group_Name=%s;",
                               (fields[3], fields[3]))
                cursor.execute("INSERT INTO isLeaderOf (Person, `Group`) "
                               "VALUES (%s, %s)",
                               (fields[1], fields[3]))
        if fields[2] == '<isAffiliatedTo>':
            if cursor.execute("SELECT Club_Name From Club WHERE Club_Name= %s;",fields[3]):
                cursor.execute("INSERT INTO isAffiliatedToClub (Person, Club) "
                               "VALUES (%s, %s)",
                               (fields[1], fields[3]))
            else:
                cursor.execute("INSERT INTO `Group` (Group_Name) "
                               "VALUES (%s) ON DUPLICATE KEY UPDATE Group_Name=%s;",
                               (fields[3], fields[3]))
                cursor.execute("INSERT INTO isAffiliatedTo (Person, `Group`) "
                               "VALUES (%s, %s)",
                               (fields[1], fields[3]))
        if fields[2] == '<created>':
            if cursor.execute("SELECT Group_Name From `Group` WHERE Group_Name= %s;", fields[3]):
                cursor.execute("INSERT INTO Created (Person, `Group`) "
                               "VALUES (%s, %s)",
                               (fields[1], fields[3]))
            else:
                cursor.execute("INSERT INTO Book (Book_Name) "
                               "VALUES (%s) ON DUPLICATE KEY UPDATE Book_Name=%s;",
                               (fields[3], fields[3]))
                cursor.execute("INSERT INTO Wrote (Person, Book) "
                               "VALUES (%s, %s)",
                               (fields[1], fields[3]))
        if fields[2] == '<influences>':
            cursor.execute("INSERT INTO Politician (Full_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE Full_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO Influences (Influencer, Follower) "
                               "VALUES (%s, %s)",
                               (fields[1], fields[3]))
        if fields[2] == '<hasChild>':
            cursor.execute("INSERT INTO Politician (Full_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE Full_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO hasChild (Parent, Child) "
                           "VALUES (%s, %s)",
                           (fields[1], fields[3]))
        if fields[2] == '<isMarriedTo>':
            cursor.execute("INSERT INTO Politician (Full_Name) "
                           "VALUES (%s) ON DUPLICATE KEY UPDATE Full_Name=%s;",
                           (fields[3], fields[3]))
            cursor.execute("INSERT INTO isMarriedTo (Husband, Wife) "
                           "VALUES (%s, %s)",
                           (fields[1], fields[3]))
        next(file)
connection.commit()
type = open("D:\\AUT\\Term 4\\DB\\Yago\\Answer\\EveryType.tsv",'r',encoding='utf-8')
connection = pymysql.connect(host='localhost',
                             user='root',
                             password='root',
                             db='dbfinal',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
with connection.cursor() as cursor:
    for line in type:
        fields = line.split()
        print(fields)
        cursor.execute("INSERT INTO Politician (Full_Name) "
                       "VALUES (%s) ON DUPLICATE KEY UPDATE Full_Name=%s ;",
                       (fields[1], fields[1]))
        cursor.execute("INSERT INTO Subject (Subject_Name) "
                       "VALUES (%s) ON DUPLICATE KEY UPDATE Subject_Name=%s ;",
                       (fields[3], fields[3]))
        cursor.execute("INSERT INTO isInSubject (Person , Subject) "
                        "VALUES (%s, %s) ;",
                        (fields[1], fields[3]))
        next(type)
connection.commit();

label = open("D:\\AUT\\Term 4\\DB\\Yago\\Answer\\EveryLabel.tsv",'r',encoding='utf-8')
connection = pymysql.connect(host='localhost',
                             user='root',
                             password='root',
                             db='dbfinal',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
with connection.cursor() as cursor:
    for line in label:
        fields = line.split('\t')
        print(fields[3])
        cursor.execute("INSERT INTO Politician (Full_Name) "
                       "VALUES (%s) ON DUPLICATE KEY UPDATE Full_Name=%s ;",
                       (fields[1], fields[1]))
        cursor.execute("INSERT INTO Politician (Full_Name, FarsiLabel) "
                        "VALUES (%s, %s) ON DUPLICATE KEY UPDATE FarsiLabel=%s ;",
                        (fields[1], fields[3], fields[3]))
        next(label)
connection.commit();