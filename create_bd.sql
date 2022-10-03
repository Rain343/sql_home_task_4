CREATE TABLE IF NOT EXISTS genres (
		genre_id SERIAL PRIMARY KEY,
		genre_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS performers (
		performer_id SERIAL PRIMARY KEY,
		performer_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS albums (
		album_id SERIAL PRIMARY KEY,
		album_name VARCHAR(60) NOT NULL,
		release_date date
);

CREATE TABLE IF NOT EXISTS tracks (
		track_id SERIAL PRIMARY KEY,
		track_name VARCHAR(60) NOT NULL,
		length_time INTEGER,
		album_id INTEGER NOT NULL REFERENCES albums(album_id)
);

CREATE TABLE IF NOT EXISTS collection (
		collection_id SERIAL PRIMARY KEY,
		collection_name VARCHAR(60) NOT NULL,
		release_date date
);

CREATE TABLE IF NOT EXISTS albums_performers (
		performer_id INTEGER NOT NULL REFERENCES performers(performer_id),
		album_id INTEGER NOT NULL REFERENCES albums(album_id),
		CONSTRAINT pk_ap PRIMARY KEY (performer_id, album_id)
);

CREATE TABLE IF NOT EXISTS genres_performers (
		performer_id INTEGER NOT NULL REFERENCES performers(performer_id),
		genre_id INTEGER NOT NULL REFERENCES genres(genre_id),
		CONSTRAINT pk_gp PRIMARY KEY (performer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS collections_tracks (
		collection_id INTEGER NOT NULL REFERENCES collection(collection_id),
		track_id INTEGER NOT NULL REFERENCES tracks(track_id),
		CONSTRAINT pk_ct PRIMARY KEY (collection_id, track_id)
);