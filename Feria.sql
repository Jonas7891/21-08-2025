CREATE DATABASE FeriaTecnologica;
USE FeriaTecnologica;

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

INSERT INTO Feria VALUES (1, 'Bogotá', '3 días', '2025-06-01', '2025-06-03', 'Feria internacional de innovación');
INSERT INTO Feria VALUES (2, 'Medellín', '2 días', '2025-07-10', '2025-07-11', 'Feria regional de startups');
INSERT INTO Feria VALUES (3, 'Cali', '4 días', '2025-08-05', '2025-08-08', 'Feria universitaria de tecnología');
INSERT INTO Feria VALUES (4, 'Barranquilla', '3 días', '2025-09-12', '2025-09-14', 'Expo CaribeTech');
INSERT INTO Feria VALUES (5, 'Bucaramanga', '2 días', '2025-10-20', '2025-10-21', 'Feria andina de software');

INSERT INTO Stand VALUES (1, 1, 1, '10m2');
INSERT INTO Stand VALUES (2, 2, 1, '15m2');
INSERT INTO Stand VALUES (3, 3, 2, '12m2');
INSERT INTO Stand VALUES (4, 4, 2, '20m2');
INSERT INTO Stand VALUES (5, 5, 3, '18m2');

INSERT INTO Visitantes VALUES (1, 'Entrada Norte', '2025-06-01', 25);
INSERT INTO Visitantes VALUES (2, 'Entrada Sur', '2025-06-01', 30);
INSERT INTO Visitantes VALUES (3, 'Entrada Este', '2025-06-02', 22);
INSERT INTO Visitantes VALUES (4, 'Entrada Oeste', '2025-06-02', 40);
INSERT INTO Visitantes VALUES (5, 'Entrada Norte', '2025-06-03', 28);

INSERT INTO Pabellon VALUES (1, 'Innovación', 10, 'Bloque A', 1, 200);
INSERT INTO Pabellon VALUES (2, 'Robótica', 8, 'Bloque B', 1, 150);
INSERT INTO Pabellon VALUES (3, 'Software', 12, 'Bloque C', 1, 250);
INSERT INTO Pabellon VALUES (4, 'Electrónica', 6, 'Bloque D', 2, 100);
INSERT INTO Pabellon VALUES (5, 'Startups', 9, 'Bloque E', 2, 180);

INSERT INTO Exhihibicion VALUES (1, 1, 'Juan Pérez', '2025-06-01');
INSERT INTO Exhihibicion VALUES (2, 2, 'Ana Torres', '2025-06-01');
INSERT INTO Exhihibicion VALUES (3, 3, 'Carlos Gómez', '2025-06-02');
INSERT INTO Exhihibicion VALUES (4, 4, 'Laura Díaz', '2025-06-02');
INSERT INTO Exhihibicion VALUES (5, 5, 'Pedro Ruiz', '2025-06-03');

INSERT INTO Empresa VALUES (1, 'TechCorp', 'Bogotá', '1234567');
INSERT INTO Empresa VALUES (2, 'InnovaSoft', 'Medellín', '2345678');
INSERT INTO Empresa VALUES (3, 'RoboMax', 'Cali', '3456789');
INSERT INTO Empresa VALUES (4, 'ElectroWorld', 'Barranquilla', '4567890');
INSERT INTO Empresa VALUES (5, 'StartUpHub', 'Bucaramanga', '5678901');

INSERT INTO Producto VALUES (1, 'Robot Educativo', 'Robótica', 1, 1, 5000.00);
INSERT INTO Producto VALUES (2, 'Software Contable', 'Software', 2, 2, 1200.00);
INSERT INTO Producto VALUES (3, 'Drone Mini', 'Robótica', 3, 3, 800.00);
INSERT INTO Producto VALUES (4, 'Chip IoT', 'Electrónica', 4, 4, 300.00);
INSERT INTO Producto VALUES (5, 'App de Salud', 'Software', 5, 5, 200.00);

INSERT INTO Responsable VALUES (1, 'Mario López', 'mario@correo.com');
INSERT INTO Responsable VALUES (2, 'Sofía Martínez', 'sofia@correo.com');
INSERT INTO Responsable VALUES (3, 'Luis Ramírez', 'luis@correo.com');
INSERT INTO Responsable VALUES (4, 'Claudia Herrera', 'claudia@correo.com');
INSERT INTO Responsable VALUES (5, 'Andrés Peña', 'andres@correo.com');

INSERT INTO Demostracion VALUES (1, 'Robótica Avanzada', '2025-06-01');
INSERT INTO Demostracion VALUES (2, 'Nube y Big Data', '2025-06-01');
INSERT INTO Demostracion VALUES (3, 'Impresión 3D', '2025-06-02');
INSERT INTO Demostracion VALUES (4, 'AI en la Medicina', '2025-06-02');
INSERT INTO Demostracion VALUES (5, 'Ciberseguridad', '2025-06-03');

INSERT INTO Registro VALUES (1, 1, 'Asistió a toda la charla');
INSERT INTO Registro VALUES (2, 2, 'Entró tarde');
INSERT INTO Registro VALUES (3, 3, 'Salió temprano');
INSERT INTO Registro VALUES (4, 4, 'Participó activamente');
INSERT INTO Registro VALUES (5, 5, 'Se ausentó al final');

INSERT INTO Charla VALUES (1, 'Introducción a IA', 1, 1, 60);
INSERT INTO Charla VALUES (2, 'Blockchain', 2, 2, 45);
INSERT INTO Charla VALUES (3, 'Cloud Computing', 3, 3, 50);
INSERT INTO Charla VALUES (4, 'Seguridad Informática', 4, 4, 55);
INSERT INTO Charla VALUES (5, 'Robótica en el Futuro', 5, 5, 40);

INSERT INTO Ponente VALUES (1, 'Dr. Alberto Torres', 'Inteligencia Artificial');
INSERT INTO Ponente VALUES (2, 'Ing. Marta Suárez', 'Blockchain');
INSERT INTO Ponente VALUES (3, 'Carlos Méndez', 'Cloud Computing');
INSERT INTO Ponente VALUES (4, 'Laura Jiménez', 'Ciberseguridad');
INSERT INTO Ponente VALUES (5, 'Pedro Fernández', 'Robótica');

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
