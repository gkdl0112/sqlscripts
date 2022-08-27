CREATE TABLE member_info (
	member_id VARCHAR2(15) NOT NULL,
	member_pw VARCHAR2(20) NOT NULL,
	name VARCHAR2(40) NOT NULL,
	email VARCHAR2(30) NOT NULL UNIQUE,
	phone CHAR(13) NOT NULL UNIQUE,
	birth_date CHAR(8) NOT NULL,
	gender VARCHAR2(6) NOT NULL,
	reg_date DATE DEFAULT SYSDATE,
	nickname VARCHAR2(40) NOT NULL UNIQUE
	);

CREATE TABLE movie_info (
	movie_id	NUMBER(5) NOT NULL,
	movie_title	VARCHAR2(200)	NOT NULL,
	review_id	NUMBER(5)	NOT NULL,
	release_date	DATE	NOT NULL,
	runtime	NVARCHAR2(4)	NOT NULL,
	cum_audience	NVARCHAR2(15)	NOT NULL,
	view_rating	NVARCHAR2(8)	NOT NULL
);

CREATE TABLE actor (
	actor_id	NUMBER(5)	NOT NULL,
	actor_name	VARCHAR2(40)	NOT NULL
);

CREATE TABLE movie_actor (
	movie_id	NUMBER(5)	NOT NULL,
	actor_id	NUMBER(5)	NOT NULL
);

CREATE TABLE director (
	director_id	NUMBER(5)	NOT NULL,
	dir_name	VARCHAR(40)	NOT NULL
);

CREATE TABLE movie_director (
	movie_id	NUMBER(5)	NOT NULL,
	director_id	NUMBER(5)	NOT NULL
);

CREATE TABLE movie_genre (
	movie_id	NUMBER(5)	NOT NULL,
	genre_id	NUMBER(5)	NOT NULL
);

CREATE TABLE genr (
	genre_id	NUMBER(5)	NOT NULL,
	genre_name	VARCHAR2(20)	NOT NULL
);

CREATE TABLE review (
	review_id	NUMBER(5)	NOT NULL,
	movie_id	NUMBER(5)	NOT NULL,
	member_id	VARCHAR2(15)	NOT NULL,
	content	NVARCHAR2(500)	NOT NULL,
	create_date	DATE DEFAULT SYSDATE,
	modify_date	DATE DEFAULT SYSDATE
);

CREATE TABLE star_rating (
	star_id	NUMBER(5)	NOT NULL,
	star_rating	NUMBER(2)	NOT NULL,
	movie_id	NUMBER(5)	NOT NULL
);

ALTER TABLE member_info ADD CONSTRAINT PK_MEMBER_INFO PRIMARY KEY (
	member_id
);

ALTER TABLE movie_info ADD CONSTRAINT PK_MOVIE_INFO PRIMARY KEY (
	movie_id
);

ALTER TABLE actor ADD CONSTRAINT PK_ACTOR PRIMARY KEY (
	actor_id
);

ALTER TABLE movie_actor ADD CONSTRAINT PK_MOVIE_ACTOR PRIMARY KEY (
	movie_id,
	actor_id
);

ALTER TABLE director ADD CONSTRAINT PK_DIRECTOR PRIMARY KEY (
	director_id
);

ALTER TABLE movie_director ADD CONSTRAINT PK_MOVIE_DIRECTOR PRIMARY KEY (
	movie_id,
	director_id
);

ALTER TABLE movie_genre ADD CONSTRAINT PK_MOVIE_GENRE PRIMARY KEY (
	movie_id,
	genre_id
);

ALTER TABLE genre ADD CONSTRAINT PK_GENRE PRIMARY KEY (
	genre_id
);

ALTER TABLE review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	review_id
);

ALTER TABLE star_rating ADD CONSTRAINT PK_STAR_RATING PRIMARY KEY (
	star_id
);

ALTER TABLE movie_actor ADD CONSTRAINT FK_movie_info_TO_movie_actor_1 FOREIGN KEY (
	movie_id
)
REFERENCES movie_info (
	movie_id
);

ALTER TABLE movie_actor ADD CONSTRAINT FK_actor_TO_movie_actor_1 FOREIGN KEY (
	actor_id
)
REFERENCES actor (
	actor_id
);

ALTER TABLE movie_director ADD CONSTRAINT FK_movie_director_1 FOREIGN KEY (
	movie_id
)
REFERENCES movie_info (
	movie_id
);

ALTER TABLE movie_director ADD CONSTRAINT FK_movie_director_2 FOREIGN KEY (
	director_id
)
REFERENCES director (
	director_id
);

ALTER TABLE movie_genre ADD CONSTRAINT FK_movie_genre_1 FOREIGN KEY (
	movie_id
)
REFERENCES movie_info (
	movie_id
);

ALTER TABLE movie_genre ADD CONSTRAINT FK_movie_genre_2 FOREIGN KEY (genre_id)
REFERENCES genre (genre_id);

ALTER TABLE MOVIE_INFO ADD plot varchar2(500);
ALTER TABLE MOVIE_INFO MODIFY cum_audience nvarchar2(30);
ALTER TABLE MOVIE_INFO MODIFY plot nvarchar2(500);
ALTER TABLE movie_info ADD poser_url varchar2(100);
ALTER TABLE MOVIE_INFO RENAME COLUMN poser_url TO poster_url;
ALTER TABLE MOVIE_INFO MODIFY runtime nvarchar2(10);
ALTER TABLE MOVIE_INFO MODIFY view_rating nvarchar2(20);

SELECT * FROM MOVIE_INFO ORDER BY MOVIE_ID ASC;