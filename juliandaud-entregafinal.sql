#=== PRIMERA ENTREGA ====#

CREATE DATABASE IF NOT EXISTS ecommerce_daud;
USE ecommerce_daud;

------------------------------
-- 1) Tabla Clientes
------------------------------
CREATE TABLE  clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    fecha_registro DATETIME
);

------------------------------
-- 2) Tabla Productos
------------------------------
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(120) NOT NULL,
    categoria VARCHAR(80),
    precio INT NOT NULL,
    stock INT NOT NULL,
    created_at DATETIME
);

------------------------------
-- 3) Tabla Ordenes
------------------------------
CREATE TABLE  ordenes (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_orden DATETIME,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

------------------------------
-- 4) Tabla Detalle Orden
------------------------------
CREATE TABLE IF NOT EXISTS detalle_orden (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_orden INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario INT NOT NULL,

    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

------------------------------
-- 5) Tabla Pagos
------------------------------
CREATE TABLE IF NOT EXISTS pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_orden INT NOT NULL,
    metodo_pago VARCHAR(50),
    monto INT NOT NULL,
    fecha_pago DATETIME,

    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden)
);

#==== SEGUNDA ENTREGA ====#


#== CORRECIONES ==#



ALTER TABLE clientes
ADD UNIQUE (email),
ADD COLUMN ciudad VARCHAR (100),
ADD COLUMN pais VARCHAR (100);


ALTER TABLE ordenes
ADD COLUMN total DECIMAL(10,2);


ALTER TABLE productos
MODIFY precio DECIMAL (10, 2); 

ALTER TABLE detalle_orden
MODIFY precio_unitario DECIMAL (10, 2); 

# === DATOS === #

USE ecommerce_daud;

#=== CLIENTES ===#

USE ecommerce_daud;


DESCRIBE clientes;

INSERT INTO clientes (nombre, email, fecha_registro, ciudad, pais) 
VALUES
('Raul Salvatierra','raul.salvatierra.35@gmail.com',NOW(),'Brooklyn','USA'),
('Maria Perez','maria@hotmail.com',NOW(),'Buenos Aires','Argentina'),
('Carlos Lopez','carlos@gmail.com',NOW(),'Madrid','España'),
('Gian Tenorio','gian.tenorio6@gmail.com',NOW(),'Cali','Colombia'),
('Brian Scheller','bscheller@gmail.com',NOW(),'Brooklyn','USA'),
('Juan Perez','juan.perez@gmail.com',NOW(),'Buenos Aires','Argentina'),
('Maria Gonzalez','maria.gonzalez@yahoo.com',NOW(),'Santiago','Chile'),
('Carlos Ramirez','carlos.ramirez@hotmail.com',NOW(),'Lima','Peru'),
('Ana Fernandez','ana.fernandez@gmail.com',NOW(),'Bogotá','Colombia'),
('Luis Martinez','luis.martinez@yahoo.com',NOW(),'Quito','Ecuador'),
('Sofia Lopez','sofia.lopez@hotmail.com',NOW(),'Montevideo','Uruguay'),
('Diego Sanchez','diego.sanchez@gmail.com',NOW(),'Asunción','Paraguay'),
('Camila Torres','camila.torres@yahoo.com',NOW(),'La Paz','Bolivia'),
('Jose Castillo','jose.castillo@hotmail.com',NOW(),'Caracas','Venezuela'),
('Valentina Herrera','valentina.herrera@gmail.com',NOW(),'Ciudad de Mexico','Mexico'),
('Ricardo Morales','ricardo.morales@yahoo.com',NOW(),'Guadalajara','Mexico'),
('Fernanda Diaz','fernanda.diaz@hotmail.com',NOW(),'Medellín','Colombia'),
('Gabriel Ortiz','gabriel.ortiz@gmail.com',NOW(),'Santo Domingo','Republica Dominicana'),
('Isabella Reyes','isabella.reyes@yahoo.com',NOW(),'San Juan','Puerto Rico'),
('Matias Rojas','matias.rojas@hotmail.com',NOW(),'Montevideo','Uruguay'),

('Andres Molina','andres.molina@gmail.com',NOW(),'Rosario','Argentina'),
('Lucia Benitez','lucia.benitez@yahoo.com',NOW(),'Córdoba','Argentina'),
('Pablo Aguirre','pablo.aguirre@hotmail.com',NOW(),'Mendoza','Argentina'),
('Mariana Soto','mariana.soto@gmail.com',NOW(),'La Plata','Argentina'),
('Nicolas Ibarra','nicolas.ibarra@gmail.com',NOW(),'Mar del Plata','Argentina'),
('Pedro Alvarez','pedro.alvarez@gmail.com',NOW(),'Valparaíso','Chile'),
('Daniela Fuentes','daniela.fuentes@yahoo.com',NOW(),'Concepción','Chile'),
('Sebastian Muñoz','sebastian.munoz@hotmail.com',NOW(),'Antofagasta','Chile'),
('Jorge Pineda','jorge.pineda@gmail.com',NOW(),'San Salvador','El Salvador'),
('Karen Morales','karen.morales@yahoo.com',NOW(),'Tegucigalpa','Honduras'),

('Oscar Mejia','oscar.mejia@gmail.com',NOW(),'Guatemala City','Guatemala'),
('Paola Cardenas','paola.cardenas@hotmail.com',NOW(),'Managua','Nicaragua'),
('Miguel Torres','miguel.torres@gmail.com',NOW(),'San Jose','Costa Rica'),
('Laura Jimenez','laura.jimenez@yahoo.com',NOW(),'Panama City','Panama'),
('Roberto Silva','roberto.silva@gmail.com',NOW(),'São Paulo','Brasil'),
('Fernanda Rocha','fernanda.rocha@hotmail.com',NOW(),'Rio de Janeiro','Brasil'),
('Thiago Pereira','thiago.pereira@yahoo.com',NOW(),'Curitiba','Brasil'),
('Alejandro Cruz','alejandro.cruz@gmail.com',NOW(),'Puebla','Mexico'),
('Monica Estrada','monica.estrada@hotmail.com',NOW(),'Monterrey','Mexico'),
('Hector Villalobos','hector.villalobos@yahoo.com',NOW(),'Toluca','Mexico'),

('Jonathan Miller','jonathan.miller@gmail.com',NOW(),'Queens','USA'),
('Emily Johnson','emily.johnson@yahoo.com',NOW(),'Manhattan','USA'),
('Michael Brown','michael.brown@hotmail.com',NOW(),'Bronx','USA'),
('Sarah Wilson','sarah.wilson@gmail.com',NOW(),'Jersey City','USA'),
('Kevin OConnor','kevin.oconnor@gmail.com',NOW(),'Dublin','Ireland'),
('Emma Walsh','emma.walsh@yahoo.com',NOW(),'Cork','Ireland'),
('Luca Bianchi','luca.bianchi@gmail.com',NOW(),'Milan','Italia'),
('Marco Rossi','marco.rossi@hotmail.com',NOW(),'Rome','Italia'),
('Thomas Keller','thomas.keller@gmail.com',NOW(),'Berlin','Alemania'),
('Anna Schmidt','anna.schmidt@yahoo.com',NOW(),'Hamburg','Alemania'),

('Julian Navarro','julian.navarro@gmail.com',NOW(),'Salta','Argentina'),
('Carolina Funes','carolina.funes@yahoo.com',NOW(),'San Luis','Argentina'),
('Tomas Calderon','tomas.calderon@hotmail.com',NOW(),'Neuquén','Argentina'),
('Rocio Peralta','rocio.peralta@gmail.com',NOW(),'Río Gallegos','Argentina'),
('Esteban Quiroga','esteban.quiroga@yahoo.com',NOW(),'San Miguel de Tucumán','Argentina'),
('Hernan Bustos','hernan.bustos@gmail.com',NOW(),'Iquique','Chile'),
('Natalia Araya','natalia.araya@hotmail.com',NOW(),'Rancagua','Chile'),
('Felipe Contreras','felipe.contreras@yahoo.com',NOW(),'Talca','Chile'),
('Victor Salinas','victor.salinas@gmail.com',NOW(),'Arequipa','Peru'),
('Daniela Rivas','daniela.rivas@hotmail.com',NOW(),'Trujillo','Peru'),

('Mauricio Beltran','mauricio.beltran@gmail.com',NOW(),'Cochabamba','Bolivia'),
('Paula Villarroel','paula.villarroel@yahoo.com',NOW(),'Santa Cruz','Bolivia'),
('Ivan Montenegro','ivan.montenegro@gmail.com',NOW(),'Cuenca','Ecuador'),
('Lorena Pacheco','lorena.pacheco@hotmail.com',NOW(),'Ambato','Ecuador'),
('Sergio Acosta','sergio.acosta@gmail.com',NOW(),'Barranquilla','Colombia'),
('Tatiana Mejia','tatiana.mejia@yahoo.com',NOW(),'Bucaramanga','Colombia'),
('Alberto Figueroa','alberto.figueroa@gmail.com',NOW(),'León','Mexico'),
('Renata Solis','renata.solis@hotmail.com',NOW(),'Aguascalientes','Mexico'),
('Daniel Hoffman','daniel.hoffman@gmail.com',NOW(),'Munich','Alemania'),
('Klara Weiss','klara.weiss@yahoo.com',NOW(),'Stuttgart','Alemania');

# == PRODUCTOS == #

INSERT INTO productos (nombre_producto, categoria, precio, stock, created_at) VALUES
('Vinilo "Midnight Echoes" - The Lunar Tides','Vinilo',28.00,40,'2025-01-05 10:00:00'),
('CD "Midnight Echoes" - The Lunar Tides','CD',18.00,50,'2025-01-10 11:00:00'),
('Camiseta "Midnight Echoes" - The Lunar Tides','Merchandising',22.00,80,'2025-01-15 12:00:00'),
('Pin "The Lunar Tides Logo"','Merchandising',6.00,150,'2025-01-20 13:00:00'),
('Poster "Midnight Echoes Album Art"','Poster',12.00,60,'2025-01-25 14:00:00'),

('Vinilo "Neon Shadows" - Desert Wolves','Vinilo',30.00,35,'2025-02-05 10:00:00'),
('CD "Neon Shadows" - Desert Wolves','CD',20.00,45,'2025-02-10 11:00:00'),
('Camiseta "Neon Shadows" - Desert Wolves','Merchandising',24.00,70,'2025-02-15 12:00:00'),
('Pin "Desert Wolves Logo"','Merchandising',6.50,140,'2025-02-20 13:00:00'),
('Poster "Neon Shadows Album Art"','Poster',13.00,55,'2025-02-25 14:00:00'),

('Vinilo "Crimson Horizon" - The Velvet Roads','Vinilo',32.00,30,'2025-03-05 10:00:00'),
('CD "Crimson Horizon" - The Velvet Roads','CD',21.00,40,'2025-03-10 11:00:00'),
('Camiseta "Crimson Horizon" - The Velvet Roads','Merchandising',25.00,60,'2025-03-15 12:00:00'),
('Pin "Velvet Roads Logo"','Merchandising',7.00,120,'2025-03-20 13:00:00'),
('Poster "Crimson Horizon Album Art"','Poster',14.00,50,'2025-03-25 14:00:00'),

('Vinilo "Echoes in Silence" - Midnight Signals','Vinilo',29.00,38,'2025-04-05 10:00:00'),
('CD "Echoes in Silence" - Midnight Signals','CD',19.00,48,'2025-04-10 11:00:00'),
('Camiseta "Echoes in Silence" - Midnight Signals','Merchandising',23.00,75,'2025-04-15 12:00:00'),
('Pin "Midnight Signals Logo"','Merchandising',6.50,130,'2025-04-20 13:00:00'),
('Poster "Echoes in Silence Album Art"','Poster',12.50,55,'2025-04-25 14:00:00'),

('Vinilo "Solar Flare" - Electric Alley','Vinilo',31.00,33,'2025-05-05 10:00:00'),
('CD "Solar Flare" - Electric Alley','CD',20.50,42,'2025-05-10 11:00:00'),
('Camiseta "Solar Flare" - Electric Alley','Merchandising',24.50,70,'2025-05-15 12:00:00'),
('Pin "Electric Alley Logo"','Merchandising',6.00,120,'2025-05-20 13:00:00'),
('Poster "Solar Flare Album Art"','Poster',13.00,50,'2025-05-25 14:00:00'),

('Vinilo "Obsidian Dreams" - The Hidden Frequencies','Vinilo',33.00,28,'2025-06-05 10:00:00'),
('CD "Obsidian Dreams" - The Hidden Frequencies','CD',22.00,38,'2025-06-10 11:00:00'),
('Camiseta "Obsidian Dreams" - The Hidden Frequencies','Merchandising',26.00,65,'2025-06-15 12:00:00'),
('Pin "Hidden Frequencies Logo"','Merchandising',7.50,110,'2025-06-20 13:00:00'),
('Poster "Obsidian Dreams Album Art"','Poster',14.50,45,'2025-06-25 14:00:00'),

('Vinilo "Twilight Reverie" - Scarlet Horizon','Vinilo',30.00,35,'2025-07-05 10:00:00'),
('CD "Twilight Reverie" - Scarlet Horizon','CD',20.00,45,'2025-07-10 11:00:00'),
('Camiseta "Twilight Reverie" - Scarlet Horizon','Merchandising',24.00,70,'2025-07-15 12:00:00'),
('Pin "Scarlet Horizon Logo"','Merchandising',6.50,140,'2025-07-20 13:00:00'),
('Poster "Twilight Reverie Album Art"','Poster',13.00,55,'2025-07-25 14:00:00'),

('Vinilo "Nocturnal Waves" - Phantom Roads','Vinilo',29.50,36,'2025-08-05 10:00:00'),
('CD "Nocturnal Waves" - Phantom Roads','CD',19.50,46,'2025-08-10 11:00:00'),
('Camiseta "Nocturnal Waves" - Phantom Roads','Merchandising',23.50,72,'2025-08-15 12:00:00'),
('Pin "Phantom Roads Logo"','Merchandising',6.00,130,'2025-08-20 13:00:00'),
('Poster "Nocturnal Waves Album Art"','Poster',12.50,50,'2025-08-25 14:00:00'),

('Vinilo "Crimson Echo" - Lunar Eclipse','Vinilo',32.00,30,'2025-09-05 10:00:00'),
('CD "Crimson Echo" - Lunar Eclipse','CD',21.00,40,'2025-09-10 11:00:00'),
('Camiseta "Crimson Echo" - Lunar Eclipse','Merchandising',25.00,65,'2025-09-15 12:00:00'),
('Pin "Lunar Eclipse Logo"','Merchandising',7.00,120,'2025-09-20 13:00:00'),
('Poster "Crimson Echo Album Art"','Poster',14.00,45,'2025-09-25 14:00:00'),

('Vinilo "Velvet Skies" - Aurora Fields','Vinilo',31.00,34,'2025-10-05 10:00:00'),
('CD "Velvet Skies" - Aurora Fields','CD',20.50,44,'2025-10-10 11:00:00'),
('Camiseta "Velvet Skies" - Aurora Fields','Merchandising',24.50,68,'2025-10-15 12:00:00'),
('Pin "Aurora Fields Logo"','Merchandising',6.50,125,'2025-10-20 13:00:00'),
('Poster "Velvet Skies Album Art"','Poster',13.50,52,'2025-10-25 14:00:00');


# === ORDENES === #


INSERT INTO ordenes (id_orden, id_cliente, fecha_orden, total) VALUES
(1, 5, '2025-01-01 10:00:00', 21.00),
(2, 12, '2025-01-02 11:15:00', 12.00),
(3, 7, '2025-01-03 12:30:00', 24.00),
(4, 20, '2025-01-04 13:45:00', 20.00),
(5, 3, '2025-01-05 14:00:00', 7.00),
(6, 42, '2025-01-06 15:10:00', 23.00),
(7, 18, '2025-01-07 16:20:00', 14.50),
(8, 31, '2025-01-08 17:30:00', 13.50),
(9, 50, '2025-01-09 09:45:00', 32.00),
(10, 25, '2025-01-10 10:50:00', 22.00),
(11, 8, '2025-01-11 11:05:00', 14.00),
(12, 3, '2025-01-12 12:15:00', 22.00),
(13, 17, '2025-01-13 13:25:00', 6.50),
(14, 9, '2025-01-14 14:35:00', 6.50),
(15, 60, '2025-01-15 15:45:00', 32.00),
(16, 44, '2025-01-16 16:50:00', 6.50),
(17, 6, '2025-01-17 09:00:00', 18.00),
(18, 2, '2025-01-18 10:10:00', 6.00),
(19, 12, '2025-01-19 11:20:00', 13.00),
(20, 30, '2025-01-20 12:30:00', 7.00),
(21, 11, '2025-01-21 13:40:00', 31.00),
(22, 7, '2025-01-22 14:50:00', 48.00),
(23, 21, '2025-01-23 15:00:00', 13.00),
(24, 35, '2025-01-24 16:10:00', 33.00),
(25, 19, '2025-01-25 17:20:00', 50.00),
(26, 28, '2025-01-26 09:30:00', 30.00),
(27, 14, '2025-01-27 10:40:00', 13.00),
(28, 37, '2025-01-28 11:50:00', 12.50),
(29, 6, '2025-01-29 12:00:00', 18.00),
(30, 40, '2025-01-30 13:10:00', 41.00),
(31, 22, '2025-01-31 14:20:00', 21.00),
(32, 9, '2025-02-01 15:30:00', 12.00),
(33, 18, '2025-02-02 16:40:00', 24.00),
(34, 15, '2025-02-03 17:50:00', 20.00),
(35, 7, '2025-02-04 09:00:00', 7.00),
(36, 44, '2025-02-05 10:10:00', 23.00),
(37, 33, '2025-02-06 11:20:00', 14.50),
(38, 10, '2025-02-07 12:30:00', 13.50),
(39, 55, '2025-02-08 13:40:00', 32.00),
(40, 12, '2025-02-09 14:50:00', 22.00),
(41, 5, '2025-02-10 15:00:00', 14.00),
(42, 8, '2025-02-11 16:10:00', 22.00),
(43, 17, '2025-02-12 17:20:00', 6.50),
(44, 1, '2025-02-13 09:30:00', 6.50),
(45, 60, '2025-02-14 10:40:00', 32.00),
(46, 44, '2025-02-15 11:50:00', 6.50),
(47, 6, '2025-02-16 12:00:00', 18.00),
(48, 2, '2025-02-17 13:10:00', 6.00),
(49, 12, '2025-02-18 14:20:00', 13.00),
(50, 30, '2025-02-19 15:30:00', 7.00),
(51, 11, '2025-02-20 16:40:00', 31.00),
(52, 7, '2025-02-21 17:50:00', 48.00),
(53, 21, '2025-02-22 09:00:00', 13.00),
(54, 35, '2025-02-23 10:10:00', 33.00),
(55, 19, '2025-02-24 11:20:00', 50.00),
(56, 28, '2025-02-25 12:30:00', 30.00),
(57, 14, '2025-02-26 13:40:00', 13.00),
(58, 37, '2025-02-27 14:50:00', 12.50),
(59, 6, '2025-02-28 15:00:00', 18.00),
(60, 40, '2025-03-01 16:10:00', 41.00),
(61, 23, '2025-03-02 17:20:00', 21.00),
(62, 16, '2025-03-03 09:30:00', 12.00),
(63, 38, '2025-03-04 10:40:00', 24.00),
(64, 9, '2025-03-05 11:50:00', 20.00),
(65, 51, '2025-03-06 12:00:00', 7.00),
(66, 41, '2025-03-07 13:10:00', 23.00),
(67, 36, '2025-03-08 14:20:00', 14.50),
(68, 15, '2025-03-09 15:30:00', 13.50),
(69, 58, '2025-03-10 16:40:00', 32.00),
(70, 20, '2025-03-11 17:50:00', 22.00),
(71, 7, '2025-03-12 09:00:00', 14.00),
(72, 34, '2025-03-13 10:10:00', 22.00),
(73, 10, '2025-03-14 11:20:00', 6.50),
(74, 5, '2025-03-15 12:30:00', 6.50),
(75, 19, '2025-03-16 13:40:00', 32.00),
(76, 46, '2025-03-17 14:50:00', 6.50),
(77, 3, '2025-03-18 15:00:00', 18.00),
(78, 9, '2025-03-19 16:10:00', 6.00),
(79, 11, '2025-03-20 17:20:00', 13.00),
(80, 38, '2025-03-21 09:30:00', 7.00),
(81, 25, '2025-03-22 10:40:00', 31.00),
(82, 8, '2025-03-23 11:50:00', 48.00),
(83, 21, '2025-03-24 12:00:00', 13.00),
(84, 35, '2025-03-25 13:10:00', 33.00),
(85, 19, '2025-03-26 14:20:00', 50.00),
(86, 28, '2025-03-27 15:30:00', 30.00),
(87, 14, '2025-03-28 16:40:00', 13.00),
(88, 37, '2025-03-29 17:50:00', 12.50),
(89, 6, '2025-03-30 09:00:00', 18.00),
(90, 40, '2025-03-31 10:10:00', 41.00),
(91, 22, '2025-04-01 11:20:00', 21.00),
(92, 16, '2025-04-02 12:30:00', 12.00),
(93, 38, '2025-04-03 13:40:00', 24.00),
(94, 12, '2025-04-04 14:50:00', 40.00),
(95, 51, '2025-04-05 15:00:00', 7.00),
(96, 41, '2025-04-06 16:10:00', 69.00),
(97, 36, '2025-04-07 17:20:00', 14.50),
(98, 15, '2025-04-08 09:30:00', 13.50),
(99, 58, '2025-04-09 10:40:00', 32.00),
(100, 20, '2025-04-10 11:50:00', 22.00),
(101, 7, '2025-04-11 12:00:00', 28.00),
(102, 34, '2025-04-12 13:10:00', 22.00),
(103, 10, '2025-04-13 14:20:00', 24.00),
(104, 5, '2025-04-14 15:30:00', 40.00),
(105, 19, '2025-04-15 16:40:00', 7.00),
(106, 28, '2025-04-16 17:50:00', 69.00),
(107, 14, '2025-04-17 09:00:00', 14.50),
(108, 37, '2025-04-18 10:10:00', 13.50),
(109, 6, '2025-04-19 11:20:00', 32.00),
(110, 40, '2025-04-20 12:30:00', 22.00),
(111, 22, '2025-04-21 13:40:00', 28.00),
(112, 16, '2025-04-22 14:50:00', 22.00),
(113, 38, '2025-04-23 15:00:00', 6.50),
(114, 12, '2025-04-24 16:10:00', 6.50),
(115, 51, '2025-04-25 17:20:00', 32.00);








# == DETALLE ORDEN == #

INSERT INTO detalle_orden (id_orden, id_producto, cantidad, precio_unitario) VALUES
(1, 12, 1, 21.00),
(2, 5, 1, 12.00),
(3, 33, 1, 24.00),
(4, 7, 1, 20.00),
(5, 44, 1, 7.00),
(6, 18, 1, 23.00),
(7, 29, 1, 14.50),
(8, 50, 1, 13.50),
(9, 11, 1, 32.00),
(10, 3, 1, 22.00),
(11, 15, 1, 14.00),
(12, 27, 1, 22.00),
(13, 34, 1, 6.50),
(14, 9, 1, 6.50),
(15, 41, 1, 32.00),
(16, 48, 1, 6.50),
(17, 2, 1, 18.00),
(18, 39, 1, 6.00),
(19, 25, 1, 13.00),
(20, 14, 1, 7.00),
(21, 21, 1, 31.00),
(22, 8, 2, 24.00),
(22, 3, 1, 22.00),
(23, 19, 2, 6.50),
(23, 17, 1, 19.00),
(24, 26, 1, 33.00),
(25, 13, 2, 25.00),
(25, 5, 1, 12.00),
(26, 31, 1, 30.00),
(27, 9, 2, 6.50),
(27, 36, 1, 29.50),
(28, 40, 1, 12.50),
(29, 2, 1, 18.00),
(30, 22, 2, 20.50),
(30, 18, 1, 23.00),
(31, 12, 1, 21.00),
(32, 5, 1, 12.00),
(33, 33, 1, 24.00),
(34, 7, 1, 20.00),
(35, 44, 1, 7.00),
(36, 18, 1, 23.00),
(37, 29, 1, 14.50),
(38, 50, 1, 13.50),
(39, 11, 1, 32.00),
(40, 3, 1, 22.00),
(41, 15, 1, 14.00),
(42, 27, 1, 22.00),
(43, 34, 1, 6.50),
(44, 9, 1, 6.50),
(45, 41, 1, 32.00),
(46, 48, 1, 6.50),
(47, 2, 1, 18.00),
(48, 39, 1, 6.00),
(49, 25, 1, 13.00),
(50, 14, 1, 7.00),
(51, 21, 1, 31.00),
(52, 8, 2, 24.00),
(52, 3, 1, 22.00),
(53, 19, 2, 6.50),
(53, 17, 1, 19.00),
(54, 26, 1, 33.00),
(55, 13, 2, 25.00),
(55, 5, 1, 12.00),
(56, 31, 1, 30.00),
(57, 9, 2, 6.50),
(57, 36, 1, 29.50),
(58, 40, 1, 12.50),
(59, 2, 1, 18.00),
(60, 22, 2, 20.50),
(60, 18, 1, 23.00),
(61, 12, 1, 21.00),
(62, 5, 1, 12.00),
(63, 33, 1, 24.00),
(64, 7, 1, 20.00),
(65, 44, 1, 7.00),
(66, 18, 1, 23.00),
(67, 29, 1, 14.50),
(68, 50, 1, 13.50),
(69, 11, 1, 32.00),
(70, 3, 1, 22.00),
(71, 15, 1, 14.00),
(72, 27, 1, 22.00),
(73, 34, 1, 6.50),
(74, 9, 1, 6.50),
(75, 41, 1, 32.00),
(76, 48, 1, 6.50),
(77, 2, 1, 18.00),
(78, 39, 1, 6.00),
(79, 25, 1, 13.00),
(80, 14, 1, 7.00),
(81, 21, 1, 31.00),
(82, 8, 2, 24.00),
(82, 3, 1, 22.00),
(83, 19, 2, 6.50),
(83, 17, 1, 19.00),
(84, 26, 1, 33.00),
(85, 13, 2, 25.00),
(85, 5, 1, 12.00),
(86, 31, 1, 30.00),
(87, 9, 2, 6.50),
(87, 36, 1, 29.50),
(88, 40, 1, 12.50),
(89, 2, 1, 18.00),
(90, 22, 2, 20.50),
(90, 18, 1, 23.00),
(91, 12, 1, 21.00),
(92, 5, 1, 12.00),
(93, 33, 1, 24.00),
(94, 7, 1, 20.00),
(95, 44, 1, 7.00),
(96, 18, 1, 23.00),
(97, 29, 1, 14.50),
(98, 50, 1, 13.50),
(99, 11, 1, 32.00),
(100, 3, 1, 22.00),
(101, 12, 1, 21.00),
(102, 5, 1, 12.00),
(103, 33, 1, 24.00),
(104, 7, 2, 20.00),
(104, 20, 1, 7.00),
(105, 44, 1, 7.00),
(106, 18, 3, 23.00),
(107, 29, 1, 14.50),
(108, 50, 1, 13.50),
(109, 11, 1, 32.00),
(110, 3, 1, 22.00),
(111, 15, 2, 14.00),
(112, 27, 1, 22.00),
(113, 34, 1, 6.50),
(114, 9, 1, 6.50),
(115, 41, 1, 32.00);




# === PAGOS === # 

INSERT INTO pagos (id_orden, metodo_pago, monto, fecha_pago, estado_pago) VALUES
(1, 'Zelle', 21.00, '2025-01-02 10:00:00', 'Pagado'),
(2, 'Tarjeta', 12.00, '2025-01-03 11:15:00', 'Pagado'),
(3, 'Venmo', 24.00, '2025-01-04 12:30:00', 'Pendiente'),
(4, 'Paypal', 20.00, '2025-01-05 13:45:00', 'Pagado'),
(5, 'Zelle', 7.00, '2025-01-06 14:00:00', 'Pagado'),
(6, 'Tarjeta', 23.00, '2025-01-07 15:10:00', 'Pagado'),
(7, 'Venmo', 14.50, '2025-01-08 16:20:00', 'Pendiente'),
(8, 'Paypal', 13.50, '2025-01-09 17:30:00', 'Pagado'),
(9, 'Zelle', 32.00, '2025-01-10 09:45:00', 'Pagado'),
(10, 'Tarjeta', 22.00, '2025-01-11 10:50:00', 'Pagado'),
(11, 'Venmo', 14.00, '2025-01-12 11:05:00', 'Pagado'),
(12, 'Paypal', 22.00, '2025-01-13 12:15:00', 'Pendiente'),
(13, 'Zelle', 6.50, '2025-01-14 13:25:00', 'Pagado'),
(14, 'Tarjeta', 6.50, '2025-01-15 14:35:00', 'Pagado'),
(15, 'Venmo', 32.00, '2025-01-16 15:45:00', 'Pagado'),
(16, 'Paypal', 6.50, '2025-01-17 16:50:00', 'Pendiente'),
(17, 'Zelle', 18.00, '2025-01-18 09:00:00', 'Pagado'),
(18, 'Tarjeta', 6.00, '2025-01-19 10:10:00', 'Pagado'),
(19, 'Venmo', 13.00, '2025-01-20 11:20:00', 'Pagado'),
(20, 'Paypal', 7.00, '2025-01-21 12:30:00', 'Pagado'),
(21, 'Zelle', 31.00, '2025-01-22 13:40:00', 'Pagado'),
(22, 'Tarjeta', 48.00, '2025-01-23 14:50:00', 'Pagado'),
(23, 'Venmo', 13.00, '2025-01-24 15:00:00', 'Pagado'),
(24, 'Paypal', 33.00, '2025-01-25 16:10:00', 'Pagado'),
(25, 'Zelle', 50.00, '2025-01-26 17:20:00', 'Pagado'),
(26, 'Tarjeta', 30.00, '2025-01-27 09:30:00', 'Pagado'),
(27, 'Venmo', 13.00, '2025-01-28 10:40:00', 'Pagado'),
(28, 'Paypal', 12.50, '2025-01-29 11:50:00', 'Pendiente'),
(29, 'Zelle', 18.00, '2025-01-30 12:00:00', 'Pagado'),
(30, 'Tarjeta', 41.00, '2025-01-31 13:10:00', 'Pagado'),
(31, 'Venmo', 21.00, '2025-02-01 14:20:00', 'Pagado'),
(32, 'Paypal', 12.00, '2025-02-02 15:30:00', 'Pagado'),
(33, 'Zelle', 24.00, '2025-02-03 16:40:00', 'Pendiente'),
(34, 'Tarjeta', 20.00, '2025-02-04 17:50:00', 'Pagado'),
(35, 'Venmo', 7.00, '2025-02-05 09:00:00', 'Pagado'),
(36, 'Paypal', 23.00, '2025-02-06 10:10:00', 'Pagado'),
(37, 'Zelle', 14.50, '2025-02-07 11:20:00', 'Pagado'),
(38, 'Tarjeta', 13.50, '2025-02-08 12:30:00', 'Pendiente'),
(39, 'Venmo', 32.00, '2025-02-09 13:40:00', 'Pagado'),
(40, 'Paypal', 22.00, '2025-02-10 14:50:00', 'Pagado'),
(41, 'Zelle', 14.00, '2025-02-11 15:00:00', 'Pagado'),
(42, 'Tarjeta', 22.00, '2025-02-12 16:10:00', 'Pagado'),
(43, 'Venmo', 6.50, '2025-02-13 17:20:00', 'Pagado'),
(44, 'Paypal', 6.50, '2025-02-14 09:30:00', 'Pagado'),
(45, 'Zelle', 32.00, '2025-02-15 10:40:00', 'Pagado'),
(46, 'Tarjeta', 6.50, '2025-02-16 11:50:00', 'Pendiente'),
(47, 'Venmo', 18.00, '2025-02-17 12:00:00', 'Pagado'),
(48, 'Paypal', 6.00, '2025-02-18 13:10:00', 'Pagado'),
(49, 'Zelle', 13.00, '2025-02-19 14:20:00', 'Pagado'),
(50, 'Tarjeta', 7.00, '2025-02-20 15:30:00', 'Pagado'),
(51, 'Venmo', 31.00, '2025-02-21 16:40:00', 'Pagado'),
(52, 'Paypal', 48.00, '2025-02-22 17:50:00', 'Pagado'),
(53, 'Zelle', 13.00, '2025-02-23 09:00:00', 'Pagado'),
(54, 'Tarjeta', 33.00, '2025-02-24 10:10:00', 'Pagado'),
(55, 'Venmo', 50.00, '2025-02-25 11:20:00', 'Pagado'),
(56, 'Paypal', 30.00, '2025-02-26 12:30:00', 'Pagado'),
(57, 'Zelle', 13.00, '2025-02-27 13:40:00', 'Pagado'),
(58, 'Tarjeta', 12.50, '2025-02-28 14:50:00', 'Pendiente'),
(59, 'Venmo', 18.00, '2025-03-01 15:00:00', 'Pagado'),
(60, 'Paypal', 41.00, '2025-03-02 16:10:00', 'Pagado'),
(61, 'Zelle', 21.00, '2025-03-03 17:20:00', 'Pagado'),
(62, 'Tarjeta', 12.00, '2025-03-04 09:30:00', 'Pagado'),
(63, 'Venmo', 24.00, '2025-03-05 10:40:00', 'Pendiente'),
(64, 'Paypal', 20.00, '2025-03-06 11:50:00', 'Pagado'),
(65, 'Zelle', 7.00, '2025-03-07 12:00:00', 'Pagado'),
(66, 'Tarjeta', 23.00, '2025-03-08 13:10:00', 'Pagado'),
(67, 'Venmo', 14.50, '2025-03-09 14:20:00', 'Pagado'),
(68, 'Paypal', 13.50, '2025-03-10 15:30:00', 'Pendiente'),
(69, 'Zelle', 32.00, '2025-03-11 16:40:00', 'Pagado'),
(70, 'Tarjeta', 22.00, '2025-03-12 17:50:00', 'Pagado'),
(71, 'Venmo', 14.00, '2025-03-13 09:00:00', 'Pagado'),
(72, 'Paypal', 22.00, '2025-03-14 10:10:00', 'Pagado'),
(73, 'Zelle', 6.50, '2025-03-15 11:20:00', 'Pagado'),
(74, 'Tarjeta', 6.50, '2025-03-16 12:30:00', 'Pagado'),
(75, 'Venmo', 32.00, '2025-03-17 13:40:00', 'Pagado'),
(76, 'Paypal', 6.50, '2025-03-18 14:50:00', 'Pendiente'),
(77, 'Zelle', 18.00, '2025-03-19 15:00:00', 'Pagado'),
(78, 'Tarjeta', 6.00, '2025-03-20 16:10:00', 'Pagado'),
(79, 'Venmo', 13.00, '2025-03-21 17:20:00', 'Pagado'),
(80, 'Paypal', 7.00, '2025-03-22 09:30:00', 'Pagado'),
(81, 'Zelle', 31.00, '2025-03-23 10:40:00', 'Pagado'),
(82, 'Tarjeta', 48.00, '2025-03-24 11:50:00', 'Pagado'),
(83, 'Venmo', 13.00, '2025-03-25 12:00:00', 'Pagado'),
(84, 'Paypal', 33.00, '2025-03-26 13:10:00', 'Pagado'),
(85, 'Zelle', 50.00, '2025-03-27 14:20:00', 'Pagado'),
(86, 'Tarjeta', 30.00, '2025-03-28 15:30:00', 'Pagado'),
(87, 'Venmo', 13.00, '2025-03-29 16:40:00', 'Pagado'),
(88, 'Paypal', 12.50, '2025-03-30 17:50:00', 'Pendiente'),
(89, 'Zelle', 18.00, '2025-03-31 09:00:00', 'Pagado'),
(90, 'Tarjeta', 41.00, '2025-04-01 10:10:00', 'Pagado'),
(91, 'Venmo', 21.00, '2025-04-02 11:20:00', 'Pagado'),
(92, 'Paypal', 12.00, '2025-04-03 12:30:00', 'Pagado'),
(93, 'Zelle', 24.00, '2025-04-04 13:40:00', 'Pendiente'),
(94, 'Tarjeta', 40.00, '2025-04-05 14:50:00', 'Pagado'),
(95, 'Venmo', 7.00, '2025-04-06 15:00:00', 'Pagado'),
(96, 'Paypal', 69.00, '2025-04-07 16:10:00', 'Pagado'),
(97, 'Zelle', 14.50, '2025-04-08 17:20:00', 'Pagado'),
(98, 'Tarjeta', 13.50, '2025-04-09 09:30:00', 'Pendiente'),
(99, 'Venmo', 32.00, '2025-04-10 10:40:00', 'Pagado'),
(100, 'Paypal', 22.00, '2025-04-11 11:50:00', 'Pagado'),
(101, 'Zelle', 28.00, '2025-04-12 12:00:00', 'Pagado'),
(102, 'Tarjeta', 22.00, '2025-04-13 13:10:00', 'Pagado'),
(103, 'Venmo', 24.00, '2025-04-14 14:20:00', 'Pendiente'),
(104, 'Paypal', 40.00, '2025-04-15 15:30:00', 'Pagado'),
(105, 'Zelle', 7.00, '2025-04-16 16:40:00', 'Pagado'),
(106, 'Tarjeta', 69.00, '2025-04-17 17:50:00', 'Pagado'),
(107, 'Venmo', 14.50, '2025-04-18 09:00:00', 'Pagado'),
(108, 'Paypal', 13.50, '2025-04-19 10:10:00', 'Pendiente'),
(109, 'Zelle', 32.00, '2025-04-20 11:20:00', 'Pagado'),
(110, 'Tarjeta', 22.00, '2025-04-21 12:30:00', 'Pagado'),
(111, 'Venmo', 28.00, '2025-04-22 13:40:00', 'Pagado'),
(112, 'Paypal', 22.00, '2025-04-23 14:50:00', 'Pagado'),
(113, 'Zelle', 6.50, '2025-04-24 15:00:00', 'Pagado'),
(114, 'Tarjeta', 6.50, '2025-04-25 16:10:00', 'Pendiente'),
(115, 'Venmo', 32.00, '2025-04-26 17:20:00', 'Pagado');




#=== VISTAS ===#

#=1=# 

CREATE VIEW vw_detalle_compra AS
SELECT 	p.categoria,
		pa.metodo_pago,
		d.precio_unitario
FROM detalle_orden AS d
INNER JOIN productos AS p ON d.id_producto = p.id_producto
INNER JOIN ordenes AS o ON d.id_orden = o.id_orden
INNER JOIN pagos AS pa ON o.id_orden = pa.id_orden;


#=2=# 
CREATE VIEW vw_total_por_clientes AS
SELECT 	c.nombre,
		p.categoria,
        o.fecha_orden,
		pa.monto
FROM clientes AS c
INNER JOIN ordenes AS o ON c.id_cliente = o.id_cliente
INNER JOIN detalle_orden AS do ON o.id_orden = do.id_orden
INNER JOIN productos AS p ON do.id_producto = p.id_producto
INNER JOIN pagos AS pa ON o.id_orden = pa.id_orden; 

#=3=#
 
CREATE VIEW vw_ordenes_por_ubicacion AS 
SELECT 	c.ciudad,
		c.pais,
        COUNT(o.id_orden) AS cantidad_ordenes
FROM clientes AS c 
LEFT JOIN ordenes AS o ON c.id_cliente = o.id_cliente 
GROUP BY c.ciudad, c.pais; 

#=4=# 

CREATE VIEW vw_fecha_producto AS
SELECT 	o.id_orden,
		o.fecha_orden,
		p.categoria,
		p.created_at
FROM ordenes o
INNER JOIN detalle_orden d ON o.id_orden = d.id_orden
INNER JOIN productos p ON d.id_producto = p.id_producto;

#=5=# 

CREATE VIEW vw_stock_productos AS
SELECT 	p.nombre_producto,
		p.stock,
        d.precio_unitario
FROM productos p
JOIN detalle_orden d ON p.id_producto = d.id_producto; 


# EJECUSIONES #

SELECT * FROM vw_detalle_compra
WHERE metodo_pago IN ('Venmo'); 

SELECT * FROM vw_total_por_clientes
WHERE categoria IN ('Vinilo');

SELECT * FROM vw_ordenes_por_ubicacion
WHERE pais IN ('Argentina');

SELECT * FROM vw_fecha_producto 
WHERE MONTH  (fecha_orden)  =3;  

SELECT * FROM vw_stock_productos
WHERE precio_unitario < 25;


# === FUNCIONES === # 

# = 1 = #

USE ecommerce_daud;
DELIMITER //

CREATE FUNCTION monto_total_ordenes (param_idOrden INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN 
    DECLARE total DECIMAL(10,2);
    
    SELECT IFNULL(SUM(precio_unitario * cantidad), 0)
    INTO total
    FROM detalle_orden
    WHERE id_orden = param_idOrden; 
    
    RETURN total;
END//

DELIMITER ;

SELECT monto_total_ordenes(2);
SELECT monto_total_ordenes(3);
SELECT monto_total_ordenes(8);


# = 2 = #

DELIMITER //

CREATE FUNCTION ubicacion_clientes(param_idCliente INT)
RETURNS VARCHAR(250)
DETERMINISTIC
BEGIN
    DECLARE info VARCHAR(250);
    SELECT CONCAT(nombre, ', ', ciudad, ', ', pais) INTO info
    FROM clientes
    WHERE id_cliente = param_idCliente;

    RETURN info;
END//

DELIMITER ;

SELECT ubicacion_clientes (2); 


#=== SP ===#

# = 1 = #

DELIMITER //

CREATE PROCEDURE sp_listar_ordenes_cliente (IN p_id_cliente INT)
BEGIN
    SELECT 
        o.id_orden,
        o.fecha_orden,
        monto_total_ordenes(o.id_orden) AS total
    FROM ordenes AS o
    WHERE o.id_cliente = p_id_cliente;
END//

DELIMITER //

USE ecommerce_daud;  
CALL sp_listar_ordenes_cliente(2);

# = 2 = # 


DELIMITER //

CREATE PROCEDURE sp_ordenar_clientes(IN p_tabla VARCHAR(225),IN p_columna VARCHAR(225),IN p_orden VARCHAR(225))
BEGIN
    SET @sql_text = CONCAT('SELECT * FROM `', p_tabla, '` ORDER BY `', p_columna, '` ', p_orden, ';');
    PREPARE stmt FROM @sql_text;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END//

DELIMITER ;

CALL sp_ordenar_clientes('clientes', 'fecha_registro', 'ASC');

#=== TRIGGERS ===#

DELIMITER //

CREATE TRIGGER trg_actualizar_stock
AFTER INSERT ON detalle_orden
FOR EACH ROW
BEGIN
    UPDATE productos
    SET stock = stock - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END//

DELIMITER ;

SELECT stock FROM productos WHERE id_producto = 15;


DELIMITER //

CREATE TRIGGER trg_marcar_pago
AFTER UPDATE ON pagos
FOR EACH ROW
BEGIN
    IF NEW.estado_pago = 'Pagado' THEN
        UPDATE ordenes
        SET total = NEW.monto
        WHERE id_orden = NEW.id_orden;
    END IF;
END//

DELIMITER ;

SELECT * FROM pagos WHERE id_pago = 70;
SELECT * FROM ordenes WHERE id_orden = (SELECT id_orden FROM pagos WHERE id_pago = 70);


#==== ENTREGA FINAL ====#



#=== CORRECCIONES ===#

USE ecommerce_daud;

ALTER TABLE pagos
MODIFY COLUMN estado_pago ENUM('Pagado','Pendiente','Rechazado');


UPDATE pagos
SET estado_pago = 'Pagado'
WHERE id_pago >= 1
  AND fecha_pago IS NOT NULL;


UPDATE pagos
SET estado_pago = 'Pendiente'
WHERE id_pago IN (3, 7, 15);

UPDATE pagos
SET estado_pago = 'Rechazado'
WHERE id_pago IN (9, 21);

CREATE OR REPLACE VIEW vw_stock_productos AS
SELECT 
    nombre_producto,
    stock
FROM productos;


SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE detalle_orden;
TRUNCATE TABLE pagos;
TRUNCATE TABLE ordenes;
TRUNCATE TABLE clientes;

SET FOREIGN_KEY_CHECKS = 1;



ALTER TABLE pagos
MODIFY monto DECIMAL(10,2);

DROP TRIGGER IF EXISTS tr_agregar_cliente;


