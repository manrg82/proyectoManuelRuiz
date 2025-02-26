-- Tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    contraseña VARCHAR2(255) NOT NULL
);
CREATE SEQUENCE seq_usuario START WITH 1 INCREMENT BY 1;
-- Tabla Organizadores
CREATE TABLE Organizadores (
    id_organizador NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    contacto VARCHAR2(100) NOT NULL
);
CREATE SEQUENCE seq_organizador START WITH 1 INCREMENT BY 1;
-- Tabla Categorías
CREATE TABLE Categorias (
    id_categoria NUMBER PRIMARY KEY,
    nombre VARCHAR2(50) UNIQUE NOT NULL
);
CREATE SEQUENCE seq_categoria START WITH 1 INCREMENT BY 1;
-- Tabla Ubicaciones
CREATE TABLE Ubicaciones (
    id_ubicacion NUMBER PRIMARY KEY,
    tipo VARCHAR2(20) CHECK (tipo IN ('Presencial', 'Online')),
    direccion VARCHAR2(255),  -- Solo para eventos presenciales
    enlace_online VARCHAR2(255)  -- Solo para eventos online
);
CREATE SEQUENCE seq_ubicacion START WITH 1 INCREMENT BY 1;
-- Tabla Eventos
CREATE TABLE Eventos (
    id_evento NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    fecha DATE NOT NULL,
    duracion NUMBER NOT NULL,  -- Duración en horas
    id_ubicacion NUMBER NOT NULL,
    id_organizador NUMBER,
    id_categoria NUMBER,
    FOREIGN KEY (id_ubicacion) REFERENCES Ubicaciones(id_ubicacion) ON DELETE CASCADE,
    FOREIGN KEY (id_organizador) REFERENCES Organizadores(id_organizador) ON DELETE SET NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria) ON DELETE SET NULL
);
CREATE SEQUENCE seq_evento START WITH 1 INCREMENT BY 1;
-- Tabla Inscripciones
CREATE TABLE Inscripciones (
    id_inscripcion NUMBER PRIMARY KEY,
    id_usuario NUMBER NOT NULL,
    id_evento NUMBER NOT NULL,
    fecha_inscripcion TIMESTAMP DEFAULT SYSTIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento) ON DELETE CASCADE,
    CONSTRAINT unique_inscripcion UNIQUE (id_usuario, id_evento)  -- Evita inscripciones duplicadas
);
CREATE SEQUENCE seq_inscripcion START WITH 1 INCREMENT BY 1;