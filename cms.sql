/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-04-28 16:43:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reply_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '写的啥啊', '2018-04-20 11:49:34', '2018-04-20 00:00:00', '8', '8', '0');
INSERT INTO `comments` VALUES ('2', '写的啥啊', '2018-04-20 13:27:01', '2018-04-20 13:27:01', '8', '8', '0');
INSERT INTO `comments` VALUES ('3', '又写的啥啊', '2018-04-20 13:27:07', '2018-04-20 13:27:07', '8', '8', '0');
INSERT INTO `comments` VALUES ('4', '又写的啥啊', '2018-04-20 13:34:42', '2018-04-20 13:34:42', '8', '7', '0');
INSERT INTO `comments` VALUES ('5', '又写的啥啊', '2018-04-20 13:34:44', '2018-04-20 13:34:44', '8', '7', '0');
INSERT INTO `comments` VALUES ('6', '算了看电视剧弗兰克搞就搞定了开收据', '2018-04-23 13:53:27', '2018-04-23 13:53:27', '49', '6', '0');
INSERT INTO `comments` VALUES ('7', '123', '2018-04-23 14:42:57', '2018-04-23 14:42:57', '49', '6', '0');
INSERT INTO `comments` VALUES ('8', '123', '2018-04-23 14:42:59', '2018-04-23 14:42:59', '49', '6', '0');
INSERT INTO `comments` VALUES ('9', '买别的区', '2018-04-23 14:50:15', '2018-04-23 14:50:15', '49', '6', '0');
INSERT INTO `comments` VALUES ('10', '评论下又改了 来自 123', '2018-04-23 15:15:24', '2018-04-23 15:15:24', '40', '12', '0');
INSERT INTO `comments` VALUES ('11', '评论下坚果 ，来自123', '2018-04-23 15:15:53', '2018-04-23 15:15:53', '49', '12', '0');
INSERT INTO `comments` VALUES ('12', '回复测试345 来自 liucc', '2018-04-23 15:20:06', '2018-04-23 15:20:06', '43', '6', '0');
INSERT INTO `comments` VALUES ('13', '在回复一条 liucc', '2018-04-23 15:20:49', '2018-04-23 15:20:49', '43', '6', '0');
INSERT INTO `comments` VALUES ('14', '爱怎么换怎么换', '2018-04-23 15:40:49', '2018-04-23 15:40:49', '48', '6', '0');
INSERT INTO `comments` VALUES ('15', 'cadfsfds', '2018-04-24 10:20:01', '2018-04-24 10:20:01', '42', '9', '0');
INSERT INTO `comments` VALUES ('16', '写的什么玩意', '2018-04-24 14:29:22', '2018-04-24 14:29:22', '44', '12', '0');
INSERT INTO `comments` VALUES ('17', '前端 缓存一般缓存的是图片和js文件吗', '2018-04-24 16:31:08', '2018-04-24 16:31:08', '40', '6', '0');

-- ----------------------------
-- Table structure for topics
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topics
-- ----------------------------
INSERT INTO `topics` VALUES ('40', '又改了特别长的标题又改了特别长的标题又改了特别长的标题又改了特别长的标题又改了特别长的标题', '又改了改了改了', '6', '2018-04-20 10:26:25', '2018-04-24 16:28:05');
INSERT INTO `topics` VALUES ('42', '测试标题123123', '测试文件中1211231', '12', '2018-04-22 10:38:11', '2018-04-22 10:38:11');
INSERT INTO `topics` VALUES ('43', '测试标题354', '测试文件中35453', '6', '2018-04-22 10:49:55', '2018-04-22 10:49:55');
INSERT INTO `topics` VALUES ('44', '测试标题7898', '测试文件中789789', '6', '2018-04-22 10:52:01', '2018-04-22 10:52:01');
INSERT INTO `topics` VALUES ('46', '又写了一排', '似懂非懂看后感考多少分看帅哥', '6', '2018-04-22 11:01:43', '2018-04-22 11:01:43');
INSERT INTO `topics` VALUES ('48', '求教怎么换电池', '如题，电池尿崩了…想问下去换电池的话只能售后吗？南宁的售后太坑了，啥都不懂…所以求教各位大大自己换电池会不会悲剧', '6', '2018-04-22 16:17:26', '2018-04-22 17:02:19');
INSERT INTO `topics` VALUES ('49', '坚果 3 购买及使用常见问题', '一、购买咨询\n\n问：坚果 3 在下单后多长时间内可以付款？\n答：含有坚果 3 手机的订单需要在 15 分钟内完成支付，具体时效以订单页面显示为准，超期会自动关闭，请您及时完成支付。\n\n问：在锤子科技官方网站购买的坚果 3，什么时候发货？\n答：\n现货购买方式：订单成功付款后 72 小时内发货（销售活动期间发货时效可能会有调整，具体请以订单页面显示为准）。\n全款预订方式：订单发货时间以成功付款后在【我的订单】- 【订单详情】中显示的发货日期为准。\n\n问：我的订单信息（电话、收货地址）需要修改，如何处理？\n答：\n修改订单收货信息，有以下三种情况：\n1、 订单未支付时，您可在【个人中心】-【我的订单】中点击相应的订单号，在【修改收货信息】中修改；\n2、 订单已付款但未发货（订单状态为“配货”），需要收货人使用订单中的电话联系客服（400-626-5666）进行修改；\n3、 订单已发货（订单状态为“出库”），需要收货人直接与顺丰（95338）联系进行修改。 需要订单中收货人联系锤子科技客服修改。\n\n问：坚果 3手机有哪些颜色和存储版本？\n答：坚果 3 手机有碳黑色（细红线版）、酒红色、浅金色、炫红色（特别版）、炫黑色（特别版）五种颜色。', '12', '2018-04-23 12:56:59', '2018-04-23 12:57:21');
INSERT INTO `topics` VALUES ('50', '坚果 3 来了', '坚果 3 采用(almost)三面无边框的设计，7.16 毫米超薄机身内包含 4000mAh 超巨型电池，续航超长。专业级双 1300 万诚实双摄+高通八核超低功耗处理器，#漂亮得不像实力派#，1299元起。官方商城， JD ，及线下门店同步开售。 ', '6', '2018-04-23 15:54:16', '2018-04-23 15:54:16');
INSERT INTO `topics` VALUES ('51', '三面无边框的坚果3开箱图赏走一波···', '坚果3和坚果PRO的合影\n这样更能直观的看出坚果3的进步\n这样的千元机你买不买？', '6', '2018-04-23 15:54:39', '2018-04-23 15:54:39');
INSERT INTO `topics` VALUES ('52', '闪念胶囊的英文语音转换英文文字识别率还需提升', '闪念胶囊的英文语音转换英文文字识别率还需提升。\n闪念胶囊的英文语音转换英文文字识别率还需提升。\n闪念胶囊的英文语音转换英文文字识别率还需提升。\n感谢smartisanOS团队的辛勤付出，感谢锤子科技一如既往的坚持，再顶你一下。', '12', '2018-04-23 15:55:26', '2018-04-23 15:55:26');
INSERT INTO `topics` VALUES ('53', '坚果3虽然好看但是类似花瓶！', '2017年8月11日，锤子给一个少年卖出了一部坚果pro，但是这个人发现用625芯片的坚果pro用到现在性能已经略有不足，，当初没有花多点钱买更好点芯片的手机，但这并不妨碍我对坚果pro的喜爱，但对锤子新出的坚果3我有新的看法，坚果3最大的缺点不是其他，正是性能缺陷。当初我拿着我的坚果pro走进班级，班里人都是很惊讶的，他们第一次看到有人用锤子，尽管他们很多人都听过锤子，但他们就是没看过，班里很多人都玩王者荣耀，到现在更是有玩吃鸡的，就是最近我在玩王者的时候已经感受到了明显的掉帧，吃鸡更是不能上30针，这就让我有点想换个新的手机，熬到4月9号，锤子新品发布会推出的坚果3让我眼前一亮，我特别喜欢坚果3的外形，本以为老罗这次又能赚一把的时候，老罗用他的配置猛敲了我，高通骁龙625这个芯片在这个年代还能撑多久？我买个手机就用半年？确实，坚果3很便宜 ，我买坚果pro的时候要1499，坚果3全面屏还1299，但是呢？这个性能怎么让人提的起购买的欲望？相信很多人换手机都是想要更高的性能。所以', '12', '2018-04-23 15:55:43', '2018-04-23 15:55:43');
INSERT INTO `topics` VALUES ('54', '测试标题', '测试文件中', '9', '2018-04-24 10:18:38', '2018-04-24 10:18:38');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `nickname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('6', 'liucc512@163.com', 'd9b1d7db4cd6e70935368a1efb10e377', 'liucc512@163.com', 'default-avatar.png', '\0', '2018-04-19 02:44:26', '2018-04-19 02:44:26', 'gaoji');
INSERT INTO `users` VALUES ('9', '597084511@qq.com', '63ee451939ed580ef3c4b6f0109d1fd0', '597084511@qq.com', 'default-avatar.png', '\0', '2018-04-21 17:14:06', '2018-04-21 17:14:06', 'qq');
INSERT INTO `users` VALUES ('11', '603089567@qq.com', '63ee451939ed580ef3c4b6f0109d1fd0', '603089567@qq.com', 'default-avatar.png', '\0', '2018-04-21 17:18:20', '2018-04-21 17:18:20', 'qqq');
INSERT INTO `users` VALUES ('12', '123@123.com', '63ee451939ed580ef3c4b6f0109d1fd0', '123@123.com', 'default-avatar.png', '\0', '2018-04-21 17:57:44', '2018-04-21 17:57:44', '美貌大王');
INSERT INTO `users` VALUES ('13', '456@456.com', '63ee451939ed580ef3c4b6f0109d1fd0', '456@456.com', 'default-avatar.png', '\0', '2018-04-22 08:56:21', '2018-04-22 08:56:21', '456');

-- ----------------------------
-- Table structure for websites
-- ----------------------------
DROP TABLE IF EXISTS `websites`;
CREATE TABLE `websites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL DEFAULT '' COMMENT '站点名称',
  `url` varchar(255) NOT NULL DEFAULT '',
  `alexa` int(11) NOT NULL DEFAULT '0' COMMENT 'Alexa 排名',
  `country` char(10) NOT NULL DEFAULT '' COMMENT '国家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of websites
-- ----------------------------
INSERT INTO `websites` VALUES ('1', 'Google', 'https://www.google.cm/', '1', 'USA');
INSERT INTO `websites` VALUES ('2', '淘宝', 'https://www.taobao.com/', '13', 'CN');
INSERT INTO `websites` VALUES ('3', '菜鸟教程', 'http://www.runoob.com/', '4689', 'CN');
INSERT INTO `websites` VALUES ('4', '微博', 'http://weibo.com/', '20', 'CN');
INSERT INTO `websites` VALUES ('5', 'Facebook', 'https://www.facebook.com/', '3', 'USA');
