-- ============================================================================
-- 2. CONSULTAS SQL (DQL)
-- ============================================================================

-- A. Consultas individuales para verificar el contenido de cada tabla
SELECT * FROM LOCALIDAD;
SELECT * FROM ESTADO_ALERTA;
SELECT * FROM TIPO_DOCUMENTO;
SELECT * FROM TIPO_RH;
SELECT * FROM EPS;
SELECT * FROM CONDICION_MEDICA;
SELECT * FROM GRADO_DISCAPACIDAD;
SELECT * FROM BARRIO;
SELECT * FROM TIPO_ALERTA;
SELECT * FROM USUARIO;
SELECT * FROM UBICACION;
SELECT * FROM CONTACTO_EMERGENCIA;
SELECT * FROM USUARIO_CONDICION;
SELECT * FROM USUARIO_DISCAPACIDAD;
SELECT * FROM LUGARES_FRECUENTES;
SELECT * FROM LISTA_ALERTAS;

-- B. Consulta avanzada: Detalle general de Alertas emitidas con información del usuario y ubicación
SELECT 
    A.ID_Alerta,
    U.Nombre AS Usuario,
    TD.Nombre_Doc AS Tipo_Documento,
    U.Num_Doc,
    TA.Nombre_Alerta,
    EA.Nombre_Estado AS Estado_Alerta,
    UB.Direccion,
    B.Nombre_Barrio,
    L.Nombre_Localidad,
    A.Fecha_Hora,
    A.Indicaciones
FROM LISTA_ALERTAS A
JOIN USUARIO U ON A.ID_Usuario = U.ID_Usuario
JOIN TIPO_DOCUMENTO TD ON U.ID_Tipo_Doc = TD.ID_Tipo_Doc
JOIN TIPO_ALERTA TA ON A.ID_Tipo_Alerta = TA.ID_Tipo_Alerta
JOIN ESTADO_ALERTA EA ON TA.ID_Estado = EA.ID_Estado
JOIN UBICACION UB ON A.ID_Ubicacion = UB.ID_Ubicacion
JOIN BARRIO B ON UB.ID_Barrio = B.ID_Barrio
JOIN LOCALIDAD L ON B.ID_Localidad = L.ID_Localidad;

-- C. Consulta avanzada: Perfil médico de usuarios con EPS, RH y Condiciones de salud
SELECT 
    U.Nombre AS Usuario,
    RH.Grupo_RH,
    E.Nombre_EPS,
    COALESCE(CM.Tipo_Condicion, 'Sin condición registrada') AS Condicion_Medica,
    COALESCE(GD.Discapacidad, 'Sin discapacidad registrada') AS Discapacidad
FROM USUARIO U
JOIN TIPO_RH RH ON U.ID_RH = RH.ID_RH
JOIN EPS E ON U.ID_EPS = E.ID_EPS
LEFT JOIN USUARIO_CONDICION UC ON U.ID_Usuario = UC.ID_Usuario
LEFT JOIN CONDICION_MEDICA CM ON UC.ID_Condicion = CM.ID_Condicion
LEFT JOIN USUARIO_DISCAPACIDAD UD ON U.ID_Usuario = UD.ID_Usuario
LEFT JOIN GRADO_DISCAPACIDAD GD ON UD.ID_Discapacidad = GD.ID_Discapacidad;

```