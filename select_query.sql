--количество исполнителей в каждом жанре;
SELECT genre_name, COUNT(performer_id)
FROM genres_performers
JOIN genres USING(genre_id)
GROUP BY genre_name;


--количество треков, вошедших в альбомы 2019-2020 годов;
SELECT COUNT(track_id)
FROM tracks
JOIN albums USING(album_id)
WHERE EXTRACT(YEAR FROM release_date) BETWEEN 2019 AND 2020;


--средняя продолжительность треков по каждому альбому;
SELECT album_name, AVG(length_time)
FROM tracks
JOIN albums USING(album_id)
GROUP BY album_name;


--все исполнители, которые не выпустили альбомы в 2020 году;
WITH perf_album_2020 AS 
(
    SELECT performer_name
    FROM albums_performers
    JOIN albums USING(album_id)
    JOIN performers USING(performer_id)
    WHERE EXTRACT(YEAR FROM release_date) = 2020
)
			
SELECT performer_name
FROM performers
WHERE performer_name != (SELECT * FROM perf_album_2020);


--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT collection_name
FROM performers
JOIN albums_performers USING(performer_id)
JOIN tracks USING(album_id)
JOIN collections_tracks USING(track_id)
JOIN collection USING(collection_id)
WHERE performer_name = 'Захаров Марк';


--название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT album_name
FROM albums
JOIN albums_performers USING(album_id)
JOIN genres_performers USING(performer_id)
GROUP BY album_name
HAVING COUNT(performer_id) > 1;


--наименование треков, которые не входят в сборники;
SELECT track_name
FROM tracks
LEFT JOIN collections_tracks USING(track_id)
WHERE collections_tracks.track_id IS NULL;


--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT performer_name, track_name, length_time
FROM tracks
JOIN albums_performers USING(album_id)
JOIN performers USING(performer_id)
WHERE length_time = (SELECT MIN(length_time) FROM tracks);


--название альбомов, содержащих наименьшее количество треков.
WITH min_count AS
(
    SELECT COUNT(album_id) AS count_value
    FROM tracks
    GROUP BY album_id
)

SELECT album_name, COUNT(album_id)
FROM albums
LEFT JOIN tracks USING(album_id)
GROUP BY album_name
HAVING COUNT(album_id) = (SELECT MIN(count_value) FROM min_count)
