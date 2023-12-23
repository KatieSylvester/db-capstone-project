-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db-capstone-project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db-capstone-project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db-capstone-project` DEFAULT CHARACTER SET utf8 ;
USE `db-capstone-project` ;

-- -----------------------------------------------------
-- Table `db-capstone-project`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Staff` (
  `StaffID` VARCHAR(25) NOT NULL,
  `FullName` VARCHAR(45) NULL,
  `Role` VARCHAR(45) NULL,
  `Salary` FLOAT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Customers` (
  `CustomerID` VARCHAR(25) NOT NULL,
  `FullName` VARCHAR(45) NULL,
  `PhoneNumber` VARCHAR(15) NULL,
  `Email` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `PostalCode` VARCHAR(45) NULL,
  `CountryCode` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`MenuItems` (
  `MenuItemID` INT UNSIGNED NOT NULL,
  `CourseName` VARCHAR(45) NULL,
  `StarterName` VARCHAR(45) NULL,
  `DessertName` VARCHAR(45) NULL,
  `Drink` VARCHAR(45) NULL,
  `Sides` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuItemID`),
  UNIQUE INDEX `MenuItemID_UNIQUE` (`MenuItemID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Menu` (
  `MenuID` INT NOT NULL,
  `MenuItemID` INT UNSIGNED NOT NULL,
  `MenuName` VARCHAR(45) NULL,
  `Cuisine` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `MenuItemID_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `MenuItemID`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `db-capstone-project`.`MenuItems` (`MenuItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Orders` (
  `OrderID` VARCHAR(25) NOT NULL,
  `CustomerID` VARCHAR(25) NULL,
  `MenuItemID` INT NULL,
  `OrderDate` DATE NULL,
  `Quantity` INT NULL,
  `Cost` FLOAT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `Customer ID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `Menu Item ID_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `Customer ID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `db-capstone-project`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Menu Item ID`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `db-capstone-project`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `OrderID` VARCHAR(25) NULL,
  `CustomerID` VARCHAR(25) NULL,
  `DeliveryDate` DATE NULL,
  `DeliveryStatus` VARCHAR(45) NULL,
  `DeliveryCost` FLOAT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `Order ID_idx` (`OrderID` ASC) VISIBLE,
  INDEX `Customer ID_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `Order ID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `db-capstone-project`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Customer ID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `db-capstone-project`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Bookings` (
  `BookingID` VARCHAR(25) NOT NULL,
  `CustomerID` VARCHAR(25) NULL,
  `StaffID` VARCHAR(25) NULL,
  `BookingDate` DATE NULL,
  `TableNumber` INT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `Customer ID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `Staff ID_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `Customer ID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `db-capstone-project`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Staff ID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `db-capstone-project`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
