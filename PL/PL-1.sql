/*
 * Crea una función que tome como parámetro un rango de fechas y devuelva
 * la cantidad de reservas realizadas en ese rango.
 * La función debe devolver un único valor entero.
 */
DELIMITER $$
CREATE OR REPLACE FUNCTION reservas_entre (fecha_1 DATE, fecha_2 DATE)
RETURNS INT
BEGIN
    DECLARE cantidad INT;
    IF fecha_1 < fecha_2 THEN
        SET cantidad = (
            SELECT COUNT(*)
            FROM reservas
            WHERE fecha_reserva BETWEEN fecha_1 AND fecha_2
            );
    ELSE
        SET cantidad = (
            SELECT COUNT(*)
            FROM reservas
            WHERE fecha_reserva BETWEEN fecha_2 AND fecha_1
            );
    END IF;
    RETURN cantidad;
END$$
DELIMITER ;

SELECT reservas_entre('2013-01-01', '2014-12-31');

/*
 * Crea un procedimiento que tome como parámetro un nombre de usuario y
 * muestre por pantalla la cantidad de reservas realizadas por ese usuario.
 * El procedimiento no debe devolver ningún valor.
 */
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS nombre_usuario (nombre VARCHAR(50))
BEGIN
    SELECT COUNT(*) AS cantidad_reservas
    FROM reservas.reservas
    JOIN reservas.usuario_reserva ur on reservas.id = ur.id_reserva
    JOIN usuarios ON dni_usuario = usuarios.dni
    WHERE usuarios.nombre = nombre;
END$$

CALL nombre_usuario('Ray');

/*
 * Crea una función que tome como parámetro un DNI de un usuario y el nombre de un polideportivo
 * y devuelva un booleano que indique si el usuario ha realizado alguna reserva en ese polideportivo.
 */

DELIMITER $$
CREATE FUNCTION IF NOT EXISTS reserva_realizada (dni CHAR(9), nombre_polideportivo VARCHAR(50))
RETURNS BOOLEAN
BEGIN
   DECLARE reservado BOOLEAN;
   SET reservado = (
       SELECT COUNT(*) AS reservas_totales
       FROM reservas.reservas
       JOIN reservas.usuario_reserva ur on reservas.id = ur.id_reserva
       JOIN reservas.usuarios u on ur.dni_usuario = u.dni
       JOIN reservas.pistas p on p.id = reservas.id_pista
       JOIN reservas.polideportivos p2 on p2.id = p.id_polideportivo
       WHERE dni_usuario = dni AND p2.nombre = nombre_polideportivo
       );
   RETURN reservado;
END$$

SELECT reserva_realizada('ASITBSEM2', 'NA');


/*
 * Crea un procedimiento que tome como parámetro el DNI de un usuario
 * y muestre un historial de las reservas realizadas por ese usuario.
 * El procedimiento no debe devolver ningún valor.
 */
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS reservas_realizadas (dni CHAR(9))
BEGIN
    SELECT COUNT(*) AS reservas_realizadas
    FROM reservas
    JOIN reservas.pistas p on p.id = reservas.id_pista
    JOIN reservas.polideportivos p2 on p2.id = p.id_polideportivo
    JOIN reservas.usuario_reserva ur on reservas.id = ur.id_reserva
    JOIN reservas.usuarios u on u.dni = ur.dni_usuario
    WHERE ur.dni_usuario = dni;
END$$
CALL reservas_realizadas('AIXZNVWS0')$$
DELIMITER ;

 /*
 * Crea un procedimiento que tome como parámetro el DNI de un usuario y
 * el id de una pista y realice una reserva para ese usuario en esa pista.
 * La fecha de la reserva debe ser la fecha actual, la fecha de uso debe ser
 * la fecha actual más 7 días y el precio debe ser el de la pista aplicando
 * el descuento correspondiente al usuario.
 */
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS reserva_pista(dni CHAR(9), id_pista INT)
BEGIN
    DECLARE precio_pista INT;
    DECLARE descuento DOUBLE;
    DECLARE precio_final DOUBLE;

    SET precio_pista = (
        SELECT pistas.precio
        FROM pistas
        WHERE id = id_pista
        );
    SET descuento = (
        SELECT usuarios.descuento
        FROM usuarios
        WHERE usuarios.dni = dni
        );
    SET precio_final = precio_pista * descuento;

    INSERT INTO reservas (fecha_reserva, fecha_uso, precio, id_pista)
        VALUES (CURDATE(), CURDATE() + INTERVAL 7 DAY, precio_final, id_pista);
END$$

CALL reserva_pista('AIXZNVWS0', 1);
DELIMITER ;