/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : smartSale
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS smartSale;
USE smartSale;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT ,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin');


-- ----------------------------
-- Table structure for InStock
-- ----------------------------
DROP TABLE IF EXISTS `inStock`;
CREATE TABLE `inStock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT ,
  `itemId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `itemName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `inDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `quantity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `in_price` float NULL DEFAULT NULL COMMENT '价格',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of InStock
-- ----------------------------
INSERT INTO `inStock` VALUES (1, '0001', 'Coke', '2022-07-01', '100', 1.50, 'admin');
INSERT INTO `inStock` VALUES (2, '0002', 'coke Zero', '2022-07-01', '100', 1.00, 'admin');
INSERT INTO `inStock` VALUES (3, '0003', 'Coke', '2022-07-04', '100', 1.50, 'admin');

-- ----------------------------
-- Table structure for Type
-- ----------------------------
DROP TABLE IF EXISTS `productType`;
CREATE TABLE `productType`  (
  `id` int(11) NOT NULL AUTO_INCREMENT ,
  `typeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Type
-- ----------------------------
INSERT INTO `productType` VALUES (1, 'Drink');
INSERT INTO `productType` VALUES (2, 'Snack');
INSERT INTO `productType` VALUES (3, 'Food');
INSERT INTO `productType` VALUES (4, 'Veg');

-- ----------------------------
-- Table structure for Income and expenditure account information
-- ----------------------------
DROP TABLE IF EXISTS `ieAccount`;
CREATE TABLE `ieAccount`  (
  `id` int(11) NOT NULL AUTO_INCREMENT ,
  `ieDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `ieType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `amount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `note` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL  ,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Income and expenditure account information
-- ----------------------------

-- ----------------------------
-- Table structure for Sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale`  (
  `id` int(11) NOT NULL AUTO_INCREMENT ,
  `itemID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `itemName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `saleDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `quantity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `price` float NULL DEFAULT NULL ,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale
-- ----------------------------
INSERT INTO `sale` VALUES (1, '0002', 'Coke Zero', '2022-07-11', '2', 1.5, 'admin');
INSERT INTO `sale` VALUES (2, '0002', 'Coke Zero', '2022-07-12', '1', 1.5, 'admin');
INSERT INTO `sale` VALUES (3, '0001', 'Coke', '2022-07-12', '2', 2.00, '0001');
INSERT INTO `sale` VALUES (4, '0001', 'Coke', '2022-07-13', '1', 2.00, '0001');
INSERT INTO `sale` VALUES (5, '0001', 'Coke', '2022-07-13', '10', 2.00, 'admin');
INSERT INTO `sale` VALUES (6, '0001', 'Coke', '2022-07-13', '11', 2.00, 'admin');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `itemID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `typeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL COMMENT '价格',
  `manuName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `barCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `sku` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `note` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
  `pic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `stockArea` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Product
-- ----------------------------
INSERT INTO `product` VALUES (1, '0001', 'Coke', 'Drink', 2.00, 'The Coca-Cola Company Ireland', '5449000000996', '5449000000996', 'Soft Drink', 'N/A', 1000, '', 'Fridge 1');
INSERT INTO `product` VALUES (2, '0002', 'Coke Zero', 'Drink', 1.5, 'The Coca-Cola Company Ireland', '5449000131836', '5449000131836', 'Soft Drink', 'N/A', 1000, '', 'Fridge 1');

-- ----------------------------
-- Table structure for Staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `id` int(11) NOT NULL AUTO_INCREMENT ,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `staffName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `age` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Staff
-- ----------------------------
INSERT INTO `staff` VALUES (2, '0001', '0001', 'Louis', 'Male', '26', '0870515255', 'Dulbin');

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for Sale
-- ----------------------------
DROP TABLE IF EXISTS `sale_tmp`;
CREATE TABLE `sale_tmp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT ,
  `itemID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `itemName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `saleDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `quantity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  `price` float NULL DEFAULT NULL ,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci  ROW_FORMAT = Dynamic;
