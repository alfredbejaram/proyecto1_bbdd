CREATE DATABASE actuaciondb;
USE actuaciondb;


/* Tabla Actores */
DROP TABLE IF EXISTS actores;

CREATE TABLE actores
(
actor_prota VARCHAR(4) NOT NULL,
nombre_act VARCHAR(30),
nacionalidad VARCHAR(20),
edad INT,
num_peliculas INT,
CONSTRAINT pk_actor_prota PRIMARY KEY(actor_prota)
);


/* Tabla Series */
DROP TABLE IF EXISTS series;

CREATE TABLE series
(
cod_serie INT AUTO_INCREMENT NOT NULL,
nombre_serie VARCHAR(60),
director VARCHAR(30),
actor_prota VARCHAR(4) NOT NULL,
actriz_prota VARCHAR(4) NOT NULL,
argumento VARCHAR(200),
duracion INT,
temporadas INT,

CONSTRAINT pk_series PRIMARY KEY(cod_serie),
CONSTRAINT fk_actor_prota FOREIGN KEY(actor_prota) REFERENCES actores(actor_prota),
CONSTRAINT fk_actriz_prota FOREIGN KEY(actriz_prota) REFERENCES actores(actor_prota)
);


/* Tabla Plataformas */
DROP TABLE IF EXISTS plataformas;

CREATE TABLE plataformas
(
id_plataforma VARCHAR(4) NOT NULL,
nombre VARCHAR(30),
precio FLOAT,
tipo_suscripcion ENUM('anual','semestral','mensual'),
CONSTRAINT pk_id_plataforma PRIMARY KEY(id_plataforma)
);


/* Tabla Cartelera */
DROP TABLE IF EXISTS cartelera;

CREATE TABLE cartelera
(
id_emision INT AUTO_INCREMENT NOT NULL,
fecha DATE,
id_plataforma VARCHAR(4) NOT NULL, /* clave foranea */
cod_serie INT NOT NULL, /* clave foranea */
categoria ENUM('comedia','romantica','terror','infantil'),

CONSTRAINT pk_id_emision PRIMARY KEY(id_emision),
CONSTRAINT fk_cod_serie FOREIGN KEY(cod_serie) REFERENCES series(cod_serie),
CONSTRAINT fk_id_plataforma FOREIGN KEY(id_plataforma) REFERENCES plataformas(id_plataforma)
);



/*Inserciones de los valores por cada tabla*/

INSERT INTO actores (actor_prota, nombre_act, nacionalidad, edad, num_peliculas)
VALUES
('BRPI', 'Brad Pitt', 'Estados Unidos', 58, 80),
('SCJO', 'Scarlett Johansson', 'Estados Unidos', 37, 60),
('LEDI', 'Leonardo DiCaprio', 'Estados Unidos', 47, 50),
('PECR', 'Penélope Cruz', 'España', 47, 40),
('TOHA', 'Tom Hanks', 'Estados Unidos', 65, 70),
('JEDU', 'Jean Dujardin', 'Francia', 49, 30),
('DACR', 'Daniel Craig', 'Reino Unido', 53, 25),
('EMST', 'Emma Stone', 'Estados Unidos', 33, 35),
('JABA', 'Javier Bardem', 'España', 52, 45),
('MEST', 'Meryl Streep', 'Estados Unidos', 72, 70),
('ROBE', 'Roberto Benigni', 'Italia', 69, 20),
('DABR', 'Daniel Brühl', 'Alemania', 43, 30);



INSERT INTO series (cod_serie, nombre_serie, director, actor_prota, actriz_prota, argumento, duracion, temporadas)
VALUES
(1, 'Breaking Bad', 'Vince Guilligan', 'DABR', 'MEST', 'Walter White, un profesor de química de Albuquerque, se enfrenta a un cáncer terminal cuando cumple 50 años. Decide fabricar y vender metanfetaminas para asegurar el futuro financiero de su familia.',60, 5),
(2, 'Game of Thrones', 'Mark Millord','JABA', 'EMST','Basada en la serie de novelas “Canción de hielo y fuego” de George R.R. Martin, sigue las luchas por el poder entre familias nobles en los Siete Reinos de Westeros.', 100, 8),
(3, 'Friends', 'David Crane', 'DACR', 'PECR','La vida y las relaciones de seis amigos que viven en Nueva York. Amor, amistad y situaciones cómicas.', 60, 10),
(4, 'Stranger Things', 'The Duffer Brothers', 'LEDI', 'PECR','En los años 80, un grupo de niños en Hawkins, Indiana, se enfrenta a fenómenos paranormales y criaturas aterradoras.', 110, 4),
(5, 'The Crown', 'Peter Morgan', 'BRPI', 'SCJO','La vida de la Reina Isabel II desde su ascenso al trono británico. Intrigas, política y relaciones familiares.', 45, 5),
(6, 'Black Mirror', 'Charlie Brooker', 'DABR', 'PECR','Episodios independientes que exploran los aspectos oscuros y perturbadores de la tecnología y la sociedad moderna.', 90, 5),
(7, 'Sherlock', 'Mark Gatiss', 'LEDI', 'SCJO','Adaptación contemporánea de las historias de Sherlock Holmes. El detective y su amigo John Watson resuelven casos en Londres.', 90, 4),
(8, 'The Office', 'Greg Daniels','DABR', 'MEST','Una comedia de oficina que sigue la vida de los empleados de Dunder Mifflin, una empresa de papel en Scranton, Pensilvania.', 45, 9);


INSERT INTO plataformas (id_plataforma, nombre, precio, tipo_suscripcion)
VALUES
('NETF', 'NETFLIX', 10, 'mensual'),
('DISN', 'DISNEY', 5, 'mensual'),
('PRIM', 'PRIME VIDEO', 120, 'anual'),
('RAKU', 'RAKUTEN', 90, 'semestral'),
('HBOM', 'HBO MAX', 130, 'semestral'),
('MIVI', 'MI VIDEO', 240, 'anual');


INSERT INTO cartelera (id_emision, fecha, id_plataforma, cod_serie, categoria)
VALUES
(1, '2023-01-01', 'NETF', 1, 'romantica'),
(2, '2024-01-01', 'PRIM', 8, 'terror'),
(3, '2024-06-01', 'HBOM', 4, 'infantil'),
(4, '2022-01-01', 'NETF', 2, 'romantica'),
(5, '2020-08-01', 'RAKU', 2, 'romantica'),
(6, '2023-01-01', 'MIVI', 3, 'terror'),
(7, '2023-06-01', 'DISN', 6, 'comedia'),
(8, '2022-01-01', 'RAKU', 7, 'comedia'),
(9, '2023-01-01', 'DISN', 8, 'infantil'),
(10, '2020-01-01', 'MIVI', 1, 'romantica');




