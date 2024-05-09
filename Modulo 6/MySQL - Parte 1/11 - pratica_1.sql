-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pratica_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pratica_1` DEFAULT CHARACTER SET utf8 ;
USE `pratica_1` ;

-- -----------------------------------------------------
-- Table `pratica_1`.`tipo_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pratica_1`.`tipo_produto` (
  `idTipo_produto` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_produto`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `pratica_1`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pratica_1`.`produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `idTipo_produto` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`idProduto`),
  INDEX `fk_produto_idx` (`idTipo_produto` ASC) VISIBLE,
  CONSTRAINT `fk_tipo_produto`
    FOREIGN KEY (`idTipo_produto`)
    REFERENCES `pratica_1`.`tipo_produto` (`idTipo_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


--------------------------------------------------------
------------------SEM_VÍNCULO---------------------------
--------------------------------------------------------


-- -----------------------------------------------------
-- Table `pratica_1`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pratica_1`.`paciente` (
  `idPaciente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `endereco` VARCHAR(50) NOT NULL,
  `bairro` VARCHAR(40) NOT NULL,
  `cidade` VARCHAR(40) NOT NULL,
  `estado` VARCHAR(2) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `data_nasc` DATE NOT NULL,
  PRIMARY KEY (`idPaciente`))
ENGINE = InnoDB;


--------------------------------------------------------
------------------SEM_VÍNCULO---------------------------
--------------------------------------------------------


-- -----------------------------------------------------
-- Table `pratica_1`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pratica_1`.`professor` (
  `idProfessor` INT NOT NULL AUTO_INCREMENT,
  `telefone` INT NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`idProfessor`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `pratica_1`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pratica_1`.`turma` (
  `idTurma` INT NOT NULL AUTO_INCREMENT,
  `idProfessor` INT NOT NULL,
  `capacidade` INT NOT NULL,
  PRIMARY KEY (`idTurma`),
  INDEX `fk_professor_idx` (`idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_professor`
    FOREIGN KEY (`idProfessor`)
    REFERENCES `pratica_1`.`professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
