/*
 Navicat Premium Data Transfer

 Source Server         : MySQL56
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : 65001

 Date: 25/11/2022 16:11:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `a_pass` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '000000');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES (105, 41, 16, 1, 20, '20.0');
INSERT INTO `car` VALUES (106, 12, 16, 1, 3, '3.0');
INSERT INTO `car` VALUES (107, 45, 16, 1, 20, '20.0');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(255) NULL DEFAULT NULL,
  `order_id` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL COMMENT '0.未退货 1已退货',
  `num` int(11) NULL DEFAULT NULL,
  `total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info`  (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `p_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `p_price` int(11) NULL DEFAULT NULL,
  `p_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `p_number` int(11) NULL DEFAULT NULL,
  `type_id` int(11) NULL DEFAULT NULL,
  `p_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`p_id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  CONSTRAINT `product_info_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `product_type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES (2, '蔬菜', '一堆蔬菜', 30, '3fc25809ea4b4a2f9d672ba5a6611c71.jpg', 10, 5, '2022-09-05');
INSERT INTO `product_info` VALUES (4, '猪肉', '非常的新鲜，非常的美味', 40, 'ddc26a971a5e4a7580764b3522239210.jpg', 100, 3, '2022-09-05');
INSERT INTO `product_info` VALUES (6, '鸡蛋', '非常的新鲜，非常的美味', 2, '7a0311739bc64ecb845d6163555e977f.jpg', 30, 4, '2022-09-05');
INSERT INTO `product_info` VALUES (7, '苹果3', '非常的新鲜，非常的美味', 30, '8f14d0953f554f8794c8b2c06c9ff46f.jpg', 30, 1, '2022-09-06');
INSERT INTO `product_info` VALUES (9, '草莓', '非常的新鲜，非常的美味', 30, 'c2eb3b74a06d4dc989f584f9a1a1fc84.jpg', 100, 1, '2022-09-08');
INSERT INTO `product_info` VALUES (11, '猪肉3', '非常的新鲜，非常的美味', 3434, 'ee5b364d7d1a4dd9a11e9afe4196c7bc.jpg', 444, 3, '2022-09-08');
INSERT INTO `product_info` VALUES (12, '冰淇淋', '香啊，很香啊', 3, '87fb396b4ea74967a24b35c9ca8f2017.jpg', 100, 6, '2022-09-08');
INSERT INTO `product_info` VALUES (41, '葡萄', '非常的新鲜，非常的美味', 20, 'c69a84762c32453c8932e795032acbea.jpg', 30, 1, '2022-09-17');
INSERT INTO `product_info` VALUES (43, '青柠', '非常的新鲜，非常的美味', 20, '81905138ef4d46aaaa3c35c2ea5ab95d.png', 30, 1, '2022-09-21');
INSERT INTO `product_info` VALUES (45, '柠檬', '非常的新鲜，非常的美味', 20, '927fab6b84d0415db39c26fc29fb14f2.jpg', 30, 1, '2022-09-22');
INSERT INTO `product_info` VALUES (46, '香蕉', '非常的新鲜，非常的美味', 10, '3233e126edd54c74ac8443055e4bad28.jfif', 10, 1, '2022-09-22');

-- ----------------------------
-- Table structure for product_info_order
-- ----------------------------
DROP TABLE IF EXISTS `product_info_order`;
CREATE TABLE `product_info_order`  (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addTime` datetime(0) NULL DEFAULT NULL,
  `total` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isDelete` int(255) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL COMMENT '0.新建代发货1.已取消 2已已发货3.到收货4已评价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_info_order
-- ----------------------------
INSERT INTO `product_info_order` VALUES (00000000079, 45, 11, '2022092210500001', '2022-09-22 10:50:55', '100.00', 0, 3);
INSERT INTO `product_info_order` VALUES (00000000080, 45, 11, '2022092211300001', '2022-09-22 11:30:26', '20.00', 0, 0);
INSERT INTO `product_info_order` VALUES (00000000081, 43, 11, '2022092211330001', '2022-09-22 11:33:19', '20.00', 0, 0);
INSERT INTO `product_info_order` VALUES (00000000082, 46, 11, '2022101714260001', '2022-10-17 14:26:07', '30.00', 0, 0);

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES (1, '新鲜水果');
INSERT INTO `product_type` VALUES (2, '海鲜水产');
INSERT INTO `product_type` VALUES (3, '猪肉羊肉');
INSERT INTO `product_type` VALUES (4, '禽类蛋品');
INSERT INTO `product_type` VALUES (5, '新鲜素菜');
INSERT INTO `product_type` VALUES (6, '速冻食品');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES (17, 27, 3);
INSERT INTO `sc` VALUES (18, 28, 3);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (11, '天之璎珞', '555555', '10086', '天之璎珞', '男', '海南师范大学', 'tzyl@gmail.com');
INSERT INTO `user` VALUES (12, '李四', '555555', '10086', '李四', '男', '海南师范大学', 'tzyl@gmail.com');
INSERT INTO `user` VALUES (13, '张三', '555555', '10086', '张三', '男', '海南师范大学', 'tzyl@gmail.com');
INSERT INTO `user` VALUES (15, '赵六111', '555555', '10090', NULL, NULL, NULL, 'tzyl@gmail.com');
INSERT INTO `user` VALUES (16, '天之璎珞1', '555555', '10086', NULL, NULL, NULL, 'tzyl12345zzz@gmail.com');

SET FOREIGN_KEY_CHECKS = 1;
