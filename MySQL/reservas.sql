-- Nombre y apellidos de todos los usuarios (100 filas)

SELECT usuarios.nombre, usuarios.apellidos
FROM usuarios;

-- Toda la información de todos los usuarios (100 filas)

SELECT *
FROM usuarios;

-- Toda la informacion de los usuarios ordenados alfabeticamente por apellidos (100 filas)

SELECT *
FROM usuarios
ORDER BY apellidos;

-- Toda la informacion de los polideportivos de Teruel (11 filas)

SELECT *
FROM polideportivos
WHERE ciudad LIKE 'Teruel';

-- Nombre, dirección y ciudad de los polideportivos cuya extension sea de mas de 200 (25 filas)

SELECT polideportivos.nombre, polideportivos.direccion, polideportivos.ciudad
FROM polideportivos
WHERE extension > 200;

-- Toda la informacion de los polideportivos de Zaragoza ordenados alfabeticamente por nombre (9 filas)

SELECT *
FROM polideportivos
WHERE ciudad LIKE 'Zaragoza'
ORDER BY nombre;

-- ID, tipo y precio de las pistas que cuesten menos de 10 euros (27 filas)

SELECT pistas.id, pistas.tipo, pistas.precio
FROM pistas
WHERE precio < 10;

-- Toda la informacion de las pistas que cuestan entre 10 y 20 euros (166 filas)

SELECT *
FROM pistas
WHERE precio BETWEEN 10 AND 20;

-- Toda la informacion de los usuarios cuyo nombre empiece por 'A' (13 filas)

SELECT *
FROM usuarios
WHERE nombre LIKE 'A%';

-- Toda la informacion de los usuarios cuyo nombre acabe por 'a' ordenados por apellido (14 filas)

SELECT *
FROM usuarios
WHERE nombre LIKE '%a'
ORDER BY apellidos;

-- Toda la informacion de los polideportivos cuya extension sea de 152, 259 o 399 (3 filas)

SELECT *
FROM polideportivos
WHERE extension IN (152, 259, 399);


-- Toda la informacion de los polideportivos cuyo nombre no empiece por 'Z' (32 filas)

SELECT *
FROM polideportivos
WHERE nombre NOT LIKE 'Z%';

-- Nombre completo de los usuarios cuyo nombre no empiece por 'A' (87 filas)

SELECT CONCAT(usuarios.nombre, '', usuarios.apellidos) AS nombre_completo
FROM usuarios
WHERE nombre NOT LIKE 'A%';

-- Nombre completo de los usuarios nacidos en 2014 y que sean de Zaragoza (12 filas)

SELECT CONCAT(usuarios.nombre, '', usuarios.apellidos) AS nombre_completo
FROM usuarios
WHERE YEAR(fecha_nacimiento) = 2014 AND ciudad LIKE 'Zaragoza';

-- Nombre completo y fecha de nacimiento completa en castellano de los usuarios nacidos en 2013 (53 filas)

SELECT CONCAT(usuarios.nombre, '', usuarios.apellidos) AS nombre_completo, usuarios.fecha_nacimiento
FROM usuarios
WHERE YEAR(fecha_nacimiento) = 2013;

-- Número de polideportivos hay en cada ciudad (3 filas)

SELECT COUNT(polideportivos.ciudad) AS numero_polideportivos
FROM polideportivos
GROUP BY ciudad;

-- Número de usuarios en cada ciudad (4 filas)

SELECT COUNT(usuarios.ciudad) AS usuarios_ciudad
FROM usuarios
GROUP BY ciudad;

-- Número de polideportivos hay en cada ciudad, solamente de aquellas ciudades donde hay más de 10 (2 filas)

SELECT COUNT(polideportivos.ciudad) AS numero_polideportivos
FROM polideportivos
GROUP BY ciudad
HAVING COUNT(polideportivos.ciudad) > 10;

-- Cantidad de pistas que hay en cada polideportivo (32 filas)

SELECT COUNT(pistas.id_polideportivo)
FROM pistas
GROUP BY id_polideportivo;

-- Precio medio, por tipo de pista (4 filas)

SELECT AVG(pistas.precio) AS precio_medio
FROM pistas
GROUP BY tipo;

-- Cuánto vale la pista más cara (1 fila)

SELECT MAX(pistas.precio)
FROM pistas;

-- Cuánto vale la pista más barata (1 fila)

SELECT MIN(pistas.precio)
FROM pistas;

-- Número de veces que se ha reservado cada pista (131 filas)

SELECT COUNT(reservas.id_pista)
FROM reservas
GROUP BY id_pista;

-- ID de las pistas con más de 2 reservas (13 filas)

SELECT COUNT(reservas.id_pista)
FROM reservas
GROUP BY id_pista
HAVING COUNT(id_pista) > 2;

-- Nombre de los tipos de pistas cuyo precio medio es de mas de 10 euros (3 filas)

SELECT pistas.tipo, AVG(pistas.precio) AS precio_medio
FROM pistas
GROUP BY tipo
HAVING AVG(precio) > 10;

-- Tipo de pista, precio y nombre del polideportivo de las pistas que pertenezcan a polideportivos de Zaragoza (63 filas)

SELECT p.tipo, p.precio, po.nombre
FROM pistas p
JOIN polideportivos po ON p.id_polideportivo = po.id
WHERE po.ciudad = 'Zaragoza';

-- Toda la informacion de las reservas realizadas por el usuario con DNI 'MUUCLKSD8' (2 filas)

SELECT *
FROM reservas
JOIN reservas.usuario_reserva ur ON reservas.id = ur.id_reserva
WHERE dni_usuario = 'MUUCLKSD8';

-- Número de pistas que hay de cada tipo en el polideportivo 'Nova Scotia' (4 filas)

SELECT COUNT(*) AS numero_pistas
FROM pistas
JOIN polideportivos po ON pistas.id_polideportivo = po.id
WHERE po.nombre = 'Nova Scotia'
GROUP BY tipo;

-- Total de dinero generado por cada tipo de pista ordenados por recaudación (4 filas)

SELECT pistas.tipo, SUM(precio) AS dinero_generado
FROM pistas
GROUP BY tipo
ORDER BY dinero_generado DESC;


-- Número de reservas que ha hecho cada usuario ordenados por apellidos (89 filas)

SELECT usuarios.nombre, usuarios.apellidos, COUNT(usuario_reserva.id_reserva) AS numero_reservas
FROM usuarios
JOIN reservas.usuario_reserva ON usuarios.dni = usuario_reserva.dni_usuario
GROUP BY usuarios.nombre, usuarios.apellidos
ORDER BY apellidos;

-- DNI y nombre completo de todos los amigos del usuario con dni 'HKOWKLQF9' (4 filas)

SELECT usuarios.dni, CONCAT(usuarios.nombre, ' ', usuarios.apellidos) AS nombre_completo
FROM usuarios
JOIN usuario_usuario ON usuarios.dni = usuario_usuario.dni_amigo
WHERE usuario_usuario.dni_usuario = 'HKOWKLQF9'

-- Toda la información de los usuarios que tengan al menos 5 amigos (9 filas)
/*
SELECT *
FROM usuarios
JOIN usuario_usuario ON usuarios.dni = usuario_usuario.dni_usuario
GROUP BY usuarios.dni
HAVING COUNT(dni_amigo) >= 5;
 */

-- Toda la información de los usuarios que han hecho al menos una reserva en agosto de 2014 (14 fila)

-- Toda la información de los usuarios que han reservado una pista de tenis (46 filas)

/* SELECT *
FROM usuarios
JOIN reservas.usuario_reserva ON usuarios.dni = usuario_reserva.dni_usuario
JOIN pistas ON reservas.reservas.id_pista = pistas.id
WHERE tipo = 'Tenis'
 */

-- DNI, nombre, apellidos y fecha de reserva más reciente de todos los usuarios (100 filas)

-- Toda la informacion de los usuarios que han hecho al menos 5 reservas (11 filas)

-- DNI y Nombre completo de los usuarios que han hecho reservas en pistas de tenis (46 filas)



-- DNI y nombre completo de los usuarios sin amigos (9 filas)



-- DNI y nombre completo de los usuarios con amigos en Teruel (72 fila)

-- Toda la información de los polideportivos que tienen pistas de baloncesto que han sido reservadas más de 5 veces (2 filas)

-- DNI y nombre completo de los usuarios que han hecho más de una reserva en pistas de baloncesto de un polideportivo de Zaragoza (5 filas)

-- Toda la información de los usuarios que son amigos de otros usuarios que tengan más de 5 amigos (35 filas)

-- DNI y nombre completo de los usuarios que han realizado las reservas de las pistas que han sido reservadas una sola vez (73 filas)

-- DNI y nombre completo de los usuarios que tengan amigos que hayan reservado alguna pista en Huesca (66 filas)

-- Tipo de pista y polideportivo de las pistas que han sido reservadas por algún usuario con más de 5 reservas realizadas (25 filas)

-- Tipo de pista y nombre de los polideportivos que tienen pistas que han sido reservadas por usuarios que han realizado una sola reserva (12 filas)

-- DNI y nombre completo de los usuarios que tienen algun amigo que no ha hecho ninguna reserva (55 filas)
