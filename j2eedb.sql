/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : j2eedb

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 17/06/2019 22:08:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`categoryId`) USING BTREE,
  UNIQUE INDEX `categoryId`(`categoryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '电子产品');
INSERT INTO `category` VALUES (2, '生活用品');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `clientId` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cliName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cliTelephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cliEmail` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cliAddress` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`clientId`) USING BTREE,
  UNIQUE INDEX `clientId`(`clientId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', '小明', '000-12345', '12345@163.com', '北京');
INSERT INTO `client` VALUES ('2', '大明', '000-12345678', '2362563@QQ.com', '西安');
INSERT INTO `client` VALUES ('3', '小明', '000-12345', '12345@163.com', '西安');

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `contractId` int(11) NOT NULL AUTO_INCREMENT,
  `clientNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `employeeId` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contractName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contractContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `contractProduct` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contractStartTime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `contractValidity` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`contractId`) USING BTREE,
  UNIQUE INDEX `contractId`(`contractId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES (1, '小明（1）', '小黑（4）', '电脑购买', '购买100台华硕电脑', '小米手机,华为手机', '2019-06-05', '2019-06-27');
INSERT INTO `contract` VALUES (2, '小明（3）', '小明（3）', '电脑购买', '购买100台华硕电脑', '小米手机,华为手机', '2019-06-05', '2019-06-27');
INSERT INTO `contract` VALUES (3, '大明（2）', '小明（3）', '电脑购买', '购买100台华硕电脑', '小米手机,华为手机', '2019-05-08', '2019-06-19');
INSERT INTO `contract` VALUES (5, '小明（1）', '小明（3）', '电脑购买', '购买100台华硕电脑', '小米手机,华硕电脑', '2019-06-05', '2019-06-12');
INSERT INTO `contract` VALUES (8, '小明（1）', '小明（3）', '电脑购买', '购买100台华硕电脑', '小米手机', '2019-06-05', '2019-06-05');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `departmentId` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`departmentId`) USING BTREE,
  UNIQUE INDEX `departmentId`(`departmentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '技术部');
INSERT INTO `department` VALUES (2, '销售部');
INSERT INTO `department` VALUES (3, '人事部');

-- ----------------------------
-- Table structure for education
-- ----------------------------
DROP TABLE IF EXISTS `education`;
CREATE TABLE `education`  (
  `eduId` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `eduName` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`eduId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of education
-- ----------------------------
INSERT INTO `education` VALUES ('1', '高中');
INSERT INTO `education` VALUES ('2', '大专');
INSERT INTO `education` VALUES ('3', '本科');
INSERT INTO `education` VALUES ('4', '硕士');
INSERT INTO `education` VALUES ('5', '博士');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `employeeId` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `empName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `empSex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `empBirthday` date NULL DEFAULT NULL,
  `empDepartment` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `empTitle` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `empHireDate` date NULL DEFAULT NULL,
  `empSalary` decimal(10, 0) NULL DEFAULT NULL,
  `empTelephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `empEmail` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `empAddress` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `empEducation` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`employeeId`) USING BTREE,
  UNIQUE INDEX `employeeId`(`employeeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '小明', '男', '1999-06-23', '技术部', '程序员', '2019-06-14', 200, '123222222', '123222222@166.com', '北京', '硕士');
INSERT INTO `employee` VALUES ('2', '小明', '男', '1999-06-23', '技术部', '工程师', '2019-06-14', 200, '123222222', '123222222@166.com', '北京', '博士');
INSERT INTO `employee` VALUES ('3', '小明', '男', '1999-06-23', '销售部', '销售员', '2019-06-14', 200, '123222222', '123222222@166.com', '北京', '高中');
INSERT INTO `employee` VALUES ('4', '小黑', '男', '1999-06-23', '销售部', '销售员', '2019-06-14', 32423, '123', '123222222@166.com', '北京', '硕士');
INSERT INTO `employee` VALUES ('5', '二明', '男', '1999-06-23', '销售部', '销售员', '2019-06-14', 32423, '123', '123222222@166.com', '北京', '大专');

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `jobId` int(11) NOT NULL AUTO_INCREMENT,
  `jobName` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `departmentName` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`jobId`) USING BTREE,
  UNIQUE INDEX `jobId`(`jobId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES (1, '程序员', '技术部');
INSERT INTO `job` VALUES (2, '工程师', '技术部');
INSERT INTO `job` VALUES (3, '销售经理', '销售部');
INSERT INTO `job` VALUES (4, '销售员', '销售部');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `managerId` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `manPassword` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `manName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `manTelephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `manEmail` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `manPer` int(11) NOT NULL,
  PRIMARY KEY (`managerId`) USING BTREE,
  UNIQUE INDEX `managerId`(`managerId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('admin', '123456', '老板', '12345678901', '12345678901@qq.com', 2);
INSERT INTO `manager` VALUES ('xiaobei', '123456', '小北', '55555', '55555@qq.com', 1);
INSERT INTO `manager` VALUES ('xiaodong', '123456', '小东', '11112', '11112@163.com', 1);
INSERT INTO `manager` VALUES ('xiaonan', '123456', '小南', '33333', '33333@qq.com', 1);
INSERT INTO `manager` VALUES ('xiaoxi', '123456', '小西', '44444', '44444@qq.com', 1);
INSERT INTO `manager` VALUES ('xiaozhong', '123456', '小中', '66666', '66666@qq.com', 1);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `productId` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `productName` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `productModel` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `productNum` decimal(10, 0) NULL DEFAULT NULL,
  `productPrice` decimal(10, 0) NULL DEFAULT NULL,
  `productCategory` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `productContract` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`productId`) USING BTREE,
  UNIQUE INDEX `productId`(`productId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('3', '手机', '小米', 22, 2333, '生活用品', '1,2,3,5,8');
INSERT INTO `product` VALUES ('4', '电脑', '华硕', 2, 2222, '电子产品', '5');
INSERT INTO `product` VALUES ('5', '手机', '华为', 22, 2000, '电子产品', '1,2,3');

-- ----------------------------
-- Table structure for product_contract
-- ----------------------------
DROP TABLE IF EXISTS `product_contract`;
CREATE TABLE `product_contract`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `contractId` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `Id`(`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_contract
-- ----------------------------
INSERT INTO `product_contract` VALUES (9, 3, 1);
INSERT INTO `product_contract` VALUES (10, 5, 1);
INSERT INTO `product_contract` VALUES (11, 3, 2);
INSERT INTO `product_contract` VALUES (12, 5, 2);
INSERT INTO `product_contract` VALUES (13, 3, 3);
INSERT INTO `product_contract` VALUES (14, 5, 3);
INSERT INTO `product_contract` VALUES (16, 3, 8);
INSERT INTO `product_contract` VALUES (17, 3, 5);
INSERT INTO `product_contract` VALUES (18, 4, 5);

SET FOREIGN_KEY_CHECKS = 1;
