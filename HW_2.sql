

CREATE TABLE album (
	album_id serial4 NOT NULL,
	"year" int4 NOT NULL,
	title varchar(40) NOT NULL,
	CONSTRAINT album_pk PRIMARY KEY (album_id)
);



CREATE TABLE artist (
	id serial4 NOT NULL,
	artist_name varchar(40) NOT NULL,
	CONSTRAINT artist_pkey PRIMARY KEY (id)
);


CREATE TABLE collection (
	collection_id serial4 NOT NULL,
	"year" int4 NOT NULL,
	title varchar(40) NOT NULL,
	CONSTRAINT collection_pk PRIMARY KEY (collection_id)
);



CREATE TABLE genre (
	id serial4 NOT NULL,
	genre_name varchar(40) NOT NULL,
	CONSTRAINT genre_pkey PRIMARY KEY (id)
);


CREATE TABLE album_artist (
	album_id int4 NOT NULL,
	artist_id int4 NOT NULL,
	CONSTRAINT album_artist_pk PRIMARY KEY (album_id, artist_id),
	CONSTRAINT album_artist_fk FOREIGN KEY (album_id) REFERENCES album(album_id),
	CONSTRAINT album_artist_fk_1 FOREIGN KEY (artist_id) REFERENCES artist(id)
);



CREATE TABLE genre_artist (
	genre_id int4 NOT NULL,
	artist_id int4 NOT NULL,
	CONSTRAINT genreartist_pk PRIMARY KEY (genre_id, artist_id),
	CONSTRAINT genreartist_fk FOREIGN KEY (artist_id) REFERENCES artist(id),
	CONSTRAINT genreartist_fk_1 FOREIGN KEY (genre_id) REFERENCES genre(id)
);


CREATE TABLE song (
	song_id serial4 NOT NULL,
	title varchar(100) NOT NULL,
	duration text NOT NULL,
	album int4 NOT NULL,
	CONSTRAINT song_pk PRIMARY KEY (song_id),
	CONSTRAINT song_fk FOREIGN KEY (album) REFERENCES album(album_id)
);


CREATE TABLE song_to_collection (
	song_id int4 NOT NULL,
	collection_id int4 NOT NULL,
	CONSTRAINT song_to_collection_pk PRIMARY KEY (song_id, collection_id),
	CONSTRAINT song_to_collection_fk FOREIGN KEY (collection_id) REFERENCES collection(collection_id),
	CONSTRAINT song_to_collection_fk_1 FOREIGN KEY (song_id) REFERENCES song(song_id)
);