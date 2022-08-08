CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists (
	artist_id SERIAL PRIMARY KEY,
	name_or_alias VARCHAR(160)
);

CREATE TABLE IF NOT EXISTS GenresArtists (
	artist_id INTEGER REFERENCES Artists,
	genre_id INTEGER REFERENCES Genres,
  PRIMARY KEY(artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(160) UNIQUE NOT NULL,
  release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS AlbumsArtists (
	artist_id INTEGER REFERENCES Artists,
	album_id INTEGER REFERENCES Albums,
  PRIMARY KEY(artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	name VARCHAR(160) NOT NULL,
  album_id INTEGER REFERENCES Albums
);

CREATE TABLE IF NOT EXISTS Compilations (
	compilation_id SERIAL PRIMARY KEY,
	name VARCHAR(160) UNIQUE NOT NULL,
  release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS TracksCompilations (
	track_id INTEGER REFERENCES Tracks,
	compilation_id INTEGER REFERENCES Compilations,
  PRIMARY KEY(track_id, compilation_id)
);
