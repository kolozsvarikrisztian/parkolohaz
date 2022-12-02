-- A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!
-- 13. feladat
CREATE DATABASE parkolohaz
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;
-- ***
-- 15. feladat
SELECT
  COUNT(parkolohely.id) AS masfeles_parkolohelyek_szama
FROM parkolohely
WHERE parkolohely.szelesseg = 1.5
-- ***
-- 16. feladat
INSERT INTO jarmutipus(nev)
VALUES ("Elektromos gépjármű");

UPDATE parkolohely
SET parkolohely.jarmutipusId = (SELECT id FROM jarmutipus WHERE jarmutipus.nev = 'Elektromos gépjármű')
WHERE parkolohely.felirat = 'P001';
-- ***
-- 17. feladat
SELECT foglalas.datum, foglalas.ar
FROM foglalas INNER JOIN felhasznalo on foglalas.felhasznaloId = felhasznalo.id
WHERE felhasznalo.nev ='Kov?cs Anna';
-- ***
-- 18. feladat
SELECT felhasznalo.nev, SUM(foglalas.ar) as szumma_tartozas
FROM foglalas INNER JOIN felhasznalo on foglalas.felhasznaloId = felhasznalo.id
              INNER JOIN parkolohely on foglalas.parkolohelyId = parkolohely.id
              INNER JOIN jarmutipus on parkolohely.jarmutipusId = jarmutipus.id
WHERE jarmutipus.nev = "Motorker?kp" AND foglalas.fizetve = false
GROUP BY felhasznalo.id, felhasznalo.nev 
ORDER BY szumma_tartozas DESC 
LIMIT 1;
-- ***
