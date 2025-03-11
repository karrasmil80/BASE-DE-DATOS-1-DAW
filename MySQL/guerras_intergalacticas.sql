-- 1ª Listar los planetas y el número de viajes espaciales realizados por cada especie a cada uno, ordenados por el número de viajes (incluyendo planetas sin viajes).

SELECT e.nombre AS especie_nombre,
       (SELECT COUNT(*)
        FROM ViajesEspaciales v
        WHERE v.especie_id = e.especie_id) AS cantidad_viajes
FROM Especies e
GROUP BY e.nombre DESC;


-- 2ª Encuentra el nombre de las especies cuya agresividad es mayor que la agresividad promedio de todas las especies

SELECT nombre
FROM especies
WHERE agresividad > (
    SELECT AVG(agresividad)
    FROM especies);

-- 3ª Calcula el total de anillos que tienen los planetas de tipo 'Rocoso'

SELECT SUM(tiene_anillos) AS total_anillos
FROM planetas
WHERE tipo = 'Rocoso';

-- 4ª Contar cuántos viajes espaciales ha realizado cada especie.

SELECT e.nombre AS nombre_especie, COUNT(ve.viaje_id) AS total_viajes
FROM Especies e
         JOIN ViajesEspaciales ve ON e.especie_id = ve.especie_id
GROUP BY e.nombre;

-- 5ª Calcular la inteligencia media de las especies que desarrollaron tecnologías de tipo 'Energía' y muestra la especie con la inteligencia mas alta del total y con la inteligencia mas baja del total.
SELECT t.nombre AS nombre_tecnologia, e.nombre AS nombre_especie, AVG(e.nivel_inteligencia) AS inteligencia_media, MAX(e.nivel_inteligencia), MIN(e.nivel_inteligencia)
FROM especies e
JOIN tecnologias t ON e.especie_id = t.especie_id
WHERE t.tipo = 'Energía';


-- 6ª  Contar cuántos planetas tienen anillos y agruparlos por su tipo y su habitabilidad.

SELECT p.nombre AS nombre_planeta, p.tipo, p.habitabilidad, p.tiene_anillos
FROM planetas p
WHERE tiene_anillos = TRUE
GROUP BY p.habitabilidad, p.tipo;

-- 7ª Listar las especies que han participado en conflictos y los nombres de esos conflictos con su resultado
SELECT c.nombre AS Conflicto, e1.nombre AS Especie_1, e2.nombre AS Especie_2, c.resultado
FROM Conflictos c
JOIN Especies e1 ON c.especie_1 = e1.especie_id
JOIN Especies e2 ON c.especie_2 = e2.especie_id;

-- 8º Ordena los conflictos de mayor a menor duración mostrando su nombre, fechas e id del conflicto

SELECT conflicto_id, nombre, fecha_inicio, fecha_fin, DATEDIFF(fecha_fin, fecha_inicio) AS duracion_dias
FROM Conflictos
ORDER BY duracion_dias DESC;

-- 9ª muestra la especie con más conflictos
SELECT e.nombre AS especie_con_mas_conflictos
FROM especies e
WHERE e.especie_id = (
    SELECT especie_id
    FROM conflictos
    GROUP BY especie_id
    ORDER BY COUNT(conflicto_id) DESC
    LIMIT 1
    );







