#1
SELECT MAX(ticket_price) FROM Concert WHERE location='Royal Concert Hall';
#2
SELECT DISTINCT location FROM Concert WHERE ticket_price>'200';
#3
SELECT * FROM Audience WHERE auid IN (SELECT auid FROM Attended WHERE cid='C28');
#4
SELECT * FROM Song WHERE aid=(SELECT aid FROM Artist WHERE name = 'Salar Aghili') AND sid = (SELECT sid FROM PlayedIn WHERE cid IN (SELECT cid FROM Concert WHERE location = 'Milad Tower'));
#5
SELECT name FROM artist WHERE country='Russia' AND age=(SELECT MAX(age) FROM Artist);
#6
SELECT avg(age) FROM Audience WHERE auid=(SELECT auid FROM Attended WHERE cid=(SELECT cid FROM Playedin WHERE sid=(SELECT sid FROM Song WHERE aid=(SELECT aid FROM Artist WHERE name='Sirvan Khosravi'))));
#7
SELECT title FROM Song WHERE genre='Pop' AND aid=(SELECT aid FROM Artist WHERE name='Elvis Presley');
#8
SELECT title FROM Song WHERE genre='Rock' AND aid=(SELECT aid FROM Artist WHERE country='Iran');
#9
SELECT sum(ticket_price) FROM Concert WHERE location='Milad Tower';
#10
SELECT full_name FROM Audience WHERE auid IN (SELECT auid FROM Attended WHERE cid IN (SELECT cid FROM Concert WHERE year='2010'));
#11
CREATE VIEW V AS SELECT * FROM Audience WHERE auid IN (SELECT auid FROM Attended WHERE cid IN (SELECT cid FROM Playedin WHERE sid=(SELECT sid FROM Song WHERE title='Hobab' AND aid=(SELECT aid FROM Artist WHERE name='Mohsen Yeganeh'))));
SELECT gender,COUNT(gender) FROM V GROUP BY gender;
