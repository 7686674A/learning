/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-09-13 15:58:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('博客管理', '1', '1504488615');
INSERT INTO `auth_assignment` VALUES ('管理员', '2', '1504506390');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/admin/*', '2', null, null, null, '1504505884', '1504505884');
INSERT INTO `auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1504508534', '1504508534');
INSERT INTO `auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1504510278', '1504510278');
INSERT INTO `auth_item` VALUES ('/blog/create', '2', null, null, null, '1504502066', '1504502066');
INSERT INTO `auth_item` VALUES ('/blog/delete', '2', null, null, null, '1504502066', '1504502066');
INSERT INTO `auth_item` VALUES ('/blog/index', '2', '博客列表', null, null, '1504488615', '1504488615');
INSERT INTO `auth_item` VALUES ('/blog/update', '2', null, null, null, '1504502066', '1504502066');
INSERT INTO `auth_item` VALUES ('/blog/view', '2', null, null, null, '1504502066', '1504502066');
INSERT INTO `auth_item` VALUES ('/category/*', '2', null, null, null, '1504512435', '1504512435');
INSERT INTO `auth_item` VALUES ('/category/create', '2', null, null, null, '1504512435', '1504512435');
INSERT INTO `auth_item` VALUES ('/category/delete', '2', null, null, null, '1504512435', '1504512435');
INSERT INTO `auth_item` VALUES ('/category/index', '2', null, null, null, '1504512435', '1504512435');
INSERT INTO `auth_item` VALUES ('/category/update', '2', null, null, null, '1504512435', '1504512435');
INSERT INTO `auth_item` VALUES ('/category/view', '2', null, null, null, '1504512435', '1504512435');
INSERT INTO `auth_item` VALUES ('博客管理', '1', null, null, null, '1504488615', '1504488615');
INSERT INTO `auth_item` VALUES ('权限管理', '2', '权限管理', null, null, '1504505953', '1504506150');
INSERT INTO `auth_item` VALUES ('栏目管理', '2', '栏目管理', null, null, '1504512476', '1504512476');
INSERT INTO `auth_item` VALUES ('管理员', '1', '管理员', null, null, '1504506266', '1504506266');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/assignment/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/assignment/assign');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/assignment/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/assignment/revoke');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/assignment/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/default/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/default/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/menu/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/menu/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/menu/delete');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/menu/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/menu/update');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/menu/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/assign');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/delete');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/remove');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/update');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/assign');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/delete');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/remove');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/update');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/route/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/route/assign');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/route/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/route/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/route/refresh');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/route/remove');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/rule/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/rule/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/rule/delete');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/rule/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/rule/update');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/rule/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/activate');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/change-password');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/delete');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/login');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/logout');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/request-password-reset');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/reset-password');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/signup');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/view');
INSERT INTO `auth_item_child` VALUES ('博客管理', '/blog/create');
INSERT INTO `auth_item_child` VALUES ('博客管理', '/blog/delete');
INSERT INTO `auth_item_child` VALUES ('博客管理', '/blog/index');
INSERT INTO `auth_item_child` VALUES ('博客管理', '/blog/update');
INSERT INTO `auth_item_child` VALUES ('博客管理', '/blog/view');
INSERT INTO `auth_item_child` VALUES ('栏目管理', '/category/*');
INSERT INTO `auth_item_child` VALUES ('栏目管理', '/category/create');
INSERT INTO `auth_item_child` VALUES ('栏目管理', '/category/delete');
INSERT INTO `auth_item_child` VALUES ('栏目管理', '/category/index');
INSERT INTO `auth_item_child` VALUES ('栏目管理', '/category/update');
INSERT INTO `auth_item_child` VALUES ('栏目管理', '/category/view');
INSERT INTO `auth_item_child` VALUES ('管理员', '博客管理');
INSERT INTO `auth_item_child` VALUES ('管理员', '权限管理');
INSERT INTO `auth_item_child` VALUES ('管理员', '栏目管理');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `is_delete` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否删除 1未删除 2已删除',
  `created_at` datetime NOT NULL COMMENT '添加时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'test', '<h1>Hellow world!</h1><p>cesihi</p><p><a href=\"http://www.baidu.com\" target=\"_blank\">百度</a><br></p><p><span style=\"background-color: rgb(219, 238, 243);\"></span></p><p><img src=\"./uploads/2/0878e4a063-123.png\"></p><p><a href=\"./uploads/2/9eb53b5052-tai-zhang-biao-ge.rar\">9eb53b5052-tai-zhang-biao-ge.rar</a><br></p><p><img src=\"./uploads/20170907/2f1818a43b-timg.jpg\"></p>', '1', '1', '2015-00-00 00:00:00', '2015-00-00 00:00:00');
INSERT INTO `blog` VALUES ('2', 'aaaaa', '<p>safaf</p>', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `blog` VALUES ('3', '123456', '<p>okok,interesting!!!</p>', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `blog` VALUES ('4', 'warning', '<h1>fsafasfasf</h1><pre>&lt;?php\r\n<span class=\"redactor-invisible-space\">    echo \"hellow world\";\r\n</span>?&gt;</pre>', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `blog` VALUES ('5', 'test may ok', '<p>test may ok</p>', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `blog_id` int(11) NOT NULL COMMENT '文章ID',
  `category_id` int(11) NOT NULL COMMENT '栏目ID',
  KEY `blog_id` (`blog_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章-栏目关联表';

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES ('0', '1');
INSERT INTO `blog_category` VALUES ('0', '2');
INSERT INTO `blog_category` VALUES ('0', '1');
INSERT INTO `blog_category` VALUES ('0', '2');
INSERT INTO `blog_category` VALUES ('3', '2');
INSERT INTO `blog_category` VALUES ('4', '7');
INSERT INTO `blog_category` VALUES ('5', '7');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '栏目名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'haha');
INSERT INTO `category` VALUES ('2', '测试12');
INSERT INTO `category` VALUES ('3', '测试2');
INSERT INTO `category` VALUES ('5', '测试4');
INSERT INTO `category` VALUES ('6', '123456');
INSERT INTO `category` VALUES ('7', '1234');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '11111');
INSERT INTO `goods` VALUES ('2', '22222');
INSERT INTO `goods` VALUES ('3', '333');
INSERT INTO `goods` VALUES ('4', '444');
INSERT INTO `goods` VALUES ('5', '555');
INSERT INTO `goods` VALUES ('6', '66');
INSERT INTO `goods` VALUES ('7', '');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '权限', null, null, '1', null);
INSERT INTO `menu` VALUES ('2', '菜单', null, '/admin/menu/index', '1', null);
INSERT INTO `menu` VALUES ('3', '路由管理', '1', '/admin/route/index', '1', null);
INSERT INTO `menu` VALUES ('4', '权限管理', '1', '/admin/permission/index', '2', null);
INSERT INTO `menu` VALUES ('5', '角色管理', '1', '/admin/role/index', '3', null);
INSERT INTO `menu` VALUES ('6', '管理员', '1', '/admin/assignment/index', '4', null);
INSERT INTO `menu` VALUES ('7', '栏目管理', null, '/category/index', '9', null);

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1504341217');
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', '1504341220');
INSERT INTO `migration` VALUES ('m140602_111327_create_menu_table', '1504506844');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `date` datetime DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('2', '123456', null);
INSERT INTO `test` VALUES ('3', '12345', '2017-09-07 00:00:00');
INSERT INTO `test` VALUES ('4', 'asd', '2017-09-08 13:50:00');
INSERT INTO `test` VALUES ('5', 'firefox', '2017-09-07 13:50:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `api_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'yzY59n9P-m16En93EogIZtrLKNSM-D6q', '$2y$13$BrKrefYiS4gzWQNBEnSDWOp.zee7mpDIW0I/pBAA2LmobROu4ooku', null, 'admin@qq.com', '10', '1504079415', '1504079415', null);
INSERT INTO `user` VALUES ('6', '111', 'ASt7NPwxa-4xx3gg0-FXjjLrzoWZrm5A', '$2y$13$zApzQ3Pe9biV8MsLKD9ebur5Ib1xkIWVTeclqRkRxRB9eevNjuaT6', null, '111@111.com', '10', '1505187121', '1505289207', 'J1zMEncT9yYAaXP84ppNY28CXuNv3KWP_1505289207');

-- ----------------------------
-- Table structure for user_backend
-- ----------------------------
DROP TABLE IF EXISTS `user_backend`;
CREATE TABLE `user_backend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_backend
-- ----------------------------
INSERT INTO `user_backend` VALUES ('1', 'admin', 'yzY59n9P-m16En93EogIZtrLKNSM-D6q', '$2y$13$BrKrefYiS4gzWQNBEnSDWOp.zee7mpDIW0I/pBAA2LmobROu4ooku', 'admin@qq.com', '2017-09-02 13:35:07', '2017-09-02 13:35:12');
INSERT INTO `user_backend` VALUES ('2', 'root', 'GiWXNkyGx_ENmxY09LkN9kq0hDHDa5bo', '$2y$13$UAT8ZGfBLGfi6yHq/5sEGefAnS7ZN5wiuwcPZDlQJsLmy9MSaAXCy', 'root@163.com', '2017-09-02 14:16:43', '2017-09-02 14:16:43');
