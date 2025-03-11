-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS Tienda;
-- Crear la base de datos
CREATE DATABASE Tienda;
-- Usar la base de datos creada
USE Tienda;
-- --------------------------------------------------------
--
-- Crear la tabla de productos
--
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL CHECK (stock >= 0),
    marca VARCHAR(100) NOT NULL
);
-- --------------------------------------------------------
--
-- Crear la tabla de marcas
--
CREATE TABLE marcas (
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    fundacion YEAR NOT NULL,
    PRIMARY KEY (nombre)
);
-- --------------------------------------------------------
--
-- Crear la tabla de clientes
--
CREATE TABLE clientes (
    email VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    PRIMARY KEY (email)
);
-- --------------------------------------------------------
--
-- Crear la tabla de pedidos
--
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    unidades INT NOT NULL CHECK (unidades > 0),
    producto INT NOT NULL,
    cliente VARCHAR(100) NOT NULL
);
-- --------------------------------------------------------
--
-- Añadir las claves foráneas
--
ALTER TABLE productos 
    ADD FOREIGN KEY (marca) REFERENCES marcas(nombre);
ALTER TABLE pedidos
    ADD FOREIGN KEY (producto) REFERENCES productos(id),
    ADD FOREIGN KEY (cliente) REFERENCES clientes(email);
-- --------------------------------------------------------
--
-- Insertamos datos a la tabla marcas
--
INSERT INTO marcas (nombre, pais, fundacion) VALUES
    ('Apple', 'Estados Unidos', 1976),
    ('Samsung', 'Corea del Sur', 1938),
    ('Huawei', 'China', 1987),
    ('Xiaomi', 'China', 2010),
    ('Sony', 'Japón', 1946),
    ('LG', 'Corea del Sur', 1958),
    ('HP', 'Estados Unidos', 1939),
    ('Dell', 'Estados Unidos', 1984),
    ('Lenovo', 'China', 1984),
    ('Asus', 'Taiwán', 1989),
    ('Acer', 'Taiwán', 1976),
    ('MSI', 'Taiwán', 1986),
    ('Razer', 'Estados Unidos', 2005),
    ('Alienware', 'Estados Unidos', 1996),
    ('Corsair', 'Estados Unidos', 1994),
    ('Logitech', 'Suiza', 1981),
    ('SteelSeries', 'Dinamarca', 2001),
    ('HyperX', 'Estados Unidos', 2002),
    ('Kingston', 'Estados Unidos', 1987),
    ('Crucial', 'Estados Unidos', 1996);
-- --------------------------------------------------------
--
-- Insertamos datos a la tabla productos
--
INSERT INTO productos (nombre, precio, stock, marca) VALUES
    ('iPhone 12', 909.00, 100, 'Apple'),
    ('Galaxy S21', 849.00, 100, 'Samsung'),
    ('P40 Pro', 799.00, 100, 'Huawei'),
    ('Mi 11', 749.00, 100, 'Xiaomi'),
    ('Xperia 1 II', 1199.00, 100, 'Sony'),
    ('V60 ThinQ', 799.00, 100, 'LG'),
    ('Spectre x360', 1299.00, 100, 'HP'),
    ('XPS 13', 999.00, 100, 'Dell'),
    ('ThinkPad X1 Carbon', 1499.00, 100, 'Lenovo'),
    ('ZenBook 14', 999.00, 100, 'Asus'),
    ('Swift 3', 599.00, 100, 'Acer'),
    ('GS66 Stealth', 1499.00, 100, 'MSI'),
    ('Blade 15', 1599.00, 100, 'Razer'),
    ('Area-51m', 1999.00, 100, 'Alienware'),
    ('K70 RGB MK.2', 159.00, 100, 'Corsair'),
    ('G502 HERO', 79.00, 100, 'Logitech'),
    ('Rival 3', 29.00, 100, 'SteelSeries'),
    ('Cloud II', 99.00, 100, 'HyperX'),
    ('A2000', 59.00, 100, 'Kingston'),
    ('BX500', 49.00, 100, 'Crucial'),
    ('iPad Pro', 899.00, 100, 'Apple'),
    ('Galaxy Tab S7', 649.00, 100, 'Samsung'),
    ('MatePad Pro', 549.00, 100, 'Huawei'),
    ('Mi Pad 5', 499.00, 100, 'Xiaomi'),
    ('Xperia Tablet Z4', 799.00, 100, 'Sony'),
    ('G Pad 5', 299.00, 100, 'LG'),
    ('MacBook Pro', 1299.00, 100, 'Apple'),
    ('Galaxy Book Flex', 1349.00, 100, 'Samsung'),
    ('MateBook X Pro', 1499.00, 100, 'Huawei'),
    ('Mi Notebook Pro', 999.00, 100, 'Xiaomi'),
    ('VAIO Z', 1799.00, 100, 'Sony'),
    ('Gram 17', 1699.00, 100, 'LG'),
    ('Pavilion x360', 799.00, 100, 'HP'),
    ('Inspiron 15', 599.00, 100, 'Dell'),
    ('IdeaPad 5', 499.00, 100, 'Lenovo'),
    ('VivoBook 15', 399.00, 100, 'Asus'),
    ('Swift 5', 999.00, 100, 'Acer'),
    ('Prestige 14', 1299.00, 100, 'MSI'),
    ('Blade Stealth', 1399.00, 100, 'Razer'),
    ('M15', 1799.00, 100, 'Alienware'),
    ('K95 RGB PLATINUM', 199.00, 100, 'Corsair'),
    ('G Pro X', 129.00, 100, 'Logitech'),
    ('Rival 600', 79.00, 100, 'SteelSeries'),
    ('Cloud Alpha', 99.00, 100, 'HyperX'),
    ('FURY RGB', 49.00, 100, 'Kingston'),
    ('P2', 39.00, 100, 'Crucial'),
    ('Magic Keyboard', 299.00, 100, 'Apple'),
    ('Galaxy Buds Pro', 199.00, 100, 'Samsung'),
    ('FreeBuds Pro', 179.00, 100, 'Huawei'),
    ('Mi True Wireless Earphones 2', 99.00, 100, 'Xiaomi'),
    ('WH-1000XM4', 349.00, 100, 'Sony'),
    ('TONE Free FN7', 199.00, 100, 'LG'),
    ('Spectre 700', 149.00, 100, 'HP'),
    ('XPS 15', 1299.00, 100, 'Dell'),
    ('ThinkPad X1 Fold', 2499.00, 100, 'Lenovo'),
    ('ZenBook Pro Duo', 2499.00, 100, 'Asus'),
    ('Swift 7', 999.00, 100, 'Acer');
-- --------------------------------------------------------
--
-- Insertamos datos a la tabla clientes
--
INSERT INTO clientes VALUES ('dnovik0@ebay.com', 'Devland', 'Novik');
INSERT INTO clientes VALUES ('gtretter1@squidoo.com', 'Gabbie', 'Tretter');
INSERT INTO clientes VALUES ('aromeril2@fotki.com', 'Adamo', 'Romeril');
INSERT INTO clientes VALUES ('wmeigh3@aol.com', 'Wilhelmina', 'Meigh');
INSERT INTO clientes VALUES ('oyukhin4@meetup.com', 'Olenolin', 'Yukhin');
INSERT INTO clientes VALUES ('amcclean5@nymag.com', 'Audrie', 'McClean');
INSERT INTO clientes VALUES ('sconan6@linkedin.com', 'Sissy', 'Conan');
INSERT INTO clientes VALUES ('mshird7@infoseek.co.jp', 'Milzie', 'Shird');
INSERT INTO clientes VALUES ('nnockalls8@hibu.com', 'Noland', 'Nockalls');
INSERT INTO clientes VALUES ('ftrappe9@ezinearticles.com', 'Faythe', 'Trappe');
INSERT INTO clientes VALUES ('eortzena@wiley.com', 'Eugenie', 'Ortzen');
INSERT INTO clientes VALUES ('kbarnabyb@barnesandnoble.com', 'Kattie', 'Barnaby');
INSERT INTO clientes VALUES ('dbarthrupc@canalblog.com', 'Davin', 'Barthrup');
INSERT INTO clientes VALUES ('hmenlowd@nhs.uk', 'Haskell', 'Menlow');
INSERT INTO clientes VALUES ('hbrooksbanke@mtv.com', 'Halie', 'Brooksbank');
INSERT INTO clientes VALUES ('shabblef@yellowpages.com', 'Sigismond', 'Habble');
INSERT INTO clientes VALUES ('emoreg@bandcamp.com', 'Eveleen', 'More');
INSERT INTO clientes VALUES ('dcornelisseh@time.com', 'Dynah', 'Cornelisse');
INSERT INTO clientes VALUES ('jtuveyi@redcross.org', 'Jaymie', 'Tuvey');
INSERT INTO clientes VALUES ('jgaskinsj@cnn.com', 'Joya', 'Gaskins');
INSERT INTO clientes VALUES ('hnorthropk@paginegialle.it', 'Hillary', 'Northrop');
INSERT INTO clientes VALUES ('snovikl@theglobeandmail.com', 'Stephen', 'Novik');
INSERT INTO clientes VALUES ('vmorpethm@mtv.com', 'Virginie', 'Morpeth');
INSERT INTO clientes VALUES ('fwhatmoughn@bing.com', 'Florella', 'Whatmough');
INSERT INTO clientes VALUES ('rchaperlingo@scribd.com', 'Raphaela', 'Chaperling');
INSERT INTO clientes VALUES ('mboogp@whitehouse.gov', 'Mercy', 'Boog');
INSERT INTO clientes VALUES ('rbecerraq@timesonline.co.uk', 'Reyna', 'Becerra');
INSERT INTO clientes VALUES ('cspaingowerr@noaa.gov', 'Chelsae', 'Spain-Gower');
INSERT INTO clientes VALUES ('snestoruks@wisc.edu', 'Sigismund', 'Nestoruk');
INSERT INTO clientes VALUES ('lblackettt@ifeng.com', 'Letti', 'Blackett');
INSERT INTO clientes VALUES ('bguillouu@surveymonkey.com', 'Britt', 'Guillou');
INSERT INTO clientes VALUES ('estrikerv@wikia.com', 'Edita', 'Striker');
INSERT INTO clientes VALUES ('gfairbairnw@shop-pro.jp', 'Gareth', 'Fairbairn');
INSERT INTO clientes VALUES ('ealcottx@seesaa.net', 'Ellerey', 'Alcott');
INSERT INTO clientes VALUES ('mbrisleny@networksolutions.com', 'Maynord', 'Brislen');
INSERT INTO clientes VALUES ('lchestertonz@drupal.org', 'Lyell', 'Chesterton');
INSERT INTO clientes VALUES ('pcunde10@oakley.com', 'Paola', 'Cunde');
INSERT INTO clientes VALUES ('jhurworth11@php.net', 'Julius', 'Hurworth');
INSERT INTO clientes VALUES ('atoquet12@army.mil', 'Andrea', 'Toquet');
INSERT INTO clientes VALUES ('lgaudin13@paginegialle.it', 'Lu', 'Gaudin');
INSERT INTO clientes VALUES ('jwinchcomb14@admin.ch', 'Jillayne', 'Winchcomb');
INSERT INTO clientes VALUES ('akittle15@blogspot.com', 'Anastassia', 'Kittle');
INSERT INTO clientes VALUES ('shamson16@php.net', 'Sumner', 'Hamson');
INSERT INTO clientes VALUES ('gcumberlidge17@google.pl', 'Griffy', 'Cumberlidge');
INSERT INTO clientes VALUES ('cdingsdale18@wordpress.org', 'Cathryn', 'Dingsdale');
INSERT INTO clientes VALUES ('gchrispin19@umich.edu', 'Galina', 'Chrispin');
INSERT INTO clientes VALUES ('aperigeaux1a@indiatimes.com', 'Arleta', 'Perigeaux');
INSERT INTO clientes VALUES ('mhum1b@nasa.gov', 'Maddi', 'Hum');
INSERT INTO clientes VALUES ('ffriedank1c@example.com', 'Felicia', 'Friedank');
INSERT INTO clientes VALUES ('pprestie1d@joomla.org', 'Percival', 'Prestie');
-- --------------------------------------------------------
--
-- Insertamos datos a la tabla pedidos
--
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-20', 5, 34, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-08-26', 1, 39, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-11-29', 1, 21, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-11-14', 5, 45, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-17', 3, 17, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-20', 4, 45, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-26', 3, 14, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-08-03', 1, 7, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-30', 4, 53, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-07', 4, 7, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-25', 1, 57, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-23', 5, 6, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-11-27', 2, 54, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-21', 4, 40, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-07', 4, 18, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-06', 3, 27, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-10', 3, 4, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-19', 2, 8, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-04', 5, 56, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-05', 5, 22, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-30', 1, 4, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-12-27', 3, 48, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-31', 2, 54, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-07', 4, 21, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-11', 2, 24, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-27', 2, 30, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-05-02', 3, 13, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-14', 1, 53, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-05', 1, 30, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-12', 4, 49, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-25', 3, 15, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-23', 4, 49, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-28', 1, 41, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-02-20', 3, 24, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-17', 4, 4, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-09-07', 1, 34, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-29', 1, 55, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-28', 5, 41, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-16', 5, 25, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-04', 5, 38, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-11', 5, 31, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-30', 3, 2, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-02-04', 5, 20, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-05', 4, 51, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-26', 4, 17, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-29', 5, 7, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-22', 5, 52, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-09-30', 5, 16, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-26', 3, 36, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-01', 4, 10, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-17', 5, 49, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-18', 4, 18, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-26', 5, 28, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-02-23', 1, 13, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-04', 3, 44, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-19', 4, 18, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-12-24', 2, 21, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-17', 3, 18, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-14', 5, 11, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-11', 5, 24, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-08', 4, 41, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-01', 2, 5, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-23', 2, 32, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-23', 4, 4, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-11-13', 5, 30, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-28', 4, 2, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-18', 2, 34, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-06-25', 2, 9, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-15', 2, 4, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-08', 3, 33, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-12', 2, 53, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-02', 4, 31, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-31', 5, 21, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-19', 5, 24, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-26', 2, 30, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-09-01', 2, 2, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-28', 4, 42, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-24', 5, 26, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-12', 2, 16, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-16', 5, 43, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-16', 3, 54, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-11', 1, 25, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-10', 5, 7, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-31', 1, 17, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-22', 2, 7, 'emoreg@bandcamp.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-25', 5, 16, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-01', 3, 11, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-02-18', 5, 35, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-23', 4, 50, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-23', 5, 39, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-28', 2, 40, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-04', 5, 28, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-01', 4, 11, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-02-05', 2, 2, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-25', 4, 42, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-19', 4, 52, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-10', 3, 28, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-02', 3, 9, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-11-04', 5, 38, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-21', 1, 11, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-13', 3, 46, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-06', 1, 7, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-05', 3, 15, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-07', 3, 23, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-07', 3, 26, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-01', 2, 45, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-28', 2, 14, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-05-26', 2, 56, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-23', 5, 49, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-22', 3, 50, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-10-10', 3, 40, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-02', 2, 36, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-04', 2, 54, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-25', 5, 14, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-01', 1, 11, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-03', 1, 21, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-08', 5, 34, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-27', 4, 57, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-23', 5, 29, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-14', 2, 57, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-23', 1, 34, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-12-06', 2, 21, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-10', 1, 5, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-17', 1, 40, 'emoreg@bandcamp.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-04-11', 2, 32, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-09-08', 3, 34, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-10-09', 3, 43, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-12', 5, 2, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-10', 1, 42, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-11-20', 2, 1, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-26', 2, 25, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-15', 5, 25, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-05', 3, 15, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-11-16', 3, 54, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-09', 2, 23, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-07', 2, 1, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-06', 5, 17, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-12-11', 3, 7, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-22', 4, 51, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-01', 5, 33, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-08', 3, 15, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-11-15', 5, 16, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-12-12', 5, 44, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-17', 4, 13, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-06-02', 5, 31, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-16', 1, 46, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-11-05', 5, 8, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-28', 2, 21, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-27', 2, 55, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-17', 3, 36, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-24', 5, 13, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-21', 1, 20, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-23', 2, 18, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-02-11', 2, 2, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-24', 1, 22, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-07', 5, 56, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-29', 5, 35, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-03', 2, 3, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-02', 4, 3, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-04', 5, 18, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-19', 5, 23, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-29', 3, 1, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-09-01', 5, 17, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-17', 5, 23, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-02', 3, 30, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-31', 2, 51, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-20', 2, 43, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-12-15', 1, 55, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-06', 3, 44, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-11', 5, 6, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-17', 3, 52, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-25', 4, 39, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-19', 4, 47, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-10-19', 3, 5, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-25', 4, 35, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-02-25', 1, 56, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-23', 4, 55, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-11', 3, 39, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-12', 2, 45, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-13', 3, 33, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-24', 1, 12, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-21', 1, 21, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-24', 3, 3, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-01', 1, 28, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-03', 4, 39, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-12', 3, 15, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-16', 4, 20, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-07', 1, 46, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-16', 4, 55, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-11', 5, 9, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-05', 1, 30, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-29', 1, 23, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-06-13', 3, 15, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-19', 5, 36, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-02', 3, 6, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-21', 1, 7, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-31', 2, 52, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-09-29', 2, 51, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-17', 2, 9, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-21', 1, 56, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-02', 3, 25, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-04', 5, 7, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-01', 2, 8, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-19', 5, 46, 'emoreg@bandcamp.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-09-11', 1, 38, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-04', 1, 7, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-11-23', 5, 52, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-30', 3, 27, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-06', 2, 38, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-12', 3, 22, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-21', 5, 29, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-15', 5, 39, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-08', 5, 24, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-01', 2, 22, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-13', 3, 18, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-04-21', 2, 31, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-28', 2, 36, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-15', 1, 45, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-04-23', 2, 22, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-12', 3, 44, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-29', 3, 15, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-20', 4, 33, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-27', 1, 25, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-11', 5, 49, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-18', 2, 34, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-05', 5, 23, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-16', 2, 36, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-20', 4, 26, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-10-08', 3, 42, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-13', 3, 33, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-29', 2, 5, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-14', 4, 55, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-14', 1, 5, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-04-11', 5, 50, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-30', 2, 12, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-20', 1, 15, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-10', 3, 29, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-30', 2, 1, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-02-01', 5, 30, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-04', 1, 22, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-26', 4, 53, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-18', 1, 35, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-31', 4, 48, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-01', 5, 56, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-22', 3, 51, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-05', 4, 32, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-19', 2, 24, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-08', 3, 39, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-25', 2, 14, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-20', 5, 52, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-27', 5, 7, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-10-03', 5, 56, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-15', 2, 25, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-03', 1, 1, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-22', 4, 32, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-11-18', 2, 29, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-12', 2, 24, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-16', 3, 53, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-16', 2, 48, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-19', 5, 21, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-20', 3, 45, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-20', 2, 17, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-01', 1, 26, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-04-22', 1, 41, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-20', 1, 8, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-22', 4, 3, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-01', 2, 55, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-31', 4, 15, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-21', 5, 2, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-24', 2, 19, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-06-08', 2, 16, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-23', 2, 54, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-24', 1, 31, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-28', 3, 3, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-02-16', 5, 51, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-28', 4, 44, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-30', 1, 25, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-02', 1, 56, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-14', 2, 18, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-24', 5, 45, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-04', 5, 19, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-04-25', 2, 25, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-25', 1, 38, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-04-07', 5, 45, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-18', 2, 56, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-20', 3, 17, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-21', 3, 11, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-12', 1, 50, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-10', 5, 35, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-05', 1, 49, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-16', 1, 24, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-13', 1, 8, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-04', 2, 3, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-09', 2, 22, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-25', 5, 49, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-02-26', 1, 21, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-09-18', 2, 7, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-02', 2, 43, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-19', 4, 6, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-04-02', 2, 32, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-26', 5, 43, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-05-14', 5, 2, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-02-10', 2, 50, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-07', 1, 14, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-19', 3, 40, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-02', 2, 16, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-12-09', 3, 19, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-12-23', 5, 54, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-23', 3, 54, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-11', 1, 8, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-04', 1, 15, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-08', 2, 17, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-02-19', 2, 27, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-15', 5, 22, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-06-18', 5, 53, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-02', 4, 28, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-06', 2, 34, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-25', 5, 55, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-30', 1, 31, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-06', 5, 6, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-22', 2, 43, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-04-18', 5, 36, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-19', 3, 54, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-06', 2, 39, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-16', 3, 56, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-08', 4, 43, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-04', 4, 41, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-12', 5, 29, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-20', 4, 25, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-14', 3, 15, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-08-27', 4, 53, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-21', 4, 11, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-11-23', 2, 41, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-20', 4, 3, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-28', 1, 39, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-24', 1, 10, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-14', 5, 22, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-08-29', 3, 40, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-13', 2, 57, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-09', 4, 56, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-09-30', 4, 28, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-30', 1, 51, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-15', 1, 1, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-06-26', 4, 29, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-10', 4, 32, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-31', 3, 7, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-14', 1, 39, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-16', 5, 35, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-27', 4, 36, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-11-18', 4, 48, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-13', 4, 29, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-18', 4, 50, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-29', 1, 43, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-10-14', 5, 30, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-03', 3, 38, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-04', 2, 44, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-11', 3, 16, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-11-22', 1, 29, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-19', 2, 24, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-09', 3, 15, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-24', 2, 28, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-04', 4, 42, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-26', 5, 45, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-17', 4, 33, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-26', 1, 37, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-09', 3, 33, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-09-04', 1, 1, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-06', 3, 30, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-04-27', 5, 37, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-26', 5, 12, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-14', 5, 57, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-03', 2, 45, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-30', 3, 5, 'emoreg@bandcamp.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-31', 2, 9, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-29', 1, 32, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-05', 4, 9, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-25', 4, 26, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-04', 5, 29, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-04-18', 2, 51, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-11', 2, 1, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-30', 5, 10, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-03', 2, 36, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-25', 4, 22, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-15', 2, 7, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-09', 1, 38, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-04-23', 4, 28, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-12-08', 4, 20, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-05', 4, 37, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-30', 2, 7, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-10-21', 5, 12, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-08-22', 2, 14, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-17', 1, 13, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-02', 5, 28, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-09', 4, 33, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-01', 2, 10, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-18', 5, 45, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-27', 4, 43, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-03', 5, 49, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-02-21', 4, 45, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-01', 1, 12, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-26', 3, 6, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-15', 4, 15, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-25', 4, 17, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-28', 5, 55, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-16', 3, 12, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-31', 2, 53, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-01', 2, 48, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-02', 3, 11, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-12', 4, 6, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-05', 1, 27, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-31', 2, 6, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-08', 3, 7, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-16', 4, 48, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-15', 5, 22, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-23', 5, 23, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-08', 3, 4, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-04-03', 1, 41, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-13', 5, 27, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-20', 4, 7, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-09', 1, 1, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-25', 4, 54, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-05', 1, 37, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-11', 4, 31, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-17', 4, 18, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-07', 2, 27, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-05', 3, 24, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-18', 1, 6, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-09', 1, 42, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-21', 2, 17, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-24', 1, 8, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-19', 3, 32, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-14', 5, 55, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-09-04', 5, 25, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-06-26', 4, 54, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-22', 4, 36, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-09-01', 2, 33, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-06', 5, 56, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-13', 4, 6, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-11-06', 4, 54, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-24', 5, 33, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-30', 5, 18, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-13', 2, 31, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-15', 4, 23, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-04', 1, 56, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-08-04', 3, 34, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-10-22', 1, 43, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-22', 1, 56, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-16', 3, 53, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-17', 5, 9, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-01', 1, 9, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-05', 5, 56, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-08-13', 5, 56, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-03', 2, 22, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-19', 5, 35, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-12', 2, 47, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-11', 1, 16, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-02-23', 2, 43, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-12', 2, 41, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-16', 4, 31, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-20', 3, 33, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-06', 1, 6, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-04-22', 2, 55, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-25', 1, 28, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-28', 5, 14, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-08-08', 2, 20, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-31', 1, 11, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-02-14', 3, 51, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-20', 5, 37, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-14', 4, 30, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-13', 1, 22, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-11', 4, 6, 'emoreg@bandcamp.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-24', 4, 15, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-12', 2, 35, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-04-13', 5, 4, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-09-05', 2, 50, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-02-28', 4, 45, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-03', 3, 21, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-09-15', 4, 54, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-06', 3, 14, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-07', 1, 12, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-19', 5, 8, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-27', 3, 2, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-02-01', 1, 57, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-10', 5, 4, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-26', 4, 14, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-15', 5, 20, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-17', 4, 56, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-06', 3, 40, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-20', 3, 48, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-04', 5, 2, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-04-02', 4, 38, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-28', 3, 26, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-18', 3, 36, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-12', 2, 57, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-20', 2, 6, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-26', 5, 18, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-09-08', 1, 46, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-27', 3, 13, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-16', 1, 51, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-23', 2, 5, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-14', 4, 4, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-23', 4, 46, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-22', 3, 15, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-21', 1, 9, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-25', 3, 33, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-02-27', 3, 25, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-07', 1, 3, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-13', 4, 1, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-01', 2, 41, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-29', 5, 22, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-30', 2, 11, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-22', 5, 29, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-18', 1, 39, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-26', 3, 33, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-10-28', 3, 34, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-04-28', 4, 46, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-20', 1, 44, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-16', 5, 14, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-27', 3, 3, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-02-17', 5, 8, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-14', 4, 34, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-05', 2, 23, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-20', 1, 6, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-09-16', 3, 37, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-17', 4, 17, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-25', 4, 29, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-21', 2, 7, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-08', 3, 30, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-25', 3, 28, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-08', 1, 17, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-02', 2, 35, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-05', 5, 12, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-02', 3, 50, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-11', 2, 12, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-17', 5, 28, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-25', 4, 49, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-12-14', 5, 13, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-24', 2, 43, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-19', 1, 57, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-04-23', 5, 15, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-05', 1, 38, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-17', 4, 26, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-20', 5, 28, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-15', 4, 52, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-03', 1, 53, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-06', 4, 5, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-22', 1, 19, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-29', 3, 5, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-18', 3, 24, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-30', 3, 23, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-27', 1, 31, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-25', 3, 39, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-09-25', 4, 32, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-23', 3, 24, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-09', 5, 18, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-23', 3, 35, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-15', 5, 13, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-31', 3, 15, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-23', 2, 25, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-22', 4, 17, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-11-28', 4, 25, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-29', 4, 35, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-12', 4, 38, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-16', 1, 56, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-31', 1, 36, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-25', 5, 9, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-14', 3, 12, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-08-13', 4, 40, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-22', 2, 37, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-24', 3, 52, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-18', 1, 43, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-06-17', 2, 36, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-23', 1, 36, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-04', 3, 4, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-05', 2, 14, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-11', 4, 36, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-25', 4, 54, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-07', 2, 49, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-19', 5, 41, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-08-12', 3, 45, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-21', 4, 48, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-15', 3, 10, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-05-06', 4, 10, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-11-09', 5, 1, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-02-14', 4, 51, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-27', 2, 37, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-20', 5, 34, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-18', 2, 57, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-14', 4, 8, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-03', 1, 25, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-13', 2, 32, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-29', 4, 4, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-18', 5, 14, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-11', 4, 42, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-21', 5, 26, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-07', 1, 5, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-11', 1, 42, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-27', 5, 49, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-18', 3, 49, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-15', 5, 34, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-04', 4, 52, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-16', 3, 36, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-14', 3, 27, 'emoreg@bandcamp.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-17', 3, 27, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-18', 5, 9, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-29', 2, 43, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-04', 2, 3, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-30', 3, 18, 'emoreg@bandcamp.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-17', 3, 31, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-23', 1, 34, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-08-22', 1, 35, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-07', 4, 28, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-02', 1, 29, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-18', 5, 7, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-13', 4, 43, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-12-19', 5, 7, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-11', 3, 5, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-30', 4, 10, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-16', 4, 23, 'emoreg@bandcamp.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-12', 2, 16, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-15', 1, 44, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-29', 3, 57, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-05', 2, 6, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-28', 3, 34, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-23', 4, 6, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-31', 1, 36, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-17', 5, 24, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-25', 4, 20, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-02', 2, 16, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-12', 3, 35, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-07', 5, 49, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-07', 5, 4, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-20', 1, 15, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-12', 2, 41, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-12', 2, 14, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-12', 3, 51, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-04', 2, 28, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-25', 3, 15, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-16', 2, 34, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-22', 2, 14, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-29', 3, 32, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-07', 4, 42, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-24', 4, 52, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-25', 4, 54, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-23', 2, 6, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-02', 5, 55, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-23', 3, 7, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-30', 3, 27, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-06-25', 4, 56, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-04', 1, 28, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-10', 2, 23, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-09-17', 3, 1, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-26', 2, 8, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-12-30', 5, 28, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-04', 4, 24, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-16', 2, 17, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-10', 1, 26, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-09', 4, 2, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-09-07', 1, 11, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-26', 4, 15, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-06', 2, 11, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-09', 5, 49, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-06', 5, 24, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-13', 2, 41, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-12', 4, 8, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-16', 5, 13, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-12', 2, 14, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-03', 5, 20, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-21', 5, 14, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-13', 4, 23, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-18', 1, 48, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-08', 4, 3, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-15', 2, 13, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-22', 4, 47, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-02-03', 4, 45, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-05', 2, 45, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-09-08', 4, 29, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-16', 3, 49, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-02', 3, 53, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-06', 4, 39, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-05-10', 2, 34, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-11', 3, 4, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-15', 2, 43, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-24', 3, 47, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-12', 1, 21, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-15', 5, 31, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-03', 2, 35, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-21', 4, 57, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-06', 1, 35, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-20', 2, 39, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-03', 5, 13, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-04', 5, 42, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-17', 3, 30, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-09-24', 3, 45, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-26', 5, 54, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-09-30', 4, 33, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-09', 4, 1, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-24', 2, 31, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-23', 5, 42, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-07', 5, 22, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-11-29', 2, 11, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-04-06', 5, 48, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-06-12', 2, 31, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-19', 5, 43, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-10', 3, 18, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-23', 3, 9, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-09-12', 1, 23, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-26', 4, 47, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-19', 2, 45, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-04', 5, 19, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-28', 2, 50, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-12', 1, 12, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-21', 4, 19, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-11', 4, 56, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-22', 4, 10, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-13', 2, 39, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-02-16', 4, 32, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-03', 3, 45, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-09-12', 2, 21, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-21', 4, 28, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-29', 1, 21, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-07', 2, 43, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-29', 5, 45, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-30', 2, 48, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-13', 2, 18, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-10-12', 4, 46, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-04', 5, 50, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-02-09', 3, 26, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-19', 4, 29, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-07', 3, 40, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-10-08', 1, 5, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-09', 2, 46, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-11-28', 5, 40, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-09', 3, 5, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-30', 2, 19, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-07', 4, 55, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-03', 2, 55, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-13', 4, 7, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-05', 4, 47, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-08', 2, 42, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-11-06', 5, 12, 'emoreg@bandcamp.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-01', 3, 3, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-31', 5, 45, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-10-09', 2, 8, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-18', 4, 10, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-17', 1, 7, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-06', 2, 41, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-25', 3, 47, 'rbecerraq@timesonline.co.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-19', 1, 18, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-06', 2, 48, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-03', 1, 13, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-11', 4, 28, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-12', 4, 20, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-08', 4, 27, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-28', 2, 5, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-11', 4, 55, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-04-24', 3, 16, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-24', 3, 54, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-13', 1, 26, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-25', 3, 26, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-12', 3, 43, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-07', 4, 10, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-10', 2, 15, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-29', 3, 21, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-19', 2, 8, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-15', 4, 30, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-06', 2, 46, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-18', 1, 26, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-19', 2, 16, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-04-22', 3, 38, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-18', 1, 9, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-02-01', 1, 52, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-02-08', 1, 14, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-25', 1, 13, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-11-21', 2, 32, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-06', 3, 22, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-11-30', 2, 43, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-14', 1, 49, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-05', 3, 40, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-21', 5, 52, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-05-06', 2, 55, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-25', 5, 8, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-06-04', 5, 46, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-29', 4, 15, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-09', 5, 45, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-09', 2, 12, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-08', 5, 6, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-11', 3, 27, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-15', 4, 18, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-15', 3, 28, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-10', 3, 44, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-25', 3, 50, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-14', 1, 17, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-14', 5, 52, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-26', 4, 16, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-31', 5, 28, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-30', 4, 57, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-23', 3, 49, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-14', 4, 46, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-08', 1, 54, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-27', 3, 37, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-25', 2, 16, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-21', 1, 3, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-29', 2, 31, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-14', 4, 14, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-04-12', 5, 15, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-13', 4, 39, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-26', 5, 51, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-14', 5, 22, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-26', 3, 14, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-04-24', 3, 37, 'emoreg@bandcamp.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-04', 4, 2, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-13', 5, 30, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-04-30', 4, 18, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-17', 4, 56, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-10-30', 1, 45, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-02-18', 2, 50, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-26', 4, 3, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-07', 5, 41, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-09', 2, 9, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-08-27', 4, 48, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-29', 3, 20, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-09', 5, 49, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-27', 1, 57, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-02', 3, 38, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-02', 2, 38, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-19', 3, 38, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-02', 1, 52, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-12', 4, 49, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-27', 4, 44, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-27', 4, 11, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-24', 5, 30, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-11', 4, 54, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-19', 5, 8, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-04-09', 3, 48, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-10', 3, 47, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-27', 1, 45, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-05', 5, 26, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-09', 5, 42, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-03', 1, 10, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-21', 5, 27, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-02-10', 3, 28, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-16', 1, 38, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-01', 5, 4, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-31', 1, 23, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-29', 3, 52, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-10', 1, 43, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-27', 2, 17, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-20', 3, 37, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-21', 1, 15, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-21', 1, 17, 'lchestertonz@drupal.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-28', 3, 15, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-24', 5, 4, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-10', 5, 17, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-01', 2, 51, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-12', 3, 12, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-18', 4, 33, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-04', 3, 44, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-11', 4, 47, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-16', 3, 22, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-11', 1, 42, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-22', 3, 25, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-03', 2, 53, 'gcumberlidge17@google.pl');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-17', 1, 36, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-08', 4, 15, 'emoreg@bandcamp.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-27', 5, 6, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-12-13', 4, 8, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-25', 2, 27, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-01', 1, 49, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-11', 3, 7, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-24', 1, 40, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-06', 1, 45, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-07-12', 4, 53, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-13', 4, 37, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-01', 4, 34, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-21', 1, 42, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-07-07', 5, 41, 'shamson16@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-02', 5, 11, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-18', 3, 26, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-02-07', 2, 22, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-21', 1, 40, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-22', 5, 25, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-30', 5, 7, 'lgaudin13@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-28', 4, 27, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-06-23', 4, 11, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-27', 4, 50, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-07', 2, 55, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-15', 3, 26, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-10', 5, 16, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-06', 4, 14, 'emoreg@bandcamp.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-27', 3, 13, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-05-01', 3, 31, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-22', 3, 36, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-21', 4, 36, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-10', 5, 8, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-17', 1, 3, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-02-25', 1, 43, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-30', 1, 9, 'ffriedank1c@example.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-04', 3, 12, 'vmorpethm@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-08', 4, 8, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-24', 5, 27, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-24', 4, 16, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-14', 2, 9, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-27', 4, 49, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-14', 3, 31, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-26', 4, 37, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-02', 5, 21, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-28', 1, 52, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-16', 4, 28, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-04', 2, 3, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-23', 5, 10, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-19', 5, 21, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-11-13', 5, 7, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-28', 4, 6, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-23', 4, 52, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-12', 3, 8, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-04-24', 1, 22, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-12', 3, 55, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-25', 2, 21, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-27', 4, 53, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-06', 1, 24, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-24', 2, 2, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-22', 4, 13, 'bguillouu@surveymonkey.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-02', 3, 37, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-14', 5, 3, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-02-20', 1, 2, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-20', 5, 9, 'pcunde10@oakley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-19', 2, 42, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-05-03', 5, 32, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-22', 2, 3, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-10-11', 1, 10, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-03-20', 4, 52, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-01-06', 5, 3, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-02-18', 2, 49, 'ftrappe9@ezinearticles.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-22', 2, 33, 'mbrisleny@networksolutions.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-15', 4, 47, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-03-25', 4, 18, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-05-31', 2, 50, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-07', 3, 42, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-23', 5, 40, 'wmeigh3@aol.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-30', 5, 28, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-23', 4, 9, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-05-08', 4, 14, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-01-29', 5, 5, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-26', 5, 22, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-05', 3, 48, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-02-11', 3, 21, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-20', 3, 35, 'rchaperlingo@scribd.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-19', 3, 6, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-08', 4, 51, 'dnovik0@ebay.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-11-04', 5, 39, 'lblackettt@ifeng.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-26', 5, 43, 'aromeril2@fotki.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-06-24', 4, 34, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-18', 2, 47, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-12-08', 5, 32, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-24', 3, 57, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-02', 1, 20, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-07', 1, 17, 'dcornelisseh@time.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-12-19', 4, 20, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-07-26', 2, 33, 'gchrispin19@umich.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-11-12', 1, 51, 'estrikerv@wikia.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-03-04', 3, 22, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-08-02', 1, 42, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-20', 1, 28, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-09-16', 1, 55, 'hnorthropk@paginegialle.it');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-06-12', 5, 21, 'kbarnabyb@barnesandnoble.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-08-27', 4, 25, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-02-08', 1, 18, 'amcclean5@nymag.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-08', 3, 18, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-11-25', 5, 18, 'sconan6@linkedin.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-21', 4, 2, 'eortzena@wiley.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-11', 5, 10, 'hbrooksbanke@mtv.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-08-22', 1, 7, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-06-09', 2, 14, 'snovikl@theglobeandmail.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-08-25', 2, 25, 'shabblef@yellowpages.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-10-11', 3, 32, 'dbarthrupc@canalblog.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-04-17', 5, 13, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-06-06', 4, 44, 'nnockalls8@hibu.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-03', 2, 10, 'jtuveyi@redcross.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-01-28', 1, 3, 'hmenlowd@nhs.uk');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-09-22', 2, 54, 'fwhatmoughn@bing.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-11-06', 5, 20, 'aperigeaux1a@indiatimes.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-03-04', 4, 39, 'mshird7@infoseek.co.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2022-09-24', 4, 45, 'gfairbairnw@shop-pro.jp');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-05-21', 4, 36, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-15', 5, 57, 'cspaingowerr@noaa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-19', 2, 45, 'jhurworth11@php.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-10-27', 1, 11, 'jwinchcomb14@admin.ch');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-18', 5, 7, 'ealcottx@seesaa.net');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-01-21', 1, 44, 'snestoruks@wisc.edu');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-11-18', 2, 32, 'mboogp@whitehouse.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-25', 3, 42, 'jgaskinsj@cnn.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-04-16', 2, 44, 'mhum1b@nasa.gov');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-08-11', 2, 33, 'akittle15@blogspot.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-07-18', 2, 26, 'atoquet12@army.mil');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2020-03-28', 3, 14, 'oyukhin4@meetup.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-12-24', 1, 17, 'pprestie1d@joomla.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2024-04-23', 1, 4, 'cdingsdale18@wordpress.org');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2021-07-12', 2, 28, 'gtretter1@squidoo.com');
INSERT INTO pedidos (fecha, unidades, producto, cliente) VALUES ('2023-01-20', 1, 2, 'mbrisleny@networksolutions.com');
-- --------------------------------------------------------