-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mymall
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mymall
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mymall` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mymall` ;

-- -----------------------------------------------------
-- Table `mymall`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mymall`.`admin` (
  `id` VARCHAR(120) NOT NULL,
  `pwd` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mymall`.`shoppingmall`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mymall`.`shoppingmall` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NOT NULL,
  `content` VARCHAR(1024) NOT NULL,
  `url` VARCHAR(1024) NOT NULL,
  `best_code` INT NOT NULL,
  `image_name` VARCHAR(256) NULL DEFAULT NULL,
  `admin_id` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shoppingmall_admin1_idx` (`admin_id` ASC) VISIBLE,
  CONSTRAINT `fk_shoppingmall_admin1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `mymall`.`admin` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mymall`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mymall`.`user` (
  `id` VARCHAR(120) NOT NULL,
  `pwd` VARCHAR(120) NOT NULL,
  `name` VARCHAR(120) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mymall`.`bookmark`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mymall`.`bookmark` (
  `user_id` VARCHAR(120) NOT NULL,
  `shoppingmall_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `shoppingmall_id`),
  INDEX `fk_bookmark_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_bookmark_shoppingmall1_idx` (`shoppingmall_id` ASC) VISIBLE,
  CONSTRAINT `fk_bookmark_shoppingmall1`
    FOREIGN KEY (`shoppingmall_id`)
    REFERENCES `mymall`.`shoppingmall` (`id`),
  CONSTRAINT `fk_bookmark_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mymall`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mymall`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mymall`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NOT NULL,
  `img` VARCHAR(1024) NOT NULL,
  `price` VARCHAR(120) NOT NULL,
  `url` VARCHAR(1024) NOT NULL,
  `shoppingmall_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_shoppingmall1_idx` (`shoppingmall_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_shoppingmall1`
    FOREIGN KEY (`shoppingmall_id`)
    REFERENCES `mymall`.`shoppingmall` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2467
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mymall`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mymall`.`likes` (
  `user_id` VARCHAR(120) NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `product_id`),
  INDEX `fk_likes_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_likes_product1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_likes_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mymall`.`product` (`id`),
  CONSTRAINT `fk_likes_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mymall`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
