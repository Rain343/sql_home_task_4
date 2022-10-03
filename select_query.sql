--количество исполнителей в каждом жанре;
SELECT g.genre_name, COUNT(performer_id)
FROM genres_performers AS gp
JOIN genres AS g ON g.genre_id = gp.genre_id
GROUP BY g.genre_name;


--количество треков, вошедших в альбомы 2019-2020 годов;
SELECT COUNT(t.track_id)
FROM tracks AS t
JOIN albums AS a ON a.album_id = t.album_id
WHERE EXTRACT(YEAR FROM a.release_date) BETWEEN 2019 AND 2020;


--средняя продолжительность треков по каждому альбому;
SELECT a.album_name, AVG(t.length_time)
FROM tracks AS t
JOIN albums AS a ON a.album_id = t.album_id
GROUP BY a.album_name;


--все исполнители, которые не выпустили альбомы в 2020 году;
SELECT p.performer_name
FROM albums_performers AS ap
JOIN albums AS a ON a.album_id = ap.album_id
JOIN performers AS p ON p.performer_id = ap.performer_id
WHERE EXTRACT(YEAR FROM a.release_date) != 2020;


--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT c.collection_name
FROM performers AS p
JOIN albums_performers AS ap ON ap.performer_id = p.performer_id
JOIN tracks AS t ON t.album_id = ap.album_id
JOIN collections_tracks AS ct ON ct.track_id = t.track_id
JOIN collection AS c ON c.collection_id = ct.collection_id
WHERE p.performer_name = 'Захаров Марк';


--название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT a.album_name
FROM albums AS a
JOIN albums_performers AS ap ON ap.album_id = a.album_id
JOIN genres_performers AS gp ON gp.performer_id = ap.performer_id
GROUP BY a.album_name
HAVING COUNT(gp.performer_id) > 1;


--наименование треков, которые не входят в сборники;
SELECT track_name
FROM tracks
WHERE track_id NOT IN (SELECT track_id FROM collections_tracks);


--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT track_name, length_time
FROM tracks
WHERE length_time = (SELECT MIN(length_time) FROM tracks);


--название альбомов, содержащих наименьшее количество треков.
SELECT a.album_name, COUNT(t.album_id)
FROM albums AS a
LEFT JOIN tracks AS t ON t.album_id = a.album_id
GROUP BY a.album_name
ORDER BY COUNT(t.album_id) ASC
LIMIT 1
