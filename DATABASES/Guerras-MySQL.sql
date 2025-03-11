-- Creación de la base de datos  
DROP DATABASE IF EXISTS intergalactic_db;  
CREATE DATABASE intergalactic_db;  
USE intergalactic_db; 

-- Tabla 'Planetas'
 -- 'planeta_id' es la clave principal y autoincremental.
 -- 'nombre' es un campo único y no nulo.
 -- 'tipo' es un enum que puede tomar valores 'Gaseoso', 'Rocoso', 'Helado', o 'Desértico'.
 -- 'habitabilidad' es un enum que puede tomar valores 'Alta', 'Media', o 'Baja'.
 -- 'tiene_anillos' es un booleano que indica si el planeta tiene anillos o no. Por defecto, se establece en FALSE.
CREATE TABLE Planetas (
    planeta_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    tipo ENUM('Gaseoso', 'Rocoso', 'Helado', 'Desértico'),
    habitabilidad ENUM('Alta', 'Media', 'Baja'),
    tiene_anillos BOOLEAN DEFAULT FALSE
);

-- Tabla 'Especies'
 -- 'especie_id' es la clave principal y autoincremental.
 -- 'nombre' es un campo único y no nulo.
 -- 'planeta_origen_id' es una clave foránea que referencia la columna 'planeta_id' de la tabla 'Planetas'.
 -- 'nivel_inteligencia' es un número entero entre 1 y 10 que indica el nivel de inteligencia de la especie.
 -- 'agresividad' es un número entero entre 1 y 10 que indica la agresividad de la especie.
 -- Las restricciones de la columna 'nivel_inteligencia' y 'agresividad' garantizan que el valor sea un número entre 1 y 10 que indica la agresividad de la especie.
CREATE TABLE Especies (
    especie_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    planeta_origen_id INT,
    nivel_inteligencia INT CHECK (nivel_inteligencia BETWEEN 1 AND 10),
    agresividad INT CHECK (agresividad BETWEEN 1 AND 10),
    FOREIGN KEY (planeta_origen_id) REFERENCES Planetas(planeta_id)
);

-- Tabla 'Tecnologias'
 -- 'tecnologia_id' es la clave principal y autoincremental.
 -- 'nombre' es un campo único y no nulo.
 -- 'especie_id' es una clave foránea que referencia la columna 'especie_id' de la tabla 'Especies'.
 -- 'tipo' es un enum que puede tomar valores 'Armamento', 'Energía', 'Transporte', o 'Comunicación'.
 -- 'impacto' es un enum que puede tomar valores 'Galáctico', 'Local', o 'Interdimensional'.
 -- Las restricciones de la columna 'impacto' garantizan que el valor sea un enum que puede tomar valores 'Galáctico', 'Local', o 'Interdimensional'.
CREATE TABLE Tecnologias (
    tecnologia_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    especie_id INT,
    tipo ENUM('Armamento', 'Energía', 'Transporte', 'Comunicación'),
    impacto ENUM('Galáctico', 'Local', 'Interdimensional'),
    FOREIGN KEY (especie_id) REFERENCES Especies(especie_id)
);
-- Tabla 'ViajesEspaciales'
 -- 'viaje_id' es la clave principal y autoincremental.
 -- 'especie_id' es una clave foránea que referencia la columna 'especie_id' de la tabla 'Especies'.
 -- 'planeta_destino_id' es una clave foránea que referencia la columna 'planeta_id' de la tabla 'Planetas'.
 -- 'fecha' es una fecha no nula que indica la fecha del viaje.
 -- 'proposito' es un enum que puede tomar valores 'Colonización', 'Diplomacia', 'Guerra', o 'Exploración'.
 -- Las restricciones de la columna 'proposito' garantizan que el valor sea un enum que puede tomar valores 'Colonización', 'Diplomacia', 'Guerra', o 'Exploración'.
CREATE TABLE ViajesEspaciales (
    viaje_id INT PRIMARY KEY AUTO_INCREMENT,
    especie_id INT,
    planeta_destino_id INT,
    fecha DATE,
    proposito ENUM('Colonización', 'Diplomacia', 'Guerra', 'Exploración'),
    FOREIGN KEY (especie_id) REFERENCES Especies(especie_id),
    FOREIGN KEY (planeta_destino_id) REFERENCES Planetas(planeta_id)
);-- Creación de la base de datos
DROP DATABASE IF EXISTS intergalactic_db;
CREATE DATABASE intergalactic_db;
USE intergalactic_db;

-- Tabla 'Planetas'
 -- 'planeta_id' es la clave principal y autoincremental.
 -- 'nombre' es un campo único y no nulo.
 -- 'tipo' es un enum que puede tomar valores 'Gaseoso', 'Rocoso', 'Helado', o 'Desértico'.
 -- 'habitabilidad' es un enum que puede tomar valores 'Alta', 'Media', o 'Baja'.
 -- 'tiene_anillos' es un booleano que indica si el planeta tiene anillos o no. Por defecto, se establece en FALSE.
CREATE TABLE Planetas (
    planeta_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    tipo ENUM('Gaseoso', 'Rocoso', 'Helado', 'Desértico'),
    habitabilidad ENUM('Alta', 'Media', 'Baja'),
    tiene_anillos BOOLEAN DEFAULT FALSE
);

-- Tabla 'Especies'
 -- 'especie_id' es la clave principal y autoincremental.
 -- 'nombre' es un campo único y no nulo.
 -- 'planeta_origen_id' es una clave foránea que referencia la columna 'planeta_id' de la tabla 'Planetas'.
 -- 'nivel_inteligencia' es un número entero entre 1 y 10 que indica el nivel de inteligencia de la especie.
 -- 'agresividad' es un número entero entre 1 y 10 que indica la agresividad de la especie.
 -- Las restricciones de la columna 'nivel_inteligencia' y 'agresividad' garantizan que el valor sea un número entre 1 y 10 que indica la agresividad de la especie.
CREATE TABLE Especies (
    especie_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    planeta_origen_id INT,
    nivel_inteligencia INT CHECK (nivel_inteligencia BETWEEN 1 AND 10),
    agresividad INT CHECK (agresividad BETWEEN 1 AND 10),
    FOREIGN KEY (planeta_origen_id) REFERENCES Planetas(planeta_id)
);

-- Tabla 'Tecnologias'
 -- 'tecnologia_id' es la clave principal y autoincremental.
 -- 'nombre' es un campo único y no nulo.
 -- 'especie_id' es una clave foránea que referencia la columna 'especie_id' de la tabla 'Especies'.
 -- 'tipo' es un enum que puede tomar valores 'Armamento', 'Energía', 'Transporte', o 'Comunicación'.
 -- 'impacto' es un enum que puede tomar valores 'Galáctico', 'Local', o 'Interdimensional'.
 -- Las restricciones de la columna 'impacto' garantizan que el valor sea un enum que puede tomar valores 'Galáctico', 'Local', o 'Interdimensional'.
CREATE TABLE Tecnologias (
    tecnologia_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    especie_id INT,
    tipo ENUM('Armamento', 'Energía', 'Transporte', 'Comunicación'),
    impacto ENUM('Galáctico', 'Local', 'Interdimensional'),
    FOREIGN KEY (especie_id) REFERENCES Especies(especie_id)
);
-- Tabla 'ViajesEspaciales'
 -- 'viaje_id' es la clave principal y autoincremental.
 -- 'especie_id' es una clave foránea que referencia la columna 'especie_id' de la tabla 'Especies'.
 -- 'planeta_destino_id' es una clave foránea que referencia la columna 'planeta_id' de la tabla 'Planetas'.
 -- 'fecha' es una fecha no nula que indica la fecha del viaje.
 -- 'proposito' es un enum que puede tomar valores 'Colonización', 'Diplomacia', 'Guerra', o 'Exploración'.
 -- Las restricciones de la columna 'proposito' garantizan que el valor sea un enum que puede tomar valores 'Colonización', 'Diplomacia', 'Guerra', o 'Exploración'.
CREATE TABLE ViajesEspaciales (
    viaje_id INT PRIMARY KEY AUTO_INCREMENT,
    especie_id INT,
    planeta_destino_id INT,
    fecha DATE,
    proposito ENUM('Colonización', 'Diplomacia', 'Guerra', 'Exploración'),
    FOREIGN KEY (especie_id) REFERENCES Especies(especie_id),
    FOREIGN KEY (planeta_destino_id) REFERENCES Planetas(planeta_id)
);

-- INSERCIONES DE DATOS

-- 20 nuevos Planetas
INSERT INTO Planetas (nombre, tipo, habitabilidad, tiene_anillos) VALUES
('Zentar-5', 'Gaseoso', 'Baja', TRUE),
('Ophidion', 'Rocoso', 'Alta', FALSE),
('Velkar Prime', 'Volcánico', 'Media', FALSE),
('Hades-9', 'Desértico', 'Baja', TRUE),
('Xyphar', 'Helado', 'Alta', FALSE),
('Titanus', 'Rocoso', 'Media', TRUE),
('Vespera', 'Gaseoso', 'Alta', FALSE),
('Draxos', 'Volcánico', 'Baja', TRUE),
('Eon', 'Rocoso', 'Alta', TRUE),
('Sirius-B', 'Gaseoso', 'Media', FALSE),
('Lunaris', 'Rocoso', 'Alta', FALSE),
('Morvath', 'Helado', 'Baja', TRUE),
('Zephyria', 'Desértico', 'Media', FALSE),
('Thanatos', 'Volcánico', 'Baja', TRUE),
('Icarion', 'Rocoso', 'Alta', FALSE),
('Drathis', 'Gaseoso', 'Media', TRUE),
('Kryos', 'Helado', 'Alta', FALSE),
('Oblivion', 'Rocoso', 'Baja', TRUE),
('Omicron-7', 'Desértico', 'Media', FALSE),
('Solstice', 'Rocoso', 'Alta', TRUE);

-- 20 nuevas Especies
INSERT INTO Especies (nombre, planeta_origen_id, nivel_inteligencia, agresividad) VALUES
('Zentarianos', 14, 5, 6),
('Ophidianos', 15, 8, 3),
('Velkarianos', 16, 6, 7),
('Hadeanos', 17, 4, 8),
('Xypharianos', 18, 9, 4),
('Titanianos', 19, 7, 5),
('Vesperanos', 20, 9, 3),
('Draxianos', 21, 5, 7),
('Eonitas', 22, 8, 4),
('Siriusianos', 23, 6, 5),
('Lunaritas', 24, 9, 3),
('Morvathianos', 25, 5, 6),
('Zephyrianos', 26, 7, 4),
('Thanatonianos', 27, 4, 9),
('Icarionitas', 28, 8, 3),
('Drathianos', 29, 6, 7),
('Kryonitas', 30, 9, 2),
('Oblivianos', 31, 4, 8),
('Omicronianos', 32, 6, 5),
('Solsticianos', 33, 9, 3);

-- 20 nuevas Tecnologías
INSERT INTO Tecnologias (nombre, especie_id, tipo, impacto) VALUES
('Nanoarmaduras Quánticas', 14, 'Defensa', 'Interdimensional'),
('Cañón de Fusión Solar', 15, 'Armamento', 'Galáctico'),
('Inteligencia Artificial Suprema', 16, 'Computación', 'Local'),
('Propulsor Hiperlumínico', 17, 'Transporte', 'Interdimensional'),
('Red de Energía Estelar', 18, 'Energía', 'Galáctico'),
('Generador de Agujeros de Gusano', 19, 'Transporte', 'Interdimensional'),
('Escudo de Antimateria', 20, 'Defensa', 'Galáctico'),
('Armadura de Densidad Variable', 21, 'Defensa', 'Interdimensional'),
('Interfaz Neural Total', 22, 'Computación', 'Local'),
('Satélites Autónomos de Guerra', 23, 'Armamento', 'Galáctico'),
('Armadura de Cristales Vivos', 24, 'Defensa', 'Local'),
('Resonador Cuántico', 25, 'Comunicación', 'Interdimensional'),
('Colector de Energía Oscura', 26, 'Energía', 'Galáctico'),
('Red de Defensa Orbital', 27, 'Defensa', 'Galáctico'),
('Interfaz Cibernética Total', 28, 'Computación', 'Local'),
('Sistema de Camuflaje Quántico', 29, 'Defensa', 'Interdimensional'),
('Hipercomputadora de Materia Gris', 30, 'Computación', 'Galáctico'),
('Lanzador de Partículas Subatómicas', 31, 'Armamento', 'Galáctico'),
('Unidad de Regeneración Celular', 32, 'Salud', 'Interdimensional'),
('Motor de Antigravedad', 33, 'Transporte', 'Local');

-- 20 nuevos Viajes Espaciales
INSERT INTO ViajesEspaciales (especie_id, planeta_destino_id, fecha, proposito) VALUES
(14, 15, '3055-02-12', 'Exploración'),
(15, 16, '3055-06-08', 'Colonización'),
(16, 17, '3055-09-19', 'Comercio'),
(17, 18, '3056-01-25', 'Investigación'),
(18, 19, '3056-05-30', 'Diplomacia'),
(19, 20, '3056-08-15', 'Guerra'),
(20, 21, '3057-03-10', 'Exploración'),
(21, 22, '3057-07-22', 'Investigación'),
(22, 23, '3057-12-05', 'Colonización'),
(23, 24, '3058-04-11', 'Diplomacia'),
(24, 25, '3058-09-02', 'Guerra'),
(25, 26, '3059-01-18', 'Comercio'),
(26, 27, '3059-06-29', 'Investigación'),
(27, 28, '3059-10-14', 'Exploración'),
(28, 29, '3060-02-28', 'Colonización'),
(29, 30, '3060-07-09', 'Diplomacia'),
(30, 31, '3060-11-22', 'Exploración'),
(31, 32, '3061-04-03', 'Guerra'),
(32, 33, '3061-08-15', 'Investigación'),
(33, 14, '3061-12-27', 'Colonización');

-- 20 nuevos Conflictos
INSERT INTO Conflictos (nombre, especie_1, especie_2, fecha_inicio, fecha_fin, resultado) VALUES
('Guerra de Titanus', 19, 20, '3055-03-10', '3055-08-20', 'Victoria especie 1'),
('Asedio de Xyphar', 18, 21, '3055-09-12', NULL, 'Paz forzada'),
('Rebelión de Vespera', 20, 22, '3056-05-25', '3056-12-10', 'Victoria especie 2'),
('Batalla de Omicron-7', 32, 33, '3057-06-20', '3057-11-30', 'Empate'),
('Conflicto de Drathis', 29, 30, '3058-01-15', NULL, 'Victoria especie 1'),
('Guerra de los Tres Soles', 15, 16, '3058-07-01', '3058-12-01', 'Victoria especie 2'),
('Levantamiento de Thanatos', 27, 28, '3059-04-17', NULL, 'Alianza'),
('Invasión de Solstice', 33, 14, '3060-08-15', '3060-12-20', 'Victoria especie 1'),
('Conquista de Oblivion', 31, 32, '3061-02-10', '3061-06-30', 'Victoria especie 2'),
('Guerra de los Mil Años', 17, 18, '3061-11-01', NULL, 'Indecisa');
