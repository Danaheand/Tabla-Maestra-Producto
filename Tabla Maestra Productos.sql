use comercial;
/* Creación de tabla para unidades de medida */
CREATE TABLE UNIDADES_MEDIDA (
   UMCODIGO             CHAR(3) NOT NULL,
   UMDESCRIPCION        VARCHAR(100) NOT NULL,
   PRIMARY KEY (UMCODIGO)
);

/* Insertamos ejemplos de unidades de medida */
INSERT INTO UNIDADES_MEDIDA (UMCODIGO, UMDESCRIPCION) VALUES
('kg', 'Kilogramos'),    /* Para peso */
('gr', 'Gramos'),        /* Para peso */
('lt', 'Litros'),        /* Para volumen líquido */
('ml', 'Mililitros'),    /* Para volumen líquido */
('un', 'Unidades'),      /* Para conteo de artículos */
('m', 'Metros'),         /* Para longitud */
('cm', 'Centímetros'),   /* Para longitud */
('mm', 'Milímetros');    /* Para longitud */

/* Creación de tabla para estados del producto */
CREATE TABLE ESTADOS_PRODUCTO (
   ESTCODIGO            CHAR(3) NOT NULL,
   ESTDESCRIPCION       VARCHAR(100) NOT NULL,
   PRIMARY KEY (ESTCODIGO)
);

/* Insertamos algunos estados posibles para los productos */
INSERT INTO ESTADOS_PRODUCTO (ESTCODIGO, ESTDESCRIPCION) VALUES
('ACT', 'Activo'),       /* Disponible para la venta o uso */
('INA', 'Inactivo'),     /* No disponible temporalmente */
('DIS', 'Discontinuado'),/* No volverá a estar disponible */
('ESC', 'Escasez');      /* Poca cantidad disponible */

/* Creación de la tabla PRODUCTOS */
CREATE TABLE PRODUCTOS (
   PROCODIGO            VARCHAR(10) NOT NULL,
   PRODESCRIPCION       VARCHAR(100) NOT NULL,
   PROUNIDADMEDIDA      CHAR(3) NOT NULL,
   PROSALDOINICIAL      DECIMAL(9,2) NOT NULL CHECK (PROSALDOINICIAL >= 0),
   PROINGRESOS          DECIMAL(9,2) NOT NULL CHECK (PROINGRESOS >= 0),
   PROEGRESOS           DECIMAL(9,2) NOT NULL CHECK (PROEGRESOS >= 0),
   PROAJUSTES           DECIMAL(9,2) NOT NULL CHECK (PROAJUSTES >= 0),
   PROSALDOFINAL        DECIMAL(9,2) NOT NULL CHECK (PROSALDOFINAL >= 0),
   PROCOSTOUM           DECIMAL(7,2) NOT NULL CHECK (PROCOSTOUM >= 0),
   PROPRECIOUM          DECIMAL(7,2) NOT NULL CHECK (PROPRECIOUM >= 0),
   PROSTATUS            CHAR(3) NOT NULL,
   PROFOTO              MEDIUMBLOB,
   PRIMARY KEY (PROCODIGO),
   CONSTRAINT fk_unidad_medida FOREIGN KEY (PROUNIDADMEDIDA) REFERENCES UNIDADES_MEDIDA(UMCODIGO),
   CONSTRAINT fk_prostatus FOREIGN KEY (PROSTATUS) REFERENCES ESTADOS_PRODUCTO(ESTCODIGO)
);
INSERT INTO PRODUCTOS (
    PROCODIGO, PRODESCRIPCION, PROUNIDADMEDIDA, PROSALDOINICIAL, PROINGRESOS, PROEGRESOS,
    PROAJUSTES, PROSALDOFINAL, PROCOSTOUM, PROPRECIOUM, PROSTATUS
) VALUES
    ('P-0001', 'CEREAL TRIGO ENTERO', 'un', 100, 50, 20, 5, 135, 0.50, 1.00, 'ACT'),
    ('P-0002', 'MORA FRUTO COMPLETO', 'un', 200, 100, 50, 10, 260, 0.20, 0.45, 'ACT'),
    ('P-0003', 'CARNE DE CERDO CON HUESO', 'kg', 150, 70, 30, 0, 190, 3.50, 5.00, 'ACT'),
    ('P-0004', 'SARDINAS EN CONSERVA', 'un', 300, 150, 75, 25, 400, 0.85, 1.50, 'ACT'),
    ('P-0005', 'LECHE LÍQUIDA PASTEURIZADA', 'lt', 500, 300, 200, 0, 600, 0.90, 1.20, 'ACT'),
    ('P-0006', 'ATÚN EN CONSERVA', 'un', 400, 200, 100, 50, 550, 0.95, 1.75, 'ACT'),
    ('P-0007', 'JUGO DE NARANJA', 'lt', 250, 120, 80, 0, 290, 0.55, 1.10, 'ACT'),
    ('P-0008', 'HARINA DE TRIGO', 'kg', 800, 400, 300, 50, 950, 0.20, 0.40, 'ACT'),
    ('P-0009', 'ARROZ BLANCO', 'un', 600, 300, 150, 30, 780, 0.15, 0.30, 'ACT'),
    ('P-0010', 'FRIJOLES NEGROS', 'kg', 500, 250, 125, 25, 650, 0.45, 0.90, 'ACT');
    
    
    