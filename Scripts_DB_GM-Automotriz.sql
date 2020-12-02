---CREACIÓN DE TABLAS:
CREATE TABLE `gm_automotriz`.`cliente` (
    `idCliente` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(65) NOT NULL,
    `apellido` VARCHAR(45) NOT NULL,
    `dui` VARCHAR(45) NOT NULL,
    `telefono` VARCHAR(12) NOT NULL,
    PRIMARY KEY (`idCliente`)
) COMMENT = 'Table For Clients';

CREATE TABLE `gm_automotriz`.`vehiculo` (
    `idvehiculo` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `codCliente` INT UNSIGNED NOT NULL,
    `marca` VARCHAR(45) NOT NULL,
    'modelo' VARCHAR(45) NOT NULL,
    `anio` INT NOT NULL,
    `placa` VARCHAR(45) NULL,
    `color` VARCHAR(45) NULL,
    `traccion` VARCHAR(45) NULL,
    `motor` VARCHAR(45) NULL,
    PRIMARY KEY (`idvehiculo`)
);

CREATE TABLE `gm_automotriz`.`reparacion` (
    `idreparacion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `placa` VARCHAR(45) NOT NULL,
    `reparacion` VARCHAR(75) NOT NULL,
    `coste_reparacion` DOUBLE NOT NULL,
    PRIMARY KEY (`idreparacion`)
);

CREATE TABLE `gm_automotriz`.`servicio` (
    `idservicio` INT NOT NULL,
    `placa` VARCHAR(45) NOT NULL,
    `servicio` VARCHAR(120) NOT NULL,
    `coste_servicio` DOUBLE NOT NULL,
    PRIMARY KEY (`idservicio`)
);

--ALTER TABLE (ADDICIÓN DE LLAVES):
ALTER TABLE
    `gm_automotriz`.`vehiculo`
ADD
    INDEX `id_cliente_idx` (`codCliente` ASC) VISIBLE;

;

ALTER TABLE
    `gm_automotriz`.`vehiculo`
ADD
    CONSTRAINT `id_cliente` FOREIGN KEY (`codCliente`) REFERENCES `gm_automotriz`.`cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    `gm_automotriz`.`reparacion`
ADD
    INDEX `id_placa_idx` (`placa` ASC) VISIBLE;

;

ALTER TABLE
    `gm_automotriz`.`reparacion`
ADD
    CONSTRAINT `id_placa` FOREIGN KEY (`placa`) REFERENCES `gm_automotriz`.`vehiculo` (`marca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    `gm_automotriz`.`reparacion`
ADD
    CONSTRAINT `placa` FOREIGN KEY (`placa`) REFERENCES `gm_automotriz`.`vehiculo` (`placa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE
    `gm_automotriz`.`servicio`
ADD
    INDEX `placa_vehiculo_idx` (`placa` ASC) VISIBLE;

;

ALTER TABLE
    `gm_automotriz`.`servicio`
ADD
    CONSTRAINT `placa_vehiculo` FOREIGN KEY (`placa`) REFERENCES `gm_automotriz`.`vehiculo` (`placa`) ON DELETE NO ACTION ON UPDATE NO ACTION;