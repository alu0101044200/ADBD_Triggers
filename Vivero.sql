-- -----------------------------------------------------
-- Table Empleado
-- -----------------------------------------------------
CREATE TABLE  Empleado (
  dni VARCHAR(9) NOT NULL,
  productividad INT NOT NULL,
  histórico_puesto VARCHAR(64) NOT NULL,
  gestiones_clienteplus VARCHAR(45) NULL,
  PRIMARY KEY (dni));


-- -----------------------------------------------------
-- Table Clienteplus
-- -----------------------------------------------------
CREATE TABLE  Clienteplus (
  dni VARCHAR(9) NOT NULL,
  volumen_compras_mensual INT NOT NULL,
  n_pedidos INT NOT NULL,
  bonificación VARCHAR(45) NOT NULL,
  PRIMARY KEY (dni));


-- -----------------------------------------------------
-- Table Producto
-- -----------------------------------------------------
CREATE TABLE  Producto (
  id INT NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  PRIMARY KEY (id));


-- -----------------------------------------------------
-- Table Vivero
-- -----------------------------------------------------
CREATE TABLE  Vivero (
  cod INT NOT NULL,
  PRIMARY KEY (cod));


-- -----------------------------------------------------
-- Table Zona
-- -----------------------------------------------------
CREATE TABLE  Zona (
  cod INT NOT NULL,
  productividad INT NOT NULL,
  cod_vivero INT NOT NULL,
  PRIMARY KEY (cod, cod_vivero),
  CONSTRAINT cod_vivero
    FOREIGN KEY (cod_vivero)
    REFERENCES Vivero (cod)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table Zona_Producto
-- -----------------------------------------------------
CREATE TABLE  Zona_Producto (
  cantidad INT NOT NULL,
  idP INT NOT NULL,
  cod_zona INT NOT NULL,
  cod_vivero INT NOT NULL,
  PRIMARY KEY (idP, cod_zona, cod_vivero),
  CONSTRAINT cod_zona
    FOREIGN KEY (cod_zona, cod_vivero)
    REFERENCES Zona (cod, cod_vivero)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT idP
    FOREIGN KEY (idP)
    REFERENCES Producto (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table Empleado_Zona
-- -----------------------------------------------------
CREATE TABLE  Empleado_Zona (
  fecha_ini DATE NOT NULL,
  dniE VARCHAR(45) NOT NULL,
  cod_zona INT NOT NULL,
  cod_vivero INT NOT NULL,
  PRIMARY KEY (fecha_ini, dniE, cod_vivero, cod_zona),
  CONSTRAINT dniE
    FOREIGN KEY (dniE)
    REFERENCES Empleado (dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT cod_zona
    FOREIGN KEY (cod_zona, cod_vivero)
    REFERENCES Zona (cod, cod_vivero)
    ON DELETE CASCADE);


-- -----------------------------------------------------
-- Table Empleado_ClientePlus_Producto
-- -----------------------------------------------------
CREATE TABLE  Empleado_ClientePlus_Producto (
  id INT NOT NULL,
  fecha DATE NOT NULL,
  precio INT NOT NULL,
  dniE VARCHAR(45) NOT NULL,
  dniCP VARCHAR(45) NOT NULL,
  idP INT NOT NULL,
  PRIMARY KEY (id, dniCP, dniE, idP),
  CONSTRAINT dniE
    FOREIGN KEY (dniE)
    REFERENCES Empleado (dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT dniCP
    FOREIGN KEY (dniCP)
    REFERENCES Clienteplus (dni)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT idP
    FOREIGN KEY (idP)
    REFERENCES Producto (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

