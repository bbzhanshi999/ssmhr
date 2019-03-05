/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50528
Source Host           : 127.0.0.1:3306
Source Database       : hr

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-03-05 11:54:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(32) DEFAULT NULL COMMENT '部门名称',
  `depart_code` varchar(32) DEFAULT NULL COMMENT '部门编码',
  `depart_type` varchar(32) DEFAULT NULL COMMENT '部门类型',
  `depart_phone` varchar(32) DEFAULT NULL COMMENT '部门电话',
  `del_flag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', '开发部', '001', '研发', '112313', '0');
INSERT INTO `departments` VALUES ('2', '经理办公室', '002', '后勤', '1123123', '0');
INSERT INTO `departments` VALUES ('3', '销售部', '003', '销售', '123123', '0');
INSERT INTO `departments` VALUES ('4', '售后中心', '004', '售后', '123213', '0');
INSERT INTO `departments` VALUES ('5', '庶务科', '005', '后勤', '5436436', '0');
INSERT INTO `departments` VALUES ('6', '产品部', '006', '产品', '5435435', '0');
INSERT INTO `departments` VALUES ('7', '大数据部', '007', '研发', '123213', '0');

-- ----------------------------
-- Table structure for employee_tranform
-- ----------------------------
DROP TABLE IF EXISTS `employee_tranform`;
CREATE TABLE `employee_tranform` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trans_type` char(1) DEFAULT NULL COMMENT '0:入职，1：离职，2：调动',
  `in_depart_id` bigint(20) DEFAULT NULL COMMENT '入职部门id',
  `out_depart_id` bigint(20) DEFAULT NULL COMMENT '离职部门',
  `in_pos_id` bigint(20) DEFAULT NULL COMMENT '入职岗位id',
  `out_pos_id` bigint(20) DEFAULT NULL COMMENT '离职岗位id',
  `t_id` bigint(20) DEFAULT NULL COMMENT '人才id',
  `tran_date` date DEFAULT NULL COMMENT '流转日期',
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_tranform
-- ----------------------------

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(32) DEFAULT NULL,
  `url` varchar(64) DEFAULT NULL,
  `del_flag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', '系统管理', null, '0');
INSERT INTO `menus` VALUES ('2', '人才管理', null, '0');
INSERT INTO `menus` VALUES ('3', '统计报表', null, '0');

-- ----------------------------
-- Table structure for positions
-- ----------------------------
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(32) DEFAULT NULL COMMENT '岗位名称',
  `pos_code` varchar(32) DEFAULT NULL COMMENT '岗位编码',
  `pos_salary` double(10,2) DEFAULT NULL COMMENT '岗位薪水',
  `del_flag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of positions
-- ----------------------------
INSERT INTO `positions` VALUES ('1', '程序员', '1', '20000.00', '0');
INSERT INTO `positions` VALUES ('2', '测试工程师', '2', '8000.00', '0');
INSERT INTO `positions` VALUES ('3', '人事专员', '11', '5000.00', '0');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) DEFAULT NULL,
  `del_flag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', '0');
INSERT INTO `roles` VALUES ('2', 'client', '0');
INSERT INTO `roles` VALUES ('3', 'manager', '0');

-- ----------------------------
-- Table structure for roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `roles_menus`;
CREATE TABLE `roles_menus` (
  `role_id` bigint(20) NOT NULL DEFAULT '0',
  `menu_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles_menus
-- ----------------------------
INSERT INTO `roles_menus` VALUES ('1', '1');
INSERT INTO `roles_menus` VALUES ('1', '2');
INSERT INTO `roles_menus` VALUES ('1', '3');
INSERT INTO `roles_menus` VALUES ('2', '2');
INSERT INTO `roles_menus` VALUES ('2', '3');
INSERT INTO `roles_menus` VALUES ('3', '3');

-- ----------------------------
-- Table structure for talents
-- ----------------------------
DROP TABLE IF EXISTS `talents`;
CREATE TABLE `talents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `t_code` varchar(32) DEFAULT NULL COMMENT '工号',
  `sexual` char(1) DEFAULT '2' COMMENT '0：女，1：男，2：未知',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `identity` varchar(32) DEFAULT NULL COMMENT '身份证',
  `depart_id` bigint(20) DEFAULT NULL COMMENT '部门id',
  `pos_id` bigint(20) DEFAULT NULL COMMENT '岗位id',
  `employ_date` date DEFAULT NULL COMMENT '雇佣时间',
  `unemploy_date` date DEFAULT NULL COMMENT '离职时间',
  `startup_date` date DEFAULT NULL COMMENT '开始工作时间',
  `talent_source` varchar(20) DEFAULT NULL COMMENT '人才来源',
  `politics_status` varchar(10) DEFAULT NULL COMMENT '政治面貌',
  `marriage` varchar(10) DEFAULT NULL COMMENT '婚姻状况',
  `body_height` int(11) DEFAULT NULL COMMENT '身高',
  `body_weight` int(11) DEFAULT NULL COMMENT '体重',
  `edu_background` varchar(10) DEFAULT NULL COMMENT '学历',
  `grad_inst` varchar(64) DEFAULT NULL COMMENT '毕业院校',
  `profession` varchar(32) DEFAULT NULL COMMENT '专业',
  `status` char(1) DEFAULT '0' COMMENT '入职状态：0:未入职，1:入职，2：离职',
  `del_flag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of talents
-- ----------------------------
INSERT INTO `talents` VALUES ('1', '张三疯', '001', '0', '2018-06-30', '111', '1', '1', '2018-06-30', '2018-06-30', '2018-06-05', '校招', '党员', '1', '150', '160', '大学本科', '上海海洋', '计算机', '1', '0');
INSERT INTO `talents` VALUES ('2', '李四', '002', '1', '2018-07-01', '222', '2', '2', null, null, '2018-06-04', '社招', '普通公民', '0', '111', '111', '专科', '上海海事', '社会', '0', '0');
INSERT INTO `talents` VALUES ('3', '王五', '003', '1', '2018-05-29', '3232323233', '2', '3', '2018-06-26', '2018-05-29', null, '校招', '普通公民', '0', '111', '111', '', '', '', '1', '0');
INSERT INTO `talents` VALUES ('4', '啊沙发斯蒂芬斯蒂芬', '123213', '1', '2018-07-26', '3213', '2', '2', null, null, null, '社招', '普通公民', '1', '213213', '123', '', '123', '123', '0', '0');
INSERT INTO `talents` VALUES ('5', 'fdsf', '', '0', '2018-07-24', '', '1', '1', null, null, null, '校招', '普通公民', '0', null, null, '', '', '', '0', '0');
INSERT INTO `talents` VALUES ('6', '法第三方士大夫gfg', '', '1', '2018-05-29', '', '1', '1', null, null, null, '校招', '普通公民', '0', null, null, '', '', '', '0', '0');
INSERT INTO `talents` VALUES ('7', '法第三方士大夫gfg', 'asf', '1', null, '', '1', '1', null, null, null, '校招', '普通公民', '0', null, null, '', '', '', '0', '0');
INSERT INTO `talents` VALUES ('8', 'fsdf', 'sdf ', '1', '2018-05-29', '', '1', '1', null, null, null, '校招', '普通公民', '0', null, null, '', '', '', '0', '0');
INSERT INTO `talents` VALUES ('9', 'fdwfwe3e3q', '', '0', '2018-07-24', '', '1', '1', null, null, null, '校招', '普通公民', '0', null, null, '', '', '', '0', '0');
INSERT INTO `talents` VALUES ('10', '赵六', null, '1', '2018-07-01', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', '0');
INSERT INTO `talents` VALUES ('11', '刘翔', 'asdsad', '0', '2018-07-17', '1', '2', '2', '2018-07-12', '2018-07-17', '2018-07-04', '社招', '党员', '1', '11', null, null, null, null, '0', '0');
INSERT INTO `talents` VALUES ('12', '分页测试', null, '1', null, null, '7', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('13', '分页测试', null, '1', null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('14', '分页测试', null, '1', null, null, '7', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('15', '分页测试', null, '1', null, null, '5', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('16', '分页测试', null, '1', null, null, '5', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('17', '分页测试', null, '1', null, null, '3', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('18', '分页测试', null, '1', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('19', '分页测试', null, '1', null, null, '2', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('20', '分页测试', null, '1', null, null, '5', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('21', '分页测试', null, '1', null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('22', '分页测试', null, '1', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('23', '分页测试', null, '1', null, null, '3', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('24', '分页测试', null, '1', null, null, '3', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('25', '分页测试', null, '1', null, null, '2', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('26', '分页测试', null, '1', null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('27', '分页测试', null, '1', null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('28', '分页测试', null, '1', null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('29', '分页测试', null, '1', null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('30', '分页测试', null, '1', null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('31', '分页测试', null, '1', null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('32', '分页测试', null, '1', null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('33', '分页测试', null, '1', null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('34', '分页测试', null, '1', null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('35', '分页测试', null, '1', null, null, '6', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('36', '分页测试', null, '1', null, null, '5', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('37', '分页测试', null, '1', null, null, '5', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('38', '分页测试', null, '1', null, null, '5', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('39', '分页测试', null, '1', null, null, '5', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('40', '分页测试', null, '1', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('41', '分页测试1', null, '1', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('42', '分页测试1', null, '1', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('43', '分页测试1', null, '1', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('44', '分页测试2', null, '1', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('45', '分页测试3', null, '1', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('46', '分页测试4', null, '1', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('47', '分页测试5', null, '1', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('48', '分页测试6', null, '1', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('49', '分页测试6', null, '1', null, null, '4', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('50', '分页测试6', null, '1', null, null, '5', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('51', '分页测试7', null, '1', null, null, '3', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('52', '分页测试74', null, '1', null, null, '3', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('53', '分页测试454', null, '1', null, null, '3', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('54', '分页测试45', null, '1', null, null, '3', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('55', '分页测试45', null, '1', null, null, '3', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('56', '分页测试424', null, '1', null, null, '3', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');
INSERT INTO `talents` VALUES ('57', '分页测试234', null, '1', null, null, '3', null, null, null, null, null, null, null, null, null, null, null, null, '2', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记位：0：未删除，1：删除',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'zql', '1234', '赵千里', '1333333', '0', '2018-06-30 00:13:12');
INSERT INTO `users` VALUES ('2', 'zhangsan', '4567', '张三', '5435435435', '0', '2018-08-28 14:10:53');
INSERT INTO `users` VALUES ('3', 'lisi', '324324', '李四', '1333333', '0', '2018-08-16 09:01:16');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('1', '2');
INSERT INTO `user_role` VALUES ('2', '2');
INSERT INTO `user_role` VALUES ('1', '3');
INSERT INTO `user_role` VALUES ('2', '3');
