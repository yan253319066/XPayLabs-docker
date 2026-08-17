/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 8.0.39 : Database - xpaylabs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xpaylabs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `xpaylabs`;

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL COMMENT '编号',
  `data_name` varchar(200) DEFAULT '' COMMENT '数据源名称',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

/*Data for the table `gen_table` */


/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

/*Table structure for table `sys_client` */

DROP TABLE IF EXISTS `sys_client`;

CREATE TABLE `sys_client` (
  `id` bigint NOT NULL COMMENT 'id',
  `client_id` varchar(64) DEFAULT NULL COMMENT '客户端id',
  `client_key` varchar(32) DEFAULT NULL COMMENT '客户端key',
  `client_secret` varchar(255) DEFAULT NULL COMMENT '客户端秘钥',
  `grant_type` varchar(255) DEFAULT NULL COMMENT '授权类型',
  `device_type` varchar(32) DEFAULT NULL COMMENT '设备类型',
  `active_timeout` int DEFAULT '1800' COMMENT 'token活跃超时时间',
  `timeout` int DEFAULT '604800' COMMENT 'token固定超时',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统授权表';

/*Data for the table `sys_client` */

insert  into `sys_client`(`id`,`client_id`,`client_key`,`client_secret`,`grant_type`,`device_type`,`active_timeout`,`timeout`,`status`,`del_flag`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,'e5cd7e4891bf95d1d19206ce24a7b32e','pc','pc123','password,social','SYS_PC',1800,604800,'0','0',103,1,'2025-07-28 10:29:46',1,'2025-07-28 10:29:46'),
(2,'428a8310cd442757ae699df5d894f051','app','app123','password,sms,social','SYS_APP',1800,604800,'0','0',103,1,'2025-07-28 10:29:46',1,'2025-07-28 10:29:46');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` bigint NOT NULL COMMENT '参数主键',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`tenant_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000','主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y',103,1,'2025-07-28 10:29:45',NULL,NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
(2,'000000','用户管理-账号初始密码','sys.user.initPassword','123456','Y',103,1,'2025-07-28 10:29:45',NULL,NULL,'初始化密码 123456'),
(3,'000000','主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y',103,1,'2025-07-28 10:29:45',NULL,NULL,'深色主题theme-dark，浅色主题theme-light'),
(5,'000000','账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y',103,1,'2025-07-28 10:29:45',NULL,NULL,'是否开启注册用户功能（true开启，false关闭）'),
(11,'000000','OSS预览列表资源开关','sys.oss.previewListResource','true','Y',103,1,'2025-07-28 10:29:45',NULL,NULL,'true:开启, false:关闭');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(500) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `dept_category` varchar(100) DEFAULT NULL COMMENT '部门类别编码',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` bigint DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`tenant_id`,`parent_id`,`ancestors`,`dept_name`,`dept_category`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(100,'000000',0,'0','XXX科技',NULL,0,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-07-28 10:29:43',NULL,NULL),
(101,'000000',100,'0,100','深圳总公司',NULL,1,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-07-28 10:29:43',NULL,NULL),
(102,'000000',100,'0,100','长沙分公司',NULL,2,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-07-28 10:29:43',NULL,NULL),
(103,'000000',101,'0,100,101','研发部门',NULL,1,1,'15888888888','xxx@qq.com','0','0',103,1,'2025-07-28 10:29:43',NULL,NULL),
(104,'000000',101,'0,100,101','市场部门',NULL,2,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-07-28 10:29:43',NULL,NULL),
(105,'000000',101,'0,100,101','测试部门',NULL,3,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-07-28 10:29:43',NULL,NULL),
(106,'000000',101,'0,100,101','财务部门',NULL,4,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-07-28 10:29:43',NULL,NULL),
(107,'000000',101,'0,100,101','运维部门',NULL,5,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-07-28 10:29:43',NULL,NULL),
(108,'000000',102,'0,100,102','市场部门',NULL,1,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-07-28 10:29:43',NULL,NULL),
(109,'000000',102,'0,100,102','财务部门',NULL,2,NULL,'15888888888','xxx@qq.com','0','0',103,1,'2025-07-28 10:29:43',NULL,NULL);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL COMMENT '字典编码',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`tenant_id`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000',1,'男','0','sys_user_sex','','','Y',103,1,'2025-06-08 23:53:51',NULL,NULL,'性别男'),
(2,'000000',2,'女','1','sys_user_sex','','','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'性别女'),
(3,'000000',3,'未知','2','sys_user_sex','','','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'性别未知'),
(4,'000000',1,'显示','0','sys_show_hide','','primary','Y',103,1,'2025-06-08 23:53:51',NULL,NULL,'显示菜单'),
(5,'000000',2,'隐藏','1','sys_show_hide','','danger','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'隐藏菜单'),
(6,'000000',1,'正常','0','sys_normal_disable','','primary','Y',103,1,'2025-06-08 23:53:51',NULL,NULL,'正常状态'),
(7,'000000',2,'停用','1','sys_normal_disable','','danger','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'停用状态'),
(12,'000000',1,'是','Y','sys_yes_no','','primary','Y',103,1,'2025-06-08 23:53:51',NULL,NULL,'系统默认是'),
(13,'000000',2,'否','N','sys_yes_no','','danger','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'系统默认否'),
(14,'000000',1,'通知','1','sys_notice_type','','warning','Y',103,1,'2025-06-08 23:53:51',NULL,NULL,'通知'),
(15,'000000',2,'公告','2','sys_notice_type','','success','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'公告'),
(16,'000000',1,'正常','0','sys_notice_status','','primary','Y',103,1,'2025-06-08 23:53:51',NULL,NULL,'正常状态'),
(17,'000000',2,'关闭','1','sys_notice_status','','danger','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'关闭状态'),
(18,'000000',1,'新增','1','sys_oper_type','','info','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'新增操作'),
(19,'000000',2,'修改','2','sys_oper_type','','info','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'修改操作'),
(20,'000000',3,'删除','3','sys_oper_type','','danger','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'删除操作'),
(21,'000000',4,'授权','4','sys_oper_type','','primary','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'授权操作'),
(22,'000000',5,'导出','5','sys_oper_type','','warning','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'导出操作'),
(23,'000000',6,'导入','6','sys_oper_type','','warning','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'导入操作'),
(24,'000000',7,'强退','7','sys_oper_type','','danger','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'强退操作'),
(25,'000000',8,'生成代码','8','sys_oper_type','','warning','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'生成操作'),
(26,'000000',9,'清空数据','9','sys_oper_type','','danger','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'清空操作'),
(27,'000000',1,'成功','0','sys_common_status','','primary','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'正常状态'),
(28,'000000',2,'失败','1','sys_common_status','','danger','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'停用状态'),
(29,'000000',99,'其他','0','sys_oper_type','','info','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'其他操作'),
(30,'000000',0,'密码认证','password','sys_grant_type','el-check-tag','default','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'密码认证'),
(31,'000000',0,'短信认证','sms','sys_grant_type','el-check-tag','default','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'短信认证'),
(32,'000000',0,'邮件认证','email','sys_grant_type','el-check-tag','default','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'邮件认证'),
(33,'000000',0,'小程序认证','xcx','sys_grant_type','el-check-tag','default','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'小程序认证'),
(34,'000000',0,'三方登录认证','social','sys_grant_type','el-check-tag','default','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'三方登录认证'),
(35,'000000',0,'管理端PC','SYS_PC','sys_device_type','','default','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'管理端PC'),
(36,'000000',0,'用户端PC','USER_PC','sys_device_type','','default','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'用户端PC'),
(37,'000000',0,'用户端APP','USER_APP','sys_device_type','','default','N',103,1,'2025-06-08 23:53:51',NULL,NULL,'USER_APP');

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL COMMENT '字典主键',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `tenant_id` (`tenant_id`,`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`tenant_id`,`dict_name`,`dict_type`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000','用户性别','sys_user_sex',103,1,'2025-07-28 10:29:45',NULL,NULL,'用户性别列表'),
(2,'000000','菜单状态','sys_show_hide',103,1,'2025-07-28 10:29:45',NULL,NULL,'菜单状态列表'),
(3,'000000','系统开关','sys_normal_disable',103,1,'2025-07-28 10:29:45',NULL,NULL,'系统开关列表'),
(6,'000000','系统是否','sys_yes_no',103,1,'2025-07-28 10:29:45',NULL,NULL,'系统是否列表'),
(7,'000000','通知类型','sys_notice_type',103,1,'2025-07-28 10:29:45',NULL,NULL,'通知类型列表'),
(8,'000000','通知状态','sys_notice_status',103,1,'2025-07-28 10:29:45',NULL,NULL,'通知状态列表'),
(9,'000000','操作类型','sys_oper_type',103,1,'2025-07-28 10:29:45',NULL,NULL,'操作类型列表'),
(10,'000000','系统状态','sys_common_status',103,1,'2025-07-28 10:29:45',NULL,NULL,'登录状态列表'),
(11,'000000','授权类型','sys_grant_type',103,1,'2025-07-28 10:29:45',NULL,NULL,'认证授权类型'),
(12,'000000','设备类型','sys_device_type',103,1,'2025-07-28 10:29:45',NULL,NULL,'客户端设备类型');

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL COMMENT '访问ID',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `client_key` varchar(32) DEFAULT '' COMMENT '客户端',
  `device_type` varchar(32) DEFAULT '' COMMENT '设备类型',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */


/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query_param`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system',103,1,'2025-07-28 10:29:43',NULL,NULL,'系统管理目录'),
(2,'系统监控',0,3,'monitor',NULL,'',1,0,'M','0','0','','monitor',103,1,'2025-07-28 10:29:43',NULL,NULL,'系统监控目录'),
(3,'系统工具',0,4,'tool',NULL,'',1,0,'M','0','0','','tool',103,1,'2025-07-28 10:29:43',NULL,NULL,'系统工具目录'),
(4,'XPayLabs官网',0,5,'https://xpaylabs.com',NULL,'',0,0,'M','0','0','','guide',103,1,'2025-07-28 10:29:43',NULL,NULL,'XpayLabs官网地址'),
(5,'测试菜单',0,5,'demo',NULL,'',1,0,'M','0','1','','star',103,1,'2025-07-28 10:29:43',1,'2025-07-28 18:54:46','测试菜单'),
(6,'租户管理',0,2,'tenant',NULL,'',1,0,'M','0','1','','chart',103,1,'2025-07-28 10:29:43',1,'2025-07-28 11:00:34','租户管理目录'),
(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user',103,1,'2025-07-28 10:29:43',NULL,NULL,'用户管理菜单'),
(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples',103,1,'2025-07-28 10:29:43',NULL,NULL,'角色管理菜单'),
(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table',103,1,'2025-07-28 10:29:43',NULL,NULL,'菜单管理菜单'),
(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree',103,1,'2025-07-28 10:29:43',NULL,NULL,'部门管理菜单'),
(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post',103,1,'2025-07-28 10:29:44',NULL,NULL,'岗位管理菜单'),
(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict',103,1,'2025-07-28 10:29:44',NULL,NULL,'字典管理菜单'),
(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit',103,1,'2025-07-28 10:29:44',NULL,NULL,'参数设置菜单'),
(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message',103,1,'2025-07-28 10:29:44',NULL,NULL,'通知公告菜单'),
(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log',103,1,'2025-07-28 10:29:44',NULL,NULL,'日志管理菜单'),
(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online',103,1,'2025-07-28 10:29:44',NULL,NULL,'在线用户菜单'),
(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis',103,1,'2025-07-28 10:29:44',NULL,NULL,'缓存监控菜单'),
(115,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code',103,1,'2025-07-28 10:29:44',NULL,NULL,'代码生成菜单'),
(116,'修改生成配置',3,2,'gen-edit/index/:tableId(\\d+)','tool/gen/editTable','',1,1,'C','1','0','tool:gen:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(117,'Admin监控',2,5,'Admin','monitor/admin/index','',1,0,'C','0','0','monitor:admin:list','dashboard',103,1,'2025-07-28 10:29:44',NULL,NULL,'Admin监控菜单'),
(118,'文件管理',1,10,'oss','system/oss/index','',1,0,'C','0','0','system:oss:list','upload',103,1,'2025-07-28 10:29:44',NULL,NULL,'文件管理菜单'),
(120,'任务调度中心',2,6,'snailjob','monitor/snailjob/index','',1,0,'C','0','0','monitor:snailjob:list','job',103,1,'2025-07-28 10:29:44',NULL,NULL,'SnailJob控制台菜单'),
(121,'租户管理',6,1,'tenant','system/tenant/index','',1,0,'C','0','0','system:tenant:list','list',103,1,'2025-07-28 10:29:44',NULL,NULL,'租户管理菜单'),
(122,'租户套餐管理',6,2,'tenantPackage','system/tenantPackage/index','',1,0,'C','0','0','system:tenantPackage:list','form',103,1,'2025-07-28 10:29:44',NULL,NULL,'租户套餐管理菜单'),
(123,'客户端管理',1,11,'client','system/client/index','',1,0,'C','0','0','system:client:list','international',103,1,'2025-07-28 10:29:44',NULL,NULL,'客户端管理菜单'),
(130,'分配用户',1,2,'role-auth/user/:roleId(\\d+)','system/role/authUser','',1,1,'C','1','0','system:role:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(131,'分配角色',1,1,'user-auth/role/:userId(\\d+)','system/user/authRole','',1,1,'C','1','0','system:user:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(132,'字典数据',1,6,'dict-data/index/:dictId(\\d+)','system/dict/data','',1,1,'C','1','0','system:dict:list','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(133,'文件配置管理',1,10,'oss-config/index','system/oss/config','',1,1,'C','1','0','system:ossConfig:list','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form',103,1,'2025-07-28 10:29:44',NULL,NULL,'操作日志菜单'),
(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor',103,1,'2025-07-28 10:29:44',NULL,NULL,'登录日志菜单'),
(1001,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1002,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1003,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1004,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1005,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1006,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1007,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1008,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1009,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1010,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1011,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1012,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1013,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1014,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1015,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1016,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1017,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1018,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1019,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1020,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1021,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1022,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1023,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1024,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1025,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1026,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1027,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1028,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1029,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1030,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1031,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1032,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1033,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1034,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1035,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1036,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1037,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1038,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1039,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1040,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1041,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1042,'日志导出',500,4,'#','','',1,0,'F','0','0','monitor:operlog:export','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1043,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1044,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1045,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1050,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1055,'生成查询',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1056,'生成修改',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1057,'生成删除',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1058,'导入代码',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1059,'预览代码',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1060,'生成代码',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1061,'客户端管理查询',123,1,'#','','',1,0,'F','0','0','system:client:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1062,'客户端管理新增',123,2,'#','','',1,0,'F','0','0','system:client:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1063,'客户端管理修改',123,3,'#','','',1,0,'F','0','0','system:client:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1064,'客户端管理删除',123,4,'#','','',1,0,'F','0','0','system:client:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1065,'客户端管理导出',123,5,'#','','',1,0,'F','0','0','system:client:export','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1500,'测试单表',5,1,'demo','demo/demo/index','',1,0,'C','0','0','demo:demo:list','#',103,1,'2025-07-28 10:29:44',NULL,NULL,'测试单表菜单'),
(1501,'测试单表查询',1500,1,'#','','',1,0,'F','0','0','demo:demo:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1502,'测试单表新增',1500,2,'#','','',1,0,'F','0','0','demo:demo:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1503,'测试单表修改',1500,3,'#','','',1,0,'F','0','0','demo:demo:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1504,'测试单表删除',1500,4,'#','','',1,0,'F','0','0','demo:demo:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1505,'测试单表导出',1500,5,'#','','',1,0,'F','0','0','demo:demo:export','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1506,'测试树表',5,1,'tree','demo/tree/index','',1,0,'C','0','0','demo:tree:list','#',103,1,'2025-07-28 10:29:44',NULL,NULL,'测试树表菜单'),
(1507,'测试树表查询',1506,1,'#','','',1,0,'F','0','0','demo:tree:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1508,'测试树表新增',1506,2,'#','','',1,0,'F','0','0','demo:tree:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1509,'测试树表修改',1506,3,'#','','',1,0,'F','0','0','demo:tree:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1510,'测试树表删除',1506,4,'#','','',1,0,'F','0','0','demo:tree:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1511,'测试树表导出',1506,5,'#','','',1,0,'F','0','0','demo:tree:export','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1600,'文件查询',118,1,'#','','',1,0,'F','0','0','system:oss:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1601,'文件上传',118,2,'#','','',1,0,'F','0','0','system:oss:upload','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1602,'文件下载',118,3,'#','','',1,0,'F','0','0','system:oss:download','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1603,'文件删除',118,4,'#','','',1,0,'F','0','0','system:oss:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1606,'租户查询',121,1,'#','','',1,0,'F','0','0','system:tenant:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1607,'租户新增',121,2,'#','','',1,0,'F','0','0','system:tenant:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1608,'租户修改',121,3,'#','','',1,0,'F','0','0','system:tenant:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1609,'租户删除',121,4,'#','','',1,0,'F','0','0','system:tenant:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1610,'租户导出',121,5,'#','','',1,0,'F','0','0','system:tenant:export','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1611,'租户套餐查询',122,1,'#','','',1,0,'F','0','0','system:tenantPackage:query','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1612,'租户套餐新增',122,2,'#','','',1,0,'F','0','0','system:tenantPackage:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1613,'租户套餐修改',122,3,'#','','',1,0,'F','0','0','system:tenantPackage:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1614,'租户套餐删除',122,4,'#','','',1,0,'F','0','0','system:tenantPackage:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1615,'租户套餐导出',122,5,'#','','',1,0,'F','0','0','system:tenantPackage:export','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1620,'配置列表',118,5,'#','','',1,0,'F','0','0','system:ossConfig:list','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1621,'配置添加',118,6,'#','','',1,0,'F','0','0','system:ossConfig:add','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1622,'配置编辑',118,6,'#','','',1,0,'F','0','0','system:ossConfig:edit','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1623,'配置删除',118,6,'#','','',1,0,'F','0','0','system:ossConfig:remove','#',103,1,'2025-07-28 10:29:44',NULL,NULL,''),
(1949666771274547202,'XPayLabs管理',0,6,'xpay',NULL,NULL,1,0,'M','0','0',NULL,'category',103,1,'2025-07-28 11:02:36',1,'2026-06-02 11:51:14',''),
(1949668662876291073,'归集记录',1949666771274547202,1,'collectRecord','xpay/collectRecord/index',NULL,1,0,'C','0','0','xpay:collectRecord:list','#',103,1,'2025-07-28 11:19:05',1,'2025-07-28 12:18:12','链上归集记录菜单'),
(1949668662876291074,'链上归集记录查询',1949668662876291073,1,'#','',NULL,1,0,'F','0','0','xpay:collectRecord:query','#',103,1,'2025-07-28 11:19:05',NULL,NULL,''),
(1949668662876291075,'链上归集记录新增',1949668662876291073,2,'#','',NULL,1,0,'F','0','0','xpay:collectRecord:add','#',103,1,'2025-07-28 11:19:05',NULL,NULL,''),
(1949668662876291076,'链上归集记录修改',1949668662876291073,3,'#','',NULL,1,0,'F','0','0','xpay:collectRecord:edit','#',103,1,'2025-07-28 11:19:05',NULL,NULL,''),
(1949668662876291077,'链上归集记录删除',1949668662876291073,4,'#','',NULL,1,0,'F','0','0','xpay:collectRecord:remove','#',103,1,'2025-07-28 11:19:05',NULL,NULL,''),
(1949668662876291078,'链上归集记录导出',1949668662876291073,5,'#','',NULL,1,0,'F','0','0','xpay:collectRecord:export','#',103,1,'2025-07-28 11:19:05',NULL,NULL,''),
(1949668663341858818,'商户信息',1949666771274547202,1,'merchant','xpay/merchant/index',NULL,1,0,'C','0','0','xpay:merchant:list','#',103,1,'2025-07-28 11:19:08',NULL,NULL,'商户信息菜单'),
(1949668663341858819,'商户信息查询',1949668663341858818,1,'#','',NULL,1,0,'F','0','0','xpay:merchant:query','#',103,1,'2025-07-28 11:19:08',NULL,NULL,''),
(1949668663341858820,'商户信息新增',1949668663341858818,2,'#','',NULL,1,0,'F','0','0','xpay:merchant:add','#',103,1,'2025-07-28 11:19:08',NULL,NULL,''),
(1949668663341858821,'商户信息修改',1949668663341858818,3,'#','',NULL,1,0,'F','0','0','xpay:merchant:edit','#',103,1,'2025-07-28 11:19:08',NULL,NULL,''),
(1949668663341858822,'商户信息删除',1949668663341858818,4,'#','',NULL,1,0,'F','0','0','xpay:merchant:remove','#',103,1,'2025-07-28 11:19:08',NULL,NULL,''),
(1949668663341858823,'商户信息导出',1949668663341858818,5,'#','',NULL,1,0,'F','0','0','xpay:merchant:export','#',103,1,'2025-07-28 11:19:08',NULL,NULL,''),
(1949668663656431617,'订单记录',1949666771274547202,1,'paymentOrder','xpay/paymentOrder/index',NULL,1,0,'C','0','0','xpay:paymentOrder:list','#',103,1,'2025-07-28 11:19:11',1,'2025-07-28 12:18:47','支付订单菜单'),
(1949668663656431618,'支付订单查询',1949668663656431617,1,'#','',NULL,1,0,'F','0','0','xpay:paymentOrder:query','#',103,1,'2025-07-28 11:19:11',NULL,NULL,''),
(1949668663656431619,'支付订单新增',1949668663656431617,2,'#','',NULL,1,0,'F','0','0','xpay:paymentOrder:add','#',103,1,'2025-07-28 11:19:11',NULL,NULL,''),
(1949668663656431620,'支付订单修改',1949668663656431617,3,'#','',NULL,1,0,'F','0','0','xpay:paymentOrder:edit','#',103,1,'2025-07-28 11:19:11',NULL,NULL,''),
(1949668663656431621,'支付订单删除',1949668663656431617,4,'#','',NULL,1,0,'F','0','0','xpay:paymentOrder:remove','#',103,1,'2025-07-28 11:19:11',NULL,NULL,''),
(1949668663656431622,'支付订单导出',1949668663656431617,5,'#','',NULL,1,0,'F','0','0','xpay:paymentOrder:export','#',103,1,'2025-07-28 11:19:11',NULL,NULL,''),
(1949668663924867074,'订单链上记录',1949666771274547202,1,'txRecord','xpay/txRecord/index',NULL,1,0,'C','0','1','xpay:txRecord:list','#',103,1,'2025-07-28 11:19:13',1,'2026-06-02 15:50:38','链上交易记录菜单'),
(1949668663924867075,'链上交易记录查询',1949668663924867074,1,'#','',NULL,1,0,'F','0','0','xpay:txRecord:query','#',103,1,'2025-07-28 11:19:13',NULL,NULL,''),
(1949668663924867076,'链上交易记录新增',1949668663924867074,2,'#','',NULL,1,0,'F','0','0','xpay:txRecord:add','#',103,1,'2025-07-28 11:19:13',NULL,NULL,''),
(1949668663924867077,'链上交易记录修改',1949668663924867074,3,'#','',NULL,1,0,'F','0','0','xpay:txRecord:edit','#',103,1,'2025-07-28 11:19:14',NULL,NULL,''),
(1949668663924867078,'链上交易记录删除',1949668663924867074,4,'#','',NULL,1,0,'F','0','0','xpay:txRecord:remove','#',103,1,'2025-07-28 11:19:14',NULL,NULL,''),
(1949668663924867079,'链上交易记录导出',1949668663924867074,5,'#','',NULL,1,0,'F','0','0','xpay:txRecord:export','#',103,1,'2025-07-28 11:19:14',NULL,NULL,''),
(1949668664449155074,'币种类型',1949666771274547202,1,'assetType','xpay/assetType/index',NULL,1,0,'C','0','0','xpay:assetType:list','#',103,1,'2025-07-28 11:19:02',1,'2025-07-28 12:19:17','支持的币种资产类型菜单'),
(1949668664449155075,'支持的币种资产类型查询',1949668664449155074,1,'#','',NULL,1,0,'F','0','0','xpay:assetType:query','#',103,1,'2025-07-28 11:19:02',NULL,NULL,''),
(1949668664449155076,'支持的币种资产类型新增',1949668664449155074,2,'#','',NULL,1,0,'F','0','0','xpay:assetType:add','#',103,1,'2025-07-28 11:19:02',NULL,NULL,''),
(1949668664449155077,'支持的币种资产类型修改',1949668664449155074,3,'#','',NULL,1,0,'F','0','0','xpay:assetType:edit','#',103,1,'2025-07-28 11:19:02',NULL,NULL,''),
(1949668664449155078,'支持的币种资产类型删除',1949668664449155074,4,'#','',NULL,1,0,'F','0','0','xpay:assetType:remove','#',103,1,'2025-07-28 11:19:02',NULL,NULL,''),
(1949668664449155079,'支持的币种资产类型导出',1949668664449155074,5,'#','',NULL,1,0,'F','0','0','xpay:assetType:export','#',103,1,'2025-07-28 11:19:02',NULL,NULL,''),
(1961007631626887169,'商家费用明细',1949666771274547202,1,'merchantCostDetail','xpay/merchantCostDetail/index',NULL,1,0,'C','0','1','xpay:merchantCostDetail:list','#',103,1,'2025-08-28 18:12:23',1,'2026-06-02 15:49:59','商家费用明细菜单'),
(1961007631626887170,'商家费用明细查询',1961007631626887169,1,'#','',NULL,1,0,'F','0','0','xpay:merchantCostDetail:query','#',103,1,'2025-08-28 18:12:23',NULL,NULL,''),
(1961007631626887171,'商家费用明细新增',1961007631626887169,2,'#','',NULL,1,0,'F','0','0','xpay:merchantCostDetail:add','#',103,1,'2025-08-28 18:12:23',NULL,NULL,''),
(1961007631626887172,'商家费用明细修改',1961007631626887169,3,'#','',NULL,1,0,'F','0','0','xpay:merchantCostDetail:edit','#',103,1,'2025-08-28 18:12:23',NULL,NULL,''),
(1961007631626887173,'商家费用明细删除',1961007631626887169,4,'#','',NULL,1,0,'F','0','0','xpay:merchantCostDetail:remove','#',103,1,'2025-08-28 18:12:23',NULL,NULL,''),
(1961007631626887174,'商家费用明细导出',1961007631626887169,5,'#','',NULL,1,0,'F','0','0','xpay:merchantCostDetail:export','#',103,1,'2025-08-28 18:12:23',NULL,NULL,''),
(1961406328621715457,'商家充值提现',1949666771274547202,1,'merchantRechargeWithdraw','xpay/merchantRechargeWithdraw/index',NULL,1,0,'C','0','0','xpay:merchantRechargeWithdraw:list','#',103,1,'2025-08-29 20:32:29',NULL,NULL,'商家充值提现菜单'),
(1961406328621715458,'商家充值提现查询',1961406328621715457,1,'#','',NULL,1,0,'F','0','0','xpay:merchantRechargeWithdraw:query','#',103,1,'2025-08-29 20:32:29',NULL,NULL,''),
(1961406328621715459,'商家充值提现新增',1961406328621715457,2,'#','',NULL,1,0,'F','0','0','xpay:merchantRechargeWithdraw:add','#',103,1,'2025-08-29 20:32:29',NULL,NULL,''),
(1961406328621715460,'商家充值提现修改',1961406328621715457,3,'#','',NULL,1,0,'F','0','0','xpay:merchantRechargeWithdraw:edit','#',103,1,'2025-08-29 20:32:29',NULL,NULL,''),
(1961406328621715461,'商家充值提现删除',1961406328621715457,4,'#','',NULL,1,0,'F','0','0','xpay:merchantRechargeWithdraw:remove','#',103,1,'2025-08-29 20:32:29',NULL,NULL,''),
(1961406328621715462,'商家充值提现导出',1961406328621715457,5,'#','',NULL,1,0,'F','0','0','xpay:merchantRechargeWithdraw:export','#',103,1,'2025-08-29 20:32:29',NULL,NULL,''),
(1961406328621715463,'商家提现审核通过',1961406328621715457,6,'#','',NULL,1,0,'F','0','0','xpay:merchantRechargeWithdraw:approve','#',103,1,'2025-08-29 20:32:29',NULL,NULL,''),
(1961406328621715464,'商家提现审核不通过',1961406328621715457,7,'#','',NULL,1,0,'F','0','0','xpay:merchantRechargeWithdraw:unapprove','#',103,1,'2025-08-29 20:32:29',NULL,NULL,''),
(1967410932618551298,'商家资产',1949666771274547202,1,'merchantAssets','xpay/merchantAssets/index',NULL,1,0,'C','0','0','xpay:merchantAssets:list','#',103,1,'2025-09-15 10:12:39',NULL,NULL,'商家资产菜单'),
(1967410932618551299,'商家资产查询',1967410932618551298,1,'#','',NULL,1,0,'F','0','0','xpay:merchantAssets:query','#',103,1,'2025-09-15 10:12:39',NULL,NULL,''),
(1967410932618551300,'商家资产新增',1967410932618551298,2,'#','',NULL,1,0,'F','0','0','xpay:merchantAssets:add','#',103,1,'2025-09-15 10:12:39',NULL,NULL,''),
(1967410932618551301,'商家资产修改',1967410932618551298,3,'#','',NULL,1,0,'F','0','0','xpay:merchantAssets:edit','#',103,1,'2025-09-15 10:12:39',NULL,NULL,''),
(1967410932618551302,'商家资产删除',1967410932618551298,4,'#','',NULL,1,0,'F','0','0','xpay:merchantAssets:remove','#',103,1,'2025-09-15 10:12:39',NULL,NULL,''),
(1967410932618551303,'商家资产导出',1967410932618551298,5,'#','',NULL,1,0,'F','0','0','xpay:merchantAssets:export','#',103,1,'2025-09-15 10:12:39',NULL,NULL,''),
(1967410933142839297,'资产变动明细',1949666771274547202,1,'merchantAssetDetails','xpay/merchantAssetDetails/index',NULL,1,0,'C','0','0','xpay:merchantAssetDetails:list','#',103,1,'2025-09-15 10:12:42',NULL,NULL,'资产变动明细菜单'),
(1967410933142839298,'资产变动明细查询',1967410933142839297,1,'#','',NULL,1,0,'F','0','0','xpay:merchantAssetDetails:query','#',103,1,'2025-09-15 10:12:42',NULL,NULL,''),
(1967410933142839299,'资产变动明细新增',1967410933142839297,2,'#','',NULL,1,0,'F','0','0','xpay:merchantAssetDetails:add','#',103,1,'2025-09-15 10:12:42',NULL,NULL,''),
(1967410933142839300,'资产变动明细修改',1967410933142839297,3,'#','',NULL,1,0,'F','0','0','xpay:merchantAssetDetails:edit','#',103,1,'2025-09-15 10:12:42',NULL,NULL,''),
(1967410933142839301,'资产变动明细删除',1967410933142839297,4,'#','',NULL,1,0,'F','0','0','xpay:merchantAssetDetails:remove','#',103,1,'2025-09-15 10:12:42',NULL,NULL,''),
(1967410933142839302,'资产变动明细导出',1967410933142839297,5,'#','',NULL,1,0,'F','0','0','xpay:merchantAssetDetails:export','#',103,1,'2025-09-15 10:12:42',NULL,NULL,''),
(1976489660241833985,'法币订单',1949666771274547202,1,'fiatcurrencyOrder','xpay/fiatcurrencyOrder/index',NULL,1,0,'C','0','1','xpay:fiatcurrencyOrder:list','#',103,1,'2025-10-10 11:28:08',1,'2026-06-02 15:50:24','法币订单菜单'),
(1976489660241833986,'法币订单查询',1976489660241833985,1,'#','',NULL,1,0,'F','0','0','xpay:fiatcurrencyOrder:query','#',103,1,'2025-10-10 11:28:08',NULL,NULL,''),
(1976489660241833987,'法币订单新增',1976489660241833985,2,'#','',NULL,1,0,'F','0','0','xpay:fiatcurrencyOrder:add','#',103,1,'2025-10-10 11:28:08',NULL,NULL,''),
(1976489660241833988,'法币订单修改',1976489660241833985,3,'#','',NULL,1,0,'F','0','0','xpay:fiatcurrencyOrder:edit','#',103,1,'2025-10-10 11:28:08',NULL,NULL,''),
(1976489660241833989,'法币订单删除',1976489660241833985,4,'#','',NULL,1,0,'F','0','0','xpay:fiatcurrencyOrder:remove','#',103,1,'2025-10-10 11:28:08',NULL,NULL,''),
(1976489660241833990,'法币订单导出',1976489660241833985,5,'#','',NULL,1,0,'F','0','0','xpay:fiatcurrencyOrder:export','#',103,1,'2025-10-10 11:28:08',NULL,NULL,''),
(2061736465958866945,'回调通知',1949666771274547202,1,'callbackNotice','xpay/callbackNotice/index',NULL,1,0,'C','0','0','xpay:callbackNotice:list','#',103,1,'2026-06-02 17:12:17',NULL,NULL,'回调通知菜单'),
(2061736465958866946,'回调通知查询',2061736465958866945,1,'#','',NULL,1,0,'F','0','0','xpay:callbackNotice:query','#',103,1,'2026-06-02 17:12:17',NULL,NULL,''),
(2061736465958866947,'回调通知新增',2061736465958866945,2,'#','',NULL,1,0,'F','0','0','xpay:callbackNotice:add','#',103,1,'2026-06-02 17:12:17',NULL,NULL,''),
(2061736465958866948,'回调通知修改',2061736465958866945,3,'#','',NULL,1,0,'F','0','0','xpay:callbackNotice:edit','#',103,1,'2026-06-02 17:12:17',NULL,NULL,''),
(2061736465958866949,'回调通知删除',2061736465958866945,4,'#','',NULL,1,0,'F','0','0','xpay:callbackNotice:remove','#',103,1,'2026-06-02 17:12:17',NULL,NULL,''),
(2061736465958866950,'回调通知导出',2061736465958866945,5,'#','',NULL,1,0,'F','0','0','xpay:callbackNotice:export','#',103,1,'2026-06-02 17:12:17',NULL,NULL,'');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` bigint NOT NULL COMMENT '公告ID',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`notice_id`,`tenant_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000','温馨提醒：2018-07-01 新版本发布啦','2','新版本内容','0',103,1,'2025-07-28 10:29:45',NULL,NULL,'管理员'),
(2,'000000','维护通知：2018-07-01 系统凌晨维护','1','维护内容','0',103,1,'2025-07-28 10:29:45',NULL,NULL,'管理员');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL COMMENT '日志主键',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(4000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(4000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(4000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */


/*Table structure for table `sys_oss` */

DROP TABLE IF EXISTS `sys_oss`;

CREATE TABLE `sys_oss` (
  `oss_id` bigint NOT NULL COMMENT '对象存储主键',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) NOT NULL COMMENT 'URL地址',
  `ext1` text COMMENT '扩展字段',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '上传人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `service` varchar(20) NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='OSS对象存储表';

/*Data for the table `sys_oss` */

/*Table structure for table `sys_oss_config` */

DROP TABLE IF EXISTS `sys_oss_config`;

CREATE TABLE `sys_oss_config` (
  `oss_config_id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `config_key` varchar(20) NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) DEFAULT '' COMMENT '域',
  `access_policy` char(1) NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) DEFAULT '' COMMENT '扩展字段',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='对象存储配置表';

/*Data for the table `sys_oss_config` */

insert  into `sys_oss_config`(`oss_config_id`,`tenant_id`,`config_key`,`access_key`,`secret_key`,`bucket_name`,`prefix`,`endpoint`,`domain`,`is_https`,`region`,`access_policy`,`status`,`ext1`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000','minio','yan','yan123','yan','','127.0.0.1:9000','','N','','1','0','',103,1,'2025-07-28 10:29:45',1,'2025-07-28 10:29:45',NULL),
(2,'000000','qiniu','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','yan','','s3-cn-north-1.qiniucs.com','','N','','1','1','',103,1,'2025-07-28 10:29:45',1,'2025-07-28 10:29:45',NULL),
(3,'000000','aliyun','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','yan','','oss-cn-beijing.aliyuncs.com','','N','','1','1','',103,1,'2025-07-28 10:29:45',1,'2025-07-28 10:29:45',NULL),
(4,'000000','qcloud','XXXXXXXXXXXXXXX','XXXXXXXXXXXXXXX','yan-1240000000','','cos.ap-beijing.myqcloud.com','','N','ap-beijing','1','1','',103,1,'2025-07-28 10:29:45',1,'2025-07-28 10:29:45',NULL),
(5,'000000','image','yan','yan123','yan','image','127.0.0.1:9000','','N','','1','1','',103,1,'2025-07-28 10:29:45',1,'2025-07-28 10:29:45',NULL);

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_category` varchar(100) DEFAULT NULL COMMENT '岗位类别编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`tenant_id`,`dept_id`,`post_code`,`post_category`,`post_name`,`post_sort`,`status`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000',103,'ceo',NULL,'董事长',1,'0',103,1,'2025-07-28 10:29:43',NULL,NULL,''),
(2,'000000',100,'se',NULL,'项目经理',2,'0',103,1,'2025-07-28 10:29:43',NULL,NULL,''),
(3,'000000',100,'hr',NULL,'人力资源',3,'0',103,1,'2025-07-28 10:29:43',NULL,NULL,''),
(4,'000000',100,'user',NULL,'普通员工',4,'0',103,1,'2025-07-28 10:29:43',NULL,NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限 5：仅本人数据权限 6：部门及以下或本人数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`tenant_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000','超级管理员','superadmin',1,'1',1,1,'0','0',103,1,'2025-07-28 10:29:43',NULL,NULL,'超级管理员'),
(3,'000000','本部门及以下','test1',3,'4',1,1,'0','0',103,1,'2025-07-28 10:29:43',NULL,NULL,''),
(4,'000000','仅本人','test2',4,'5',1,1,'0','0',103,1,'2025-07-28 10:29:43',NULL,NULL,''),
(1949781307067346946,'000000','商家','merchant',2,'1',1,1,'0','0',103,1,'2025-07-28 18:37:43',1,'2025-08-31 22:00:13','');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values 
(3,1),
(3,5),
(3,100),
(3,101),
(3,102),
(3,103),
(3,104),
(3,105),
(3,106),
(3,107),
(3,108),
(3,118),
(3,123),
(3,130),
(3,131),
(3,132),
(3,133),
(3,500),
(3,501),
(3,1001),
(3,1002),
(3,1003),
(3,1004),
(3,1005),
(3,1006),
(3,1007),
(3,1008),
(3,1009),
(3,1010),
(3,1011),
(3,1012),
(3,1013),
(3,1014),
(3,1015),
(3,1016),
(3,1017),
(3,1018),
(3,1019),
(3,1020),
(3,1021),
(3,1022),
(3,1023),
(3,1024),
(3,1025),
(3,1026),
(3,1027),
(3,1028),
(3,1029),
(3,1030),
(3,1031),
(3,1032),
(3,1033),
(3,1034),
(3,1035),
(3,1036),
(3,1037),
(3,1038),
(3,1039),
(3,1040),
(3,1041),
(3,1042),
(3,1043),
(3,1044),
(3,1045),
(3,1050),
(3,1061),
(3,1062),
(3,1063),
(3,1064),
(3,1065),
(3,1500),
(3,1501),
(3,1502),
(3,1503),
(3,1504),
(3,1505),
(3,1506),
(3,1507),
(3,1508),
(3,1509),
(3,1510),
(3,1511),
(3,1600),
(3,1601),
(3,1602),
(3,1603),
(3,1620),
(3,1621),
(3,1622),
(3,1623),
(3,11616),
(3,11618),
(3,11619),
(3,11622),
(3,11623),
(3,11629),
(3,11632),
(3,11633),
(3,11638),
(3,11639),
(3,11640),
(3,11641),
(3,11642),
(3,11643),
(3,11701),
(4,5),
(4,1500),
(4,1501),
(4,1502),
(4,1503),
(4,1504),
(4,1505),
(4,1506),
(4,1507),
(4,1508),
(4,1509),
(4,1510),
(4,1511),
(1949781307067346946,4),
(1949781307067346946,1949666771274547202),
(1949781307067346946,1949668663656431617),
(1949781307067346946,1949668663656431618),
(1949781307067346946,1949668663656431622),
(1949781307067346946,1961406328621715457),
(1949781307067346946,1961406328621715458),
(1949781307067346946,1961406328621715462);

/*Table structure for table `sys_social` */

DROP TABLE IF EXISTS `sys_social`;

CREATE TABLE `sys_social` (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户id',
  `auth_id` varchar(255) NOT NULL COMMENT '平台+平台唯一id',
  `source` varchar(255) NOT NULL COMMENT '用户来源',
  `open_id` varchar(255) DEFAULT NULL COMMENT '平台编号唯一id',
  `user_name` varchar(30) NOT NULL COMMENT '登录账号',
  `nick_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `email` varchar(255) DEFAULT '' COMMENT '用户邮箱',
  `avatar` varchar(500) DEFAULT '' COMMENT '头像地址',
  `access_token` varchar(2000) NOT NULL COMMENT '用户的授权令牌',
  `expire_in` int DEFAULT NULL COMMENT '用户的授权令牌的有效期，部分平台可能没有',
  `refresh_token` varchar(255) DEFAULT NULL COMMENT '刷新令牌，部分平台可能没有',
  `access_code` varchar(2000) DEFAULT NULL COMMENT '平台的授权信息，部分平台可能没有',
  `union_id` varchar(255) DEFAULT NULL COMMENT '用户的 unionid',
  `scope` varchar(255) DEFAULT NULL COMMENT '授予的权限，部分平台可能没有',
  `token_type` varchar(255) DEFAULT NULL COMMENT '个别平台的授权信息，部分平台可能没有',
  `id_token` varchar(2000) DEFAULT NULL COMMENT 'id token，部分平台可能没有',
  `mac_algorithm` varchar(255) DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `mac_key` varchar(255) DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `code` varchar(255) DEFAULT NULL COMMENT '用户的授权code，部分平台可能没有',
  `oauth_token` varchar(255) DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `oauth_token_secret` varchar(255) DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='社会化关系表';

/*Data for the table `sys_social` */

/*Table structure for table `sys_tenant` */

DROP TABLE IF EXISTS `sys_tenant`;

CREATE TABLE `sys_tenant` (
  `id` bigint NOT NULL COMMENT 'id',
  `tenant_id` varchar(20) NOT NULL COMMENT '租户编号',
  `contact_user_name` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `company_name` varchar(30) DEFAULT NULL COMMENT '企业名称',
  `license_number` varchar(30) DEFAULT NULL COMMENT '统一社会信用代码',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `intro` varchar(200) DEFAULT NULL COMMENT '企业简介',
  `domain` varchar(200) DEFAULT NULL COMMENT '域名',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `package_id` bigint DEFAULT NULL COMMENT '租户套餐编号',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `account_count` int DEFAULT '-1' COMMENT '用户数量（-1不限制）',
  `status` char(1) DEFAULT '0' COMMENT '租户状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='租户表';

/*Data for the table `sys_tenant` */

insert  into `sys_tenant`(`id`,`tenant_id`,`contact_user_name`,`contact_phone`,`company_name`,`license_number`,`address`,`intro`,`domain`,`remark`,`package_id`,`expire_time`,`account_count`,`status`,`del_flag`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,'000000','管理组','15888888888','XXX有限公司',NULL,NULL,'多租户通用后台管理管理系统',NULL,NULL,NULL,NULL,-1,'0','0',103,1,'2025-07-28 10:29:43',NULL,NULL);

/*Table structure for table `sys_tenant_package` */

DROP TABLE IF EXISTS `sys_tenant_package`;

CREATE TABLE `sys_tenant_package` (
  `package_id` bigint NOT NULL COMMENT '租户套餐id',
  `package_name` varchar(20) DEFAULT NULL COMMENT '套餐名称',
  `menu_ids` varchar(3000) DEFAULT NULL COMMENT '关联菜单id',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='租户套餐表';

/*Data for the table `sys_tenant_package` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` bigint DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`tenant_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_dept`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'000000',103,'admin','Yan','SYS_USER','Yan@163.com','15888888888','1',NULL,'$2a$10$dQp7BLpqr2hkItFLLvKIe.k2friHwWw098jGh76gylOuGP3gUQDW2','0','0','0:0:0:0:0:0:0:1','2026-06-09 16:45:27',103,1,'2025-07-28 10:29:43',1,'2026-06-09 16:45:27','管理员'),
(3,'000000',108,'test','本部门及以下 密码666666','SYS_USER','','','0',NULL,'$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne','0','0','0:0:0:0:0:0:0:1','2025-07-28 18:43:19',103,1,'2025-07-28 10:29:43',3,'2025-07-28 18:43:19',NULL),
(4,'000000',102,'test1','仅本人 密码666666','SYS_USER','','','0',NULL,'$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne','0','0','0:0:0:0:0:0:0:1','2025-07-28 18:40:06',103,1,'2025-07-28 10:29:43',4,'2025-07-28 18:40:06',NULL),
(2061724760923164673,'000000',NULL,'xpaytest','xpaytest','SYS_USER','','','0',NULL,'$2a$10$2OCHSG9Hcg.PsZDAt4GEKehTWt9Cfcb/h00q/G/tGGB8RN04pe2mC','0','0','0:0:0:0:0:0:0:1','2026-06-09 16:44:09',103,1,'2026-06-02 16:21:03',2061724760923164673,'2026-06-09 16:44:09',NULL);

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values 
(1,1);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values 
(1,1),
(3,3),
(4,4),
(1949756045671956482,1949781307067346946),
(1967765508865564673,1949781307067346946),
(1967929097073188866,1949781307067346946),
(2061724760923164673,1949781307067346946);

/*Table structure for table `t_address_pool` */

DROP TABLE IF EXISTS `t_address_pool`;

CREATE TABLE `t_address_pool` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chain` varchar(20) NOT NULL COMMENT '链',
  `type` varchar(20) NOT NULL DEFAULT 'GENERAL',
  `address` varchar(128) NOT NULL,
  `keystore` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `encrypt` varchar(100) DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL COMMENT '派生路径',
  `used` varchar(20) DEFAULT NULL COMMENT '是否已使用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_address` (`address`),
  KEY `idx_asset_used` (`chain`,`used`)
) ENGINE=InnoDB AUTO_INCREMENT=2061839236213170179 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='地址池管理表';

/*Data for the table `t_address_pool` */


/*Table structure for table `t_asset_type` */

DROP TABLE IF EXISTS `t_asset_type`;

CREATE TABLE `t_asset_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chain` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链类型，如 TRON、ETH、BTC、BSC',
  `symbol` varchar(32) NOT NULL COMMENT '币种符号，如 USDT、BTC、ETH',
  `contract_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '代币合约地址（主币为空）',
  `decimals` int DEFAULT '6' COMMENT '精度',
  `network` varchar(10) DEFAULT 'MAIN' COMMENT '主网MAIN，测试网TEST',
  `hot_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '热钱包地址',
  `cold_address` varbinary(100) DEFAULT NULL COMMENT '冷钱包地址',
  `collect_amount` decimal(14,4) DEFAULT '1.0000' COMMENT '冷钱包触发归集数量',
  `confirmed_num` int DEFAULT NULL COMMENT '确认数',
  `enabled` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'ENABLED' COMMENT '是否启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_symbol_chain` (`symbol`,`chain`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='支持的币种资产类型表';

/*Data for the table `t_asset_type` */

INSERT  INTO `t_asset_type`(`id`,`chain`,`symbol`,`contract_address`,`decimals`,`network`,`hot_address`,`cold_address`,`collect_amount`,`confirmed_num`,`enabled`) VALUES 
(1,'TRON','USDT','TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t',6,'MAIN','','',50.0000,2,'ENABLED'),
(2,'TRON','TRX',NULL,6,'MAIN','','',500.0000,2,'ENABLED'),
(3,'ETH','USDT','0xdAC17F958D2ee523a2206206994597C13D831ec7',6,'MAIN','','',50.0000,2,'ENABLED'),
(4,'ETH','ETH',NULL,18,'MAIN','','',0.1000,2,'ENABLED'),
(5,'BSC','USDT','0x55d398326f99059fF775485246999027B3197955',18,'MAIN','','',50.0000,2,'ENABLED'),
(6,'BSC','BNB',NULL,18,'MAIN','','',0.2000,2,'ENABLED'),
(7,'BSC_TEST','BNB',NULL,18,'TEST','','',0.1000,2,'ENABLED'),
(8,'BSC_TEST','USDT','0x1D136Cd361e802e4Ea5785573D076d14fDE3f6e1',18,'TEST','','',50.0000,2,'ENABLED'),
(9,'ETH_SEPOLIA','ETH',NULL,18,'TEST','','',0.1000,2,'ENABLED'),
(10,'ETH_SEPOLIA','USDT','0x40701a30271a68cd6f1e31304e10ccd9ab92ebbb',18,'TEST','','',50.0000,2,'ENABLED'),
(11,'TRON_TEST','TRX',NULL,6,'TEST','','',500.0000,2,'ENABLED'),
(12,'TRON_TEST','USDT','TG3XXyExBkPp9nzdajDZsozEu4BkaSJozs',6,'TEST','','',50.0000,2,'ENABLED'),
(14,'POLYGON','POL',NULL,18,'MAIN','',NULL,500.0000,2,'ENABLED'),
(15,'POLYGON','USDT','0xc2132D05D31c914a87C6611C10748AEb04B58e8F',6,'MAIN','',NULL,50.0000,2,'ENABLED'),
(16,'AVAX_C_CHAIN','AVAX',NULL,18,'MAIN','',NULL,1.0000,2,'ENABLED'),
(17,'AVAX_C_CHAIN','USDT','0x9702230A8Ea53601f5cD2dc00fDBc13d4dF4A8c7',6,'MAIN','',NULL,50.0000,2,'ENABLED'),
(18,'POLYGON_AMOY','POL',NULL,18,'TEST','',NULL,1.0000,2,'ENABLED'),
(19,'POLYGON_AMOY','USDT','0x574217CD258E9949dc6fE3dF2473879b2028cdD2',18,'TEST','',NULL,50.0000,2,'ENABLED'),
(20,'AVAX_FUJI_TEST','AVAX',NULL,18,'TEST','',NULL,0.1000,2,'ENABLED'),
(21,'AVAX_FUJI_TEST','USDT','0x574217CD258E9949dc6fE3dF2473879b2028cdD2',18,'TEST','',NULL,50.0000,2,'ENABLED'),
(22,'SUI','USDT','0x375f70cf2ae4c00bf37117d0c85a2c71545e6ee05c4a5c7d282cd66a4504b068::usdt::USDT',6,'MAIN','','',50.0000,2,'ENABLED'),
(23,'SUI','USDC','0xdba34672e30cb065b1f93e3ab55318768fd6fef66c15942c9f7cb846e2f900e7::usdc::USDC',6,'MAIN','','',50.0000,2,'ENABLED'),
(24,'SUI','SUI',NULL,9,'MAIN','','',1.0000,2,'ENABLED'),
(25,'SUI_TEST','USDT','0xf093da7b398511579503e3b23747c1abaaf2673a0419813bf89fb545e04379f4::usdt_faucet::USDT_FAUCET',6,'TEST','','',10.0000,2,'ENABLED'),
(26,'SUI_TEST','SUI',NULL,9,'TEST','','',0.0500,2,'ENABLED'),
(27,'SUI_TEST','USDC','0xa1ec7fc00a6f40db9693ad1415d0c193ad3906494428cf252621037bd7117e29::usdc::USDC',6,'TEST','','',10.0000,2,'ENABLED');

/*Table structure for table `t_block_height_tracker` */

DROP TABLE IF EXISTS `t_block_height_tracker`;

CREATE TABLE `t_block_height_tracker` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chain` varchar(32) NOT NULL COMMENT '链类型，如 BTC、TRON、ETH',
  `last_height` bigint NOT NULL COMMENT '最后处理的区块高度',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_chain` (`chain`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='区块监听高度追踪表';

/*Data for the table `t_block_height_tracker` */

insert  into `t_block_height_tracker`(`id`,`chain`,`last_height`,`update_time`) values 
(1,'TRON',76226243,'2026-06-07 01:01:08'),
(2,'BSC',54592974,'2026-06-03 00:59:40'),
(3,'ETH',23037189,'2026-06-07 13:10:41'),
(4,'BSC_TEST',69379595,'2026-06-07 13:10:41'),
(5,'ETH_SEPOLIA',10975899,'2026-06-07 13:10:41'),
(6,'TRON_TEST',65414854,'2026-06-07 01:01:08'),
(7,'POLYGON',78406797,'2026-06-07 00:37:21'),
(8,'POLYGON_AMOY',28443419,'2026-06-07 13:10:41'),
(9,'AVAX_C_CHAIN',71208051,'2026-06-07 13:10:41'),
(10,'AVAX_FUJI_TEST',47347037,'2026-06-07 13:10:41'),
(11,'SUI',219259812,'2026-06-03 11:13:32'),
(12,'SUI_TEST',344058488,'2026-06-03 11:13:32');

/*Table structure for table `t_callback_notice` */

DROP TABLE IF EXISTS `t_callback_notice`;

CREATE TABLE `t_callback_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `merchant_id` bigint NOT NULL COMMENT '商家ID',
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `callback_url` varchar(255) NOT NULL COMMENT '回调URL',
  `notify_status` varchar(20) NOT NULL DEFAULT 'INIT' COMMENT '回调通知状态',
  `notify_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '通知时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2062009628907188226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='回调通知表';

/*Data for the table `t_callback_notice` */


/*Table structure for table `t_collect_record` */

DROP TABLE IF EXISTS `t_collect_record`;

CREATE TABLE `t_collect_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint NOT NULL,
  `block_number` bigint DEFAULT NULL,
  `from_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `to_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `chain` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `symbol` varchar(20) DEFAULT NULL,
  `amount` decimal(20,4) DEFAULT '0.0000',
  `tx_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contract_address` varchar(128) DEFAULT NULL,
  `tx_fee` decimal(20,18) DEFAULT NULL,
  `confirmed_num` int DEFAULT '0',
  `status` varchar(20) DEFAULT 'INIT' COMMENT '交易状态：PENDING, SUCCESS, FAILED',
  `block_time` bigint DEFAULT NULL COMMENT '交易区块时间',
  `collect_amount` decimal(20,4) DEFAULT NULL COMMENT '预计收集数量',
  `fee` decimal(20,12) DEFAULT NULL COMMENT '平台手续费',
  `fee_ratio` decimal(6,2) DEFAULT NULL COMMENT '平台手续费率',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2061846734303334403 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='链上归集记录表';

/*Data for the table `t_collect_record` */


/*Table structure for table `t_error_block` */

DROP TABLE IF EXISTS `t_error_block`;

CREATE TABLE `t_error_block` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `chain` varchar(32) NOT NULL DEFAULT '' COMMENT '链',
  `block_number` bigint NOT NULL COMMENT '错误高度',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2061874513858183170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='错误的区块';

/*Data for the table `t_error_block` */


/*Table structure for table `t_fiatcurrency_order` */

DROP TABLE IF EXISTS `t_fiatcurrency_order`;

CREATE TABLE `t_fiatcurrency_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_no` varchar(32) NOT NULL COMMENT '商户订单号',
  `merchant_id` bigint NOT NULL COMMENT '商户ID',
  `order_type` varchar(10) NOT NULL COMMENT '订单类型',
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `actual_amount` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '实际金额',
  `currency` varchar(10) NOT NULL COMMENT '币种',
  `payer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '付款人姓名',
  `payer_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '付款人账号',
  `payer_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '付款人手机号',
  `payer_email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '付款人邮箱',
  `payer_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '付款代码',
  `extra` json DEFAULT NULL COMMENT '扩展字段，JSON格式',
  `payee_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '收款人姓名',
  `payee_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '收款人账号',
  `payee_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '收款人手机号',
  `payee_email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '收款人邮箱',
  `payee_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '收款代码',
  `status` varchar(20) NOT NULL COMMENT '订单状态: INIT,WAIT, PADDING, SUCCESS, FAIL',
  `channel_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '支付通道代码',
  `notify_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商户通知地址',
  `handing_fee` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '平台手续费',
  `handing_rate` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '平台手续费费率（百分比）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `third_party_response` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '第三方响应内容',
  `callback_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '第三方回调内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`),
  KEY `idx_merchant_id` (`merchant_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1977587385398169602 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='法币订单表';

/*Data for the table `t_fiatcurrency_order` */

/*Table structure for table `t_merchant` */

DROP TABLE IF EXISTS `t_merchant`;

CREATE TABLE `t_merchant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sys_user_id` bigint DEFAULT '-1' COMMENT '系统用户ID',
  `name` varchar(64) NOT NULL COMMENT '商户名称',
  `token` varchar(64) NOT NULL COMMENT '商户鉴权Token',
  `webhook_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'webhook秘钥',
  `white_list_ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '白名单ip地址',
  `enable_whitelist_ip` varchar(10) NOT NULL DEFAULT 'ENABLED' COMMENT '是否启用白名单ip',
  `generated_address_type` varchar(10) DEFAULT 'ORDER' COMMENT '按什么类型生成地址 ORDER订单，USER用户',
  `vip` tinyint DEFAULT '1' COMMENT 'VIP等级',
  `fee_ratio` decimal(5,2) DEFAULT '0.50' COMMENT '手续费(百分比)',
  `withdrawal_type` varchar(10) NOT NULL DEFAULT 'MANUAL' COMMENT '商家提币手动还是自动',
  `callback_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '支付成功回调地址',
  `into_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'HOT' COMMENT '商家归集时进入热钱包还是冷钱包还是进入平台冷钱包',
  `account_type` varchar(10) NOT NULL DEFAULT 'TEST' COMMENT '商家账号类型 TEST测试账号，MAIN正式账户',
  `merchant_sys_version` varchar(10) NOT NULL DEFAULT 'V2' COMMENT '商家选择的版本，V2（商家出GAS费版本）V3（平台出GAS费版本）',
  `energy_apikey` varchar(50) DEFAULT '' COMMENT '租赁能量的apikey',
  `google_secretkey` varchar(50) DEFAULT '' COMMENT '谷歌验证',
  `google_status` varchar(10) DEFAULT 'UNBOUND' COMMENT '谷歌2fa是否绑定',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2061724760923164677 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商户信息表';

/*Data for the table `t_merchant` */

insert  into `t_merchant`(`id`,`sys_user_id`,`name`,`token`,`webhook_secret`,`white_list_ip`,`enable_whitelist_ip`,`generated_address_type`,`vip`,`fee_ratio`,`withdrawal_type`,`callback_url`,`into_type`,`account_type`,`merchant_sys_version`,`energy_apikey`,`google_secretkey`,`google_status`,`create_time`) values 
(1,1,'admin','','','','ENABLED','ORDER',0,0.00,'MANUAL','','PLATFORM','MAIN','V3','','','UNBOUND','2026-06-09 15:41:17'),
(2061724760923164675,2061724760923164673,'xpaytest','xpaytest','','','ENABLED','ORDER',1,0.00,'MANUAL','http://localhost:8077/webhook','PLATFORM','TEST','V3','','','UNBOUND','2026-06-02 16:21:02');

/*Table structure for table `t_merchant_address` */

DROP TABLE IF EXISTS `t_merchant_address`;

CREATE TABLE `t_merchant_address` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `merchant_id` bigint DEFAULT NULL COMMENT '商家ID',
  `chain` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '链',
  `symbol` varchar(32) DEFAULT NULL,
  `cold_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '冷钱包地址',
  `collect_amount` decimal(14,4) DEFAULT '1.0000' COMMENT '归集触发额度',
  `hot_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '热钱包地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_CHAIN_SYMBOL_ADDRESS` (`chain`,`symbol`,`hot_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2061724762986762243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商家钱包地址';

/*Data for the table `t_merchant_address` */


/*Table structure for table `t_merchant_asset_details` */

DROP TABLE IF EXISTS `t_merchant_asset_details`;

CREATE TABLE `t_merchant_asset_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `transaction_no` varchar(100) NOT NULL COMMENT '交易流水号',
  `merchant_id` bigint NOT NULL COMMENT '商家ID',
  `network` varchar(50) DEFAULT NULL COMMENT '网络MAIN，TEST',
  `chain` varchar(50) DEFAULT NULL COMMENT '链',
  `symbol` varchar(20) NOT NULL COMMENT '币种符号',
  `amount` decimal(20,8) NOT NULL COMMENT '变动金额',
  `old_balance` decimal(20,8) NOT NULL COMMENT '变动前可用余额',
  `new_balance` decimal(20,8) NOT NULL COMMENT '变动后可用余额',
  `old_frozen` decimal(20,8) NOT NULL COMMENT '变动前冻结余额',
  `new_frozen` decimal(20,8) NOT NULL COMMENT '变动后冻结余额',
  `type` varchar(32) NOT NULL COMMENT '类型:deposit/withdraw/payin/payout',
  `in_out` varchar(10) NOT NULL COMMENT '收入/支出IN/OUT',
  `fee` decimal(20,8) DEFAULT NULL COMMENT '手续费',
  `fee_rate` decimal(10,4) DEFAULT NULL COMMENT '手续费费率',
  `fee_symbol` varchar(20) DEFAULT NULL COMMENT '手续费币种',
  `rate` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '兑换汇率（仅兑换类型有效）',
  `remark` text COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_transaction_no` (`transaction_no`),
  KEY `idx_merchant_id` (`merchant_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2062009628638752771 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='资产变动明细表';

/*Data for the table `t_merchant_asset_details` */


/*Table structure for table `t_merchant_asset_type` */

DROP TABLE IF EXISTS `t_merchant_asset_type`;

CREATE TABLE `t_merchant_asset_type` (
  `asset_type_id` bigint NOT NULL COMMENT '资产类型ID',
  `merchant_id` bigint NOT NULL COMMENT '商家ID',
  `status` varchar(10) NOT NULL DEFAULT 'ENABLED' COMMENT '状态 ENABLED启用，DISABLED禁用',
  PRIMARY KEY (`asset_type_id`,`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商家资产类型表';

/*Data for the table `t_merchant_asset_type` */

insert  into `t_merchant_asset_type`(`asset_type_id`,`merchant_id`,`status`) values 
(1,2061724760923164675,'ENABLED'),
(2,2061724760923164675,'ENABLED'),
(3,2061724760923164675,'ENABLED'),
(4,2061724760923164675,'ENABLED'),
(5,2061724760923164675,'ENABLED'),
(6,2061724760923164675,'ENABLED'),
(7,2061724760923164675,'ENABLED'),
(8,2061724760923164675,'ENABLED'),
(9,2061724760923164675,'ENABLED'),
(10,2061724760923164675,'ENABLED'),
(11,2061724760923164675,'ENABLED'),
(12,2061724760923164675,'ENABLED'),
(14,2061724760923164675,'ENABLED'),
(15,2061724760923164675,'ENABLED'),
(16,2061724760923164675,'ENABLED'),
(17,2061724760923164675,'ENABLED'),
(18,2061724760923164675,'ENABLED'),
(19,2061724760923164675,'ENABLED'),
(20,2061724760923164675,'ENABLED'),
(21,2061724760923164675,'ENABLED'),
(22,2061724760923164675,'ENABLED'),
(23,2061724760923164675,'ENABLED'),
(24,2061724760923164675,'ENABLED'),
(25,2061724760923164675,'ENABLED'),
(26,2061724760923164675,'ENABLED'),
(27,2061724760923164675,'ENABLED');

/*Table structure for table `t_merchant_assets` */

DROP TABLE IF EXISTS `t_merchant_assets`;

CREATE TABLE `t_merchant_assets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint NOT NULL COMMENT '商家ID',
  `symbol` varchar(20) NOT NULL COMMENT '币种符号(USDT,BTC等)',
  `balance` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '可用余额',
  `frozen_balance` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '冻结余额',
  `total_balance` decimal(20,8) GENERATED ALWAYS AS ((`balance` + `frozen_balance`)) STORED COMMENT '总余额(冗余)',
  `version` int NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_merchant_symbol` (`merchant_id`,`symbol`),
  KEY `idx_merchant_id` (`merchant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2062007145581453314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商家资产表';

/*Data for the table `t_merchant_assets` */


/*Table structure for table `t_merchant_cost_detail` */

DROP TABLE IF EXISTS `t_merchant_cost_detail`;

CREATE TABLE `t_merchant_cost_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `merchant_id` bigint NOT NULL COMMENT '商家ID',
  `cost_type` varchar(30) NOT NULL COMMENT '费用类型',
  `chain` varchar(20) NOT NULL COMMENT '链',
  `symbol` varchar(20) NOT NULL COMMENT '币种',
  `amount` decimal(38,18) NOT NULL COMMENT '数量',
  `business_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '业务ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2061846688296013827 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商家费用明细';

/*Data for the table `t_merchant_cost_detail` */


/*Table structure for table `t_merchant_recharge_withdraw` */

DROP TABLE IF EXISTS `t_merchant_recharge_withdraw`;

CREATE TABLE `t_merchant_recharge_withdraw` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `transaction_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '交易编号',
  `merchant_id` bigint NOT NULL COMMENT '商家ID',
  `type` varchar(20) NOT NULL COMMENT '记录类型：充值，提现',
  `chain` varchar(20) NOT NULL COMMENT '链',
  `symbol` varchar(20) NOT NULL COMMENT '币种',
  `contract_address` varchar(128) NOT NULL DEFAULT '' COMMENT '合约地址',
  `pay_address` varchar(128) NOT NULL COMMENT '支付地址',
  `receive_address` varchar(128) NOT NULL COMMENT '接收地址',
  `amount` decimal(38,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '数量',
  `status` varchar(20) NOT NULL DEFAULT 'PENDING' COMMENT '状态：INIT,APPROVED,REJECTED,SUBMITTED,	PENDING,SUCCESS,FAILED;',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `tx_id` varchar(128) NOT NULL DEFAULT '0' COMMENT 'txId',
  `tx_gas` decimal(38,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT 'GAS费',
  `fee` decimal(38,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '平台手续费',
  `rate` decimal(38,4) NOT NULL DEFAULT '0.0000' COMMENT '平台手续费费率（百分比）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2062004443354992643 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商家充值提现';

/*Data for the table `t_merchant_recharge_withdraw` */


/*Table structure for table `t_payment_order` */

DROP TABLE IF EXISTS `t_payment_order`;

CREATE TABLE `t_payment_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `merchant_id` bigint NOT NULL,
  `merchant_order_id` varchar(64) NOT NULL COMMENT '商户自定义订单号',
  `uid` varchar(64) DEFAULT NULL COMMENT 'uid',
  `order_type` varchar(10) NOT NULL COMMENT '订单类型，代收，代付',
  `asset_type_id` bigint NOT NULL COMMENT '支付币种ID',
  `chain` varchar(32) DEFAULT NULL,
  `symbol` varchar(32) DEFAULT NULL,
  `pay_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户付款地址',
  `receive_address` varchar(128) NOT NULL COMMENT '系统分配的收款地址',
  `amount` decimal(38,8) NOT NULL DEFAULT '0.00000000' COMMENT '支付金额',
  `actual_amount` decimal(38,8) NOT NULL DEFAULT '0.00000000' COMMENT '实际支付金额',
  `expired_time` bigint NOT NULL COMMENT '过期时间',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'PENDING' COMMENT '状态：PENDING,PENDING_CONFIRMATION,SUCCESS,EXPIRED,FAILED,',
  `reason` varchar(255) DEFAULT '' COMMENT '失败原因',
  `tx_id` varchar(128) DEFAULT NULL COMMENT '支付交易ID',
  `tx_gas` decimal(38,18) DEFAULT '0.000000000000000000' COMMENT 'gas费',
  `handing_fee` decimal(38,8) NOT NULL DEFAULT '0.00000000' COMMENT '平台手续费',
  `handing_rate` decimal(8,4) NOT NULL DEFAULT '0.0000' COMMENT '平台手续费费率（百分比）',
  `extra_given` decimal(38,8) DEFAULT '0.00000000' COMMENT '用户多给',
  `already_given` decimal(38,8) DEFAULT '0.00000000' COMMENT '用户只给',
  `notify_status` varchar(20) DEFAULT 'INIT' COMMENT '回调通知状态',
  `callback_url` varchar(255) DEFAULT NULL,
  `notify_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_merchant_order` (`merchant_id`,`merchant_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2062009129373966339 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通用支付订单表';

/*Data for the table `t_payment_order` */


/*Table structure for table `t_tx_record` */

DROP TABLE IF EXISTS `t_tx_record`;

CREATE TABLE `t_tx_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(64) NOT NULL COMMENT '对应订单ID',
  `block_number` bigint DEFAULT NULL,
  `from_address` varchar(128) NOT NULL,
  `to_address` varchar(128) NOT NULL,
  `chain` varchar(20) NOT NULL,
  `symbol` varchar(20) DEFAULT NULL,
  `amount` decimal(38,0) NOT NULL,
  `tx_id` varchar(128) DEFAULT NULL,
  `fee_tx_id` varchar(128) DEFAULT NULL COMMENT '手续费txid',
  `contract_address` varchar(128) DEFAULT NULL,
  `tx_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'COLLECTION' COMMENT '交易类型：COLLECTION,PAYOUT',
  `tx_fee` decimal(38,0) DEFAULT NULL,
  `confirmed_num` int DEFAULT '0',
  `status` varchar(20) DEFAULT 'INIT' COMMENT '交易状态：INIT, BROADCASTED, CONFIRMED, FAILED',
  `block_time` bigint DEFAULT NULL COMMENT '交易区块时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2061845028119187458 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='链上交易记录表';

/*Data for the table `t_tx_record` */


/*Table structure for table `t_user_address` */

DROP TABLE IF EXISTS `t_user_address`;

CREATE TABLE `t_user_address` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `merchant_id` bigint NOT NULL COMMENT '商家ID',
  `user_id` varchar(50) NOT NULL COMMENT '用户ID',
  `chain` varchar(32) NOT NULL COMMENT '链',
  `symbol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'USDT' COMMENT '币种',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地址',
  `amount` decimal(38,18) DEFAULT '0.000000000000000000' COMMENT '可收集数量',
  `collectible` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NO' COMMENT '是否可归集',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'USED' COMMENT '未使用UNUSED，使用中USED',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_CHAIN_SYMBOL_ADDRESS` (`chain`,`symbol`,`address`)
) ENGINE=InnoDB AUTO_INCREMENT=2062006966463750147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户地址用于收集';

/*Data for the table `t_user_address` */


/*Table structure for table `test_demo` */

DROP TABLE IF EXISTS `test_demo`;

CREATE TABLE `test_demo` (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `order_num` int DEFAULT '0' COMMENT '排序号',
  `test_key` varchar(255) DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `version` int DEFAULT '0' COMMENT '版本',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `del_flag` int DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='测试单表';

/*Data for the table `test_demo` */

insert  into `test_demo`(`id`,`tenant_id`,`dept_id`,`user_id`,`order_num`,`test_key`,`value`,`version`,`create_dept`,`create_time`,`create_by`,`update_time`,`update_by`,`del_flag`) values 
(1,'000000',102,4,1,'测试数据权限','测试',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(2,'000000',102,3,2,'子节点1','111',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(3,'000000',102,3,3,'子节点2','222',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(4,'000000',108,4,4,'测试数据','demo',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(5,'000000',108,3,13,'子节点11','1111',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(6,'000000',108,3,12,'子节点22','2222',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(7,'000000',108,3,11,'子节点33','3333',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(8,'000000',108,3,10,'子节点44','4444',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(9,'000000',108,3,9,'子节点55','5555',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(10,'000000',108,3,8,'子节点66','6666',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(11,'000000',108,3,7,'子节点77','7777',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(12,'000000',108,3,6,'子节点88','8888',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(13,'000000',108,3,5,'子节点99','9999',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0);

/*Table structure for table `test_tree` */

DROP TABLE IF EXISTS `test_tree`;

CREATE TABLE `test_tree` (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint DEFAULT '0' COMMENT '父id',
  `dept_id` bigint DEFAULT NULL COMMENT '部门id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `tree_name` varchar(255) DEFAULT NULL COMMENT '值',
  `version` int DEFAULT '0' COMMENT '版本',
  `create_dept` bigint DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint DEFAULT NULL COMMENT '更新人',
  `del_flag` int DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='测试树表';

/*Data for the table `test_tree` */

insert  into `test_tree`(`id`,`tenant_id`,`parent_id`,`dept_id`,`user_id`,`tree_name`,`version`,`create_dept`,`create_time`,`create_by`,`update_time`,`update_by`,`del_flag`) values 
(1,'000000',0,102,4,'测试数据权限',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(2,'000000',1,102,3,'子节点1',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(3,'000000',2,102,3,'子节点2',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(4,'000000',0,108,4,'测试树1',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(5,'000000',4,108,3,'子节点11',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(6,'000000',4,108,3,'子节点22',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(7,'000000',4,108,3,'子节点33',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(8,'000000',5,108,3,'子节点44',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(9,'000000',6,108,3,'子节点55',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(10,'000000',7,108,3,'子节点66',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(11,'000000',7,108,3,'子节点77',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(12,'000000',10,108,3,'子节点88',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0),
(13,'000000',10,108,3,'子节点99',0,103,'2025-07-28 10:29:46',1,NULL,NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
