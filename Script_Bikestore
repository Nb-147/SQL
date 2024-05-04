-- Creación de Base de Datos "Bikestore" --

DROP DATABASE IF EXISTS Bikestore;
CREATE DATABASE Bikestore;
USE Bikestore;

-- Creación de la tabla Proveedor --
CREATE TABLE Proveedor (
    id_Proveedor INT NOT NULL AUTO_INCREMENT,
    Empresa VARCHAR(255) NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Documento VARCHAR(20) NOT NULL UNIQUE,
    Dirección VARCHAR(255) NOT NULL,
    Teléfono VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_Proveedor)
);

-- Creación de la tabla Cliente --
CREATE TABLE Cliente (
    id_Cliente INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
	Documento VARCHAR(20) NOT NULL UNIQUE,
    Correo VARCHAR(255) NOT NULL,
    Teléfono VARCHAR(20) NOT NULL,
	PRIMARY KEY (id_Cliente)
);

-- Creación de la tabla Supervisor --
CREATE TABLE Supervisor (
    id_Supervisor INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    Documento VARCHAR(20) NOT NULL UNIQUE,
    Teléfono VARCHAR(20) NOT NULL,
    Dirección VARCHAR(255) NOT NULL,
    Correo VARCHAR(255) NOT NULL,
    id_Proveedor INT NOT NULL,
	PRIMARY KEY (id_Supervisor),
    FOREIGN KEY (id_Proveedor) REFERENCES Proveedor(id_Proveedor)
);

-- Creación de la tabla Empleado --
CREATE TABLE Empleado (
    id_Empleado INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
	Documento VARCHAR(20) NOT NULL UNIQUE,
    Rol VARCHAR(100) NOT NULL,
    Dirección VARCHAR(255) NOT NULL,
    Teléfono VARCHAR(20) NOT NULL,
    id_Cliente INT NOT NULL,
    id_Supervisor INT NOT NULL,
	PRIMARY KEY (id_Empleado),
    FOREIGN KEY (id_Cliente) REFERENCES Cliente(id_Cliente),
    FOREIGN KEY (id_Supervisor) REFERENCES Supervisor(id_Supervisor)
);

-- Creación de la tabla Compra --
CREATE TABLE Compra (
    id_Compra INT NOT NULL AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Precio_total DECIMAL(10,2) NOT NULL,
    id_Proveedor INT NOT NULL,
	PRIMARY KEY (id_Compra),
    FOREIGN KEY (id_Proveedor) REFERENCES Proveedor(id_Proveedor)
);

-- Creación de la tabla Detalle_compra --
CREATE TABLE Detalle_Compra (
    id_Detalle INT NOT NULL AUTO_INCREMENT,
    Articulo VARCHAR(45) NOT NULL,
    Cantidad INT NOT NULL,
    Precio_unitario DECIMAL(10,2) NOT NULL,
    id_Compra INT NOT NULL,
	PRIMARY KEY (id_Detalle),
    FOREIGN KEY (id_Compra) REFERENCES Compra(id_Compra)
);

-- Creación de la tabla Bicicleta --
CREATE TABLE Bicicleta (
    id_Bicicleta INT NOT NULL AUTO_INCREMENT,
    Marca VARCHAR(255) NOT NULL,
    Modelo VARCHAR(255) NOT NULL,
    Tipo VARCHAR(255) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    Talle VARCHAR(50) NOT NULL,
    Img_Url VARCHAR(255) NOT NULL,
    id_Proveedor INT NOT NULL,
	PRIMARY KEY (id_Bicicleta),
    FOREIGN KEY (id_Proveedor) REFERENCES Proveedor(id_Proveedor)
);

-- Creación de la tabla Accesorio --
CREATE TABLE Accesorio (
    id_Accesorio INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Descripción VARCHAR(255) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    Img_Url VARCHAR(255) NOT NULL,
    id_Proveedor INT NOT NULL,
	PRIMARY KEY (id_Accesorio),
    FOREIGN KEY (id_Proveedor) REFERENCES Proveedor(id_Proveedor)
);

-- Creación de la tabla Venta --
CREATE TABLE Venta (
    id_Venta INT NOT NULL AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Precio_Total DECIMAL(10,2) NOT NULL,
    id_Cliente INT NOT NULL,
    id_Empleado INT NOT NULL,
	PRIMARY KEY (id_Venta),
    FOREIGN KEY (id_Cliente) REFERENCES Cliente(id_Cliente),
    FOREIGN KEY (id_Empleado) REFERENCES Empleado(id_Empleado)
);

-- Creación de la tabla Mantenimiento --
CREATE TABLE Mantenimiento (
    id_Mantenimiento INT NOT NULL AUTO_INCREMENT,
    Fecha_inicio DATE NOT NULL,
    Fecha_devolucion DATE NOT NULL,
    Detalle VARCHAR(255) NOT NULL,
    Costo DECIMAL(10,2) NOT NULL,
    id_Bicicleta INT NOT NULL,
    id_Cliente INT NOT NULL,
    id_Empleado INT NOT NULL,
	PRIMARY KEY (id_Mantenimiento),
    FOREIGN KEY (id_Bicicleta) REFERENCES Bicicleta(id_Bicicleta),
    FOREIGN KEY (id_Cliente) REFERENCES Cliente(id_Cliente),
    FOREIGN KEY (id_Empleado) REFERENCES Empleado(id_Empleado)
);

-- Creación de la tabla Log_Mantenimiento --
CREATE TABLE Mantenimiento_log (
    id_Log INT NOT NULL AUTO_INCREMENT,
    Accion VARCHAR(50) NOT NULL,
    Fecha TIMESTAMP,
    Detalle VARCHAR(500),
    id_Mantenimiento INT,
    PRIMARY KEY (id_Log),
    FOREIGN KEY (id_Mantenimiento) REFERENCES Mantenimiento(id_Mantenimiento)
);

-- Creación de la tabla Detalle_Venta --
CREATE TABLE Detalle_Venta (
    id_Detalle INT NOT NULL AUTO_INCREMENT,
    Articulo VARCHAR(255) NOT NULL,
    Cantidad INT NOT NULL,
    Precio_unitario DECIMAL(10,2) NOT NULL,
    ID_Venta INT NOT NULL,
    ID_Accesorio INT NOT NULL,
    id_Bicicleta INT NOT NULL,
    id_Mantenimiento INT NOT NULL,
    PRIMARY KEY (id_Detalle),
    FOREIGN KEY (ID_Venta) REFERENCES Venta(id_Venta),
    FOREIGN KEY (ID_Accesorio) REFERENCES Accesorio(id_Accesorio),
    FOREIGN KEY (id_Bicicleta) REFERENCES Bicicleta(id_Bicicleta),
    FOREIGN KEY (id_Mantenimiento) REFERENCES Mantenimiento(id_Mantenimiento)
);

-- Creación de la tabla Reg_Actividad --
CREATE TABLE Reg_Actividad (
    id_Actividad INT NOT NULL AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Actividad VARCHAR(255) NOT NULL,
    Hs_extras DECIMAL(10,2) NOT NULL,
	Salario DECIMAL(10,2) NOT NULL,
    id_Empleado INT NOT NULL,
    id_Supervisor INT NOT NULL,
	PRIMARY KEY (id_Actividad),
    FOREIGN KEY (id_Empleado) REFERENCES Empleado(id_Empleado),
    FOREIGN KEY (id_Supervisor) REFERENCES Supervisor(id_Supervisor)
);

-- Script para insersión de datos --

INSERT INTO Proveedor (Empresa, Nombre, Documento, Dirección, Teléfono) VALUES
('Jota Bikes S.A.', 'Juan Rodriguez', '43456709', 'Av. San Martin 1287, Montevideo', '094886438'),
('BikeParts', 'Mariano Lopez', '37654321', 'Av. Libertador 4563, Montevideo', '099490856'),
('Rockbros', 'Pedro Gonzalez', '49123456', 'Av. Agraciada 3423, Montevideo', '099446656'),
('Scott Montevideo', 'Laura Gomez', '47258369', 'Av. Rondeau 4644, Montevideo', '096548954'),
('The Bike Shop', 'Marcelo Fernandez', '52369741', 'Soriano 456, Montevideo', '098987954'),
('TrekBikes', 'Raul Suarez', '39852147', 'Bulevar Artigas 3467, Montevideo', '099008764'),
('Specialized', 'Florencia Martinez', '41852963', 'Av Burgues 2929, Montevideo', '099343454'),
('Bianchi', 'Luisa Perez', '35852741', 'Av de las Americas, Canelones', '099765494'),
('Cyclemania', 'Daniel Sanchez', '52913654', '18 de Julio 2356, Montevideo', '098765409'),
('ServicePro', 'Daniel Fernandez', '41369852', 'Buxareo 2356, Montevideo', '095689744');

INSERT INTO Cliente (Nombre, Apellido, Documento, Correo, Teléfono) VALUES
('Pedro', 'Gomez', '55852754', 'pedrog-147@gmail.com', '098756488'),
('Ana', 'Perez', '45096655', 'anisperez12@gmail.com', '098594253'),
('Laura', 'Gonzalez', '46096445', 'lauritag444@gmail.com', '092437891'),
('Carlos', 'Rodriguez', '47896455', 'Carlosrod15@gmail.com', '095675812'),
('Maria', 'Lopez', '45879655', 'Marilo18@gmail.com', '094123876'),
('Javier', 'Diaz', '45095655', 'javier1357@gmail.com', '098875342'),
('Silvia', 'Fernandez', '45876645', 'silvia@gmail.com', '095756209'),
('Juan', 'Martinez', '59052753', 'juan@gmail.com', '092765431'),
('Sara', 'Hernandez', '59092755', 'sara@gmail.com', '098456728'),
('Roberto', 'Perez', '59652795', 'roberto@gmail.com', '094239870'),
('Elena', 'Gomez', '53609345', 'elena@gmail.com', '098564321'),
('Miguel', 'Rodriguez', '39096754', 'miguel@gmail.com', '095689076'),
('Andrea', 'Lopez', '48765654', 'andrea@gmail.com', '092987654'),
('Carlos', 'Gonzalez', '45456652', 'carlos@gmail.com', '094345679'),
('Martha', 'Diaz', '43095555', 'martha@gmail.com', '098132645'),
('Jose', 'Fernandez', '31095455', 'jose@gmail.com', '095265438'),
('Lorena', 'Perez', '46022653', 'lorena@gmail.com', '092678945'),
('Daniel', 'Gomez', '34965555', 'daniel@gmail.com', '098876542'),
('Ana', 'Martinez', '49895445', 'ana@gmail.com', '094453782'),
('Julian', 'Gomez', '49893345', 'Juligomez14@gmail.com', '094453499');

INSERT INTO Supervisor (Nombre, Apellido, Documento, Teléfono, Dirección, Correo, id_Proveedor) VALUES
('Eduardo', 'Sanchez', '49875555', '098756488', 'Av. 18 de Julio 1234', 'eduardosa-34@gmail.com', 1),
('Laura', 'Gonzalez', '49809875', '098594253', 'Av. Italia 5678', 'laura_gonzalez1@gmail.com', 2),
('Roberto', 'Fernandez', '37759995', '092437891', 'Av. Agraciada 910', 'robfer25@gmail.com', 3),
('Miguel', 'Martinez', '34565996', '095675812', 'Bvar. Artigas 3456', 'miguemar@gmail.com', 4),
('Carla', 'Lopez', '45559879', '094123876', 'Av. General Flores 789', 'carla.lopez12@gmail.com', 5);

INSERT INTO Empleado (Nombre, Apellido, Documento, Rol, Dirección, Teléfono, id_Cliente, id_Supervisor) VALUES
('Carlos', 'Lopez', '35487132', 'Vendedor', 'Rambla República de México 2357', '098756488', 1, 1),
('María', 'Garcia', '23891547', 'Vendedor', 'Av. Italia 554', '098594253', 2, 2),
('Javier', 'Diaz', '14758936', 'Mecánico', 'Av. Agraciada 1212', '092437891', 3, 3),
('Laura', 'Gomez', '85236914', 'Vendedor', 'Bvar. Artigas 4465', '095675812', 4, 4),
('Pedro', 'Martinez', '69325478', 'Mecánico', 'Calle 18 de Julio 123', '094123876', 5, 5),
('Ana', 'Fernandez', '47182593', 'chofer', 'Av. General Flores 2828', '098875342', 6, 5),
('Luis', 'Perez', '61938475', 'Vendedor', 'Rambla República Argentina 2345', '095756209', 7, 4),
('Sara', 'Gonzalez', '28741596', 'Mecánico', 'Av. Luis Alberto de Herrera 456', '092765431', 8, 1),
('Roberto', 'Sanchez', '94528713', 'chofer', 'Bvar. España 1253', '098456728', 9, 3),
('Miguel', 'Lopez', '73815924', 'Mecánicos', 'Rambla Republica de Chile 789', '094239870', 10, 2);

INSERT INTO Compra (Fecha, Precio_total, id_proveedor) VALUES
('2023-12-27', 6499.99, 1),  
('2024-04-24', 500.00, 2),   
('2024-04-28', 8999.99, 3),  
('2024-04-28', 6199.99, 4), 
('2024-04-28', 9000.00, 5),  
('2024-04-29', 8599.99, 6), 
('2024-04-30', 4000.00, 7),  
('2024-05-02', 7500.00, 8),  
('2024-05-02', 6000.00, 9),  
('2024-05-03', 500.00, 10),  
('2024-05-04', 7999.99, 1), 
('2024-05-06', 6199.99, 2),  
('2024-05-06', 6000.00, 3),  
('2024-05-07', 7500.00, 4), 
('2024-05-08', 500.00, 5),   
('2024-04-11', 7999.99, 6), 
('2024-04-11', 4197.99, 7),  
('2024-05-11', 7999.99, 8),  
('2024-05-03', 500.00, 9),   
('2024-05-03', 500.00, 10);  

INSERT INTO Detalle_Compra (Articulo, Cantidad, Precio_unitario, id_compra) VALUES
('Trek X-Caliber 8', 1, 799.99, 1),
('Giant Defy Advanced Pro 0', 1, 3699.99, 2),
('Specialized Stumpjumper Comp Carbon 29', 1, 3299.99, 3),
('Cannondale Synapse Carbon Disc Ultegra', 1, 3199.99, 4),
('Santa Cruz Hightower C R', 1, 3999.99, 5),
('Trek Domane SL 6', 1, 2999.99, 6),
('Giant Trance Advanced Pro 29 0', 1, 5599.99, 7),
('Specialized Roubaix Sport', 1, 2399.99, 8),
('Cannondale Topstone Carbon Ultegra RX', 1, 3199.99, 9),
('Santa Cruz Blur TR C S', 1, 3699.99, 10),
('Trek Madone SL 6', 1, 5999.99, 11),
('Giant Reign Advanced Pro 29 0', 1, 5699.99, 12),
('Specialized Epic Comp', 1, 2599.99, 13),
('Cannondale SuperSix EVO Carbon Disc Ultegra', 1, 3799.99, 14),
('Santa Cruz Nomad C R', 1, 3999.99, 15),
('Trek Slash 9.8', 1, 5599.99, 16),
('Giant Anthem Advanced Pro 29 0', 1, 5699.99, 17),
('Specialized Diverge Comp Carbon', 1, 3599.99, 18),
('Cannondale CAAD13 Disc Ultegra', 1, 2499.99, 19),
('Santa Cruz 5010 C S', 1, 3999.99, 20),
('Trek Fuel EX 9.9 X01', 1, 7999.99, 20),
('Casco de Ciclismo', 1, 50.00, 1),
('Luces LED', 1, 20.00, 2),
('Bomba de Aire', 1, 30.00, 3),
('Guantes de Ciclismo', 1, 25.00, 4),
('Porta-bidón', 1, 10.00, 5),
('Cadena de Bicicleta', 1, 15.00, 6),
('Llave Allen', 1, 8.00, 7),
('Camiseta de Ciclismo', 1, 40.00, 8),
('Sillín de Bicicleta', 1, 50.00, 9),
('Pedales de Bicicleta', 1, 30.00, 10),
('Cascos de Bicicleta para Niños', 1, 20.00, 11),
('Bidones para Bicicleta', 1, 5.00, 12),
('Cámaras de Bicicleta', 1, 10.00, 13),
('Portabicicletas', 1, 100.00, 14),
('Portaequipajes para Bicicleta', 1, 50.00, 15),
('Guardabarros para Bicicleta', 1, 15.00, 16),
('Luz Trasera para Bicicleta', 1, 8.00, 17),
('Timbre de Bicicleta', 1, 4.00, 18),
('Candado para Bicicleta', 1, 20.00, 19),
('GPS para Bicicleta', 1, 150.00, 20);

INSERT INTO Accesorio (Nombre, Descripción, Precio, Stock, Img_Url, id_Proveedor) VALUES
('Casco de Ciclismo', 'Casco de ciclismo con protección para impactos.', 50.00, 100, 'https://example.com/casco-ciclismo.jpg', 1),
('Luces LED', 'Luces LED recargables para bicicletas.', 20.00, 150, 'https://example.com/luces-led.jpg', 2),
('Bomba de Aire', 'Bomba de aire portátil para inflar neumáticos.', 30.00, 80, 'https://example.com/bomba-aire.jpg', 3),
('Guantes de Ciclismo', 'Guantes acolchados para protección y agarre.', 25.00, 120, 'https://example.com/guantes-ciclismo.jpg', 4),
('Porta-bidón', 'Porta-bidón para transportar botellas de agua.', 10.00, 200, 'https://example.com/porta-bidon.jpg', 5),
('Cadena de Bicicleta', 'Cadena de bicicleta resistente y duradera.', 15.00, 100, 'https://example.com/cadena-bicicleta.jpg', 6),
('Llave Allen', 'Set de llaves Allen de diferentes tamaños.', 8.00, 150, 'https://example.com/llave-allen.jpg', 7),
('Camiseta de Ciclismo', 'Camiseta transpirable para ciclistas.', 40.00, 80, 'https://example.com/camiseta-ciclismo.jpg', 8),
('Sillín de Bicicleta', 'Sillín ergonómico para mayor comodidad.', 50.00, 60, 'https://example.com/sillin-bicicleta.jpg', 9),
('Pedales de Bicicleta', 'Pedales de bicicleta con agarre antideslizante.', 30.00, 100, 'https://example.com/pedales-bicicleta.jpg', 10),
('Cascos de Bicicleta para Niños', 'Cascos de bicicleta para niños en varios colores.', 20.00, 50, 'https://example.com/cascos-ninos.jpg', 1),
('Bidones para Bicicleta', 'Bidones para transportar líquidos durante el viaje.', 5.00, 200, 'https://example.com/bidones-bicicleta.jpg', 1),
('Cámaras de Bicicleta', 'Cámaras de bicicleta para reemplazo.', 10.00, 120, 'https://example.com/camaras-bicicleta.jpg', 3),
('Portabicicletas', 'Portabicicletas para transporte en vehículos.', 100.00, 30, 'https://example.com/portabicicletas.jpg', 3),
('Portaequipajes para Bicicleta', 'Portaequipajes para transportar carga.', 50.00, 50, 'https://example.com/portaequipajes-bicicleta.jpg', 8),
('Guardabarros para Bicicleta', 'Guardabarros para protección contra salpicaduras.', 15.00, 80, 'https://example.com/guardabarros-bicicleta.jpg', 8),
('Luz Trasera para Bicicleta', 'Luz trasera para visibilidad en la oscuridad.', 8.00, 100, 'https://example.com/luz-trasera-bicicleta.jpg', 7),
('Timbre de Bicicleta', 'Timbre de bicicleta para alertar a los peatones.', 4.00, 150, 'https://example.com/timbre-bicicleta.jpg', 8),
('Candado para Bicicleta', 'Candado resistente para asegurar la bicicleta.', 20.00, 70, 'https://example.com/candado-bicicleta.jpg', 9),
('GPS para Bicicleta', 'Dispositivo GPS para seguimiento y navegación.', 150.00, 20, 'https://example.com/gps-bicicleta.jpg', 2);

INSERT INTO Bicicleta (Marca, Modelo, Tipo, Precio, Stock, Talle, Img_Url, id_Proveedor) VALUES
('Trek', 'X-Caliber 8', 'Montaña', 799.99, 50, 'M', 'https://example.com/trek-x-caliber-8.jpg', 1),
('Giant', 'Defy Advanced Pro 0', 'Carretera', 3699.99, 30, 'L', 'https://example.com/giant-defy-advanced-pro-0.jpg', 1),
('Specialized', 'Stumpjumper Comp Carbon 29', 'Montaña', 3299.99, 20, 'S', 'https://example.com/specialized-stumpjumper-comp-carbon-29.jpg', 2),
('Cannondale', 'Synapse Carbon Disc Ultegra', 'Carretera', 3199.99, 25, 'M', 'https://example.com/cannondale-synapse-carbon-disc-ultegra.jpg', 3),
('Santa Cruz', 'Hightower C R', 'Montaña', 3999.99, 15, 'L', 'https://example.com/santa-cruz-hightower-c-r.jpg', 4),
('Trek', 'Domane SL 6', 'Carretera', 2999.99, 20, 'M', 'https://example.com/trek-domane-sl-6.jpg', 5),
('Giant', 'Trance Advanced Pro 29 0', 'Montaña', 5599.99, 10, 'L', 'https://example.com/giant-trance-advanced-pro-29-0.jpg', 6),
('Specialized', 'Roubaix Sport', 'Carretera', 2399.99, 30, 'M', 'https://example.com/specialized-roubaix-sport.jpg', 7),
('Cannondale', 'Topstone Carbon Ultegra RX', 'Gravel', 3199.99, 15, 'S', 'https://example.com/cannondale-topstone-carbon-ultegra-rx.jpg', 8),
('Santa Cruz', 'Blur TR C S', 'Montaña', 3699.99, 10, 'M', 'https://example.com/santa-cruz-blur-tr-c-s.jpg', 9),
('Trek', 'Madone SL 6', 'Carretera', 5999.99, 15, 'L', 'https://example.com/trek-madone-sl-6.jpg', 10),
('Giant', 'Reign Advanced Pro 29 0', 'Montaña', 5699.99, 8, 'M', 'https://example.com/giant-reign-advanced-pro-29-0.jpg', 4),
('Specialized', 'Epic Comp', 'Montaña', 2599.99, 12, 'S', 'https://example.com/specialized-epic-comp.jpg', 3),
('Cannondale', 'SuperSix EVO Carbon Disc Ultegra', 'Carretera', 3799.99, 18, 'M', 'https://example.com/cannondale-supersix-evo-carbon-disc-ultegra.jpg', 5),
('Santa Cruz', 'Nomad C R', 'Montaña', 3999.99, 10, 'L', 'https://example.com/santa-cruz-nomad-c-r.jpg', 5),
('Trek', 'Slash 9.8', 'Montaña', 5599.99, 8, 'M', 'https://example.com/trek-slash-9.8.jpg', 6),
('Giant', 'Anthem Advanced Pro 29 0', 'Montaña', 5699.99, 7, 'S', 'https://example.com/giant-anthem-advanced-pro-29-0.jpg', 6),
('Specialized', 'Diverge Comp Carbon', 'Gravel', 3599.99, 10, 'M', 'https://example.com/specialized-diverge-comp-carbon.jpg', 8),
('Cannondale', 'CAAD13 Disc Ultegra', 'Carretera', 2499.99, 20, 'L', 'https://example.com/cannondale-caad13-disc-ultegra.jpg', 8),
('Santa Cruz', '5010 C S', 'Montaña', 3999.99, 5, 'M', 'https://example.com/santa-cruz-5010-c-s.jpg', 2),
('Trek', 'Fuel EX 9.9 X01', 'Montaña', 7999.99, 5, 'L', 'https://example.com/trek-fuel-ex-9.9-x01.jpg', 2);

INSERT INTO Venta (Fecha, Precio_Total, id_Cliente, id_Empleado) VALUES
('2024-04-24', 5499.95, 1, 1),
('2024-04-25', 1300.00, 2, 2),
('2024-04-26', 3200.00, 3, 3),
('2024-04-27', 2360.00, 4, 4),
('2024-04-28', 3000.00, 5, 5),
('2024-04-29', 3200.00, 6, 6),
('2024-04-30', 1500.00, 7, 7),
('2024-05-01', 2740.00, 8, 8),
('2024-05-02', 2900.00, 9, 9),
('2024-05-03', 6000.00, 10, 10),
('2024-05-04', 7599.95, 1, 1),
('2024-05-05', 1140.00, 2, 2),
('2024-05-06', 4800.00, 3, 3),
('2024-05-07', 2200.00, 4, 4),
('2024-05-08', 1700.00, 5, 5);

INSERT INTO Mantenimiento (Fecha_inicio, Fecha_devolucion, Detalle, Costo, id_Bicicleta, id_Cliente, id_Empleado) VALUES
('2024-05-05', '2024-05-08', 'Revisión y ajuste de frenos', 150.00, 1, 1, 3),
('2024-05-10', '2024-05-12', 'Cambio de cadena y engrase', 80.00, 3, 3, 5),
('2024-05-15', '2024-05-18', 'Alineación de ruedas y ajuste de cambios', 120.00, 2, 2, 8),
('2024-05-20', '2024-05-22', 'Reparación de pinchazo y cambio de neumático', 50.00, 5, 5, 10),
('2024-05-25', '2024-05-28', 'Limpieza general y ajuste de componentes', 100.00, 4, 4, 5),
('2024-05-30', '2024-06-02', 'Revisión de sistema de suspensión', 200.00, 6, 6, 3),
('2024-06-05', '2024-06-08', 'Reemplazo de cableado y ajuste de cambios', 90.00, 7, 7, 8),
('2024-06-10', '2024-06-12', 'Cambio de pastillas de freno y ajuste', 70.00, 8, 8, 10),
('2024-06-15', '2024-06-18', 'Reparación de pinchazo y ajuste de cadena', 60.00, 9, 9, 3),
('2024-06-20', '2024-06-22', 'Revisión de horquilla y engrase', 180.00, 10, 10, 3),
('2024-06-25', '2024-06-28', 'Ajuste de frenos y limpieza de componentes', 130.00, 11, 11, 8),
('2024-06-30', '2024-07-02', 'Revisión de sistema de dirección', 100.00, 12, 12, 5),
('2024-07-05', '2024-07-08', 'Reparación de pinchazo y ajuste de cambios', 70.00, 13, 13, 10),
('2024-07-10', '2024-07-12', 'Cambio de pastillas de freno y ajuste', 80.00, 14, 14, 3),
('2024-07-15', '2024-07-18', 'Revisión y ajuste de suspensión trasera', 160.00, 15, 15, 3),
('2024-07-20', '2024-07-22', 'Limpieza general y engrase de componentes', 120.00, 16, 16, 5),
('2024-07-25', '2024-07-28', 'Reemplazo de cableado y ajuste de cambios', 90.00, 17, 17, 8),
('2024-07-30', '2024-08-02', 'Reparación de pinchazo y ajuste de frenos', 60.00, 18, 18, 5),
('2024-08-05', '2024-08-08', 'Cambio de cadena y ajuste de componentes', 100.00, 19, 19, 10),
('2024-08-10', '2024-08-12', 'Revisión y engrase de horquilla', 80.00, 20, 20, 3);

INSERT INTO Detalle_Venta (Articulo, Cantidad, Precio_unitario, id_Venta, ID_Accesorio, id_Bicicleta, id_Mantenimiento) VALUES
('Bicicleta de Montaña', 5, 799.99, 1, 1, 1, 1),
('Casco de Ciclismo', 10, 50.00, 2, 2, 2, 2),
('Luces LED', 15, 20.00, 3, 3, 3, 3),
('Bomba de Aire', 8, 30.00, 4, 4, 4, 4),
('Guantes de Ciclismo', 12, 25.00, 5, 5, 5, 5),
('Porta-bidón', 20, 10.00, 6, 6, 6, 6),
('Cadena de Bicicleta', 10, 15.00, 7, 7, 7, 7),
('Llave Allen', 15, 8.00, 8, 8, 8, 8),
('Camiseta de Ciclismo', 8, 40.00, 9, 9, 9, 9),
('Sillín de Bicicleta', 5, 50.00, 10, 10, 10, 10),
('Candado de Bicicleta', 5, 20.00, 11, 11, 11, 11),
('GPS para Bicicleta', 3, 150.00, 12, 12, 12, 12),
('Cascos de Bicicleta para Niños', 7, 20.00, 13, 13, 13, 13),
('Bidones para Bicicleta', 9, 5.00, 14, 14, 14, 14),
('Cámaras de Bicicleta', 4, 10.00, 15, 15, 15, 15);

INSERT INTO Reg_Actividad (Fecha, Actividad, Hs_extras, Salario, id_Empleado, id_Supervisor) VALUES
('2024-05-05', 'Mantenimiento de bicicletas', 2.5, 150.00, 3, 1),
('2024-05-06', 'Atención al cliente', 1.5, 100.00, 4, 2),
('2024-05-07', 'Inventario de productos', 3.0, 180.00, 5, 3),
('2024-05-08', 'Mantenimiento de bicicletas', 2.0, 120.00, 6, 4),
('2024-05-09', 'Atención al cliente', 1.0, 70.00, 7, 5),
('2024-05-10', 'Inventario de productos', 2.5, 150.00, 8, 1),
('2024-05-11', 'Mantenimiento de bicicletas', 3.5, 200.00, 9, 2),
('2024-05-12', 'Atención al cliente', 2.0, 130.00, 10, 3),
('2024-05-13', 'Inventario de productos', 2.0, 120.00, 10, 4),
('2024-05-14', 'Mantenimiento de bicicletas', 1.5, 90.00, 5, 5),
('2024-05-15', 'Atención al cliente', 2.5, 160.00, 9, 1),
('2024-05-16', 'Inventario de productos', 3.0, 180.00, 8, 2),
('2024-05-17', 'Mantenimiento de bicicletas', 2.0, 120.00, 8, 3),
('2024-05-18', 'Atención al cliente', 1.0, 70.00, 3, 4),
('2024-05-19', 'Inventario de productos', 2.5, 150.00, 5, 5),
('2024-05-20', 'Mantenimiento de bicicletas', 3.5, 200.00, 8, 1),
('2024-05-21', 'Atención al cliente', 2.0, 130.00, 1, 2),
('2024-05-22', 'Inventario de productos', 1.5, 90.00, 10, 3);



-- CREACIÓN DE VISTAS --

CREATE VIEW Inventario_Bicicletas_Proveedor AS
	SELECT p.Empresa, COUNT(b.id_Bicicleta) AS Cantidad_Bicicletas, AVG(b.Precio) AS Precio_Promedio
	FROM Bicicleta b
	JOIN Proveedor p ON b.id_Proveedor = p.id_Proveedor
	WHERE b.Stock > 0
	GROUP BY p.Empresa;

CREATE VIEW Total_Compras_Proveedor_Mes AS
	SELECT p.Empresa, MONTH(c.Fecha) AS Mes, YEAR(c.Fecha) AS Año, SUM(c.Precio_total) AS Total_Compras
	FROM Compra c
	JOIN Proveedor p ON c.id_Proveedor = p.id_Proveedor
	GROUP BY p.Empresa, MONTH(c.Fecha), YEAR(c.Fecha)
	ORDER BY p.Empresa, YEAR(c.Fecha), MONTH(c.Fecha);

CREATE VIEW Empleados_Ventas_Superiores_Promedio AS
	SELECT e.Nombre, e.Apellido, COUNT(v.id_Venta) AS Num_Ventas, SUM(v.Precio_Total) AS Total_Ventas
	FROM Venta v
	JOIN Empleado e ON v.id_Empleado = e.id_Empleado
	GROUP BY e.Nombre, e.Apellido
	HAVING AVG(v.Precio_Total) > (SELECT AVG(Precio_Total) FROM Venta);


CREATE VIEW Salario_empleado AS
SELECT  Subconsulta.id_Empleado,
		CONCAT(E.nombre, ' ', E.apellido) AS Empleado,
		CONCAT(' ', Subconsulta.Actividades) AS Actividades,
		Subconsulta.Hs_extras,
		Subconsulta.Hs_extras * 20 + 1000 AS Salario
FROM ( SELECT RA.id_Empleado, 
			  group_concat(' ', RA.Actividad) AS Actividades,
			  SUM(RA.Hs_extras) AS Hs_extras
		FROM Reg_Actividad RA
		GROUP BY RA.id_Empleado) AS Subconsulta
		JOIN empleado E ON Subconsulta.id_Empleado = E.id_Empleado;
        

CREATE VIEW Salario_supervisor AS
SELECT  Subconsulta.id_Supervisor,
		CONCAT(E.nombre, ' ', E.apellido) AS Supervisor,
		CONCAT(' ', Subconsulta.Actividades) AS Actividades,
		Subconsulta.Hs_extras,
		Subconsulta.Hs_extras * 40 + 1000 AS Salario
FROM ( SELECT RA.id_Supervisor, 
			  group_concat(' ', RA.Actividad) AS Actividades,
			  SUM(RA.Hs_extras) AS Hs_extras
		FROM Reg_Actividad RA
		GROUP BY RA.id_Supervisor) AS Subconsulta
		JOIN supervisor E ON Subconsulta.id_Supervisor = E.id_supervisor;
        
        
        
-- CREACIÓN DE FUNCIONES --

DELIMITER //
CREATE FUNCTION f_avg_ventas_empleado(id_empleado_param INT)
RETURNS DECIMAL(10,2) READS SQL DATA
BEGIN
    DECLARE promedio DECIMAL(10,2);
    SELECT AVG(Precio_Total) INTO promedio
    FROM venta
    WHERE id_empleado = id_empleado_param;
    
    RETURN promedio;
END;
//

DELIMITER //
CREATE FUNCTION f_avg_ventas_dia(fechaInicio DATE, fechaFin DATE) 
RETURNS DECIMAL(10,2) READS SQL DATA
BEGIN

    DECLARE total_dias INT;
    DECLARE total_ventas DECIMAL(10,2);
    DECLARE promedio DECIMAL(10,2);
    
    SET total_dias = DATEDIFF(fechaFin, fechaInicio) + 1;
    
    SELECT SUM(Precio_Total) INTO total_ventas
    FROM Venta
    WHERE Fecha BETWEEN fechaInicio AND fechaFin;
    
    IF total_dias > 0 THEN
        SET promedio = total_ventas / total_dias;
    ELSE
        SET promedio = 0;
    END IF;
    
    RETURN promedio;
END;
//

-- CREACIÓN DE PROCEDIMIENTOS --

DELIMITER &&
CREATE PROCEDURE p_reg_venta(
    IN fecha_venta DATE,
    IN precio_total DECIMAL(10,2),
    IN id_cliente INT,
    IN id_empleado INT,
    IN detalle_bicicleta_id INT,
    IN cantidad_bicicleta INT,
    IN detalle_accesorio_id INT,
    IN cantidad_accesorio INT
)
BEGIN

    INSERT INTO Venta (Fecha, Precio_Total, id_Cliente, id_Empleado)
    VALUES (fecha_venta, precio_total, id_cliente, id_empleado);
    
    SET @id_venta = LAST_INSERT_ID();
    
    IF detalle_bicicleta_id IS NOT NULL THEN
        UPDATE Bicicleta
        SET Stock = Stock - cantidad_bicicleta
        WHERE id_Bicicleta = detalle_bicicleta_id;
    END IF;

    IF detalle_accesorio_id IS NOT NULL THEN
        UPDATE Accesorio
        SET Stock = Stock - cantidad_accesorio
        WHERE id_Accesorio = detalle_accesorio_id;
    END IF;
    
END;
&&


DELIMITER &&

CREATE PROCEDURE p_eliminar_empleado_cascada(IN empleado_id INT)
BEGIN
    DECLARE empleado_existe INT;
    DECLARE ventas_existen INT;
    
    SET empleado_existe = (SELECT COUNT(*) FROM Empleado WHERE id_Empleado = empleado_id);
    
    IF empleado_existe > 0 THEN
     
        DELETE FROM detalle_venta WHERE ID_Venta IN (SELECT id_Venta FROM venta WHERE id_Empleado = empleado_id);
        DELETE FROM venta WHERE id_Empleado = empleado_id;
        DELETE FROM reg_actividad WHERE id_Empleado = empleado_id;
        DELETE FROM detalle_venta WHERE id_Mantenimiento IN (SELECT id_Mantenimiento FROM mantenimiento WHERE id_Empleado = empleado_id);
        DELETE FROM mantenimiento WHERE id_Empleado = empleado_id;
        DELETE FROM Empleado WHERE id_Empleado = empleado_id;

        SELECT CONCAT('Empleado ', empleado_id, ' y sus registros asociados han sido eliminados correctamente.') AS Mensaje;
    ELSE
        SELECT 'No se encontró ningún empleado con el ID especificado.' AS Mensaje;
    END IF;
END;
&&

DELIMITER &&

CREATE PROCEDURE p_eliminar_empleado_sinfk (IN empleado_id INT)
BEGIN

    SET FOREIGN_KEY_CHECKS = 0;

    DELETE FROM empleado WHERE id_Empleado = empleado_id;

    SET FOREIGN_KEY_CHECKS = 1;
END;
&&

DELIMITER &&


-- CREACIÓN DE TRIGGERS --

DELIMITER **
CREATE TRIGGER t_validar_rol_empleado
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN

    IF NEW.Rol NOT IN ('Vendedor', 'Mecanico', 'chofer') THEN
        SIGNAL SQLSTATE '45500'
        SET MESSAGE_TEXT = 'El rol del empleado no es válido';
    END IF;
END;
**

DELIMITER **

CREATE TRIGGER t_mantenimiento_log_insert
AFTER INSERT ON Mantenimiento FOR EACH ROW

BEGIN
    INSERT INTO Mantenimiento_log (Accion, Detalle, id_Mantenimiento)
    VALUES ('INSERT', CONCAT('Nuevo mantenimiento insertado: ', NEW.Detalle), NEW.id_Mantenimiento);
END;
**

DELIMITER **
CREATE TRIGGER t_mantenimiento_log_update
AFTER UPDATE ON Mantenimiento FOR EACH ROW

BEGIN
    INSERT INTO Mantenimiento_log (Accion, Detalle, id_Mantenimiento)
    VALUES ('UPDATE', CONCAT('Mantenimiento actualizado - Detalle antiguo: ', OLD.Detalle), NEW.id_Mantenimiento);
END;
**

DELIMITER **
CREATE TRIGGER t_mantenimiento_log_delete
AFTER DELETE ON Mantenimiento FOR EACH ROW

BEGIN
    INSERT INTO Mantenimiento_log (Accion, Detalle, id_Mantenimiento)
    VALUES ('DELETE', CONCAT('Mantenimiento eliminado - Detalle antiguo: ', OLD.Detalle), OLD.id_Mantenimiento);
END;
**
