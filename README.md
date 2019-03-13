# shopping
a simple java web shopping system
this project used ssm(spring+spring mvc+mybaties) and mysql 8.0 
here is the shopping.sql
/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2018-12-17 23:22:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` bigint(20) unsigned NOT NULL COMMENT '管理员id',
  `admin_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '管理员昵称',
  `admin_pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'shendj', '1234');

-- ----------------------------
-- Table structure for cart_info
-- ----------------------------
DROP TABLE IF EXISTS `cart_info`;
CREATE TABLE `cart_info` (
  `cart_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '顾客id，不能为空',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品id，不能为空',
  `product_name` varchar(20) DEFAULT NULL COMMENT '商品名称',
  `product_price` double DEFAULT NULL COMMENT '商品单价',
  `product_picture` varchar(200) DEFAULT NULL COMMENT '商品图片地址',
  `produce_count` int(10) unsigned DEFAULT '1' COMMENT '商品数量,默认为1',
  `product_total_price` double DEFAULT NULL COMMENT '商品总价',
  `cart_generatedTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '加入购物车时间',
  `cart_status` int(10) unsigned DEFAULT '0' COMMENT '购物车状态,0表示未提交订单,1表示已经提交订单',
  PRIMARY KEY (`cart_id`),
  KEY `顾客id` (`customer_id`),
  KEY `商品id` (`product_id`),
  CONSTRAINT `商品id` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `顾客id` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='购物车表';

-- ----------------------------
-- Records of cart_info
-- ----------------------------
INSERT INTO `cart_info` VALUES ('100001', '100002', '100001', 'iphoneXS', '8999', '/images/iphoneXS.jpg', '1', '8999', '2018-12-17 23:04:48', '0');
INSERT INTO `cart_info` VALUES ('100002', '100002', '100002', 'iphone8', '4999', '/images/iphone8.jpg', '1', '4999', '2018-12-17 23:06:47', '1');

-- ----------------------------
-- Table structure for customer_info
-- ----------------------------
DROP TABLE IF EXISTS `customer_info`;
CREATE TABLE `customer_info` (
  `customer_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家ID，起始值为100001',
  `customer_name` varchar(20) NOT NULL COMMENT '顾客昵称',
  `customer_pwd` varchar(20) NOT NULL COMMENT '顾客注册密码',
  `customer_trueName` varchar(20) DEFAULT NULL COMMENT '顾客真实姓名',
  `customer_sex` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '顾客性别',
  `customer_age` int(11) unsigned DEFAULT NULL COMMENT '顾客年龄',
  `customer_VIP` int(11) DEFAULT '0' COMMENT '顾客是否为VIP，默认为0不是',
  `customer_phone` varchar(20) DEFAULT NULL COMMENT '顾客联系电话',
  `customer_province` varchar(20) DEFAULT NULL COMMENT '顾客所在省份',
  `customer_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '顾客收获具体地址(不包括省市)',
  `customer_regTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '顾客注册时间',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='顾客表';

-- ----------------------------
-- Records of customer_info
-- ----------------------------
INSERT INTO `customer_info` VALUES ('100001', 'lcm1', '1234', '赖长萌', '男', '21', '0', '177****3216', '江西省', '南昌大学', '2018-12-17 14:58:18');
INSERT INTO `customer_info` VALUES ('100002', 'sdj', '1234', '沈东剑', '男', '20', '1', '177****3216', '江西省', '南昌大学', '2018-12-17 22:26:14');
INSERT INTO `customer_info` VALUES ('100003', 'lcm2', '1234', '赖长萌', '男', '21', '1', '177****3216', '江西省', '瑞金市', '2018-12-17 22:28:31');

-- ----------------------------
-- Table structure for merchant_info
-- ----------------------------
DROP TABLE IF EXISTS `merchant_info`;
CREATE TABLE `merchant_info` (
  `merchant_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商家ID，从100001开始',
  `merchant_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商家名称',
  `merchant_pwd` varchar(20) NOT NULL COMMENT '商家注册密码',
  `merchant_phone` varchar(20) DEFAULT NULL COMMENT '商家联系电话',
  `merchant_province` varchar(20) DEFAULT NULL COMMENT '商家所在省份',
  `merchant_address` varchar(100) DEFAULT NULL COMMENT '商家发货详细地址（不包括省市）',
  `merchant_category` varchar(20) DEFAULT NULL COMMENT '商家类型',
  `merchant_status` int(11) DEFAULT '0' COMMENT '商家是否经过审核,0表示未审核,1表示已经通过审核',
  `merchant_regTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '商家注册时间',
  PRIMARY KEY (`merchant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商家表';

-- ----------------------------
-- Records of merchant_info
-- ----------------------------
INSERT INTO `merchant_info` VALUES ('100001', '苹果旗舰店', '1234', '111110', '上海', '浦东区', '数码', '1', '2018-12-17 22:47:38');
INSERT INTO `merchant_info` VALUES ('100002', '鸿星尔克旗舰店', '1234', '111111', '广东', '广州市中心', '服装', '1', '2018-12-17 22:50:03');
INSERT INTO `merchant_info` VALUES ('100003', '小明零食', '1234', '111112', '浙江', '杭州', '零食', '0', '2018-12-17 22:51:00');

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '顾客id，不能为空',
  `order_generatedTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `order_status` int(10) unsigned DEFAULT '0' COMMENT '订单状态,0表示未支付,1表示支付成功,2表示订单已完成',
  `fare` double DEFAULT '0' COMMENT '运费，默认为0',
  `pay_method` int(11) DEFAULT '0' COMMENT '支付方式，默认为0支付宝，1微信,2银行卡',
  `pay_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '支付时间',
  `pay_count` double DEFAULT NULL COMMENT '支付金额',
  PRIMARY KEY (`order_id`),
  KEY `顾客id1` (`customer_id`),
  CONSTRAINT `顾客id1` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('100001', '100002', '2018-12-17 23:10:09', '2', '0', '0', '2018-12-17 23:10:09', '4999');

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单id',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品id',
  `product_name` varchar(20) DEFAULT NULL COMMENT '商品名称',
  `product_price` double DEFAULT NULL COMMENT '商品单价',
  `product_picture` varchar(200) DEFAULT NULL COMMENT '商品图片地址',
  `produce_count` int(10) unsigned DEFAULT '1' COMMENT '商品数量,默认为1',
  `product_total_price` double DEFAULT NULL COMMENT '商品总价',
  PRIMARY KEY (`order_id`),
  KEY `商品id2` (`product_id`),
  CONSTRAINT `商品id2` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论表';

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('1', '100002', 'iphone8', '4999', '/images/iphone8.jpg', '1', '4999');

-- ----------------------------
-- Table structure for order_product_comment
-- ----------------------------
DROP TABLE IF EXISTS `order_product_comment`;
CREATE TABLE `order_product_comment` (
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '顾客id',
  `customer_name` varchar(20) NOT NULL COMMENT '顾客昵称',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品id',
  `comment_content` varchar(2000) DEFAULT NULL COMMENT '评论内容',
  `comment_score` int(10) unsigned DEFAULT '5' COMMENT '给商品打的分数1-5,默认5',
  `comment_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`customer_id`),
  KEY `商品id1` (`product_id`),
  CONSTRAINT `商品id1` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `顾客id2` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论表';

-- ----------------------------
-- Records of order_product_comment
-- ----------------------------
INSERT INTO `order_product_comment` VALUES ('100002', 'sdj', '100002', '真的很好用！', '5', '2018-12-17 23:18:51');

-- ----------------------------
-- Table structure for pay_history
-- ----------------------------
DROP TABLE IF EXISTS `pay_history`;
CREATE TABLE `pay_history` (
  `order_id` bigint(20) unsigned NOT NULL COMMENT '订单id',
  `pay_method` int(11) DEFAULT '0' COMMENT '支付方式，默认为0支付宝，1微信,2银行卡',
  `product_total_price` double DEFAULT NULL COMMENT '商品总价',
  `pay_count` double DEFAULT NULL COMMENT '支付金额',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='支付记录表';

-- ----------------------------
-- Records of pay_history
-- ----------------------------
INSERT INTO `pay_history` VALUES ('100001', '0', '4999', '4999');

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `product_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID，从100001开始',
  `merchant_id` bigint(20) unsigned DEFAULT NULL COMMENT '商家ID',
  `product_name` varchar(20) NOT NULL COMMENT '商品名称',
  `product_category` varchar(20) DEFAULT NULL COMMENT '商品类型',
  `product_status` int(10) unsigned DEFAULT '0' COMMENT '商品状态，0表示未上架，1表示已上架,2表示已下架',
  `product_market_price` double DEFAULT NULL COMMENT '商品市场价',
  `product_VIP_price` double DEFAULT NULL COMMENT '商品VIP价',
  `product_inventory` bigint(20) unsigned DEFAULT NULL COMMENT '商品库存量',
  `product_picture` varchar(200) DEFAULT NULL COMMENT '商品图片地址',
  `product_description` varchar(1000) DEFAULT NULL COMMENT '商品详细信息',
  `product_comment_count` int(10) unsigned DEFAULT NULL COMMENT '商品评论数',
  `product_sell_count` int(10) unsigned DEFAULT NULL COMMENT '商品销量',
  `product_addedTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '商品更新时间',
  PRIMARY KEY (`product_id`),
  KEY `商家ID` (`merchant_id`),
  CONSTRAINT `商家ID` FOREIGN KEY (`merchant_id`) REFERENCES `merchant_info` (`merchant_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品表';

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES ('100001', '100001', 'iphoneXS', '手机', '0', '10099', '8999', '2000', '/images/iphoneXS.jpg', 'iPhone XS集成了各种各样的传感器，采用神经网络算法。搭载5.8英寸OLED超清视网膜屏，屏幕分辨率2436*1125，屏幕PPI达458，电池容量为3300mAh-3400mAh，运行内存为4GB， [4]  存储规格有64GB、256GB和512GB三种。 [1] \r\niPhone XS前置700万像素的摄像头，支持美颜功能 [5]  ，后置双1200万像素的摄像头，拥有更大传感器，F1.8和F2.4的光圈。 [6] ', null, null, '2018-12-17 19:42:07');
INSERT INTO `product_info` VALUES ('100002', '100001', 'iphone8', '手机', '1', '5837', '4999', '5000', '/images/iphone8.jpg', 'iPhone 8是Apple（苹果公司）第11代手机，北京时间2017年9月13日凌晨1点，在Apple Park新总部的史蒂夫·乔布斯剧院举行苹果新品发布会上发布的年度旗舰手机。\r\n2017年9月13日，2017苹果秋季新品发布会发布了iPhone 8，支持无线充电，分为64GB、256GB两个版本，699美元起售。 [1]  2018年4月9日，Apple宣布推出红色特别版iPhone 8以及iPhone 8Plus，售价5837元起 [2]  ，4月10日起接受在线订购。', null, null, '2018-12-17 22:41:33');
INSERT INTO `product_info` VALUES ('100003', '100002', '男款跑步鞋', '鞋子', '2', '259', '199', '8647', '/images/hxek1.jpg', '鸿星尔克实业有限公司创立于2000年6月，总部位于厦门。目前已发展为集研发、生产、销售为一体，员工近3万人的大型运动服饰企业 [1]  。\r\n公司在全世界拥有店铺7000余家，产品行销欧洲、东南亚、中东、南北美洲、非洲等国家和地区，在全球100多个国家拥有商标专有权，品牌价值突破219亿 [2]  ，并相继斩获“中国500最具价值品牌”、“亚洲品牌500强”、“《福布斯》亚洲200佳”等殊荣。 [3] ', null, null, '2018-12-17 23:01:27');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` char(100) DEFAULT NULL,
  `password` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('100000001', 'shendj', '1234');
INSERT INTO `test` VALUES ('100000002', 'DiamondJ', '1234');
INSERT INTO `test` VALUES ('100000003', 'Test', '1111');
INSERT INTO `test` VALUES ('100000004', 'GOD', 'GGGG');
INSERT INTO `test` VALUES ('100000005', '测试中文', '中文测试');

-- ----------------------------
-- Table structure for vip_post
-- ----------------------------
DROP TABLE IF EXISTS `vip_post`;
CREATE TABLE `vip_post` (
  `customer_id` bigint(20) unsigned NOT NULL COMMENT 'VIP_id',
  `customer_name` varchar(20) NOT NULL COMMENT 'VIP昵称',
  `post_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '发帖标题',
  `post_content` varchar(2000) DEFAULT NULL COMMENT '帖子内容',
  `post_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发帖时间',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论表';

-- ----------------------------
-- Records of vip_post
-- ----------------------------
INSERT INTO `vip_post` VALUES ('100002', 'sdj', '我是VIP', '我就是想秀一下我是VIP！', '2018-12-17 23:20:39');
