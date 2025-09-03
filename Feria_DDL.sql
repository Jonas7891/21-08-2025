CREATE DATABASE FeriaTecnologica2;
USE FeriaTecnologica2;

CREATE TABLE Feria (
    idFeria INT PRIMARY KEY,
    ciudad VARCHAR(100),
    duracion VARCHAR(50),
    fechaInicio DATETIME,
    fechaFin DATETIME
);

CREATE TABLE Stand (
    idStand INT PRIMARY KEY,
    idEmpresa INT,
    idPabellon INT,
    FOREIGN KEY (idPabellon) REFERENCES Pabellon(idPabellon)
);

CREATE TABLE Visitantes (
    idVisitantes INT PRIMARY KEY,
    lugarRegistro VARCHAR(100),
    fechaEntrada VARCHAR(50)
);

CREATE TABLE Pabellon (
    idPabellon INT PRIMARY KEY,
    nombre VARCHAR(100),
    cantidadStands INT,
    ubicacion VARCHAR(100),
    idFeria INT,
    FOREIGN KEY (idFeria) REFERENCES Feria(idFeria)
);

CREATE TABLE Exhihibicion (
    idExhibicion INT PRIMARY KEY,
    idStand INT,
    responsable VARCHAR(100),
    FOREIGN KEY (idStand) REFERENCES Stand(idStand)
);

CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion VARCHAR(100)
);

CREATE TABLE Producto (
    idProducto INT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo VARCHAR(50),
    idStand INT,
    idResponsable INT,
    FOREIGN KEY (idStand) REFERENCES Stand(idStand),
    FOREIGN KEY (idResponsable) REFERENCES Responsable(idResponsable)
);

CREATE TABLE Responsable (
    idResponsable INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Demostracion (
    idDemostracion INT PRIMARY KEY,
    titulo VARCHAR(100)
);

CREATE TABLE Registro (
    idVisitantes INT,
    idCharla INT,
    FOREIGN KEY (idVisitantes) REFERENCES Visitantes(idVisitantes),
    FOREIGN KEY (idCharla) REFERENCES Charla(idCharla)
);

CREATE TABLE Charla (
    idCharla INT PRIMARY KEY,
    titulo VARCHAR(100),
    idPonente INT,
    idEmpresa INT,
    FOREIGN KEY (idPonente) REFERENCES Ponente(idPonente),
    FOREIGN KEY (idEmpresa) REFERENCES Empresa(idEmpresa)
);

CREATE TABLE Ponente (
    idPonente INT PRIMARY KEY,
    nombre VARCHAR(100)
);

ALTER TABLE Feria ADD descripcion VARCHAR(200);
ALTER TABLE Stand ADD tamano VARCHAR(50);
ALTER TABLE Visitantes ADD edad INT;
ALTER TABLE Pabellon ADD capacidad INT;
ALTER TABLE Exhihibicion ADD fecha DATE;
ALTER TABLE Empresa ADD telefono VARCHAR(20);
ALTER TABLE Producto ADD precio DECIMAL(10,2);
ALTER TABLE Responsable ADD correo VARCHAR(100);
ALTER TABLE Demostracion ADD fecha DATE;
ALTER TABLE Registro ADD observaciones VARCHAR(200);
ALTER TABLE Charla ADD duracion INT;
ALTER TABLE Ponente ADD especialidad VARCHAR(100);

UPDATE Feria 
SET ciudad = 'Bogotá', duracion = '3 días', descripcion = 'Feria de innovación tecnológica'
WHERE idFeria = 1;

UPDATE Stand 
SET tamano = '20m2', idEmpresa = 2, idPabellon = 1
WHERE idStand = 1;

UPDATE Visitantes 
SET lugarRegistro = 'Entrada principal', fechaEntrada = '2025-08-28', edad = 30
WHERE idVisitantes = 1;

UPDATE Pabellon 
SET nombre = 'Pabellón Central', cantidadStands = 15, ubicacion = 'Bloque A', capacidad = 500
WHERE idPabellon = 1;

UPDATE Exhihibicion 
SET responsable = 'Carlos Pérez', fecha = '2025-08-28', idStand = 1
WHERE idExhibicion = 1;

UPDATE Empresa 
SET nombre = 'TechSolutions', ubicacion = 'Medellín', telefono = '3001234567'
WHERE idEmpresa = 1;

UPDATE Producto 
SET nombre = 'Impresora 3D', tipo = 'Electrónico', precio = 2500.50, idStand = 1, idResponsable = 1
WHERE idProducto = 1;

UPDATE Responsable 
SET nombre = 'María Gómez', correo = 'maria.gomez@email.com'
WHERE idResponsable = 1;

UPDATE Demostracion 
SET titulo = 'Robótica avanzada', fecha = '2025-09-01'
WHERE idDemostracion = 1;

UPDATE Registro 
SET observaciones = 'Asistió puntualmente'
WHERE idVisitantes = 1 AND idCharla = 1;

UPDATE Charla 
SET titulo = 'Inteligencia Artificial', duracion = 90, idPonente = 1, idEmpresa = 1
WHERE idCharla = 1;

UPDATE Ponente 
SET nombre = 'Juan López', especialidad = 'Ciberseguridad'
WHERE idPonente = 1;

DELETE FROM Feria WHERE idFeria = 5;
DELETE FROM Stand WHERE idStand = 5;
DELETE FROM Visitantes WHERE idVisitantes = 5;
DELETE FROM Pabellon WHERE idPabellon = 5;
DELETE FROM Exhihibicion WHERE idExhibicion = 5;
DELETE FROM Empresa WHERE idEmpresa = 5;
DELETE FROM Producto WHERE idProducto = 5;
DELETE FROM Responsable WHERE idResponsable = 5;
DELETE FROM Demostracion WHERE idDemostracion = 5;
DELETE FROM Registro WHERE idVisitantes = 5 AND idCharla = 5;
DELETE FROM Charla WHERE idCharla = 5;
DELETE FROM Ponente WHERE idPonente = 5;