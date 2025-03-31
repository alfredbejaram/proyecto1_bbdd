/*1. Mostrar todas las series de Netflix*/

SELECT c.id_plataforma, s.nombre_serie
FROM cartelera c
INNER JOIN series s ON c.cod_serie = s.cod_serie
WHERE c.id_plataforma = 'NETF';

+---------------+-----------------+
| id_plataforma | nombre_serie    |
+---------------+-----------------+
| NETF          | Breaking Bad    |
| NETF          | Game of Thrones |
+---------------+-----------------+
2 rows in set (0.000 sec)


/*2. Calcular la media de la duración de las series de MIVI*/ 

SELECT c.id_plataforma, AVG(s.duracion)
FROM series s
INNER JOIN cartelera c ON s.cod_serie = c.cod_serie
WHERE c.id_plataforma = 'MIVI';

+---------------+-----------------+
| id_plataforma | AVG(s.duracion) |
+---------------+-----------------+
| MIVI          |         60.0000 |
+---------------+-----------------+
1 row in set (0.000 sec)



/*3. Contar cuantas series de genero romántica hay en la plataforma MIVI*/

SELECT COUNT(categoria) as 'Num. series romanticas'
FROM cartelera 
WHERE id_plataforma = 'MIVI' 
AND categoria = 'romantica';

+------------------------+
| Num. series romanticas |
+------------------------+
|                      1 |
+------------------------+
1 row in set (0.000 sec)



/*4. Mostrar el nombre de las series que ha protagonizado “Brad Pitt”*/

SELECT a.nombre_act AS 'Nombre actor / actriz', s.nombre_serie AS 'Nombre de serie'
FROM series s
INNER JOIN actores a ON s.actor_prota = a.actor_prota
WHERE a.nombre_act = 'Brad Pitt';

+------------+--------------+
| nombre_act | nombre_serie |
+------------+--------------+
| Brad Pitt  | The Crown    |
+------------+--------------+
1 row in set (0.000 sec)



/*5. Mostrar el nombre del actor/actriz más viejo que ha protagonizado una serie de más de 4 temporadas*/
SELECT a.nombre_act AS 'Nombre actor / actriz', MAX(a.edad) AS edad, s.temporadas
FROM series s
INNER JOIN actores a ON s.actor_prota = a.actor_prota
GROUP BY a.edad
HAVING s.temporadas > 4;

+-----------------------+------+------------+
| Nombre actor / actriz | edad | temporadas |
+-----------------------+------+------------+
| Daniel Br├╝hl          |   43 |          5 |
| Javier Bardem         |   52 |          8 |
| Daniel Craig          |   53 |         10 |
| Brad Pitt             |   58 |          5 |
+-----------------------+------+------------+
4 rows in set (0.000 sec)


/* 6. Mostrar el nombre de la serie con más temporadas emitida en Netflix.*/
SELECT s.nombre_serie AS 'Serie con + temporadas', MAX(s.temporadas) AS 'Netflix'
FROM series s
INNER JOIN cartelera c ON s.cod_serie = c.cod_serie
WHERE c.id_plataforma = 'NETF';

+------------------------+---------+
| Serie con + temporadas | Netflix |
+------------------------+---------+
| Breaking Bad           |       8 |
+------------------------+---------+
1 row in set (0.000 sec)



/* 7. Mostrar todos los datos de los actores Españoles con más de 15 películas que tengan menos de 60 años.*/
/*Corregí en BBDD la ñ -> EspaNa ya que MariaDB no lo reconoce*/

SELECT nombre_act AS 'nombre', nacionalidad, edad, num_peliculas
FROM actores 
WHERE nacionalidad = 'Espana'
GROUP BY nombre_act 
HAVING edad < 60 AND num_peliculas > 15;               

+----------------+--------------+------+---------------+
| nombre         | nacionalidad | edad | num_peliculas |
+----------------+--------------+------+---------------+
| Javier Bardem  | Espana       |   52 |            45 |
| Pen├®lope Cruz  | Espana       |   47 |            40 |
+----------------+--------------+------+---------------+
2 rows in set (0.000 sec)


/* Si quisiera que el numero de peliculas sea mayor a 41 */
/* HAVING edad < 60 AND num_peliculas > 41; */

+---------------+--------------+------+---------------+
| nombre        | nacionalidad | edad | num_peliculas |
+---------------+--------------+------+---------------+
| Javier Bardem | Espana       |   52 |            45 |
+---------------+--------------+------+---------------+
1 row in set (0.000 sec)


/*8. Mostrar el nombre de la serie con más temporadas con una duración mayor de 60 */ 

SELECT nombre_serie, MAX(temporadas) AS 'Mas temporadas', duracion
FROM series
WHERE duracion > 60;

+-----------------+----------------+----------+
| nombre_serie    | Mas temporadas | duracion |
+-----------------+----------------+----------+
| Game of Thrones |              8 |      100 |
+-----------------+----------------+----------+
1 row in set (0.000 sec)



9. Mostrar el nombre y el argumento de las series emitidas en HBOM 
10. Mostrar el total de las series que protagonice “Leonardo Di Caprio” 
11. Calcular la media del precio de las plataformas “Semestrales” 
