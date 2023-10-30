DROP SCHEMA IF EXISTS series;
CREATE SCHEMA IF NOT EXISTS series;
USE series;

DROP TABLE IF EXISTS serie;
CREATE TABLE IF NOT EXISTS serie (
id int auto_increment not null primary key COMMENT 'clave primaria',
title varchar(50) not null COMMENT 'título de la serie',
released_in date not null COMMENT 'fecha de lanzamiento de la serie'
) COMMENT 'Tabla de series';

DROP TABLE IF EXISTS actor;
CREATE TABLE IF NOT EXISTS actor(
id int auto_increment not null primary key COMMENT 'clave primaria',
actor_name varchar(25) not null COMMENT 'nombre del actor',
actor_lastname varchar(25) not null COMMENT 'apellido del actor'
) COMMENT 'Tabla de actores';

DROP TABLE IF EXISTS serie_character;
CREATE TABLE IF NOT EXISTS serie_character (
id int auto_increment not null primary key COMMENT 'clave primaria',
character_name varchar(25) not null COMMENT 'nombre del personaje',
character_lastname varchar(25) default null COMMENT 'apellido del personaje',
id_actor int default null COMMENT 'clave foránea para la tabla de actores',
CONSTRAINT `fk_character_actor` FOREIGN KEY (id_actor)
REFERENCES actor(id)
) COMMENT 'Tabla de personajes';

DROP TABLE IF EXISTS season;
CREATE TABLE IF NOT EXISTS season (
id int auto_increment not null primary key COMMENT 'clave primaria',
season_number int not null COMMENT 'número de temporada'
) COMMENT 'Tabla de temporadas';

DROP TABLE IF EXISTS episode;
CREATE TABLE IF NOT EXISTS episode (
id int auto_increment not null primary key COMMENT 'clave primaria',
episode_name varchar(50) default null COMMENT 'nombre del episodio',
episode_description longtext default null COMMENT 'descripción del episodio',
season_id int not null COMMENT 'clave foránea para la tabla de temporadas',
CONSTRAINT `fk_episode_season` FOREIGN KEY (season_id)
REFERENCES season(id)
) COMMENT 'Tabla de episodios';


DROP TABLE IF EXISTS genre_label;
CREATE TABLE IF NOT EXISTS genre_label (
id int auto_increment not null primary key COMMENT 'clave primaria',
genre_label varchar(25) COMMENT 'nombre del género'
) COMMENT 'Tabla de nombre de géneros';

DROP TABLE IF EXISTS genre;
CREATE TABLE IF NOT EXISTS serie_genre (
id int auto_increment not null primary key COMMENT 'clave primaria',
genre_id int not null COMMENT 'clave foránea para la tabla de nombre de géneros',
serie_id int not null COMMENT 'clave foránea para la tabla de series',
CONSTRAINT `fk_genre_genre_label` FOREIGN KEY (genre_id)
REFERENCES genre_label(id),
CONSTRAINT `fk_genre_serie` FOREIGN KEY (serie_id)
REFERENCES serie(id)
) COMMENT 'Tabla de géneros de series';

DROP TABLE IF EXISTS award_name;
CREATE TABLE IF NOT EXISTS award_name (
id int auto_increment not null primary key COMMENT 'clave primaria',
award_label varchar(50) COMMENT 'nombre del premio'
) COMMENT 'Tabla de nombres de premios';

DROP TABLE IF EXISTS award_category;
CREATE TABLE IF NOT EXISTS award_category (
id int auto_increment not null primary key COMMENT 'clave primaria',
award_category varchar(100) COMMENT 'categoría del premio'
) COMMENT 'Tabla de categorías de premios';

DROP TABLE IF EXISTS award;
CREATE TABLE IF NOT EXISTS award (
  id int auto_increment not null primary key COMMENT 'clave primaria',
  serie_id int not null COMMENT 'clave foránea para la tabla de series',
  award_id int not null COMMENT 'clave foránea para la tabla de nombres de premios',
  award_category_id int not null COMMENT 'clave foránea para la tabla de categorías de premios',
  award_year INT NOT NULL COMMENT 'año en el que se ganó el premio',
  CONSTRAINT `fk_award_series` FOREIGN KEY (series_id)
  REFERENCES serie(id),
  CONSTRAINT `fk_award_award_name` FOREIGN KEY (award_id)
  REFERENCES award_name(id),
  CONSTRAINT `fk_award_award_category` FOREIGN KEY (award_category_id)
  REFERENCES award_category(id)
) COMMENT 'Tabla de premios de series';

