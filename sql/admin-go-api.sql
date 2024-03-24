/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : localhost:3306
 Source Schema         : admin-go-api

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 24/03/2024 13:40:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_admin
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin`;
CREATE TABLE `sys_admin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '''主键''',
  `post_id` bigint DEFAULT NULL COMMENT '''岗位id''',
  `dept_id` bigint DEFAULT NULL COMMENT '''部门id''',
  `username` longtext COLLATE utf8mb4_0900_bin NOT NULL COMMENT '''用户账号''',
  `password` longtext COLLATE utf8mb4_0900_bin NOT NULL COMMENT '''密码''',
  `nickname` longtext COLLATE utf8mb4_0900_bin COMMENT '''昵称''',
  `status` bigint NOT NULL DEFAULT '1' COMMENT '''帐号启用状态：1->启用,2->禁用''',
  `icon` longtext COLLATE utf8mb4_0900_bin COMMENT '''头像''',
  `email` longtext COLLATE utf8mb4_0900_bin COMMENT '''邮箱''',
  `phone` longtext COLLATE utf8mb4_0900_bin COMMENT '''电话''',
  `note` longtext COLLATE utf8mb4_0900_bin COMMENT '''备注''',
  `create_time` datetime(3) NOT NULL COMMENT '''创建时间''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_bin;

-- ----------------------------
-- Records of sys_admin
-- ----------------------------
BEGIN;
INSERT INTO `sys_admin` VALUES (3, 1, 1, 'admin', '1bbd886460827015e5d605ed44252251', 'nickname2', 1, 'http://localhost:2002/upload/img/20240323/383017000.png', '666.sans.com2', '13333333332', '后端研发', '2024-03-09 18:24:16.156');
INSERT INTO `sys_admin` VALUES (4, 1, 1, 'slysanss', 'c20ad4d76fe97759aa27a0c99bff6710', 'sly', 1, '', 'sly1@gmail.com', '13822222222', 'slynote1', '2024-03-09 18:37:21.719');
INSERT INTO `sys_admin` VALUES (5, 1, 1, 'slysanss3', '202cb962ac59075b964b07152d234b70', 'sly3', 1, '', 'sly1@gmail.com', '13822222222', 'slynote1', '2024-03-09 18:37:29.552');
INSERT INTO `sys_admin` VALUES (7, 2, 4, 'test222', '1bbd886460827015e5d605ed44252251', 'test2', 1, '', '22@2222', '22', '222', '2024-03-21 13:51:54.903');
INSERT INTO `sys_admin` VALUES (9, 1, 1, 'test', '1bbd886460827015e5d605ed44252251', 'test', 1, 'http://localhost:2002/upload/img/20240324/231656000.png', '1122', '13333333333', '111', '2024-03-23 23:06:52.328');
COMMIT;

-- ----------------------------
-- Table structure for sys_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin_role`;
CREATE TABLE `sys_admin_role` (
  `role_id` bigint unsigned NOT NULL COMMENT '''角色id''',
  `admin_id` bigint unsigned NOT NULL COMMENT '''用户id'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_bin;

-- ----------------------------
-- Records of sys_admin_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_admin_role` VALUES (1, 3);
INSERT INTO `sys_admin_role` VALUES (1, 4);
INSERT INTO `sys_admin_role` VALUES (1, 5);
INSERT INTO `sys_admin_role` VALUES (0, 0);
INSERT INTO `sys_admin_role` VALUES (1, 7);
INSERT INTO `sys_admin_role` VALUES (2, 9);
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '''主键''',
  `parent_id` bigint unsigned NOT NULL COMMENT '''父id''',
  `dept_type` bigint unsigned NOT NULL COMMENT '''部门类型（1->公司, 2->中心，3->部门）''',
  `dept_name` longtext COLLATE utf8mb4_0900_bin NOT NULL COMMENT '''部门名称''',
  `dept_status` bigint DEFAULT '1' COMMENT '''部门状态（1->正常 2->停用）''',
  `create_time` datetime(3) NOT NULL COMMENT '''创建时间''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_bin;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1, 0, 1, '深圳架构研发中心', 1, '2022-01-01 00:00:00.000');
INSERT INTO `sys_dept` VALUES (2, 1, 2, '罗湖区研发中心', 1, '2022-01-01 00:00:00.000');
INSERT INTO `sys_dept` VALUES (3, 2, 3, '架构设计部', 1, '2022-01-01 00:00:00.000');
INSERT INTO `sys_dept` VALUES (4, 2, 3, '测试部门', 1, '2024-03-08 20:44:52.954');
INSERT INTO `sys_dept` VALUES (5, 2, 3, '后端研发部门', 1, '2024-03-08 20:45:07.443');
INSERT INTO `sys_dept` VALUES (6, 2, 3, '前端研发部门', 1, '2024-03-08 20:45:20.793');
INSERT INTO `sys_dept` VALUES (7, 2, 3, '销售部门', 1, '2024-03-08 20:45:31.834');
INSERT INTO `sys_dept` VALUES (8, 2, 3, '综合管理部门', 1, '2024-03-18 21:08:14.500');
INSERT INTO `sys_dept` VALUES (9, 0, 1, '广东亚洲发展公司', 1, '2024-03-18 21:09:49.334');
COMMIT;

-- ----------------------------
-- Table structure for sys_login_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_info`;
CREATE TABLE `sys_login_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '''主键''',
  `username` longtext COLLATE utf8mb4_0900_bin COMMENT '''用户账号''',
  `ip_address` longtext COLLATE utf8mb4_0900_bin COMMENT '''登录IP地址''',
  `login_location` longtext COLLATE utf8mb4_0900_bin COMMENT '''登录地点''',
  `browser` longtext COLLATE utf8mb4_0900_bin COMMENT '''浏览器类型''',
  `os` longtext COLLATE utf8mb4_0900_bin COMMENT '''操作系统''',
  `login_status` bigint DEFAULT NULL COMMENT '''登录状态（1-成功 2-失败）''',
  `message` longtext COLLATE utf8mb4_0900_bin COMMENT '''提示消息''',
  `login_time` datetime(3) DEFAULT NULL COMMENT '''访问时间''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_bin;

-- ----------------------------
-- Records of sys_login_info
-- ----------------------------
BEGIN;
INSERT INTO `sys_login_info` VALUES (1, 'admin', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 1, '登录成功', '2024-03-24 12:40:32.376');
INSERT INTO `sys_login_info` VALUES (2, 'admin', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 2, '验证码不正确', '2024-03-24 12:46:03.180');
INSERT INTO `sys_login_info` VALUES (3, 'admin', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 2, '验证码不正确', '2024-03-24 12:46:09.413');
INSERT INTO `sys_login_info` VALUES (4, 'admin', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 1, '登录成功', '2024-03-24 12:46:18.304');
INSERT INTO `sys_login_info` VALUES (5, 'admin', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 1, '登录成功', '2024-03-24 12:48:36.429');
INSERT INTO `sys_login_info` VALUES (6, 'admin', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 1, '登录成功', '2024-03-24 13:06:18.426');
INSERT INTO `sys_login_info` VALUES (7, 'test', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 1, '登录成功', '2024-03-24 13:07:45.474');
INSERT INTO `sys_login_info` VALUES (8, 'admin', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 2, '验证码不正确', '2024-03-24 13:08:24.371');
INSERT INTO `sys_login_info` VALUES (9, 'admin', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 1, '登录成功', '2024-03-24 13:08:37.619');
INSERT INTO `sys_login_info` VALUES (10, 'test', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 1, '登录成功', '2024-03-24 13:09:29.000');
INSERT INTO `sys_login_info` VALUES (11, 'admin', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 1, '登录成功', '2024-03-24 13:14:21.977');
INSERT INTO `sys_login_info` VALUES (12, 'test', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 2, '验证码不正确', '2024-03-24 13:21:49.186');
INSERT INTO `sys_login_info` VALUES (13, 'test', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 1, '登录成功', '2024-03-24 13:21:58.929');
INSERT INTO `sys_login_info` VALUES (14, 'admin', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 1, '登录成功', '2024-03-24 13:23:57.082');
INSERT INTO `sys_login_info` VALUES (15, 'test', '127.0.0.1', '服务器登录', 'Chrome/123.0.0.0', 'Mac OS X 10_15_7', 1, '登录成功', '2024-03-24 13:24:09.833');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '''主键''',
  `parent_id` bigint unsigned DEFAULT NULL COMMENT '''父菜单id''',
  `menu_name` longtext COLLATE utf8mb4_0900_bin COMMENT '''菜单名称''',
  `icon` longtext COLLATE utf8mb4_0900_bin COMMENT '''菜单图标''',
  `value` longtext COLLATE utf8mb4_0900_bin COMMENT '''权限值''',
  `menu_type` bigint unsigned DEFAULT NULL COMMENT '''菜单类型：1->目录；2->菜单；3->按钮''',
  `url` longtext COLLATE utf8mb4_0900_bin COMMENT '''菜单url''',
  `menu_status` bigint unsigned DEFAULT NULL COMMENT '''启用状态；1->禁用；2->启用''',
  `sort` bigint unsigned DEFAULT NULL COMMENT '''排序''',
  `create_time` datetime(3) DEFAULT NULL COMMENT '''创建时间''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_bin;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '首页', 'el-icon-s-home', NULL, 1, 'welcome', 2, 1, '2022-01-01 00:00:00.000');
INSERT INTO `sys_menu` VALUES (4, 0, '基础管理', 'el-icon-setting', NULL, 1, NULL, 2, 2, '2022-01-01 00:00:00.000');
INSERT INTO `sys_menu` VALUES (6, 4, '用户信息', 'el-icon-user-solid', 'base:admin:list', 2, 'base/admin', 2, 1, '2022-01-01 00:00:00.000');
INSERT INTO `sys_menu` VALUES (7, 4, '菜单信息', 'el-icon-menu', 'base:menu:list', 2, 'base/menu', 2, 2, '2022-01-01 00:00:00.000');
INSERT INTO `sys_menu` VALUES (8, 4, '部门信息', 'el-icon-menu', 'base:dept:list', 2, 'base/dept', 2, 3, '2009-09-09 00:00:00.000');
INSERT INTO `sys_menu` VALUES (9, 4, '岗位信息', 'el-icon-menu', 'base:post:list', 2, 'base/post', 2, 4, '2020-02-02 00:00:00.000');
INSERT INTO `sys_menu` VALUES (10, 0, '日志管理', 'el-icon-platform-eleme', '', 1, '', 2, 3, '2024-03-19 14:46:19.664');
INSERT INTO `sys_menu` VALUES (11, 10, '操作日志', 'el-icon-setting', 'monitor:operator:list', 2, 'monitor/operator', 2, 2, '2024-03-19 14:49:14.688');
INSERT INTO `sys_menu` VALUES (12, 10, '登录日志', 'el-icon-user-solid', 'monitor:loginLog', 2, 'monitor/loginLog', 2, 1, '2024-03-19 14:55:58.452');
INSERT INTO `sys_menu` VALUES (16, 4, '角色信息', 'el-icon-user', 'base:role:list', 2, 'base/role', 2, 5, '2024-03-20 10:01:06.089');
INSERT INTO `sys_menu` VALUES (19, 6, '新增', '', 'base:admin:add', 3, '', 2, 1, '2024-03-24 12:41:38.233');
INSERT INTO `sys_menu` VALUES (20, 6, '编辑', '', 'base:admin:edit', 3, '', 2, 2, '2024-03-24 12:45:02.289');
INSERT INTO `sys_menu` VALUES (21, 6, '删除', '', 'base:admin:delete', 3, '', 2, 3, '2024-03-24 12:45:33.624');
INSERT INTO `sys_menu` VALUES (22, 6, '重置密码', '', 'base:admin:reset', 3, '', 2, 4, '2024-03-24 12:52:01.672');
COMMIT;

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '''主键''',
  `admin_id` bigint unsigned NOT NULL COMMENT '''管理员id''',
  `username` longtext COLLATE utf8mb4_0900_bin NOT NULL COMMENT '''管理员账号''',
  `method` longtext COLLATE utf8mb4_0900_bin NOT NULL COMMENT '''请求方式''',
  `ip` longtext COLLATE utf8mb4_0900_bin COMMENT '''IP''',
  `url` longtext COLLATE utf8mb4_0900_bin COMMENT '''URL''',
  `create_time` datetime(3) NOT NULL COMMENT '''创建时间''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_bin;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_operation_log` VALUES (1, 3, 'admin', 'post', '127.0.0.1', '/api/admin/add', '2024-03-23 23:06:52.311');
INSERT INTO `sys_operation_log` VALUES (2, 3, 'admin', 'post', '127.0.0.1', '/api/menu/add', '2024-03-24 12:41:38.216');
INSERT INTO `sys_operation_log` VALUES (3, 3, 'admin', 'post', '127.0.0.1', '/api/menu/add', '2024-03-24 12:45:02.260');
INSERT INTO `sys_operation_log` VALUES (4, 3, 'admin', 'post', '127.0.0.1', '/api/menu/add', '2024-03-24 12:45:33.589');
INSERT INTO `sys_operation_log` VALUES (5, 3, 'admin', 'put', '127.0.0.1', '/api/role/assignPermissions', '2024-03-24 12:46:47.535');
INSERT INTO `sys_operation_log` VALUES (6, 3, 'admin', 'post', '127.0.0.1', '/api/menu/add', '2024-03-24 12:52:01.590');
INSERT INTO `sys_operation_log` VALUES (7, 3, 'admin', 'put', '127.0.0.1', '/api/role/assignPermissions', '2024-03-24 12:52:10.707');
INSERT INTO `sys_operation_log` VALUES (8, 3, 'admin', 'put', '127.0.0.1', '/api/role/assignPermissions', '2024-03-24 12:52:18.066');
INSERT INTO `sys_operation_log` VALUES (9, 3, 'admin', 'put', '127.0.0.1', '/api/role/assignPermissions', '2024-03-24 12:53:02.241');
INSERT INTO `sys_operation_log` VALUES (10, 3, 'admin', 'put', '127.0.0.1', '/api/role/assignPermissions', '2024-03-24 13:02:17.308');
INSERT INTO `sys_operation_log` VALUES (11, 3, 'admin', 'put', '127.0.0.1', '/api/role/assignPermissions', '2024-03-24 13:05:25.971');
INSERT INTO `sys_operation_log` VALUES (12, 3, 'admin', 'put', '127.0.0.1', '/api/admin/update', '2024-03-24 13:06:49.450');
INSERT INTO `sys_operation_log` VALUES (13, 3, 'admin', 'put', '127.0.0.1', '/api/admin/updatePassword', '2024-03-24 13:06:56.893');
INSERT INTO `sys_operation_log` VALUES (14, 3, 'admin', 'put', '127.0.0.1', '/api/role/assignPermissions', '2024-03-24 13:07:27.070');
INSERT INTO `sys_operation_log` VALUES (15, 9, 'test', 'post', '127.0.0.1', '/api/upload', '2024-03-24 13:08:07.212');
INSERT INTO `sys_operation_log` VALUES (16, 9, 'test', 'put', '127.0.0.1', '/api/admin/updatePersonal', '2024-03-24 13:08:08.717');
INSERT INTO `sys_operation_log` VALUES (17, 3, 'admin', 'put', '127.0.0.1', '/api/role/assignPermissions', '2024-03-24 13:08:48.981');
INSERT INTO `sys_operation_log` VALUES (18, 3, 'admin', 'put', '127.0.0.1', '/api/role/assignPermissions', '2024-03-24 13:21:32.182');
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '''主键''',
  `post_code` longtext COLLATE utf8mb4_0900_bin NOT NULL COMMENT '''岗位编码''',
  `post_name` longtext COLLATE utf8mb4_0900_bin NOT NULL COMMENT '''岗位名称''',
  `post_status` bigint NOT NULL DEFAULT '1' COMMENT '''状态（1->正常 2->停用）''',
  `create_time` datetime(3) NOT NULL COMMENT '''创建时间''',
  `remark` longtext COLLATE utf8mb4_0900_bin COMMENT '''备注''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_bin;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'AAA', '财务部', 1, '2024-03-07 14:03:08.144', '财务部');
INSERT INTO `sys_post` VALUES (2, 'BBB', '销售部', 1, '2024-03-07 14:03:39.871', '销售部');
INSERT INTO `sys_post` VALUES (4, 'QHB', '企划部', 1, '2024-03-08 19:44:58.917', 'QHB');
INSERT INTO `sys_post` VALUES (7, 'CSZ', '测试组', 1, '2024-03-08 20:52:42.769', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '''主键''',
  `role_name` longtext COLLATE utf8mb4_0900_bin NOT NULL COMMENT '''角色名称''',
  `role_key` longtext COLLATE utf8mb4_0900_bin NOT NULL COMMENT '''权限字符串''',
  `status` bigint NOT NULL DEFAULT '1' COMMENT '''帐号启用状态：1->启用,2->禁用''',
  `description` longtext COLLATE utf8mb4_0900_bin COMMENT '''描述''',
  `create_time` datetime(3) NOT NULL COMMENT '''创建时间''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_bin;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'base:sys:list', 1, '超级', '2022-01-01 00:00:00.000');
INSERT INTO `sys_role` VALUES (2, '管理员', 'base:sys:admin', 1, '管理员', '2024-03-21 08:13:55.988');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint unsigned NOT NULL COMMENT '''角色id''',
  `menu_id` bigint unsigned NOT NULL COMMENT '''菜单id'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_bin;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (2, 20);
INSERT INTO `sys_role_menu` VALUES (2, 22);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (2, 9);
INSERT INTO `sys_role_menu` VALUES (2, 16);
INSERT INTO `sys_role_menu` VALUES (2, 10);
INSERT INTO `sys_role_menu` VALUES (2, 11);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
