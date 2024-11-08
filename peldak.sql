-- 1. Új rekord hozzáadása a táblához
INSERT INTO ügyfél (név, város) 
VALUES ('Kiss Péter', 'Budapest');

-- 2-3. Egy rekord módosítása a megadott táblában, meghatározott üzleti kulcs alapján
UPDATE rendelés
SET státusz = 'Szállítás alatt'
WHERE rendelés_azonosító = 98765;

-- 4.  Egy kapcsolótábla oszlopának frissítése, bizonyos rekordok szűrése a tábla alapján egy IN feltétellel.
UPDATE Order
SET Status = 'Delayed'
WHERE ShippingDate IS NULL
  AND CustomerId IN (
    SELECT CustomerId 
    FROM Customer 
    WHERE Country = 'Magyarország'
  );

-- 5. Rekordok törlése egy adott feltétel alapján.
DELETE FROM ügyfél
WHERE státusz = 'Inaktív';

-- 6. Adatok beszúrása egy kapcsolótáblába két EH-táblából származó adat alapján. Felvesszük azokat a tanulókat a kapcsolótáblába, akik 10. évfolyamba járnak és matematika kurzusra jelentkeztek.
INSERT INTO tanuló_kurzus (tanuló_id, kurzus_id, dátum)
SELECT t.tanuló_id, k.kurzus_id, '2024-09-01'
FROM tanuló t, kurzus k
WHERE t.évfolyam = '10'
AND k.típus = 'Matematika';