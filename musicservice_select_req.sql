-- Запрос названия и года выхода альбомов, вышедших в 2018 году:
SELECT name, release_year
  FROM albums
 WHERE release_year = 2018;


-- Запрос названия и продолжительности самого длительного трека:
SELECT name, length
  FROM tracks
 WHERE length = (SELECT MAX(length)
                    FROM tracks);

-- Запрос названия треков, продолжительность которых не менее 3,5 минуты:
SELECT name
  FROM tracks
 WHERE length >= '00:03:30';

-- Запрос названия сборников, вышедших в период с 2018 по 2020 год включительно:
SELECT name
  FROM compilations
 WHERE release_year >= 2018
   AND release_year <= 2020;

-- Запрос исполнителей, чье имя состоит из 1 слова:
SELECT name_or_alias
  FROM artists
 WHERE name_or_alias NOT LIKE '% %';

-- Запрос названия треков, которые содержат слово "мой"/"my":
SELECT name
  FROM tracks
 WHERE name LIKE '% мой %'
    OR name LIKE '% my %'
    OR name LIKE '%My %';
