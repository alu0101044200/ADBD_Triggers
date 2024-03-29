-- MySQL Script generated by MySQL Workbench
-- jue 14 nov 2019 13:11:38 WET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering



-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------


-- -----------------------------------------------------
-- Table FAMILIA
-- -----------------------------------------------------
CREATE TABLE  FAMILIA (
  nombre VARCHAR(45) NOT NULL,
  incompatibilidades VARCHAR(45) NULL,
  PRIMARY KEY (nombre))
;


-- -----------------------------------------------------
-- Table ENFERMEDAD
-- -----------------------------------------------------
CREATE TABLE  ENFERMEDAD (
  nombre VARCHAR(45) NOT NULL,
  sintoma VARCHAR(45) NULL,
  PRIMARY KEY (nombre))
;


-- -----------------------------------------------------
-- Table FAMILIA_ENFERMEDAD
-- -----------------------------------------------------
CREATE TABLE  FAMILIA_ENFERMEDAD (
  nombre_fa VARCHAR(45) NOT NULL,
  nombre_enf VARCHAR(45) NOT NULL,
  PRIMARY KEY (nombre_fa, nombre_enf),
  CONSTRAINT nombre_fa
    FOREIGN KEY (nombre_fa)
    REFERENCES FAMILIA (nombre)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT nombre_enf
    FOREIGN KEY (nombre_enf)
    REFERENCES ENFERMEDAD (nombre)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table LABORATORIO
-- -----------------------------------------------------
CREATE TABLE  LABORATORIO (
  codigo INT NOT NULL,
  contacto VARCHAR(45) NULL,
  nombre VARCHAR(45) NULL,
  tfno INT NULL,
  calle VARCHAR(45) NULL,
  numero INT NULL,
  cp INT NULL,
  PRIMARY KEY (codigo))
;


-- -----------------------------------------------------
-- Table MEDICAMENTOS
-- -----------------------------------------------------
CREATE TABLE  MEDICAMENTOS (
  codigo INT NOT NULL,
  nombre VARCHAR(45) NULL,
  igic INT NULL,
  precio INT NULL,
  posologia VARCHAR(45) NULL,
  tipo VARCHAR(45) NOT NULL,
  laboratorio INT NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT laboratorio
    FOREIGN KEY (laboratorio)
    REFERENCES LABORATORIO (codigo)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table MEDICAMENTO_FAMILIA
-- -----------------------------------------------------
CREATE TABLE  MEDICAMENTO_FAMILIA (
  codigo INT NOT NULL,
  nombre_fa VARCHAR(45) NULL,
  PRIMARY KEY (codigo),
  CONSTRAINT codigo
    FOREIGN KEY (codigo)
    REFERENCES MEDICAMENTOS (codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT nombre_fa
    FOREIGN KEY (nombre_fa)
    REFERENCES FAMILIA (nombre)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table COMPRA
-- -----------------------------------------------------
CREATE TABLE  COMPRA (
  fecha_actual DATE NOT NULL,
  importe INT NULL,
  PRIMARY KEY (fecha_actual))
;


-- -----------------------------------------------------
-- Table COMPRA_MEDICAMENTOS
-- -----------------------------------------------------
CREATE TABLE  COMPRA_MEDICAMENTOS (
  codigo INT NOT NULL,
  fecha_compra DATE NOT NULL,
  unidades INT NULL,
  igic INT NULL,
  importe INT NULL,
  PRIMARY KEY (codigo, fecha_compra),
  CONSTRAINT codigo
    FOREIGN KEY (codigo)
    REFERENCES MEDICAMENTOS (codigo)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT fecha_compra
    FOREIGN KEY (fecha_compra)
    REFERENCES COMPRA (fecha_actual)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
;

-- -----------------------------------------------------
-- Table CLIENTE_CREDITO
-- -----------------------------------------------------
CREATE TABLE CLIENTE_CREDITO (
  cc INT NOT NULL,
  nombre VARCHAR(45) NULL,
  dia_pago DATE NULL,
  PRIMARY KEY (cc)
);


-- -----------------------------------------------------
-- Table PAGO_CREDITO
-- -----------------------------------------------------
CREATE TABLE PAGO_CREDITO (
  mes INT NOT NULL,
  año INT NOT NULL,
  fecha_compra DATE NOT NULL,
  cantidad INT NULL,
  cc INT NULL,
  PRIMARY KEY (fecha_compra, mes, año),
  CONSTRAINT fecha_compra
    FOREIGN KEY (fecha_compra)
    REFERENCES COMPRA (fecha_actual)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT cc
	FOREIGN KEY(cc)
	REFERENCES CLIENTE_CREDITO (cc)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION)
;



