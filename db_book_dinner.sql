/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_book_dinner

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-12-22 12:09:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `realName` varchar(32) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('9', 'zsy', '123', '赵世宇', '13989898989', '安悦北');
INSERT INTO `account` VALUES ('10', 'aaa', 'aaa', null, null, null);
INSERT INTO `account` VALUES ('11', 'zzz', 'zzz', null, null, null);

-- ----------------------------
-- Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `authority_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `authority_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=518 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('285', '3', '51');
INSERT INTO `authority` VALUES ('286', '3', '52');
INSERT INTO `authority` VALUES ('287', '3', '53');
INSERT INTO `authority` VALUES ('288', '3', '54');
INSERT INTO `authority` VALUES ('289', '4', '51');
INSERT INTO `authority` VALUES ('290', '4', '52');
INSERT INTO `authority` VALUES ('291', '4', '53');
INSERT INTO `authority` VALUES ('292', '4', '54');
INSERT INTO `authority` VALUES ('293', '5', '51');
INSERT INTO `authority` VALUES ('294', '5', '52');
INSERT INTO `authority` VALUES ('295', '5', '53');
INSERT INTO `authority` VALUES ('296', '5', '54');
INSERT INTO `authority` VALUES ('297', '2', '5');
INSERT INTO `authority` VALUES ('298', '2', '17');
INSERT INTO `authority` VALUES ('299', '2', '18');
INSERT INTO `authority` VALUES ('300', '2', '19');
INSERT INTO `authority` VALUES ('301', '2', '20');
INSERT INTO `authority` VALUES ('302', '2', '35');
INSERT INTO `authority` VALUES ('303', '2', '36');
INSERT INTO `authority` VALUES ('304', '2', '25');
INSERT INTO `authority` VALUES ('305', '2', '1');
INSERT INTO `authority` VALUES ('306', '2', '14');
INSERT INTO `authority` VALUES ('307', '2', '15');
INSERT INTO `authority` VALUES ('468', '1', '40');
INSERT INTO `authority` VALUES ('469', '1', '13');
INSERT INTO `authority` VALUES ('470', '1', '41');
INSERT INTO `authority` VALUES ('471', '1', '21');
INSERT INTO `authority` VALUES ('472', '1', '42');
INSERT INTO `authority` VALUES ('473', '1', '22');
INSERT INTO `authority` VALUES ('474', '1', '39');
INSERT INTO `authority` VALUES ('475', '1', '23');
INSERT INTO `authority` VALUES ('476', '1', '14');
INSERT INTO `authority` VALUES ('477', '1', '43');
INSERT INTO `authority` VALUES ('478', '1', '15');
INSERT INTO `authority` VALUES ('479', '1', '44');
INSERT INTO `authority` VALUES ('480', '1', '24');
INSERT INTO `authority` VALUES ('481', '1', '45');
INSERT INTO `authority` VALUES ('482', '1', '25');
INSERT INTO `authority` VALUES ('483', '1', '46');
INSERT INTO `authority` VALUES ('484', '1', '26');
INSERT INTO `authority` VALUES ('485', '1', '47');
INSERT INTO `authority` VALUES ('486', '1', '31');
INSERT INTO `authority` VALUES ('487', '1', '48');
INSERT INTO `authority` VALUES ('488', '1', '32');
INSERT INTO `authority` VALUES ('489', '1', '49');
INSERT INTO `authority` VALUES ('490', '1', '33');
INSERT INTO `authority` VALUES ('491', '1', '50');
INSERT INTO `authority` VALUES ('492', '1', '34');
INSERT INTO `authority` VALUES ('493', '1', '51');
INSERT INTO `authority` VALUES ('494', '1', '38');
INSERT INTO `authority` VALUES ('495', '1', '52');
INSERT INTO `authority` VALUES ('496', '1', '40');
INSERT INTO `authority` VALUES ('497', '1', '53');
INSERT INTO `authority` VALUES ('498', '1', '41');
INSERT INTO `authority` VALUES ('499', '1', '54');
INSERT INTO `authority` VALUES ('500', '1', '42');
INSERT INTO `authority` VALUES ('501', '1', '1');
INSERT INTO `authority` VALUES ('502', '1', '39');
INSERT INTO `authority` VALUES ('503', '1', '37');
INSERT INTO `authority` VALUES ('504', '1', '43');
INSERT INTO `authority` VALUES ('505', '1', '44');
INSERT INTO `authority` VALUES ('506', '1', '45');
INSERT INTO `authority` VALUES ('507', '1', '46');
INSERT INTO `authority` VALUES ('508', '1', '47');
INSERT INTO `authority` VALUES ('509', '1', '48');
INSERT INTO `authority` VALUES ('510', '1', '49');
INSERT INTO `authority` VALUES ('511', '1', '50');
INSERT INTO `authority` VALUES ('512', '1', '51');
INSERT INTO `authority` VALUES ('513', '1', '52');
INSERT INTO `authority` VALUES ('514', '1', '53');
INSERT INTO `authority` VALUES ('515', '1', '54');
INSERT INTO `authority` VALUES ('516', '1', '1');
INSERT INTO `authority` VALUES ('517', '1', '37');

-- ----------------------------
-- Table structure for `c3p0testtable`
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c3p0testtable
-- ----------------------------

-- ----------------------------
-- Table structure for `food`
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `price` float(5,2) NOT NULL,
  `sels` int(5) NOT NULL DEFAULT '0',
  `imageUrl` varchar(128) DEFAULT NULL,
  `des` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `food_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('3', '10', 'BAS招牌菜花', '2.00', '1', '/CateringSystem/resources/upload/1608131468367.jpg', '本店铺的招牌蔬菜吃完会长寿的：宽粉！');
INSERT INTO `food` VALUES ('4', '10', 'BAS招牌娃娃菜', '6.00', '0', '/CateringSystem/resources/upload/1608132015802.jpg', '本店铺的招牌蔬菜吃完会长寿的：宽粉！');
INSERT INTO `food` VALUES ('5', '10', 'BAS招牌宽粉', '9.00', '0', '/CateringSystem/resources/upload/1608132057938.jpg', '本店铺的招牌蔬菜吃完会长寿的：宽粉！');
INSERT INTO `food` VALUES ('6', '10', 'BAS招牌豆腐皮', '18.00', '1', '/CateringSystem/resources/upload/1608132275564.jpg', '本店铺的招牌蔬菜吃完会长寿的：豆腐皮！');
INSERT INTO `food` VALUES ('7', '10', 'BAS招牌腐竹', '4.00', '1', '/CateringSystem/resources/upload/1608132324475.jpg', '本店铺的招牌蔬菜吃完会长寿的：腐竹！');
INSERT INTO `food` VALUES ('8', '10', 'BAS招牌藕片', '5.00', '1', '/CateringSystem/resources/upload/1608132356009.jpg', '本店铺的招牌蔬菜吃完会长寿的：藕片！');
INSERT INTO `food` VALUES ('9', '10', 'BAS招牌玉米', '15.00', '3', '/CateringSystem/resources/upload/1608132383323.jpg', '本店铺的招牌蔬菜吃完会长寿的：玉米！');
INSERT INTO `food` VALUES ('10', '10', 'BAS招牌素拼', '12.00', '0', '/CateringSystem/resources/upload/1608132400208.jpg', '本店铺的招牌蔬菜吃完会长寿的：素拼！');
INSERT INTO `food` VALUES ('11', '9', 'BAS招牌番茄锅', '12.00', '2', '/CateringSystem/resources/upload/1608132479638.jpg', '本店铺的招牌锅底吃完倍儿开心的：番茄锅！');
INSERT INTO `food` VALUES ('12', '9', 'BAS招牌牛油锅', '12.00', '0', '/CateringSystem/resources/upload/1608132526359.jpg', '本店铺的招牌锅底吃完倍儿开心的：牛油锅！');
INSERT INTO `food` VALUES ('13', '9', 'BAS招牌菌汤锅', '28.00', '0', '/CateringSystem/resources/upload/1608132565146.jpg', '本店铺的招牌锅底吃完倍儿开心的：菌汤锅！');
INSERT INTO `food` VALUES ('14', '9', 'BAS招牌三鲜锅', '26.00', '1', '/CateringSystem/resources/upload/1608132713405.jpg', '本店铺的招牌锅底吃完倍儿开心的：三鲜锅！');
INSERT INTO `food` VALUES ('15', '9', 'BAS招牌红油锅', '32.00', '1', '/CateringSystem/resources/upload/1608132809548.jpg', '本店铺的招牌锅底吃完倍儿开心的：红油锅！');
INSERT INTO `food` VALUES ('16', '11', 'BAS招牌五花肉片', '38.00', '2', '/CateringSystem/resources/upload/1608132870604.jpg', '本店铺的招牌肉类吃完绝对不会长胖的：五花肉！');
INSERT INTO `food` VALUES ('17', '11', 'BAS招牌午餐肉', '22.00', '0', '/CateringSystem/resources/upload/1608132953313.jpg', '本店铺的招牌肉类吃完绝对不会长胖的：午餐肉！');
INSERT INTO `food` VALUES ('18', '11', 'BAS招牌墨鱼丸', '28.00', '1', '/CateringSystem/resources/upload/1608132981757.jpg', '本店铺的招牌肉类吃完绝对不会长胖的：墨鱼丸！');
INSERT INTO `food` VALUES ('19', '11', 'BAS招牌毛肚', '28.00', '2', '/CateringSystem/resources/upload/1608133013316.jpg', '本店铺的招牌肉类吃完绝对不会长胖的：毛肚！');
INSERT INTO `food` VALUES ('20', '11', 'BAS招牌火腿肠', '36.00', '0', '/CateringSystem/resources/upload/1608133049748.jpg', '本店铺的招牌肉类吃完绝对不会长胖的：火腿肠！');
INSERT INTO `food` VALUES ('21', '7', 'BAS招牌小吃雪梅娘', '36.00', '5', '/CateringSystem/resources/upload/1608133158204.jpg', '本店铺人人都爱吃的招牌小吃：雪梅娘！');
INSERT INTO `food` VALUES ('22', '7', 'BAS招牌小吃炼乳馒头', '25.00', '1', '/CateringSystem/resources/upload/1608133426402.jpg', '本店铺人人都爱吃的招牌小吃：炼乳馒头！');
INSERT INTO `food` VALUES ('23', '7', 'BAS招牌小吃小油条', '25.00', '2', '/CateringSystem/resources/upload/1608133439102.jpg', '本店铺人人都爱吃的招牌小吃：小油条！');
INSERT INTO `food` VALUES ('24', '7', 'BAS招牌小吃南瓜羹', '29.80', '5', '/CateringSystem/resources/upload/1608133477383.jpg', '本店铺人人都爱吃的招牌小吃：南瓜羹！');
INSERT INTO `food` VALUES ('25', '3', 'BAS招牌饮品雪碧', '16.80', '1', '/CateringSystem/resources/upload/1608133538261.jpg', '本店铺人人都爱喝的招牌饮品：雪碧！');
INSERT INTO `food` VALUES ('26', '3', 'BAS招牌饮品王老吉', '9.00', '2', '/CateringSystem/resources/upload/1608133601356.jpg', '本店铺人人都爱喝的招牌饮品：王老吉！');
INSERT INTO `food` VALUES ('27', '3', 'BAS招牌饮品百事可乐', '9.00', '3', '/CateringSystem/resources/upload/1608133637827.jpg', '本店铺人人都爱喝的招牌饮品：百事可乐！');
INSERT INTO `food` VALUES ('28', '3', 'BAS招牌饮品柠檬水', '19.00', '4', '/CateringSystem/resources/upload/1608133664868.jpg', '本店铺人人都爱喝的招牌饮品：柠檬水！');
INSERT INTO `food` VALUES ('29', '3', 'BAS招牌饮品酸梅汤', '18.00', '2', '/CateringSystem/resources/upload/1608133698926.jpg', '本店铺人人都爱喝的招牌饮品：酸梅汤！');

-- ----------------------------
-- Table structure for `food_category`
-- ----------------------------
DROP TABLE IF EXISTS `food_category`;
CREATE TABLE `food_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_category
-- ----------------------------
INSERT INTO `food_category` VALUES ('2', '主食');
INSERT INTO `food_category` VALUES ('3', '酒水饮料');
INSERT INTO `food_category` VALUES ('5', '招牌菜品');
INSERT INTO `food_category` VALUES ('6', '经典热菜');
INSERT INTO `food_category` VALUES ('7', '特色小吃');
INSERT INTO `food_category` VALUES ('9', '火锅底料');
INSERT INTO `food_category` VALUES ('10', '招牌蔬菜');
INSERT INTO `food_category` VALUES ('11', '招牌肉类');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('52', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 16:07:06');
INSERT INTO `log` VALUES ('53', '新增一个日志', '2020-12-21 16:08:18');
INSERT INTO `log` VALUES ('54', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 16:13:56');
INSERT INTO `log` VALUES ('55', '用户名为{admin}，的用户成功修改密码!', '2020-12-21 16:15:35');
INSERT INTO `log` VALUES ('56', '用户名为{admin}，的用户成功修改密码!', '2020-12-21 16:15:47');
INSERT INTO `log` VALUES ('57', '用户名为{admin}，的用户成功修改密码!', '2020-12-21 16:17:33');
INSERT INTO `log` VALUES ('58', '用户名为{admin}，的用户成功修改密码!', '2020-12-21 16:17:44');
INSERT INTO `log` VALUES ('59', '用户名为{admin}，的用户成功修改密码!', '2020-12-21 16:17:54');
INSERT INTO `log` VALUES ('60', '用户名为{admin}，的用户成功修改密码!', '2020-12-21 16:19:27');
INSERT INTO `log` VALUES ('61', '用户名为{admin}，的用户成功修改密码!', '2020-12-21 16:19:46');
INSERT INTO `log` VALUES ('62', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 16:21:26');
INSERT INTO `log` VALUES ('63', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 16:21:58');
INSERT INTO `log` VALUES ('64', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 16:26:16');
INSERT INTO `log` VALUES ('65', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 16:26:50');
INSERT INTO `log` VALUES ('66', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 16:32:27');
INSERT INTO `log` VALUES ('67', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 16:34:38');
INSERT INTO `log` VALUES ('68', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 16:45:19');
INSERT INTO `log` VALUES ('69', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 16:48:09');
INSERT INTO `log` VALUES ('70', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 17:03:03');
INSERT INTO `log` VALUES ('71', '登录时，用户名为zsy的用户不存在!', '2020-12-21 17:03:25');
INSERT INTO `log` VALUES ('72', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 17:15:06');
INSERT INTO `log` VALUES ('73', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 17:17:00');
INSERT INTO `log` VALUES ('74', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 17:17:17');
INSERT INTO `log` VALUES ('75', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:21:16');
INSERT INTO `log` VALUES ('76', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:23:02');
INSERT INTO `log` VALUES ('77', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:26:28');
INSERT INTO `log` VALUES ('78', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:27:21');
INSERT INTO `log` VALUES ('79', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:29:09');
INSERT INTO `log` VALUES ('80', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:31:25');
INSERT INTO `log` VALUES ('81', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:34:34');
INSERT INTO `log` VALUES ('82', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:35:56');
INSERT INTO `log` VALUES ('83', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:36:03');
INSERT INTO `log` VALUES ('84', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:43:20');
INSERT INTO `log` VALUES ('85', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:46:20');
INSERT INTO `log` VALUES ('86', '用户名为admin的用户登录时输入验证码错误!', '2020-12-21 21:47:45');
INSERT INTO `log` VALUES ('87', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:47:52');
INSERT INTO `log` VALUES ('88', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:55:25');
INSERT INTO `log` VALUES ('89', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:56:36');
INSERT INTO `log` VALUES ('90', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:56:45');
INSERT INTO `log` VALUES ('91', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 21:57:54');
INSERT INTO `log` VALUES ('92', '用户名为admin的用户登录时输入验证码错误!', '2020-12-21 23:02:25');
INSERT INTO `log` VALUES ('93', '用户名为admin的用户登录时输入验证码错误!', '2020-12-21 23:02:32');
INSERT INTO `log` VALUES ('94', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 23:02:41');
INSERT INTO `log` VALUES ('95', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 23:04:16');
INSERT INTO `log` VALUES ('96', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 23:04:46');
INSERT INTO `log` VALUES ('97', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 23:07:14');
INSERT INTO `log` VALUES ('98', '用户名为admin的用户登录时输入验证码错误!', '2020-12-21 23:08:48');
INSERT INTO `log` VALUES ('99', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 23:08:55');
INSERT INTO `log` VALUES ('100', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 23:10:22');
INSERT INTO `log` VALUES ('101', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 23:13:00');
INSERT INTO `log` VALUES ('102', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 23:15:23');
INSERT INTO `log` VALUES ('103', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 23:17:39');
INSERT INTO `log` VALUES ('104', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 23:18:43');
INSERT INTO `log` VALUES ('105', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 23:29:10');
INSERT INTO `log` VALUES ('106', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 23:33:36');
INSERT INTO `log` VALUES ('107', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-21 23:34:30');
INSERT INTO `log` VALUES ('108', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 11:20:44');
INSERT INTO `log` VALUES ('109', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 11:31:01');
INSERT INTO `log` VALUES ('110', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 11:31:20');
INSERT INTO `log` VALUES ('111', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 11:32:30');
INSERT INTO `log` VALUES ('112', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 11:35:12');
INSERT INTO `log` VALUES ('113', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 11:36:08');
INSERT INTO `log` VALUES ('114', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 11:38:04');
INSERT INTO `log` VALUES ('115', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 11:39:44');
INSERT INTO `log` VALUES ('116', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 11:41:40');
INSERT INTO `log` VALUES ('117', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 11:42:04');
INSERT INTO `log` VALUES ('118', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 11:42:48');
INSERT INTO `log` VALUES ('119', '用户名为{admina}，角色为{厨师}的用户登录成功!', '2020-12-22 11:53:32');
INSERT INTO `log` VALUES ('120', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 11:54:08');
INSERT INTO `log` VALUES ('121', '用户名为fuwuyuan的用户登录时输入验证码错误!', '2020-12-22 11:57:43');
INSERT INTO `log` VALUES ('122', '用户名为{fuwuyuan}，角色为{服务员}的用户登录成功!', '2020-12-22 11:57:49');
INSERT INTO `log` VALUES ('123', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 11:58:16');
INSERT INTO `log` VALUES ('124', '用户名为{jingli}，角色为{经理}的用户登录成功!', '2020-12-22 11:58:32');
INSERT INTO `log` VALUES ('125', '用户名为admin的用户登录时输入验证码错误!', '2020-12-22 12:02:54');
INSERT INTO `log` VALUES ('126', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 12:03:07');
INSERT INTO `log` VALUES ('127', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2020-12-22 12:05:06');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(32) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '系统设置', '', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('5', '1', '菜单管理', '../menu/list', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('13', '1', '角色管理', '../role/list', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('14', '0', '用户管理', '', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('15', '14', '用户列表', '../user/list', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('17', '5', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('18', '5', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('19', '5', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('20', '5', '添加按钮', 'openAddMenu()', 'icon-add');
INSERT INTO `menu` VALUES ('21', '13', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('22', '13', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('23', '13', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('24', '15', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('25', '15', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('26', '15', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('31', '0', '系统日志', '', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('32', '31', '日志列表', '../log/list', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('33', '32', '添加日志', 'openAdd()', 'icon-add1');
INSERT INTO `menu` VALUES ('34', '32', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('35', '0', '修改密码', 'edit_password', 'aaa');
INSERT INTO `menu` VALUES ('36', '35', '修改密码', 'openAdd()', 'icon-lock-edit');
INSERT INTO `menu` VALUES ('37', '0', '菜品管理', '', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('38', '37', '分类管理', '../food_category/list', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('39', '37', '菜品管理', '../food/list', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('40', '38', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('41', '38', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('42', '38', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('43', '39', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('44', '39', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('45', '39', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('46', '0', '客户管理', '', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('47', '46', '客户列表', '../account/list', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('48', '47', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('49', '47', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('50', '47', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('51', '0', '订单管理', '', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('52', '51', '订单列表', '../order/list', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('53', '52', '编辑', 'openEdit()', 'icon-cart-edit');
INSERT INTO `menu` VALUES ('54', '52', '查看', 'openView()', 'icon-eye');
INSERT INTO `menu` VALUES ('55', '0', '菜品管理', '', 'fa fa-caret-right');
INSERT INTO `menu` VALUES ('56', '37', '分类管理', '../food_category/list', 'fa fa-caret-right');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) NOT NULL,
  `money` float(5,2) NOT NULL,
  `productNum` int(3) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `recieveName` varchar(32) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(128) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('14', '9', '108.00', '3', '3', '赵世宇', '13989898989', '2号桌', '2020-12-21 21:47:00');
INSERT INTO `orders` VALUES ('15', '9', '119.20', '4', '0', '赵世宇', '13989898989', '3号桌', '2020-12-21 21:49:00');
INSERT INTO `orders` VALUES ('16', '10', '127.80', '5', '0', 'aaa', '1888888888', '1号桌', '2020-12-22 11:49:10');
INSERT INTO `orders` VALUES ('17', '11', '42.00', '4', '0', '老王', '1233445666', '3号桌', '2020-12-22 12:06:36');
INSERT INTO `orders` VALUES ('18', '11', '64.80', '3', '0', '老王', '1121816161188', '4号桌', '2020-12-22 12:07:22');

-- ----------------------------
-- Table structure for `order_item`
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `foodId` int(11) NOT NULL,
  `foodName` varchar(128) NOT NULL,
  `foodImage` varchar(128) NOT NULL,
  `price` float(5,2) NOT NULL,
  `foodNum` int(3) NOT NULL,
  `money` float(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `foodId` (`foodId`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `food` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('32', '14', '21', 'BAS招牌小吃雪梅娘', '/CateringSystem/resources/upload/1608133158204.jpg', '36.00', '3', '108.00');
INSERT INTO `order_item` VALUES ('33', '15', '24', 'BAS招牌小吃南瓜羹', '/CateringSystem/resources/upload/1608133477383.jpg', '29.80', '4', '119.20');
INSERT INTO `order_item` VALUES ('34', '16', '11', 'BAS招牌番茄锅', '/CateringSystem/resources/upload/1608132479638.jpg', '12.00', '1', '12.00');
INSERT INTO `order_item` VALUES ('35', '16', '21', 'BAS招牌小吃雪梅娘', '/CateringSystem/resources/upload/1608133158204.jpg', '36.00', '1', '36.00');
INSERT INTO `order_item` VALUES ('36', '16', '22', 'BAS招牌小吃炼乳馒头', '/CateringSystem/resources/upload/1608133426402.jpg', '25.00', '1', '25.00');
INSERT INTO `order_item` VALUES ('37', '16', '23', 'BAS招牌小吃小油条', '/CateringSystem/resources/upload/1608133439102.jpg', '25.00', '1', '25.00');
INSERT INTO `order_item` VALUES ('38', '16', '24', 'BAS招牌小吃南瓜羹', '/CateringSystem/resources/upload/1608133477383.jpg', '29.80', '1', '29.80');
INSERT INTO `order_item` VALUES ('39', '17', '6', 'BAS招牌豆腐皮', '/CateringSystem/resources/upload/1608132275564.jpg', '18.00', '1', '18.00');
INSERT INTO `order_item` VALUES ('40', '17', '7', 'BAS招牌腐竹', '/CateringSystem/resources/upload/1608132324475.jpg', '4.00', '1', '4.00');
INSERT INTO `order_item` VALUES ('41', '17', '8', 'BAS招牌藕片', '/CateringSystem/resources/upload/1608132356009.jpg', '5.00', '1', '5.00');
INSERT INTO `order_item` VALUES ('42', '17', '9', 'BAS招牌玉米', '/CateringSystem/resources/upload/1608132383323.jpg', '15.00', '1', '15.00');
INSERT INTO `order_item` VALUES ('43', '18', '11', 'BAS招牌番茄锅', '/CateringSystem/resources/upload/1608132479638.jpg', '12.00', '1', '12.00');
INSERT INTO `order_item` VALUES ('44', '18', '21', 'BAS招牌小吃雪梅娘', '/CateringSystem/resources/upload/1608133158204.jpg', '36.00', '1', '36.00');
INSERT INTO `order_item` VALUES ('45', '18', '25', 'BAS招牌饮品雪碧', '/CateringSystem/resources/upload/1608133538261.jpg', '16.80', '1', '16.80');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '拥有一切权限！');
INSERT INTO `role` VALUES ('2', '普通用户', '普通用户，可以自由授权！');
INSERT INTO `role` VALUES ('3', '厨师', '拥有改变订单制作状态权限。');
INSERT INTO `role` VALUES ('4', '服务员', '拥有改变订单送达状态的权限。');
INSERT INTO `role` VALUES ('5', '经理', '拥有改变订单支付状态的权限。');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `roleId` int(11) NOT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `sex` int(1) NOT NULL DEFAULT '0',
  `age` int(3) NOT NULL DEFAULT '0',
  `address` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '1', '/CateringSystem/resources/upload/1608123795075.jpg', '1', '20', '上海市浦东新区浦东南路1835号');
INSERT INTO `user` VALUES ('13', 'bas', '123456', '2', '/CateringSystem/resources/upload/1608123810154.jpg', '1', '21', 'aaaaaa');
INSERT INTO `user` VALUES ('18', 'admina', 'admin', '3', '/CateringSystem/resources/img/logo.png', '1', '1', 'aaaaa');
INSERT INTO `user` VALUES ('19', 'adminaa', 'admin', '1', '/CateringSystem/resources/img/logo.png', '2', '21', 'aaaaa');
INSERT INTO `user` VALUES ('20', 'adminaaa', 'admin', '1', '/CateringSystem/resources/upload/1608131650315.png', '2', '22', 'aaaaa');
INSERT INTO `user` VALUES ('21', 'chushi', 'chushi', '3', '/CateringSystem/resources/img/logo.png', '1', '22', 'aaaaa');
INSERT INTO `user` VALUES ('22', 'fuwuyuan', 'fuwuyuan', '4', '/CateringSystem/resources/img/logo.png', '2', '19', 'aaaaa');
INSERT INTO `user` VALUES ('23', 'jingli', 'jingli', '5', '/CateringSystem/resources/img/logo.png', '2', '20', 'aaaaa');
