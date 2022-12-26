-- Тестування процедури перетворення цельсія в фаренгейт
CALL public.c2f(0); 

-- Тестування функції, що виводить міста з бази даних по назві країни
SELECT * FROM public.get_cities_by_country('Iceland');

-- Тестування тригера, який при пустому році вказує теперішній
INSERT INTO records (temperature,id_city) VALUES (-1.670916667,1);
SELECT * FROM records r WHERE r."year" = 2022;