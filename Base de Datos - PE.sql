CREATE DATABASE dbPE;
USE dbPE;

CREATE TABLE tbl_TipoUsuario(
	idTipoUsuario BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	eliminado BIT DEFAULT ((0)) NOT NULL
)

CREATE TABLE tbl_Usuario(
	idUsuario BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	correoElectronico VARCHAR(150),
	telefono VARCHAR(15) NOT NULL,
	contrasenha VARCHAR(20) NOT NULL,
	idTipoUsuario BIGINT FOREIGN KEY REFERENCES tbl_TipoUsuario(idTipoUsuario) NOT NULL,
	eliminado BIT DEFAULT ((0)) NOT NULL
)

CREATE TABLE tbl_Institucion(
	idInstitucion BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	eliminado BIT DEFAULT ((0)) NOT NULL
)

CREATE TABLE tbl_Materia(
	idMateria BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	idInstitucion BIGINT FOREIGN KEY REFERENCES tbl_Institucion(idInstitucion) NOT NULL,
	idUsuario BIGINT FOREIGN KEY REFERENCES tbl_Usuario(idUsuario) NOT NULL,
	eliminado BIT DEFAULT ((0)) NOT NULL
)

CREATE TABLE tbl_UsuarioMateria(
	idUsuarioMateria BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	idUsuario BIGINT FOREIGN KEY REFERENCES tbl_Usuario(idUsuario) NOT NULL,
	idMateria BIGINT FOREIGN KEY REFERENCES tbl_Materia(idMateria) NOT NULL,
	eliminado BIT DEFAULT ((0)) NOT NULL
)

CREATE TABLE tbl_Agenda(
	idAgenda BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	dia DATETIME NOT NULL,
	horaInicio TIME NOT NULL,
	horaFin TIME NOT NULL,
	aula VARCHAR(10) NOT NULL,
	idMateria BIGINT FOREIGN KEY REFERENCES tbl_Materia(idMateria) NOT NULL,
	eliminado BIT DEFAULT ((0)) NOT NULL
)

CREATE TABLE tbl_UsuarioAgenda(
	idUsuarioAgenda BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	idUsuario BIGINT FOREIGN KEY REFERENCES tbl_Usuario(idUsuario) NOT NULL,
	idAgenda BIGINT FOREIGN KEY REFERENCES tbl_Agenda(idAgenda) NOT NULL,
	fecha DATETIME DEFAULT GETDATE() NOT NULL,
	asistio BIT DEFAULT ((0)) NOT NULL,
	eliminado BIT DEFAULT ((0)) NOT NULL
)

CREATE TABLE tbl_Material(
	idMaterial BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	archivo VARCHAR(250) NOT NULL,
	fecha DATETIME DEFAULT GETDATE() NOT NULL,
	idMateria BIGINT FOREIGN KEY REFERENCES tbl_Materia(idMateria) NOT NULL,
	eliminado BIT DEFAULT ((0)) NOT NULL
)

CREATE TABLE tbl_Ponderacion(
	idPonderacion BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	nota DECIMAL( 3, 2 ) NOT NULL,
	esPromediable BIT DEFAULT ((0)) NOT NULL,
	fechaLimite DATETIME DEFAULT GETDATE() NOT NULL,
	idPonderacionRef BIGINT,
	eliminado BIT DEFAULT ((0)) NOT NULL
)

CREATE TABLE tbl_UsuarioPonderacion(
	idUsuarioPonderacion BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	idUsuario BIGINT FOREIGN KEY REFERENCES tbl_Usuario(idUsuario) NOT NULL,
	idPonderacion BIGINT FOREIGN KEY REFERENCES tbl_Ponderacion(idPonderacion) NOT NULL,
	nota DECIMAL( 3, 2 ) NOT NULL,
	fecha DATETIME DEFAULT GETDATE() NOT NULL,
	archivo VARCHAR(250) NOT NULL,
	eliminado BIT DEFAULT ((0)) NOT NULL
)