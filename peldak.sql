-- 1. Új rekord hozzáadása a táblához
INSERT INTO ügyfél (név, város) -- mesterséges kulcs NE
VALUES ('Kiss Péter', 'Budapest');

-- 2-3. Egy rekord módosítása a megadott táblában, meghatározott üzleti kulcs alapján
UPDATE rendelés
SET státusz = 'Szállítás alatt'
WHERE rendelés_azonosító = 98765;

-- 4.  Egy kapcsolótábla oszlopának frissítése, bizonyos rekordok szűrése a tábla alapján egy IN feltétellel.
UPDATE rendelés
SET státusz = 'Delayed'
WHERE kiszállítási_idő IS NULL
  AND ügyfél_azonosító IN (
    SELECT ügyfél_azonosító 
    FROM ügyfél 
    WHERE ország = 'Magyarország');

-- 5. Rekordok törlése egy adott feltétel alapján.
DELETE FROM ügyfél
WHERE státusz = 'Inaktív';

-- 6. Adatok beszúrása egy kapcsolótáblába két EH-táblából származó adat alapján. Felvesszük azokat a tanulókat a kapcsolótáblába, akik 10. évfolyamba járnak és matematika kurzusra jelentkeztek.
INSERT INTO rendelés (ügyfél_azonosító, áru_azonosító, dátum)
(SELECT u.ügyfél_azonosító, á.áru_azonosító, '2024-11-08'
  FROM ügyfél u, áru a
  WHERE ü.név = 'Kiss Péter'
  AND a.áru_azonosító = '12345');
