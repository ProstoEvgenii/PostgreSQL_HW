
CREATE TABLE genre (
	id serial4 NOT NULL,
	genre_name varchar(40) NOT NULL,
	CONSTRAINT genre_pkey PRIMARY KEY (id)
);

CREATE TABLE artist (
	id serial4 NOT NULL,
	artist_name varchar(40) NOT NULL,
	genre_id int4 NOT NULL,
	CONSTRAINT artist_pkey PRIMARY KEY (id),
	CONSTRAINT artist_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genre(id)
);


CREATE TABLE album (
	album_id serial4 NOT NULL,
	artist_id_ref int4 NOT NULL,
	"year" int4 NOT NULL,
	title varchar(40) NOT NULL,
	CONSTRAINT album_pk PRIMARY KEY (album_id),
	CONSTRAINT album_fk FOREIGN KEY (artist_id_ref) REFERENCES artist(id)
);


CREATE TABLE song (
	song_id serial4 NOT NULL,
	title varchar(100) NOT NULL,
	duration text NOT NULL,
	album int4 NOT NULL,
	CONSTRAINT song_pk PRIMARY KEY (song_id),
	CONSTRAINT song_fk FOREIGN KEY (album) REFERENCES album(album_id)
);