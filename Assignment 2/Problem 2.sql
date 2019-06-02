#1
WITH RECURSIVE Dynasty_Photos AS
(
  SELECT dynasty,COUNT(*)
  FROM event
    JOIN pictures p on event.eid = p.event_id
    JOIN countries c on event.country_id = c.cid AND name='Iran'
    GROUP BY dynasty
)
SELECT * FROM Dynasty_Photos;
#2
CREATE VIEW V2 AS
  SELECT eid,event.title AS EventTitle, pictures.full_path AS PicturePath, photographer.full_name AS PhotographerName, countries.name AS CountryName, dynasty AS `Dynasty`
       FROM (((event JOIN pictures on event.eid = pictures.event_id)
                        LEFT JOIN photographer ON pictures.taken_by=photographer.phid)
                        join countries ON `event`.country_id=countries.cid);

#3
create trigger countrydel AFTER DELETE ON countries FOR EACH ROW
DELETE
FROM pictures
  WHERE pid IN (SELECT picid FROM (select pid As picid FROM pictures WHERE event_id IN (SELECT eid FROM event WHERE country_id=OLD.cid )) AS Temp );
#4
SELECT * FROM event WHERE country_id=(SELECT cid FROM countries WHERE name='Iceland') ORDER BY occured_at , title ;
SELECT dynasty,MIN(occured_at) FROM event WHERE country_id=(SELECT cid FROM countries WHERE name='Iceland') GROUP BY dynasty;
#5
UPDATE event
SET dynasty = CASE
              WHEN dynasty='Ashkanian' THEN 'Ghajar'
              WHEN dynasty='Ghajar' THEN 'Ashkanian'
    ELSE dynasty
    END;
#6
CREATE VIEW photographers AS
  SELECT *
  FROM photographer
  WHERE phid IN
        (SELECT taken_by
         FROM pictures
         WHERE event_id IN
               (SELECT eid
                FROM event
                WHERE country_id=
                      (SELECT cid
                       FROM countries
                       WHERE name='Brazil')
               )
        );
SELECT born_in,AVG(age) FROM photographers GROUP BY born_in;
#7
CREATE VIEW MexicoPictures AS
SELECT photographer.*, pid , event.*
  FROM (
      (photographer
        JOIN pictures p
          on photographer.phid = p.taken_by
        )
      JOIN event
        ON P.event_id=eid
           AND country_id=
               (SELECT cid
                FROM countries
                WHERE name='Mexico')
  );
SELECT dynasty FROM MexicoPictures GROUP BY dynasty HAVING COUNT(dynasty)>='50';