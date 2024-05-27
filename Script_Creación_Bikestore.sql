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
    PRIMARY KEY (id_Log)
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
