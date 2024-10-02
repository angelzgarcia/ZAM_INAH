-- MySQL Script generated by MySQL Workbench
-- Tue Oct  1 15:47:13 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rol` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Rol` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Usuario` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `google_id` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `genero` VARCHAR(10) NOT NULL,
  `foto` BLOB NOT NULL,
  `email` VARCHAR(65) NOT NULL,
  `numero` BIGINT NOT NULL,
  `password` VARCHAR(25) NOT NULL,
  `token` VARCHAR(8) NOT NULL,
  `confirmado` TINYINT NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  `idRol` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `idRol_idx` (`idRol` ASC) VISIBLE,
  CONSTRAINT `idRol`
    FOREIGN KEY (`idRol`)
    REFERENCES `Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Cultura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cultura` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Cultura` (
  `idCultura` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `significado` VARCHAR(200) NOT NULL,
  `descripcion` VARCHAR(1200) NOT NULL,
  `foto` BLOB NOT NULL,
  PRIMARY KEY (`idCultura`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `EstadoRepublica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EstadoRepublica` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `EstadoRepublica` (
  `idEstadoRepublica` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `foto` BLOB NOT NULL,
  PRIMARY KEY (`idEstadoRepublica`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Ubicacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ubicacion` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Ubicacion` (
  `idUbicacion` INT NOT NULL AUTO_INCREMENT,
  `latitud` DECIMAL(6,3) NOT NULL,
  `longitud` DECIMAL(6,3) NOT NULL,
  PRIMARY KEY (`idUbicacion`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ZonaArqueologica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZonaArqueologica` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ZonaArqueologica` (
  `idZonaArqueologica` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `foto` BLOB NOT NULL,
  `significado` VARCHAR(200) NOT NULL,
  `descripcion` VARCHAR(1200) NOT NULL,
  `acceso` VARCHAR(500) NOT NULL,
  `horario` VARCHAR(60) NOT NULL,
  `costoEntrada` DECIMAL(4,2) NOT NULL,
  `contacto` VARCHAR(50) NOT NULL,
  `idCultura` INT NOT NULL,
  `idEstado` INT NOT NULL,
  `idUbicacion` INT NOT NULL,
  PRIMARY KEY (`idZonaArqueologica`),
  INDEX `idCultura_idx` (`idCultura` ASC) VISIBLE,
  INDEX `idEstado_idx` (`idEstado` ASC) VISIBLE,
  INDEX `idUbicacion_idx` (`idUbicacion` ASC) VISIBLE,
  CONSTRAINT `idCultura`
    FOREIGN KEY (`idCultura`)
    REFERENCES `Cultura` (`idCultura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEstado`
    FOREIGN KEY (`idEstado`)
    REFERENCES `EstadoRepublica` (`idEstadoRepublica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUbicacion`
    FOREIGN KEY (`idUbicacion`)
    REFERENCES `Ubicacion` (`idUbicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Resenia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Resenia` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Resenia` (
  `idResenia` INT NOT NULL AUTO_INCREMENT,
  `mensaje` VARCHAR(200) NOT NULL,
  `puntuacion` INT NOT NULL,
  `foto` BLOB NOT NULL,
  `idUsuario` INT NULL,
  PRIMARY KEY (`idResenia`),
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
