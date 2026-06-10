USE space;

DELETE FROM planets;

INSERT INTO planets (Name, Diameter) 
VALUES ('Mercury', 4879.4);

INSERT INTO planets (Name, Diameter)
VALUES ('Venus', 12103.6);

SELECT *
FROM planets;  