 ```sql
USE sistema_alertas;

-- ============================================================================
-- 1. INSERCIÓN DE DATOS (4 REGISTROS POR TABLA)
-- ============================================================================

-- 1. LOCALIDAD (Tablas independientes)
INSERT INTO LOCALIDAD (Nombre_Localidad) VALUES
('Usaquén'),
('Chapinero'),
('Santa Fe'),
('Suba');

-- 2. ESTADO_ALERTA
INSERT INTO ESTADO_ALERTA (Nombre_Estado) VALUES
('Activa'),
('En Atencion'),
('Resuelta'),
('Cancelada');

-- 3. TIPO_DOCUMENTO
INSERT INTO TIPO_DOCUMENTO (Nombre_Doc) VALUES
('Cédula de Ciudadanía'),
('Tarjeta de Identidad'),
('Cédula de Extranjería'),
('Pasaporte');

-- 4. TIPO_RH
INSERT INTO TIPO_RH (Grupo_RH) VALUES
('O+'),
('O-'),
('A+'),
('AB+');

-- 5. EPS
INSERT INTO EPS (Nombre_EPS, Direccion_EPS, Telefono, Email) VALUES
('Sura EPS', 'Calle 100 # 15-20', '6013001111', 'contacto@sura.com.co'),
('Sanitas EPS', 'Carrera 7 # 45-10', '6013002222', 'servicio@sanitas.com.co'),
('Compensar EPS', 'Avenida Caracas # 32-50', '6013003333', 'atencion@compensar.com.co'),
('Salud Total EPS', 'Calle 26 # 68-15', '6013004444', 'info@saludtotal.com.co');

-- 6. CONDICION_MEDICA
INSERT INTO CONDICION_MEDICA (Tipo_Condicion, Descripcion) VALUES
('Hipertensión', 'Presión arterial elevada de manera continua.'),
('Diabetes Tipo 2', 'Niveles elevados de glucosa en sangre.'),
('Asma', 'Enfermedad respiratoria crónica.'),
('Alergia a Medicamentos', 'Reacción adversa a la penicilina y derivados.');

-- 7. GRADO_DISCAPACIDAD
INSERT INTO GRADO_DISCAPACIDAD (Discapacidad) VALUES
('Visual Leve'),
('Discapacidad visual moderada'),
('Discapacidad visual grave'),
('Ceguera');

-- 8. BARRIO (Depende de LOCALIDAD)
INSERT INTO BARRIO (ID_Localidad, Nombre_Barrio) VALUES
(1, 'Santa Bárbara'),
(2, 'Zona G'),
(3, 'Las Nieves'),
(4, 'San Cristobal'),
(5, 'El Rincón');

-- 9. TIPO_ALERTA (Depende de ESTADO_ALERTA)
INSERT INTO TIPO_ALERTA (ID_Estado, Nombre_Alerta) VALUES
(1, 'Emergencia Médica'),
(1, 'Seguridad Ciudadana'),
(2, 'Incendio Estructural'),
(3, 'Accidente de Tránsito');

-- 10. USUARIO (Depende de TIPO_DOCUMENTO, TIPO_RH y EPS)
INSERT INTO USUARIO (ID_Tipo_Doc, Num_Doc, Nombre, Fecha_Nacimiento, ID_RH, ID_EPS) VALUES
(1, '1018456789', 'Carlos Mendoza', '1990-05-14', 1, 1),
(1, '1020304050', 'María Rodríguez', '1985-11-22', 2, 2),
(2, '1098765432', 'Andrés Gómez', '2008-03-10', 3, 3),
(3, '5544332211', 'Laura Martínez', '1995-08-30', 4, 4);

-- 11. UBICACION (Depende de BARRIO)
INSERT INTO UBICACION (ID_Barrio, Direccion, Latitud, Longitud) VALUES
(1, 'Calle 122 # 15-30', 4.70123400, -74.03210000),
(2, 'Carrera 5 # 69-10', 4.65432100, -74.05430000),
(3, 'Carrera 7 # 18-40', 4.60112200, -74.07220000),
(4, 'Calle 129 # 91-05', 4.74567800, -74.09870000);

-- 12. CONTACTO_EMERGENCIA (Depende de USUARIO)
INSERT INTO CONTACTO_EMERGENCIA (ID_Usuario, Nombre, Num_Tel, Direccion) VALUES
(1, 'Ana Mendoza', '3101234567', 'Calle 122 # 15-30'),
(2, 'Jorge Rodríguez', '3209876543', 'Carrera 5 # 69-10'),
(3, 'Lucía Gómez', '3155558888', 'Carrera 7 # 18-40'),
(4, 'Felipe Martínez', '3004441111', 'Calle 129 # 91-05');

-- 13. USUARIO_CONDICION (Tabla Intermedia: USUARIO y CONDICION_MEDICA)
INSERT INTO USUARIO_CONDICION (ID_Usuario, ID_Condicion) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4);

-- 14. USUARIO_DISCAPACIDAD (Tabla Intermedia: USUARIO y GRADO_DISCAPACIDAD)
INSERT INTO USUARIO_DISCAPACIDAD (ID_Usuario, ID_Discapacidad) VALUES
(1, 3),
(2, 1),
(3, 2),
(4, 4);

-- 15. LUGARES_FRECUENTES (Depende de USUARIO y UBICACION)
INSERT INTO LUGARES_FRECUENTES (ID_Usuario, ID_Ubicacion, Alias_Lugar) VALUES
(1, 1, 'Casa'),
(2, 2, 'Oficina'),
(3, 3, 'Universidad'),
(4, 4, 'Casa de los padres');

-- 16. LISTA_ALERTAS (Depende de USUARIO, TIPO_ALERTA y UBICACION)
INSERT INTO LISTA_ALERTAS (ID_Usuario, ID_Tipo_Alerta, ID_Ubicacion, Indicaciones) VALUES
(1, 1, 1, 'Paciente presenta dolor agudo en el pecho.'),
(2, 2, 2, 'Reporte de robo en vía pública.'),
(3, 3, 3, 'Conato de incendio en edificio residencial.'),
(4, 4, 4, 'Colisión entre dos vehículos particulares.');
