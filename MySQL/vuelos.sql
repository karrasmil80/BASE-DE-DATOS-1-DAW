-- Inserta un pasajero en la tabla pasajeros

    INSERT INTO pasajeros VALUES
        ( '12345678A', 'Pablo', 'Zuil', '123ABC', 'España', '1970-01-01');

-- Inserta dos vuelos en la tabla vuelos

    INSERT INTO vuelos VALUES
        ( '', 'EC-6028', 'SAW', 'HKT', '1970-01-01', '1970-01-02'),
        ( '', 'EC-3299', 'SAW', 'HKT', '1970-01-01', '1970-01-02');

-- Inserta dos billetes en la tabla billetes, uno para cada vuelo insertado en el paso anterior y el pasajero insertado en el primer paso

    INSERT INTO billetes VALUES
        ('', '12345678A', '310', 'D45', null),
        ('', '12345678A', '260', 'D45', null);

-- Añade un columna edad a la tabla pasajeros y actualiza la edad de todos los pasajeros realizando el cálculo con la fecha de nacimiento

    ALTER TABLE pasajeros ADD COLUMN edad INT;
    UPDATE pasajeros
    SET edad = TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE())
    WHERE 1;
-- En una transacción, modifica la columna llegada de los vuelos para que sea una hora despues de la salida en los vuelos dentro del mismo país
-- y para que sea dos horas y treinta minutos despues de la salida en los vuelos internacionales

    START TRANSACTION;
    UPDATE vuelos
    JOIN aeropuertos a1 ON vuelos.origen = a1.codigo_aeropuerto
    JOIN aeropuertos a2 ON vuelos.destino = a2.codigo_aeropuerto
    SET llegada = DATE_ADD(llegada, INTERVAL 1 HOUR)
    WHERE a1.pais = a2.pais;
    UPDATE vuelos
    JOIN aeropuertos a1 ON vuelos.origen = a1.codigo_aeropuerto
    JOIN aeropuertos a2 ON vuelos.destino = a2.codigo_aeropuerto
    SET llegada = DATE_ADD(DATE_ADD(llegada, INTERVAL 2 HOUR ), INTERVAL 30 MINUTE)
    WHERE a1.pais = a2.pais;
    COMMIT;

-- En una transacción, añade una columna precio a la tabla billetes, establece un precio aleatorio entre 100 y 500 para cada billete,
-- modifica el precio de los billetes en un 20% para los billetes de los pasajeros que no facturan equipaje y
-- modifica el precio de los billetes en un 10% para los vuelos operados por aviones de compañías low-cost (Ryanair, EasyJet, Vueling)

    START TRANSACTION;
    ALTER TABLE billetes ADD COLUMN precio INT;
    UPDATE billetes
    SET billetes.precio = ROUND(RAND(100 + 400, 2));
    UPDATE billetes
    SET billetes.precio = billetes.precio * 0.8
    WHERE peso_equipaje = null;
    UPDATE billetes
    JOIN vuelos.vuelos v on billetes.codigo_vuelo = v.codigo_vuelo
    JOIN aviones a ON v.matricula_avion = a.matricula
    SET billetes.precio = billetes.precio * 0.10
    WHERE nombre_aerolinea IN ('Ryanair', 'EasyJet', 'Vueling');


-- Elimina los vuelos que de los que no se ha vendido ningún billete

    DELETE FROM vuelos
    WHERE codigo_vuelo NOT IN (
        SELECT billetes.codigo_vuelo
        FROM billetes
        );
-- Elimina los pasajeros que no han comprado ningún billete

    DELETE FROM pasajeros
    WHERE dni NOT IN (
        SELECT billetes.dni_pasajero
        FROM billetes
        );