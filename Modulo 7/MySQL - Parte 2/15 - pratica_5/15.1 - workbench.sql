-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema farmacia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `farmacia` DEFAULT CHARACTER SET utf8 ;
USE `farmacia` ;

-- -----------------------------------------------------
-- Table `farmacia`.`tipo_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia`.`tipo_produto` (
  `idTipo_produto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_produto`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `farmacia`.`fabricante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia`.`fabricante` (
  `idFabricante` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFabricante`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `farmacia`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia`.`produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `designacao` VARCHAR(45) NOT NULL,
  `composicao` VARCHAR(45) NOT NULL,
  `preco_venda` DECIMAL(8,2) NOT NULL,
  `idTipo_produto` INT NOT NULL,
  `idFabricante` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
  INDEX `fk_tipo_produto_idx` (`idTipo_produto` ASC) VISIBLE,
  INDEX `fk_fabricante_idx` (`idFabricante` ASC) VISIBLE,
  CONSTRAINT `fk_tipo_produto`
    FOREIGN KEY (`idTipo_produto`)
    REFERENCES `farmacia`.`tipo_produto` (`idTipo_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fabricante`
    FOREIGN KEY (`idFabricante`)
    REFERENCES `farmacia`.`fabricante` (`idFabricante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `farmacia`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(50) NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `localidade` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `farmacia`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia`.`medico` (
  `idMedico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `crm` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMedico`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `farmacia`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia`.`pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `idCliente` INT NOT NULL,
  `idMedico` INT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_cliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `fk_medico_idx` (`idMedico` ASC) VISIBLE,
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `farmacia`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medico`
    FOREIGN KEY (`idMedico`)
    REFERENCES `farmacia`.`medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `farmacia`.`produto_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia`.`produto_pedido` (
  `idProduto_pedido` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `idProduto` INT NOT NULL,
  PRIMARY KEY (`idProduto_pedido`),
  INDEX `fk_pedido_idx` (`idPedido` ASC) VISIBLE,
  INDEX `fk_produto_idx` (`idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_pedido`
    FOREIGN KEY (`idPedido`)
    REFERENCES `farmacia`.`pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto`
    FOREIGN KEY (`idProduto`)
    REFERENCES `farmacia`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `farmacia`.`receita_medica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacia`.`receita_medica` (
  `idReceita_medica` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idProduto` INT NOT NULL,
  `idMedico` INT NOT NULL,
  PRIMARY KEY (`idReceita_medica`),
  INDEX `fk_produto_idx` (`idProduto` ASC) VISIBLE,
  INDEX `fk_medico_idx` (`idMedico` ASC) VISIBLE,
  CONSTRAINT `fk_produto_receita`
    FOREIGN KEY (`idProduto`)
    REFERENCES `farmacia`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medico_receita`
    FOREIGN KEY (`idMedico`)
    REFERENCES `farmacia`.`medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
