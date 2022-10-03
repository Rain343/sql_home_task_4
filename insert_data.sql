INSERT INTO performers(performer_name)
VALUES('Ковалев Владимир'), ('Клюев Родион'), ('Захаров Марк'), ('Зубов Артём'), 
			('Захаров Максим'), ('Рианна'), ('Алексеев Егор'), ('Сидоров Николай');

INSERT INTO genres(genre_name)
VALUES('Блюз'), ('Джаз'), ('Кантри'), ('Электронная музыка'), ('Рок');

INSERT INTO albums(album_name, release_date)
VALUES('You & I', '2001-05-01'), ('22 (Deluxe)', '2020-05-06'), ('Scandal', '2021-09-12'), 
			('Oro Del Oro', '2018-02-21'), ('Fossora', '2000-04-29'), ('Аутсайдер', '1999-07-25'), 
			('Doggerel', '2009-06-20'), ('Nymph', '2022-06-16');

INSERT INTO tracks(track_name, length_time, album_id)
VALUES('Хлопай', 201, 1), ('Каникулы', 206, 2), ('Rampampam', 141, 3), ('Моя игра', 154, 1), 
			('Юность', 182, 4), ('Дискотека в деревне', 185, 5), ('Полуночное такси', 177, 6), ('Никак', 243, 7), 
			('Птичка', 157, 8), ('Мой гармония', 335, 1), ('Dance Monkey', 134, 2), ('Marmalade', 214, 3),
			('Снежинки', 221, 4), ('On Repeat', 116, 5), ('My home', 116, 6);


INSERT INTO collection(collection_name, release_date)
VALUES('Топ 100 лета 2022', '05.10.2021'), ('Пятничный chillout', '11.05.2019'), 
			('Школьные песни разных лет', '21.04.2018'), ('Музыка для спорта', '13.02.2020'),
			('Привет из 2000-х', '26.06.2004'), ('Джазовое крем-брюле', '08.08.2008'),
			('На репите: часть 8', '09.01.2003'), ('Легкая музыка', '19.06.2007');

INSERT INTO albums_performers(performer_id, album_id)
VALUES(1, 8), (2, 7), (3, 6), (4, 5), (5, 4), (6, 3), (7, 2), (8, 1);

INSERT INTO collections_tracks(collection_id, track_id)
VALUES(1, 15), (2, 13), (3, 11), (4, 9), (5, 7), (6, 5), (7, 3), (8, 1);

INSERT INTO genres_performers(performer_id, genre_id)
VALUES(1, 2), (2, 4), (3, 5), (4, 1), (5, 2), (6, 4), (7, 3), (8, 5), (1, 5);