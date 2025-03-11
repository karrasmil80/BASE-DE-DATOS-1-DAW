-- Insertar tres registros en la tabla productos

    INSERT INTO productos VALUES
        ('64', 'Movil', 40.2, '1000', 'Apple'),
        ('65', 'Movil2', 40.3, '1000', 'Apple'),
        ('66', 'Movil3', 40.4, '1000', 'Apple');

-- Insertar un registro en la tabla clientes

    INSERT INTO clientes VALUES
        ('', 'Pablo', 'Zuil');
-- Insertar tres registros en la tabla pedidos del cliente con cada producto insertados antes

    INSERT INTO pedidos VALUES
        ('', '1970-01-01', '1000', '64', 'bguillouu@surveymonkey.com');

-- En una transacción, modifica el precio de los productos de marcas chinas y taiwanesas para aplicar un descuento del 10%,
-- modifica el precio de los productos de marcas coreanas para aplicar un descuento del 5% y
-- y modifica el precio de los productos de marcas estadounidenses para aplicar un incremento del 5%

    START TRANSACTION;
    UPDATE productos
    SET precio = precio * 0.90
    WHERE marca IN ( 'Taiwán', 'China');

    UPDATE productos
    SET precio = precio * 0.95
    WHERE marca IN ('Corea del Sur');

    UPDATE productos
    SET precio = precio * 1.05
    WHERE marca IN ('Estados Unidos');
    COMMIT;

-- En una transacción, añade una columna ventas a la tabla marcas,
-- actualiza el número de ventas de cada marca con el número de unidades vendidas entre de todos los productos de esa marca

    START TRANSACTION;
    ALTER TABLE marcas ADD COLUMN ventas INT;
    UPDATE marcas m
    SET ventas = (SELECT SUM(unidades)
                  FROM pedidos
                  JOIN productos p ON producto = p.id WHERE marca = m.nombre);

-- Elimina los productos que no se han vendido
    DELETE FROM productos
    WHERE id NOT IN (
        SELECT pedidos.producto
        FROM pedidos
        );

-- Elimina los clientes que no han realizado ningún pedido
    DELETE FROM clientes
    WHERE email NOT IN (
        SELECT pedidos.cliente
        FROM pedidos
        )