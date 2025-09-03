CREATE PROCEDURE GetFeriaInfo()
BEGIN
    -- Consulta para Feria 1
    SELECT Feria.ciudad, Feria.duracion, Feria.descripcion, 
           COUNT(Stand.id_Stand) AS total_stands, 
           COUNT(Producto.id_Producto) AS total_productos, 
           COUNT(Visitantes.id_Visitantes) AS total_visitantes
    FROM Feria
    JOIN Pabellon ON Feria.id_Feria = Pabellon.id_Feria
    JOIN Stand ON Pabellon.id_Pabellon = Stand.id_Pabellon
    JOIN Producto ON Stand.id_Stand = Producto.id_Stand
    JOIN Registro ON Feria.id_Feria = Feria.id_Feria
    JOIN Visitantes ON Registro.id_Visitantes = Visitantes.id_Visitantes
    WHERE Feria.id_Feria = 1;

    -- Consulta para Feria 2
    SELECT Feria.ciudad, Feria.duracion, Feria.descripcion, 
           COUNT(Pabellon.id_Pabellon) AS total_pabellones, 
           COUNT(Stand.id_Stand) AS total_stands, 
           COUNT(Charla.id_Charla) AS total_charlas
    FROM Feria
    JOIN Pabellon ON Feria.id_Feria = Pabellon.id_Feria
    JOIN Stand ON Pabellon.id_Pabellon = Stand.id_Pabellon
    JOIN Charla ON Feria.id_Feria = Feria.id_Feria
    WHERE Feria.id_Feria = 2;

    -- Consulta para Feria 3
    SELECT Feria.ciudad, Feria.duracion, Feria.descripcion, 
           COUNT(Demostracion.id_Demostracion) AS total_demostraciones, 
           COUNT(Charla.id_Charla) AS total_charlas, 
           COUNT(Visitantes.id_Visitantes) AS total_visitantes
    FROM Feria
    JOIN Pabellon ON Feria.id_Feria = Pabellon.id_Feria
    JOIN Stand ON Pabellon.id_Pabellon = Stand.id_Pabellon
    JOIN Demostracion ON Feria.id_Feria = Feria.id_Feria
    JOIN Charla ON Feria.id_Feria = Feria.id_Feria
    JOIN Registro ON Feria.id_Feria = Feria.id_Feria
    JOIN Visitantes ON Registro.id_Visitantes = Visitantes.id_Visitantes
    WHERE Feria.id_Feria = 3;
END;