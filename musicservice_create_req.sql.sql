CREATE TABLE IF NOT EXISTS genres (
    PRIMARY KEY (genre_id),
    genre_id SERIAL,
    name     VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS artists (
    PRIMARY KEY (artist_id),
    artist_id     SERIAL,
    name_or_alias VARCHAR(160)
);

CREATE TABLE IF NOT EXISTS genres_artists (
    PRIMARY KEY (artist_id, genre_id),
    artist_id INTEGER REFERENCES artists,
    genre_id  INTEGER REFERENCES genres
);

CREATE TABLE IF NOT EXISTS albums (
    PRIMARY KEY (album_id),
    album_id     SERIAL,
    name         VARCHAR(160) UNIQUE NOT NULL,
    release_year INTEGER      NOT NULL
);

CREATE TABLE IF NOT EXISTS albums_artists (
    PRIMARY KEY(artist_id, album_id),
    artist_id INTEGER REFERENCES artists,
    album_id  INTEGER REFERENCES albums
);

CREATE TABLE IF NOT EXISTS tracks (
    PRIMARY KEY (track_id),
    track_id SERIAL,
    name     VARCHAR(160) NOT NULL,
    album_id INTEGER      REFERENCES albums
);

CREATE TABLE IF NOT EXISTS compilations (
    PRIMARY KEY (compilation_id),
    compilation_id SERIAL,
    name           VARCHAR(160) UNIQUE NOT NULL,
    release_year   INTEGER      NOT NULL
);

CREATE TABLE IF NOT EXISTS tracks_compilations (
    PRIMARY KEY(track_id, compilation_id),
    track_id       INTEGER REFERENCES tracks,
    compilation_id INTEGER REFERENCES compilations
);
