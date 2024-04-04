-- Creación de Base de Datos "Bikestore"
DROP DATABASE IF EXISTS Bikestore;
CREATE DATABASE Bikestore;
USE Bikestore;

-- Creación de la tabla Proveedor
CREATE TABLE Proveedor (
    id_Proveedor INT NOT NULL AUTO_INCREMENT,
    Empresa VARCHAR(255) NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Documento VARCHAR(20) NOT NULL UNIQUE,
    Dirección VARCHAR(255) NOT NULL,
    Teléfono VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_Proveedor)
);

-- Creación de la tabla Cliente
CREATE TABLE Cliente (
    id_Cliente INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
	Documento VARCHAR(20) NOT NULL UNIQUE,
    Correo VARCHAR(255) NOT NULL,
    Teléfono VARCHAR(20) NOT NULL,
	PRIMARY KEY (id_Cliente)
);

-- Creación de la tabla Supervisor
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

-- Creación de la tabla Empleado
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

-- Creación de la tabla Compra
CREATE TABLE Compra (
    id_compra INT NOT NULL AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Precio_total DECIMAL(10,2) NOT NULL,
    id_proveedor INT NOT NULL,
	PRIMARY KEY (id_Compra),
    FOREIGN KEY (id_Proveedor) REFERENCES Proveedor(id_Proveedor)
);

-- Creación de la tabla Detalle_compra
CREATE TABLE Detalle_Compra (
    id_detalle INT NOT NULL AUTO_INCREMENT,
    Articulo VARCHAR(45) NOT NULL,
    Cantidad INT NOT NULL,
    Precio_unitario DECIMAL(10,2) NOT NULL,
    id_compra INT NOT NULL,
	PRIMARY KEY (id_Detalle),
    FOREIGN KEY (id_Compra) REFERENCES Compra(id_compra)
);

-- Creación de la tabla Bicicleta
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

-- Creación de la tabla Accesorio
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

-- Creación de la tabla Venta
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

-- Creación de la tabla Mantenimiento
CREATE TABLE Mantenimiento (
    id_Mantenimiento INT NOT NULL AUTO_INCREMENT,
    Fecha_inicio DATE NOT NULL,
    Fecha_devolución DATE NOT NULL,
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

-- Creación de la tabla Detalle_Venta
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

-- Creación de la tabla Reg_Actividad
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