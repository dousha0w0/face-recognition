/*
 Navicat Premium Data Transfer

 Source Server         : 本地服务器
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : face-recognition

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 10/04/2024 19:17:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for caserecords
-- ----------------------------
DROP TABLE IF EXISTS `caserecords`;
CREATE TABLE `caserecords`  (
  `case_id` int NOT NULL AUTO_INCREMENT COMMENT '病例ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `gender` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '患者性别',
  `age` int NOT NULL COMMENT '患者年龄',
  `medicalhistory` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '既往病史',
  `drugallergy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '药物过敏病史',
  `surgical_history` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '手术史',
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录的时间戳',
  PRIMARY KEY (`case_id`) USING BTREE,
  INDEX `caserecords_user_id_fk`(`user_id` ASC) USING BTREE,
  CONSTRAINT `caserecords_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '病例信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of caserecords
-- ----------------------------

-- ----------------------------
-- Table structure for faceinfos
-- ----------------------------
DROP TABLE IF EXISTS `faceinfos`;
CREATE TABLE `faceinfos`  (
  `face_id` int NOT NULL AUTO_INCREMENT COMMENT '人脸ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `face_data` blob NOT NULL COMMENT '人脸数据',
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '人脸数据录入时间戳',
  PRIMARY KEY (`face_id`) USING BTREE,
  UNIQUE INDEX `faceinfos_pk`(`user_id` ASC) USING BTREE,
  CONSTRAINT `faceinfos_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '人脸信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of faceinfos
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL COMMENT '编号',
  `data_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '数据源名称',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1777771142614917121, 'master', 'caserecords', '病例信息表', NULL, NULL, 'Caserecords', 'crud', 'org.dromara.system', 'system', 'caserecords', '病例信息', 'Lion Li', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null}', 103, 1, '2024-04-10 02:50:38', 1, '2024-04-10 02:51:59', NULL);
INSERT INTO `gen_table` VALUES (1777771142614917130, 'master', 'faceinfos', '人脸信息表', NULL, NULL, 'Faceinfos', 'crud', 'org.dromara.system', 'system', 'faceinfos', '人脸信息', 'Lion Li', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null}', 103, 1, '2024-04-10 02:44:06', 1, '2024-04-10 09:57:11', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1777771142614917122, 1777771142614917121, 'case_id', '病例ID', 'int', 'Long', 'caseId', '1', '1', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 103, 1, '2024-04-10 02:50:44', 1, '2024-04-10 02:51:59');
INSERT INTO `gen_table_column` VALUES (1777771142614917123, 1777771142614917121, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 103, 1, '2024-04-10 02:50:44', 1, '2024-04-10 02:51:59');
INSERT INTO `gen_table_column` VALUES (1777771142614917124, 1777771142614917121, 'gender', '患者性别', 'varchar(6)', 'String', 'gender', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', 'sys_user_sex', 3, 103, 1, '2024-04-10 02:50:44', 1, '2024-04-10 02:51:59');
INSERT INTO `gen_table_column` VALUES (1777771142614917125, 1777771142614917121, 'age', '患者年龄', 'int', 'Long', 'age', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 103, 1, '2024-04-10 02:50:44', 1, '2024-04-10 02:51:59');
INSERT INTO `gen_table_column` VALUES (1777771142614917126, 1777771142614917121, 'medicalhistory', '既往病史', 'text', 'String', 'medicalhistory', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 103, 1, '2024-04-10 02:50:44', 1, '2024-04-10 02:51:59');
INSERT INTO `gen_table_column` VALUES (1777771142614917127, 1777771142614917121, 'drugallergy', '药物过敏病史', 'text', 'String', 'drugallergy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 103, 1, '2024-04-10 02:50:44', 1, '2024-04-10 02:51:59');
INSERT INTO `gen_table_column` VALUES (1777771142614917128, 1777771142614917121, 'surgical_history', '手术史', 'text', 'String', 'surgicalHistory', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 103, 1, '2024-04-10 02:50:44', 1, '2024-04-10 02:51:59');
INSERT INTO `gen_table_column` VALUES (1777771142614917129, 1777771142614917121, 'timestamp', '记录的时间戳', 'datetime', 'Date', 'timestamp', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 103, 1, '2024-04-10 02:50:44', 1, '2024-04-10 02:51:59');
INSERT INTO `gen_table_column` VALUES (1777771142614917131, 1777771142614917130, 'face_id', '人脸ID', 'int', 'Long', 'faceId', '1', '1', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 103, 1, '2024-04-10 02:50:44', 1, '2024-04-10 09:57:11');
INSERT INTO `gen_table_column` VALUES (1777771142614917132, 1777771142614917130, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 103, 1, '2024-04-10 02:50:44', 1, '2024-04-10 09:57:11');
INSERT INTO `gen_table_column` VALUES (1777771142614917133, 1777771142614917130, 'timestamp', '人脸数据录入时间戳', 'datetime', 'Date', 'timestamp', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 103, 1, '2024-04-10 02:50:44', 1, '2024-04-10 09:57:11');
INSERT INTO `gen_table_column` VALUES (1777771836143083521, 1777771142614917130, 'face_data', '人脸数据', 'blob', 'String', 'faceData', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 103, 1, '2024-04-10 02:53:30', 1, '2024-04-10 09:57:11');

-- ----------------------------
-- Table structure for pj_app_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_app_info`;
CREATE TABLE `pj_app_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `current_server` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx01_app_info`(`app_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_app_info
-- ----------------------------
INSERT INTO `pj_app_info` VALUES (1, 'ruoyi-worker', '127.0.0.1:10010', '2023-06-13 16:32:59.263000', '2023-07-04 17:25:49.798000', '123456');

-- ----------------------------
-- Table structure for pj_container_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_container_info`;
CREATE TABLE `pj_container_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_id` bigint NULL DEFAULT NULL,
  `container_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `last_deploy_time` datetime(6) NULL DEFAULT NULL,
  `source_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `source_type` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx01_container_info`(`app_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_container_info
-- ----------------------------

-- ----------------------------
-- Table structure for pj_instance_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_instance_info`;
CREATE TABLE `pj_instance_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `actual_trigger_time` bigint NULL DEFAULT NULL,
  `app_id` bigint NULL DEFAULT NULL,
  `expected_trigger_time` bigint NULL DEFAULT NULL,
  `finished_time` bigint NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `instance_id` bigint NULL DEFAULT NULL,
  `instance_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `job_id` bigint NULL DEFAULT NULL,
  `job_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `last_report_time` bigint NULL DEFAULT NULL,
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `running_times` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `task_tracker_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `wf_instance_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx01_instance_info`(`job_id` ASC, `status` ASC) USING BTREE,
  INDEX `idx02_instance_info`(`app_id` ASC, `status` ASC) USING BTREE,
  INDEX `idx03_instance_info`(`instance_id` ASC, `status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_instance_info
-- ----------------------------

-- ----------------------------
-- Table structure for pj_job_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_job_info`;
CREATE TABLE `pj_job_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alarm_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `app_id` bigint NULL DEFAULT NULL,
  `concurrency` int NULL DEFAULT NULL,
  `designated_workers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dispatch_strategy` int NULL DEFAULT NULL,
  `execute_type` int NULL DEFAULT NULL,
  `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `instance_retry_num` int NULL DEFAULT NULL,
  `instance_time_limit` bigint NULL DEFAULT NULL,
  `job_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `job_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `lifecycle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `log_config` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `max_instance_num` int NULL DEFAULT NULL,
  `max_worker_count` int NULL DEFAULT NULL,
  `min_cpu_cores` double NOT NULL,
  `min_disk_space` double NOT NULL,
  `min_memory_space` double NOT NULL,
  `next_trigger_time` bigint NULL DEFAULT NULL,
  `notify_user_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `processor_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `processor_type` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `task_retry_num` int NULL DEFAULT NULL,
  `time_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time_expression_type` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx01_job_info`(`app_id` ASC, `status` ASC, `time_expression_type` ASC, `next_trigger_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_job_info
-- ----------------------------
INSERT INTO `pj_job_info` VALUES (1, '{\"alertThreshold\":0,\"silenceWindowLen\":0,\"statisticWindowLen\":0}', 1, 5, '', 2, 1, NULL, '2023-06-02 15:01:27.717000', '2023-07-04 17:22:12.374000', 1, 0, '', '单机处理器执行测试', NULL, '{}', '{\"type\":1}', 0, 0, 0, 0, 0, NULL, NULL, 'org.dromara.job.processors.StandaloneProcessorDemo', 1, 2, NULL, 1, '30000', 3);
INSERT INTO `pj_job_info` VALUES (2, '{\"alertThreshold\":0,\"silenceWindowLen\":0,\"statisticWindowLen\":0}', 1, 5, '', 1, 2, NULL, '2023-06-02 15:04:45.342000', '2023-07-04 17:22:12.816000', 0, 0, NULL, '广播处理器测试', NULL, '{}', '{\"type\":1}', 0, 0, 0, 0, 0, NULL, NULL, 'org.dromara.job.processors.BroadcastProcessorDemo', 1, 2, NULL, 1, '30000', 3);
INSERT INTO `pj_job_info` VALUES (3, '{\"alertThreshold\":0,\"silenceWindowLen\":0,\"statisticWindowLen\":0}', 1, 5, '', 1, 4, NULL, '2023-06-02 15:13:23.519000', '2023-06-02 16:03:22.421000', 0, 0, NULL, 'Map处理器测试', NULL, '{}', '{\"type\":1}', 0, 0, 0, 0, 0, NULL, NULL, 'org.dromara.job.processors.MapProcessorDemo', 1, 2, NULL, 1, '1000', 3);
INSERT INTO `pj_job_info` VALUES (4, '{\"alertThreshold\":0,\"silenceWindowLen\":0,\"statisticWindowLen\":0}', 1, 5, '', 1, 3, NULL, '2023-06-02 15:45:25.896000', '2023-06-02 16:03:23.125000', 0, 0, NULL, 'MapReduce处理器测试', NULL, '{}', '{\"type\":1}', 0, 0, 0, 0, 0, NULL, NULL, 'org.dromara.job.processors.MapReduceProcessorDemo', 1, 2, NULL, 1, '1000', 3);

-- ----------------------------
-- Table structure for pj_oms_lock
-- ----------------------------
DROP TABLE IF EXISTS `pj_oms_lock`;
CREATE TABLE `pj_oms_lock`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `lock_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `max_lock_time` bigint NULL DEFAULT NULL,
  `ownerip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx01_oms_lock`(`lock_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_oms_lock
-- ----------------------------

-- ----------------------------
-- Table structure for pj_server_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_server_info`;
CREATE TABLE `pj_server_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx01_server_info`(`ip` ASC) USING BTREE,
  INDEX `idx01_server_info`(`gmt_modified` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_server_info
-- ----------------------------

-- ----------------------------
-- Table structure for pj_user_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_user_info`;
CREATE TABLE `pj_user_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `web_hook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uidx01_user_info`(`username` ASC) USING BTREE,
  INDEX `uidx02_user_info`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for pj_workflow_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_workflow_info`;
CREATE TABLE `pj_workflow_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_id` bigint NULL DEFAULT NULL,
  `extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `lifecycle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `max_wf_instance_num` int NULL DEFAULT NULL,
  `next_trigger_time` bigint NULL DEFAULT NULL,
  `notify_user_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pedag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` int NULL DEFAULT NULL,
  `time_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time_expression_type` int NULL DEFAULT NULL,
  `wf_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `wf_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx01_workflow_info`(`app_id` ASC, `status` ASC, `time_expression_type` ASC, `next_trigger_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_workflow_info
-- ----------------------------

-- ----------------------------
-- Table structure for pj_workflow_instance_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_workflow_instance_info`;
CREATE TABLE `pj_workflow_instance_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `actual_trigger_time` bigint NULL DEFAULT NULL,
  `app_id` bigint NULL DEFAULT NULL,
  `dag` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `expected_trigger_time` bigint NULL DEFAULT NULL,
  `finished_time` bigint NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `parent_wf_instance_id` bigint NULL DEFAULT NULL,
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `status` int NULL DEFAULT NULL,
  `wf_context` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `wf_init_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `wf_instance_id` bigint NULL DEFAULT NULL,
  `workflow_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uidx01_wf_instance`(`wf_instance_id` ASC) USING BTREE,
  INDEX `idx01_wf_instance`(`workflow_id` ASC, `status` ASC, `app_id` ASC, `expected_trigger_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_workflow_instance_info
-- ----------------------------

-- ----------------------------
-- Table structure for pj_workflow_node_info
-- ----------------------------
DROP TABLE IF EXISTS `pj_workflow_node_info`;
CREATE TABLE `pj_workflow_node_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_id` bigint NOT NULL,
  `enable` bit(1) NOT NULL,
  `extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `job_id` bigint NULL DEFAULT NULL,
  `node_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `node_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `skip_when_failed` bit(1) NOT NULL,
  `type` int NULL DEFAULT NULL,
  `workflow_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx01_workflow_node_info`(`workflow_id` ASC, `gmt_create` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pj_workflow_node_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_client
-- ----------------------------
DROP TABLE IF EXISTS `sys_client`;
CREATE TABLE `sys_client`  (
  `id` bigint NOT NULL COMMENT 'id',
  `client_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端id',
  `client_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端key',
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端秘钥',
  `grant_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授权类型',
  `device_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备类型',
  `active_timeout` int NULL DEFAULT 1800 COMMENT 'token活跃超时时间',
  `timeout` int NULL DEFAULT 604800 COMMENT 'token固定超时',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统授权表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_client
-- ----------------------------
INSERT INTO `sys_client` VALUES (1, 'e5cd7e4891bf95d1d19206ce24a7b32e', 'pc', 'pc123', 'password,social', 'pc', 1800, 604800, '0', '0', 103, 1, '2024-04-10 00:21:53', 1, '2024-04-10 00:21:53');
INSERT INTO `sys_client` VALUES (2, '428a8310cd442757ae699df5d894f051', 'app', 'app123', 'password,sms,social', 'android', 1800, 604800, '0', '0', 103, 1, '2024-04-10 00:21:53', 1, '2024-04-10 00:21:53');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint NOT NULL COMMENT '参数主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '000000', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '000000', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '000000', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (5, '000000', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 103, 1, '2024-04-10 00:21:53', 1, '2024-04-10 02:06:11', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, '000000', 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 103, 1, '2024-04-10 00:21:53', NULL, NULL, 'true:开启, false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL COMMENT '部门id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` bigint NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, '000000', 0, '0', '人民医院', 0, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 02:23:45');
INSERT INTO `sys_dept` VALUES (101, '000000', 100, '0,100', '深圳人民医院', 1, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 02:23:56');
INSERT INTO `sys_dept` VALUES (102, '000000', 100, '0,100', '长沙人民医院', 2, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 02:24:05');
INSERT INTO `sys_dept` VALUES (103, '000000', 101, '0,100,101', '急诊部门', 1, 1, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 02:24:12');
INSERT INTO `sys_dept` VALUES (104, '000000', 101, '0,100,101', '心脏科部门', 2, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 02:24:19');
INSERT INTO `sys_dept` VALUES (105, '000000', 101, '0,100,101', '麻醉剂部门', 3, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 02:24:26');
INSERT INTO `sys_dept` VALUES (106, '000000', 101, '0,100,101', '儿童急诊部门', 4, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 02:24:39');
INSERT INTO `sys_dept` VALUES (107, '000000', 101, '0,100,101', '信息部门', 5, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 02:24:53');
INSERT INTO `sys_dept` VALUES (108, '000000', 102, '0,100,102', '急诊部门', 1, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 02:25:05');
INSERT INTO `sys_dept` VALUES (109, '000000', 102, '0,100,102', '心脏科部门', 2, NULL, '15888888888', 'xxx@qq.com', '0', '0', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 02:25:15');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL COMMENT '字典编码',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, '000000', 1, '男', '0', 'sys_user_sex', '', '', 'Y', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, '000000', 2, '女', '1', 'sys_user_sex', '', '', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, '000000', 3, '未知', '2', 'sys_user_sex', '', '', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, '000000', 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, '000000', 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, '000000', 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, '000000', 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (12, '000000', 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, '000000', 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, '000000', 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, '000000', 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, '000000', 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, '000000', 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, '000000', 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, '000000', 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, '000000', 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, '000000', 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, '000000', 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, '000000', 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, '000000', 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, '000000', 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, '000000', 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, '000000', 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, '000000', 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, '000000', 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (30, '000000', 0, '密码认证', 'password', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '密码认证');
INSERT INTO `sys_dict_data` VALUES (31, '000000', 0, '短信认证', 'sms', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '短信认证');
INSERT INTO `sys_dict_data` VALUES (32, '000000', 0, '邮件认证', 'email', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '邮件认证');
INSERT INTO `sys_dict_data` VALUES (33, '000000', 0, '小程序认证', 'xcx', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '小程序认证');
INSERT INTO `sys_dict_data` VALUES (34, '000000', 0, '三方登录认证', 'social', 'sys_grant_type', 'el-check-tag', 'default', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '三方登录认证');
INSERT INTO `sys_dict_data` VALUES (35, '000000', 0, 'PC', 'pc', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, 'PC');
INSERT INTO `sys_dict_data` VALUES (36, '000000', 0, '安卓', 'android', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '安卓');
INSERT INTO `sys_dict_data` VALUES (37, '000000', 0, 'iOS', 'ios', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, 'iOS');
INSERT INTO `sys_dict_data` VALUES (38, '000000', 0, '小程序', 'xcx', 'sys_device_type', '', 'default', 'N', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '小程序');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL COMMENT '字典主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `tenant_id`(`tenant_id` ASC, `dict_type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '000000', '用户性别', 'sys_user_sex', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '000000', '菜单状态', 'sys_show_hide', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '000000', '系统开关', 'sys_normal_disable', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (6, '000000', '系统是否', 'sys_yes_no', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '000000', '通知类型', 'sys_notice_type', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '000000', '通知状态', 'sys_notice_status', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '000000', '操作类型', 'sys_oper_type', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '000000', '系统状态', 'sys_common_status', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '000000', '授权类型', 'sys_grant_type', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '认证授权类型');
INSERT INTO `sys_dict_type` VALUES (12, '000000', '设备类型', 'sys_device_type', 103, 1, '2024-04-10 00:21:53', NULL, NULL, '客户端设备类型');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL COMMENT '访问ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `client_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '客户端',
  `device_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '设备类型',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1777758333034422274, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-04-10 01:59:50');
INSERT INTO `sys_logininfor` VALUES (1777759727690825729, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-04-10 02:05:23');
INSERT INTO `sys_logininfor` VALUES (1777759942263029762, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-04-10 02:06:14');
INSERT INTO `sys_logininfor` VALUES (1777759960319508481, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-04-10 02:06:18');
INSERT INTO `sys_logininfor` VALUES (1777759977528737793, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-04-10 02:06:22');
INSERT INTO `sys_logininfor` VALUES (1777759995463581698, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-04-10 02:06:27');
INSERT INTO `sys_logininfor` VALUES (1777760068977074178, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-04-10 02:06:44');
INSERT INTO `sys_logininfor` VALUES (1777760308610244610, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-04-10 02:07:41');
INSERT INTO `sys_logininfor` VALUES (1777760828120932353, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-04-10 02:09:45');
INSERT INTO `sys_logininfor` VALUES (1777760846710087681, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-04-10 02:09:50');
INSERT INTO `sys_logininfor` VALUES (1777762361705275393, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '退出成功', '2024-04-10 02:15:51');
INSERT INTO `sys_logininfor` VALUES (1777762910815166466, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-04-10 02:18:02');
INSERT INTO `sys_logininfor` VALUES (1777876220428488706, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-04-10 09:48:17');
INSERT INTO `sys_logininfor` VALUES (1778013503005724674, '000000', 'admin', 'pc', 'pc', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10 or Windows Server 2016', '0', '登录成功', '2024-04-10 18:53:48');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '显示状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 18:57:36', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '1', '0', '', 'tool', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 18:59:32', '系统工具目录');
INSERT INTO `sys_menu` VALUES (6, '租户管理', 0, 2, 'tenant', NULL, '', 1, 0, 'M', '1', '0', '', 'chart', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 18:57:39', '租户管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '1', '0', 'system:menu:list', 'tree-table', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 19:06:55', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 19:02:56', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '1', '0', '', 'log', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 19:07:04', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', '', '', 1, 0, 'C', '1', '1', '', 'build', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 18:57:28', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, 'Admin监控', 2, 5, 'Admin', 'monitor/admin/index', '', 1, 0, 'C', '0', '0', 'monitor:admin:list', 'dashboard', 103, 1, '2024-04-10 00:21:52', NULL, NULL, 'Admin监控菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 1, 0, 'C', '1', '0', 'system:oss:list', 'upload', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 19:07:08', '文件管理菜单');
INSERT INTO `sys_menu` VALUES (120, '任务调度中心', 2, 5, 'powerjob', 'monitor/powerjob/index', '', 1, 0, 'C', '0', '0', 'monitor:powerjob:list', 'job', 103, 1, '2024-04-10 00:21:52', NULL, NULL, 'PowerJob控制台菜单');
INSERT INTO `sys_menu` VALUES (121, '租户管理', 6, 1, 'tenant', 'system/tenant/index', '', 1, 0, 'C', '0', '0', 'system:tenant:list', 'list', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '租户管理菜单');
INSERT INTO `sys_menu` VALUES (122, '租户套餐管理', 6, 2, 'tenantPackage', 'system/tenantPackage/index', '', 1, 0, 'C', '0', '0', 'system:tenantPackage:list', 'form', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '租户套餐管理菜单');
INSERT INTO `sys_menu` VALUES (123, '客户端管理', 1, 11, 'client', 'system/client/index', '', 1, 0, 'C', '1', '0', 'system:client:list', 'international', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 19:07:11', '客户端管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '客户端管理查询', 123, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1062, '客户端管理新增', 123, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:add', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1063, '客户端管理修改', 123, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:edit', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '客户端管理删除', 123, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '客户端管理导出', 123, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:client:export', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1606, '租户查询', 121, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1607, '租户新增', 121, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:add', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1608, '租户修改', 121, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:edit', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1609, '租户删除', 121, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1610, '租户导出', 121, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenant:export', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1611, '租户套餐查询', 122, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:query', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1612, '租户套餐新增', 122, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:add', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1613, '租户套餐修改', 122, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:edit', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1614, '租户套餐删除', 122, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1615, '租户套餐导出', 122, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:tenantPackage:export', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1620, '配置列表', 118, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:list', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1621, '配置添加', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:add', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1622, '配置编辑', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:edit', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1623, '配置删除', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:ossConfig:remove', '#', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1777773170351185922, '病例信息', 1777777207293317122, 1, 'caserecords', 'system/caserecords/index', NULL, 1, 0, 'C', '0', '0', 'system:caserecords:list', '#', 103, 1, '2024-04-10 03:00:06', 1, '2024-04-10 03:15:29', '病例信息菜单');
INSERT INTO `sys_menu` VALUES (1777773170351185923, '病例信息查询', 1777773170351185922, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:caserecords:query', '#', 103, 1, '2024-04-10 03:00:06', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1777773170351185924, '病例信息新增', 1777773170351185922, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:caserecords:add', '#', 103, 1, '2024-04-10 03:00:06', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1777773170351185925, '病例信息修改', 1777773170351185922, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:caserecords:edit', '#', 103, 1, '2024-04-10 03:00:06', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1777773170351185926, '病例信息删除', 1777773170351185922, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:caserecords:remove', '#', 103, 1, '2024-04-10 03:00:06', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1777773170351185927, '病例信息导出', 1777773170351185922, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:caserecords:export', '#', 103, 1, '2024-04-10 03:00:06', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1777773170841919489, '人脸信息', 1777777207293317122, 1, 'faceinfos', 'system/faceinfos/index', NULL, 1, 0, 'C', '0', '0', 'system:faceinfos:list', '#', 103, 1, '2024-04-10 03:00:11', 1, '2024-04-10 03:15:37', '人脸信息菜单');
INSERT INTO `sys_menu` VALUES (1777773170841919490, '人脸信息查询', 1777773170841919489, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:faceinfos:query', '#', 103, 1, '2024-04-10 03:00:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1777773170841919491, '人脸信息新增', 1777773170841919489, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:faceinfos:add', '#', 103, 1, '2024-04-10 03:00:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1777773170841919492, '人脸信息修改', 1777773170841919489, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:faceinfos:edit', '#', 103, 1, '2024-04-10 03:00:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1777773170841919493, '人脸信息删除', 1777773170841919489, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:faceinfos:remove', '#', 103, 1, '2024-04-10 03:00:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1777773170841919494, '人脸信息导出', 1777773170841919489, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:faceinfos:export', '#', 103, 1, '2024-04-10 03:00:11', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (1777777207293317122, '患者信息管理', 0, 1, 'records', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'peoples', 103, 1, '2024-04-10 03:14:50', 1, '2024-04-10 03:15:57', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint NOT NULL COMMENT '公告ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL COMMENT '日志主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1777758654708178945, '000000', '菜单管理', 3, 'org.dromara.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/5', '127.0.0.1', '内网IP', '{}', '{\"code\":601,\"msg\":\"存在子菜单,不允许删除\",\"data\":null}', 0, '', '2024-04-10 02:01:07', 4);
INSERT INTO `sys_oper_log` VALUES (1777758671707693058, '000000', '菜单管理', 3, 'org.dromara.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"code\":601,\"msg\":\"菜单已分配,不允许删除\",\"data\":null}', 0, '', '2024-04-10 02:01:11', 8);
INSERT INTO `sys_oper_log` VALUES (1777758968257568770, '000000', '菜单管理', 3, 'org.dromara.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1500', '127.0.0.1', '内网IP', '{}', '{\"code\":601,\"msg\":\"存在子菜单,不允许删除\",\"data\":null}', 0, '', '2024-04-10 02:02:22', 2);
INSERT INTO `sys_oper_log` VALUES (1777759038579269634, '000000', '菜单管理', 3, 'org.dromara.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/5', '127.0.0.1', '内网IP', '{}', '{\"code\":601,\"msg\":\"存在子菜单,不允许删除\",\"data\":null}', 0, '', '2024-04-10 02:02:39', 3);
INSERT INTO `sys_oper_log` VALUES (1777759930644807681, '000000', '参数管理', 2, 'org.dromara.system.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:53\",\"updateBy\":null,\"updateTime\":null,\"configId\":5,\"configName\":\"账号自助-是否开启用户注册功能\",\"configKey\":\"sys.account.registerUser\",\"configValue\":\"true\",\"configType\":\"Y\",\"remark\":\"是否开启注册用户功能（true开启，false关闭）\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:06:11', 12);
INSERT INTO `sys_oper_log` VALUES (1777764348513525762, '000000', '部门管理', 2, 'org.dromara.system.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"deptId\":100,\"parentId\":0,\"deptName\":\"人民医院\",\"orderNum\":0,\"leader\":null,\"phone\":\"15888888888\",\"email\":\"xxx@qq.com\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:23:45', 19);
INSERT INTO `sys_oper_log` VALUES (1777764394671841281, '000000', '部门管理', 2, 'org.dromara.system.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"deptId\":101,\"parentId\":100,\"deptName\":\"深圳人民医院\",\"orderNum\":1,\"leader\":null,\"phone\":\"15888888888\",\"email\":\"xxx@qq.com\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:23:56', 5);
INSERT INTO `sys_oper_log` VALUES (1777764432756121601, '000000', '部门管理', 2, 'org.dromara.system.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"deptId\":102,\"parentId\":100,\"deptName\":\"长沙人民医院\",\"orderNum\":2,\"leader\":null,\"phone\":\"15888888888\",\"email\":\"xxx@qq.com\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:24:05', 4);
INSERT INTO `sys_oper_log` VALUES (1777764464926433281, '000000', '部门管理', 2, 'org.dromara.system.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"deptId\":103,\"parentId\":101,\"deptName\":\"急诊部门\",\"orderNum\":1,\"leader\":1,\"phone\":\"15888888888\",\"email\":\"xxx@qq.com\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:24:12', 7);
INSERT INTO `sys_oper_log` VALUES (1777764494139760642, '000000', '部门管理', 2, 'org.dromara.system.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"deptId\":104,\"parentId\":101,\"deptName\":\"心脏科部门\",\"orderNum\":2,\"leader\":null,\"phone\":\"15888888888\",\"email\":\"xxx@qq.com\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:24:19', 10);
INSERT INTO `sys_oper_log` VALUES (1777764523483111426, '000000', '部门管理', 2, 'org.dromara.system.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"deptId\":105,\"parentId\":101,\"deptName\":\"麻醉剂部门\",\"orderNum\":3,\"leader\":null,\"phone\":\"15888888888\",\"email\":\"xxx@qq.com\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:24:26', 5);
INSERT INTO `sys_oper_log` VALUES (1777764578181029889, '000000', '部门管理', 2, 'org.dromara.system.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"deptId\":106,\"parentId\":101,\"deptName\":\"儿童急诊部门\",\"orderNum\":4,\"leader\":null,\"phone\":\"15888888888\",\"email\":\"xxx@qq.com\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:24:39', 5);
INSERT INTO `sys_oper_log` VALUES (1777764635080957954, '000000', '部门管理', 2, 'org.dromara.system.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"deptId\":107,\"parentId\":101,\"deptName\":\"信息部门\",\"orderNum\":5,\"leader\":null,\"phone\":\"15888888888\",\"email\":\"xxx@qq.com\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:24:53', 5);
INSERT INTO `sys_oper_log` VALUES (1777764687467814913, '000000', '部门管理', 2, 'org.dromara.system.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"deptId\":108,\"parentId\":102,\"deptName\":\"急诊部门\",\"orderNum\":1,\"leader\":null,\"phone\":\"15888888888\",\"email\":\"xxx@qq.com\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:25:05', 5);
INSERT INTO `sys_oper_log` VALUES (1777764725925388289, '000000', '部门管理', 2, 'org.dromara.system.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"deptId\":109,\"parentId\":102,\"deptName\":\"心脏科部门\",\"orderNum\":2,\"leader\":null,\"phone\":\"15888888888\",\"email\":\"xxx@qq.com\",\"status\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:25:15', 5);
INSERT INTO `sys_oper_log` VALUES (1777770601725861890, '000000', '代码生成', 6, 'org.dromara.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"faceinfos,caserecords\" \"master\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:48:35', 35);
INSERT INTO `sys_oper_log` VALUES (1777770993935228930, '000000', '代码生成', 3, 'org.dromara.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1777770601595838465,1777770601662947336', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:50:09', 12);
INSERT INTO `sys_oper_log` VALUES (1777771142677831682, '000000', '代码生成', 6, 'org.dromara.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"caserecords,faceinfos\" \"master\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:50:44', 13);
INSERT INTO `sys_oper_log` VALUES (1777771453802913793, '000000', '代码生成', 2, 'org.dromara.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-10 02:51:58\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":\"1777771142614917121\",\"dataName\":\"master\",\"tableName\":\"caserecords\",\"tableComment\":\"病例信息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"Caserecords\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.system\",\"moduleName\":\"system\",\"businessName\":\"caserecords\",\"functionName\":\"病例信息\",\"functionAuthor\":\"Lion Li\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-10 02:50:44\",\"updateBy\":1,\"updateTime\":\"2024-04-10 02:51:58\",\"columnId\":\"1777771142614917122\",\"tableId\":\"1777771142614917121\",\"columnName\":\"case_id\",\"columnComment\":\"病例ID\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"caseId\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"insert\":false,\"pk\":true,\"superColumn\":false,\"usableColumn\":false,\"edit\":true,\"query\":false,\"increment\":true,\"capJavaField\":\"CaseId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-10 02:50:44\",\"updateBy\":1,\"updateTime\":\"2024-04-10 02:51:58\",\"columnId\":\"1777771142614917123\",\"tableId\":\"1777771142614917121\",\"columnName\":\"user_id\",\"columnComment\":\"用户ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"userId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"insert\":true,\"pk\":false,\"superColumn\":false,\"usableColumn\":false,\"edit\":true,\"query\":true,\"increment\":false,\"capJavaField\":\"UserId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-10 02:50:44\",\"updateBy\":1,\"updateTime\":\"2024-04-10 02:51:58\",\"columnId\":\"1777771142614917124\",\"tableId\":\"1777771142614917121\",\"columnName\":\"gender\",\"columnComment\":\"患', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:51:59', 18);
INSERT INTO `sys_oper_log` VALUES (1777771836143083522, '000000', '代码生成', 2, 'org.dromara.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/1777771142614917130', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:53:30', 11);
INSERT INTO `sys_oper_log` VALUES (1777772734583971842, '000000', '代码生成', 2, 'org.dromara.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/1777771142614917130', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:57:04', 10);
INSERT INTO `sys_oper_log` VALUES (1777773067347468290, '000000', '代码生成', 2, 'org.dromara.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-10 02:58:23\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":\"1777771142614917130\",\"dataName\":\"master\",\"tableName\":\"faceinfos\",\"tableComment\":\"人脸信息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"Faceinfos\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.system\",\"moduleName\":\"system\",\"businessName\":\"faceinfos\",\"functionName\":\"人脸信息\",\"functionAuthor\":\"Lion Li\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-10 02:50:44\",\"updateBy\":1,\"updateTime\":\"2024-04-10 02:58:23\",\"columnId\":\"1777771142614917131\",\"tableId\":\"1777771142614917130\",\"columnName\":\"face_id\",\"columnComment\":\"人脸ID\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"faceId\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"insert\":false,\"pk\":true,\"superColumn\":false,\"usableColumn\":false,\"edit\":true,\"query\":false,\"increment\":true,\"capJavaField\":\"FaceId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-10 02:50:44\",\"updateBy\":1,\"updateTime\":\"2024-04-10 02:58:23\",\"columnId\":\"1777771142614917132\",\"tableId\":\"1777771142614917130\",\"columnName\":\"user_id\",\"columnComment\":\"用户ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"userId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"insert\":true,\"pk\":false,\"superColumn\":false,\"usableColumn\":false,\"edit\":true,\"query\":true,\"increment\":false,\"capJavaField\":\"UserId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-10 02:53:30\",\"updateBy\":1,\"updateTime\":\"2024-04-10 02:58:23\",\"columnId\":\"1777771836143083521\",\"tableId\":\"1777771142614917130\",\"columnName\":\"face_data\",\"columnComment\":\"人脸数据', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:58:23', 7);
INSERT INTO `sys_oper_log` VALUES (1777773160301633538, '000000', '代码生成', 2, 'org.dromara.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-10 02:58:45\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":\"1777771142614917130\",\"dataName\":\"master\",\"tableName\":\"faceinfos\",\"tableComment\":\"人脸信息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"Faceinfos\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.system\",\"moduleName\":\"system\",\"businessName\":\"faceinfos\",\"functionName\":\"人脸信息\",\"functionAuthor\":\"Lion Li\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-10 02:50:44\",\"updateBy\":1,\"updateTime\":\"2024-04-10 02:58:45\",\"columnId\":\"1777771142614917131\",\"tableId\":\"1777771142614917130\",\"columnName\":\"face_id\",\"columnComment\":\"人脸ID\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"faceId\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"insert\":false,\"pk\":true,\"superColumn\":false,\"usableColumn\":false,\"edit\":true,\"query\":false,\"increment\":true,\"capJavaField\":\"FaceId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-10 02:50:44\",\"updateBy\":1,\"updateTime\":\"2024-04-10 02:58:45\",\"columnId\":\"1777771142614917132\",\"tableId\":\"1777771142614917130\",\"columnName\":\"user_id\",\"columnComment\":\"用户ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"userId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"insert\":true,\"pk\":false,\"superColumn\":false,\"usableColumn\":false,\"edit\":true,\"query\":true,\"increment\":false,\"capJavaField\":\"UserId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-10 02:53:30\",\"updateBy\":1,\"updateTime\":\"2024-04-10 02:58:45\",\"columnId\":\"1777771836143083521\",\"tableId\":\"1777771142614917130\",\"columnName\":\"face_data\",\"columnComment\":\"人脸数据', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 02:58:46', 9);
INSERT INTO `sys_oper_log` VALUES (1777773170879668225, '000000', '代码生成', 8, 'org.dromara.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tableIdStr\":\"1777771142614917121,1777771142614917130\"}', '', 0, '', '2024-04-10 02:58:48', 134);
INSERT INTO `sys_oper_log` VALUES (1777777207347843073, '000000', '菜单管理', 1, 'org.dromara.system.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"menuId\":null,\"parentId\":0,\"menuName\":\"病例信息管理\",\"orderNum\":1,\"path\":\"records\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 03:14:50', 18);
INSERT INTO `sys_oper_log` VALUES (1777777306027233281, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 03:14:50\",\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1777777207293317122\",\"parentId\":0,\"menuName\":\"患者信息管理\",\"orderNum\":1,\"path\":\"records\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 03:15:14', 8);
INSERT INTO `sys_oper_log` VALUES (1777777368182624257, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 03:00:06\",\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1777773170351185922\",\"parentId\":\"1777777207293317122\",\"menuName\":\"病例信息\",\"orderNum\":1,\"path\":\"caserecords\",\"component\":\"system/caserecords/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:caserecords:list\",\"icon\":\"#\",\"remark\":\"病例信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 03:15:29', 4);
INSERT INTO `sys_oper_log` VALUES (1777777400973692929, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 03:00:11\",\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1777773170841919489\",\"parentId\":\"1777777207293317122\",\"menuName\":\"人脸信息\",\"orderNum\":1,\"path\":\"faceinfos\",\"component\":\"system/faceinfos/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"system:faceinfos:list\",\"icon\":\"#\",\"remark\":\"人脸信息菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 03:15:37', 5);
INSERT INTO `sys_oper_log` VALUES (1777777486336167937, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 03:14:50\",\"updateBy\":null,\"updateTime\":null,\"menuId\":\"1777777207293317122\",\"parentId\":0,\"menuName\":\"患者信息管理\",\"orderNum\":1,\"path\":\"records\",\"component\":null,\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"0\",\"status\":\"0\",\"icon\":\"peoples\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 03:15:57', 5);
INSERT INTO `sys_oper_log` VALUES (1777778467362902017, '000000', 'OSS对象存储', 1, 'org.dromara.system.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '研发部门', '/resource/oss/upload', '127.0.0.1', '内网IP', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: no further information]', '2024-04-10 03:19:51', 728);
INSERT INTO `sys_oper_log` VALUES (1777778598019665921, '000000', '对象存储配置', 3, 'org.dromara.system.controller.system.SysOssConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/resource/oss/config/2', '127.0.0.1', '内网IP', '{}', '', 1, '系统内置, 不可删除!', '2024-04-10 03:20:22', 2);
INSERT INTO `sys_oper_log` VALUES (1777778705897164801, '000000', 'OSS对象存储', 1, 'org.dromara.system.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '研发部门', '/resource/oss/upload', '127.0.0.1', '内网IP', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: no further information]', '2024-04-10 03:20:48', 440);
INSERT INTO `sys_oper_log` VALUES (1777778924864999426, '000000', 'OSS对象存储', 1, 'org.dromara.system.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '研发部门', '/resource/oss/upload', '127.0.0.1', '内网IP', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: no further information]', '2024-04-10 03:21:40', 412);
INSERT INTO `sys_oper_log` VALUES (1777779080947634178, '000000', '对象存储配置', 3, 'org.dromara.system.controller.system.SysOssConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/resource/oss/config/2', '127.0.0.1', '内网IP', '{}', '', 1, '系统内置, 不可删除!', '2024-04-10 03:22:17', 0);
INSERT INTO `sys_oper_log` VALUES (1777779093186613250, '000000', '对象存储状态修改', 2, 'org.dromara.system.controller.system.SysOssConfigController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/resource/oss/config/changeStatus', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":null,\"secretKey\":null,\"bucketName\":null,\"prefix\":null,\"endpoint\":null,\"domain\":null,\"isHttps\":null,\"status\":\"1\",\"region\":null,\"ext1\":null,\"remark\":null,\"accessPolicy\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 03:22:20', 17);
INSERT INTO `sys_oper_log` VALUES (1777779103865311233, '000000', '对象存储状态修改', 2, 'org.dromara.system.controller.system.SysOssConfigController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/resource/oss/config/changeStatus', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":5,\"configKey\":\"image\",\"accessKey\":null,\"secretKey\":null,\"bucketName\":null,\"prefix\":null,\"endpoint\":null,\"domain\":null,\"isHttps\":null,\"status\":\"0\",\"region\":null,\"ext1\":null,\"remark\":null,\"accessPolicy\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 03:22:23', 4);
INSERT INTO `sys_oper_log` VALUES (1777779148446568450, '000000', 'OSS对象存储', 1, 'org.dromara.system.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '研发部门', '/resource/oss/upload', '127.0.0.1', '内网IP', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: no further information]', '2024-04-10 03:22:33', 238);
INSERT INTO `sys_oper_log` VALUES (1777779198203596801, '000000', '对象存储状态修改', 2, 'org.dromara.system.controller.system.SysOssConfigController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/resource/oss/config/changeStatus', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":5,\"configKey\":\"image\",\"accessKey\":null,\"secretKey\":null,\"bucketName\":null,\"prefix\":null,\"endpoint\":null,\"domain\":null,\"isHttps\":null,\"status\":\"1\",\"region\":null,\"ext1\":null,\"remark\":null,\"accessPolicy\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 03:22:45', 4);
INSERT INTO `sys_oper_log` VALUES (1777779217962962945, '000000', '对象存储配置', 3, 'org.dromara.system.controller.system.SysOssConfigController.remove()', 'DELETE', 1, 'admin', '研发部门', '/resource/oss/config/1,2,3,4,5', '127.0.0.1', '内网IP', '{}', '', 1, '系统内置, 不可删除!', '2024-04-10 03:22:50', 0);
INSERT INTO `sys_oper_log` VALUES (1777779284715311106, '000000', 'OSS对象存储', 1, 'org.dromara.system.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '研发部门', '/resource/oss/upload', '127.0.0.1', '内网IP', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: no further information]', '2024-04-10 03:23:06', 428);
INSERT INTO `sys_oper_log` VALUES (1777876287155671042, '000000', '对象存储状态修改', 2, 'org.dromara.system.controller.system.SysOssConfigController.changeStatus()', 'PUT', 1, 'admin', '急诊部门', '/resource/oss/config/changeStatus', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":null,\"secretKey\":null,\"bucketName\":null,\"prefix\":null,\"endpoint\":null,\"domain\":null,\"isHttps\":null,\"status\":\"0\",\"region\":null,\"ext1\":null,\"remark\":null,\"accessPolicy\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 09:48:33', 9);
INSERT INTO `sys_oper_log` VALUES (1777876373315063810, '000000', '对象存储配置', 2, 'org.dromara.system.controller.system.SysOssConfigController.edit()', 'PUT', 1, 'admin', '急诊部门', '/resource/oss/config', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"r6QX7FIlN8T8EfI5rSVf\",\"secretKey\":\"1CJilMUvw3XSzag788fv7JI9ebFMEPhNOY1J9zND\",\"bucketName\":\"face-reco\",\"prefix\":\"\",\"endpoint\":\"127.0.0.1:9000\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":null,\"accessPolicy\":\"1\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 09:48:53', 6);
INSERT INTO `sys_oper_log` VALUES (1777876391711281154, '000000', 'OSS对象存储', 1, 'org.dromara.system.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '急诊部门', '/resource/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"url\":\"http://127.0.0.1:9000/face-reco/2024/04/10/1660873c7a014ef3a6471f19842a98b4.jpg\",\"fileName\":\"b_f96b2acf068279ced213ba2e145063ad.jpg\",\"ossId\":\"1777876391648366594\"}}', 0, '', '2024-04-10 09:48:58', 110);
INSERT INTO `sys_oper_log` VALUES (1777877216969953283, '000000', 'OSS对象存储', 1, 'org.dromara.system.controller.system.SysOssController.upload()', 'POST', 1, 'admin', '急诊部门', '/resource/oss/upload', '127.0.0.1', '内网IP', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"url\":\"http://127.0.0.1:9000/face-reco/2024/04/10/2889680c89a34aecb14def4c44715407.jpg\",\"fileName\":\"Cache_-33237f5a0e17403a..jpg\",\"ossId\":\"1777877216969953282\"}}', 0, '', '2024-04-10 09:52:15', 11);
INSERT INTO `sys_oper_log` VALUES (1777877239640166401, '000000', '人脸信息', 1, 'org.dromara.system.controller.FaceinfosController.add()', 'POST', 1, 'admin', '急诊部门', '/system/faceinfos', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"faceId\":null,\"userId\":1,\"faceData\":\"1777877216969953282\",\"timestamp\":\"2024-04-10 09:52:18\"}', '', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_dept\' in \'field list\'\r\n### The error may exist in org/dromara/system/mapper/FaceinfosMapper.java (best guess)\r\n### The error may involve org.dromara.system.mapper.FaceinfosMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO faceinfos  ( face_id, user_id, face_data, timestamp, create_dept, create_by, create_time, update_by, update_time )  VALUES (  ?, ?, ?, ?, ?, ?, ?, ?, ?  )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'create_dept\' in \'field list\'\n; bad SQL grammar []', '2024-04-10 09:52:20', 34);
INSERT INTO `sys_oper_log` VALUES (1777878461004713985, '000000', '代码生成', 2, 'org.dromara.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '急诊部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":1,\"updateTime\":\"2024-04-10 09:57:11\",\"params\":{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":null},\"tableId\":\"1777771142614917130\",\"dataName\":\"master\",\"tableName\":\"faceinfos\",\"tableComment\":\"人脸信息表\",\"subTableName\":null,\"subTableFkName\":null,\"className\":\"Faceinfos\",\"tplCategory\":\"crud\",\"packageName\":\"org.dromara.system\",\"moduleName\":\"system\",\"businessName\":\"faceinfos\",\"functionName\":\"人脸信息\",\"functionAuthor\":\"Lion Li\",\"genType\":\"0\",\"genPath\":\"/\",\"pkColumn\":null,\"columns\":[{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-10 02:50:44\",\"updateBy\":1,\"updateTime\":\"2024-04-10 09:57:11\",\"columnId\":\"1777771142614917131\",\"tableId\":\"1777771142614917130\",\"columnName\":\"face_id\",\"columnComment\":\"人脸ID\",\"columnType\":\"int\",\"javaType\":\"Long\",\"javaField\":\"faceId\",\"isPk\":\"1\",\"isIncrement\":\"1\",\"isRequired\":\"1\",\"isInsert\":null,\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":null,\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":1,\"required\":true,\"list\":true,\"pk\":true,\"edit\":true,\"usableColumn\":false,\"insert\":false,\"superColumn\":false,\"query\":false,\"increment\":true,\"capJavaField\":\"FaceId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-10 02:50:44\",\"updateBy\":1,\"updateTime\":\"2024-04-10 09:57:11\",\"columnId\":\"1777771142614917132\",\"tableId\":\"1777771142614917130\",\"columnName\":\"user_id\",\"columnComment\":\"用户ID\",\"columnType\":\"bigint\",\"javaType\":\"Long\",\"javaField\":\"userId\",\"isPk\":\"0\",\"isIncrement\":\"0\",\"isRequired\":\"1\",\"isInsert\":\"1\",\"isEdit\":\"1\",\"isList\":\"1\",\"isQuery\":\"1\",\"queryType\":\"EQ\",\"htmlType\":\"input\",\"dictType\":\"\",\"sort\":2,\"required\":true,\"list\":true,\"pk\":false,\"edit\":true,\"usableColumn\":false,\"insert\":true,\"superColumn\":false,\"query\":true,\"increment\":false,\"capJavaField\":\"UserId\"},{\"createDept\":103,\"createBy\":1,\"createTime\":\"2024-04-10 02:53:30\",\"updateBy\":1,\"updateTime\":\"2024-04-10 09:57:11\",\"columnId\":\"1777771836143083521\",\"tableId\":\"1777771142614917130\",\"columnName\":\"face_data\",\"columnComment\":\"人脸数据', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 09:57:11', 13);
INSERT INTO `sys_oper_log` VALUES (1778013646299926530, '000000', '菜单管理', 3, 'org.dromara.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '急诊部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"code\":601,\"msg\":\"菜单已分配,不允许删除\",\"data\":null}', 0, '', '2024-04-10 18:54:22', 11);
INSERT INTO `sys_oper_log` VALUES (1778014326905442305, '000000', '菜单管理', 3, 'org.dromara.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '急诊部门', '/system/menu/114', '127.0.0.1', '内网IP', '{}', '{\"code\":601,\"msg\":\"菜单已分配,不允许删除\",\"data\":null}', 0, '', '2024-04-10 18:57:04', 1);
INSERT INTO `sys_oper_log` VALUES (1778014366570975234, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"menuId\":114,\"parentId\":3,\"menuName\":\"表单构建\",\"orderNum\":1,\"path\":\"build\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"build\",\"remark\":\"表单构建菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 18:57:14', 3);
INSERT INTO `sys_oper_log` VALUES (1778014375521619970, '000000', '菜单管理', 3, 'org.dromara.system.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '急诊部门', '/system/menu/114', '127.0.0.1', '内网IP', '{}', '{\"code\":601,\"msg\":\"菜单已分配,不允许删除\",\"data\":null}', 0, '', '2024-04-10 18:57:16', 2);
INSERT INTO `sys_oper_log` VALUES (1778014428457930753, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"menuId\":114,\"parentId\":3,\"menuName\":\"表单构建\",\"orderNum\":1,\"path\":\"build\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"1\",\"perms\":\"\",\"icon\":\"build\",\"remark\":\"表单构建菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 18:57:28', 4);
INSERT INTO `sys_oper_log` VALUES (1778014459957153793, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"menuId\":2,\"parentId\":0,\"menuName\":\"系统监控\",\"orderNum\":3,\"path\":\"monitor\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"monitor\",\"remark\":\"系统监控目录\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 18:57:36', 4);
INSERT INTO `sys_oper_log` VALUES (1778014473110491137, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"menuId\":6,\"parentId\":0,\"menuName\":\"租户管理\",\"orderNum\":2,\"path\":\"tenant\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"chart\",\"remark\":\"租户管理目录\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 18:57:39', 7);
INSERT INTO `sys_oper_log` VALUES (1778014948119613441, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"menuId\":3,\"parentId\":0,\"menuName\":\"系统工具\",\"orderNum\":4,\"path\":\"tool\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"tool\",\"remark\":\"系统工具目录\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 18:59:32', 4);
INSERT INTO `sys_oper_log` VALUES (1778015283856871425, '000000', '角色管理', 2, 'org.dromara.system.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/role', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:22:13\",\"updateBy\":null,\"updateTime\":null,\"roleId\":4,\"roleName\":\"患者\",\"roleKey\":\"patient\",\"roleSort\":4,\"dataScope\":\"5\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"remark\":null,\"menuIds\":[\"1777777207293317122\",\"1777773170351185922\",\"1777773170351185923\",\"1777773170351185924\",\"1777773170351185925\",\"1777773170351185926\",\"1777773170351185927\"],\"deptIds\":[],\"superAdmin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 19:00:52', 28);
INSERT INTO `sys_oper_log` VALUES (1778015411439210497, '000000', '角色管理', 2, 'org.dromara.system.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/role', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:22:13\",\"updateBy\":null,\"updateTime\":null,\"roleId\":3,\"roleName\":\"医生\",\"roleKey\":\"doctor\",\"roleSort\":3,\"dataScope\":\"4\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"remark\":null,\"menuIds\":[1,108,501,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,500,1040,1041,1042,1043,1044,1045],\"deptIds\":[],\"superAdmin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 19:01:23', 12);
INSERT INTO `sys_oper_log` VALUES (1778015585905479682, '000000', '角色管理', 2, 'org.dromara.system.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/role', '127.0.0.1', '内网IP', '{\"createDept\":null,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"roleId\":2,\"roleName\":\"主任\",\"roleKey\":\"director\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"remark\":\"普通角色\",\"menuIds\":[1,2,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,1050,123,1061,1062,1063,1064,1065,109,1046,1047,1048,113,3,114,115,1055,1056,1058,1057,1059,1060],\"deptIds\":[],\"superAdmin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 19:02:04', 12);
INSERT INTO `sys_oper_log` VALUES (1778015630948110338, '000000', '通知公告', 3, 'org.dromara.system.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '急诊部门', '/system/notice/1,2', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 19:02:15', 5);
INSERT INTO `sys_oper_log` VALUES (1778015729455534081, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"menuId\":123,\"parentId\":1,\"menuName\":\"客户端管理\",\"orderNum\":11,\"path\":\"client\",\"component\":\"system/client/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"system:client:list\",\"icon\":\"international\",\"remark\":\"客户端管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 19:02:38', 4);
INSERT INTO `sys_oper_log` VALUES (1778015744383062017, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"menuId\":118,\"parentId\":1,\"menuName\":\"文件管理\",\"orderNum\":10,\"path\":\"oss\",\"component\":\"system/oss/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"system:oss:list\",\"icon\":\"upload\",\"remark\":\"文件管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 19:02:42', 4);
INSERT INTO `sys_oper_log` VALUES (1778015800968417282, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"menuId\":104,\"parentId\":1,\"menuName\":\"岗位管理\",\"orderNum\":5,\"path\":\"post\",\"component\":\"system/post/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"system:post:list\",\"icon\":\"post\",\"remark\":\"岗位管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 19:02:56', 4);
INSERT INTO `sys_oper_log` VALUES (1778016806338891778, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"menuId\":102,\"parentId\":1,\"menuName\":\"菜单管理\",\"orderNum\":3,\"path\":\"menu\",\"component\":\"system/menu/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"system:menu:list\",\"icon\":\"tree-table\",\"remark\":\"菜单管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 19:06:55', 3);
INSERT INTO `sys_oper_log` VALUES (1778016842707701762, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"menuId\":108,\"parentId\":1,\"menuName\":\"日志管理\",\"orderNum\":9,\"path\":\"log\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"M\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"log\",\"remark\":\"日志管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 19:07:04', 3);
INSERT INTO `sys_oper_log` VALUES (1778016857786224641, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"menuId\":118,\"parentId\":1,\"menuName\":\"文件管理\",\"orderNum\":10,\"path\":\"oss\",\"component\":\"system/oss/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"system:oss:list\",\"icon\":\"upload\",\"remark\":\"文件管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 19:07:08', 6);
INSERT INTO `sys_oper_log` VALUES (1778016870809538562, '000000', '菜单管理', 2, 'org.dromara.system.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '急诊部门', '/system/menu', '127.0.0.1', '内网IP', '{\"createDept\":103,\"createBy\":null,\"createTime\":\"2024-04-10 00:21:52\",\"updateBy\":null,\"updateTime\":null,\"menuId\":123,\"parentId\":1,\"menuName\":\"客户端管理\",\"orderNum\":11,\"path\":\"client\",\"component\":\"system/client/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"1\",\"status\":\"0\",\"perms\":\"system:client:list\",\"icon\":\"international\",\"remark\":\"客户端管理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2024-04-10 19:07:11', 4);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint NOT NULL COMMENT '对象存储主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'URL地址',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '上传人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `service` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'OSS对象存储表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES (1777876391648366594, '000000', '2024/04/10/1660873c7a014ef3a6471f19842a98b4.jpg', 'b_f96b2acf068279ced213ba2e145063ad.jpg', '.jpg', 'http://127.0.0.1:9000/face-reco/2024/04/10/1660873c7a014ef3a6471f19842a98b4.jpg', 103, '2024-04-10 09:48:58', 1, '2024-04-10 09:48:58', 1, 'minio');
INSERT INTO `sys_oss` VALUES (1777877216969953282, '000000', '2024/04/10/2889680c89a34aecb14def4c44715407.jpg', 'Cache_-33237f5a0e17403a..jpg', '.jpg', 'http://127.0.0.1:9000/face-reco/2024/04/10/2889680c89a34aecb14def4c44715407.jpg', 103, '2024-04-10 09:52:15', 1, '2024-04-10 09:52:15', 1, 'minio');

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config`  (
  `oss_config_id` bigint NOT NULL COMMENT '主建',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `config_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '域',
  `access_policy` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否默认（0=是,1=否）',
  `ext1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '对象存储配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
INSERT INTO `sys_oss_config` VALUES (1, '000000', 'minio', 'r6QX7FIlN8T8EfI5rSVf', '1CJilMUvw3XSzag788fv7JI9ebFMEPhNOY1J9zND', 'face-reco', '', '127.0.0.1:9000', '', 'N', '', '1', '0', '', 103, 1, '2024-04-10 00:21:53', 1, '2024-04-10 09:48:53', '');
INSERT INTO `sys_oss_config` VALUES (2, '000000', 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '1', '', 103, 1, '2024-04-10 00:21:53', 1, '2024-04-10 00:21:53', NULL);
INSERT INTO `sys_oss_config` VALUES (3, '000000', 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '1', '', 103, 1, '2024-04-10 00:21:53', 1, '2024-04-10 00:21:53', NULL);
INSERT INTO `sys_oss_config` VALUES (4, '000000', 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'ruoyi-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '1', '', 103, 1, '2024-04-10 00:21:53', 1, '2024-04-10 00:21:53', NULL);
INSERT INTO `sys_oss_config` VALUES (5, '000000', 'image', 'ruoyi', 'ruoyi123', 'ruoyi', 'image', '127.0.0.1:9000', '', 'N', '', '1', '1', '', 103, 1, '2024-04-10 00:21:53', 1, '2024-04-10 03:22:45', NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, '000000', 'ceo', '董事长', 1, '0', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (2, '000000', 'se', '项目经理', 2, '0', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (3, '000000', 'hr', '人力资源', 3, '0', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');
INSERT INTO `sys_post` VALUES (4, '000000', 'user', '普通员工', 4, '0', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '000000', '超级管理员', 'superadmin', 1, '1', 1, 1, '0', '0', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '000000', '主任', 'director', 2, '2', 1, 1, '0', '0', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 19:02:04', '普通角色');
INSERT INTO `sys_role` VALUES (3, '000000', '医生', 'doctor', 3, '4', 1, 1, '0', '0', 103, 1, '2024-04-10 00:22:13', 1, '2024-04-10 19:01:23', NULL);
INSERT INTO `sys_role` VALUES (4, '000000', '患者', 'patient', 4, '5', 1, 1, '0', '0', 103, 1, '2024-04-10 00:22:13', 1, '2024-04-10 19:00:52', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 123);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (2, 1062);
INSERT INTO `sys_role_menu` VALUES (2, 1063);
INSERT INTO `sys_role_menu` VALUES (2, 1064);
INSERT INTO `sys_role_menu` VALUES (2, 1065);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 101);
INSERT INTO `sys_role_menu` VALUES (3, 102);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 104);
INSERT INTO `sys_role_menu` VALUES (3, 105);
INSERT INTO `sys_role_menu` VALUES (3, 106);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 108);
INSERT INTO `sys_role_menu` VALUES (3, 500);
INSERT INTO `sys_role_menu` VALUES (3, 501);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1007);
INSERT INTO `sys_role_menu` VALUES (3, 1008);
INSERT INTO `sys_role_menu` VALUES (3, 1009);
INSERT INTO `sys_role_menu` VALUES (3, 1010);
INSERT INTO `sys_role_menu` VALUES (3, 1011);
INSERT INTO `sys_role_menu` VALUES (3, 1012);
INSERT INTO `sys_role_menu` VALUES (3, 1013);
INSERT INTO `sys_role_menu` VALUES (3, 1014);
INSERT INTO `sys_role_menu` VALUES (3, 1015);
INSERT INTO `sys_role_menu` VALUES (3, 1016);
INSERT INTO `sys_role_menu` VALUES (3, 1017);
INSERT INTO `sys_role_menu` VALUES (3, 1018);
INSERT INTO `sys_role_menu` VALUES (3, 1019);
INSERT INTO `sys_role_menu` VALUES (3, 1020);
INSERT INTO `sys_role_menu` VALUES (3, 1021);
INSERT INTO `sys_role_menu` VALUES (3, 1022);
INSERT INTO `sys_role_menu` VALUES (3, 1023);
INSERT INTO `sys_role_menu` VALUES (3, 1024);
INSERT INTO `sys_role_menu` VALUES (3, 1025);
INSERT INTO `sys_role_menu` VALUES (3, 1026);
INSERT INTO `sys_role_menu` VALUES (3, 1027);
INSERT INTO `sys_role_menu` VALUES (3, 1028);
INSERT INTO `sys_role_menu` VALUES (3, 1029);
INSERT INTO `sys_role_menu` VALUES (3, 1030);
INSERT INTO `sys_role_menu` VALUES (3, 1031);
INSERT INTO `sys_role_menu` VALUES (3, 1032);
INSERT INTO `sys_role_menu` VALUES (3, 1033);
INSERT INTO `sys_role_menu` VALUES (3, 1034);
INSERT INTO `sys_role_menu` VALUES (3, 1035);
INSERT INTO `sys_role_menu` VALUES (3, 1036);
INSERT INTO `sys_role_menu` VALUES (3, 1037);
INSERT INTO `sys_role_menu` VALUES (3, 1038);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1041);
INSERT INTO `sys_role_menu` VALUES (3, 1042);
INSERT INTO `sys_role_menu` VALUES (3, 1043);
INSERT INTO `sys_role_menu` VALUES (3, 1044);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (4, 1777773170351185922);
INSERT INTO `sys_role_menu` VALUES (4, 1777773170351185923);
INSERT INTO `sys_role_menu` VALUES (4, 1777773170351185924);
INSERT INTO `sys_role_menu` VALUES (4, 1777773170351185925);
INSERT INTO `sys_role_menu` VALUES (4, 1777773170351185926);
INSERT INTO `sys_role_menu` VALUES (4, 1777773170351185927);
INSERT INTO `sys_role_menu` VALUES (4, 1777777207293317122);

-- ----------------------------
-- Table structure for sys_social
-- ----------------------------
DROP TABLE IF EXISTS `sys_social`;
CREATE TABLE `sys_social`  (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `auth_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '平台+平台唯一id',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户来源',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '平台编号唯一id',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户的授权令牌',
  `expire_in` int NULL DEFAULT NULL COMMENT '用户的授权令牌的有效期，部分平台可能没有',
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '刷新令牌，部分平台可能没有',
  `access_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '平台的授权信息，部分平台可能没有',
  `union_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户的 unionid',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授予的权限，部分平台可能没有',
  `token_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个别平台的授权信息，部分平台可能没有',
  `id_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'id token，部分平台可能没有',
  `mac_algorithm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `mac_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小米平台用户的附带属性，部分平台可能没有',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户的授权code，部分平台可能没有',
  `oauth_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `oauth_token_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Twitter平台用户的附带属性，部分平台可能没有',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '社会化关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_social
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户编号',
  `contact_user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `company_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业名称',
  `license_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `intro` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业简介',
  `domain` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '域名',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `package_id` bigint NULL DEFAULT NULL COMMENT '租户套餐编号',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `account_count` int NULL DEFAULT -1 COMMENT '用户数量（-1不限制）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '租户状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '租户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (1, '000000', '管理组', '15888888888', 'XXX有限公司', NULL, NULL, '多租户通用后台管理管理系统', NULL, NULL, NULL, NULL, -1, '0', '0', 103, 1, '2024-04-10 00:21:52', NULL, NULL);

-- ----------------------------
-- Table structure for sys_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant_package`;
CREATE TABLE `sys_tenant_package`  (
  `package_id` bigint NOT NULL COMMENT '租户套餐id',
  `package_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `menu_ids` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联菜单id',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`package_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '租户套餐表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tenant_package
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` bigint NULL DEFAULT NULL COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '000000', 103, 'admin', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@163.com', '15888888888', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-04-10 18:53:48', 103, 1, '2024-04-10 00:21:52', 1, '2024-04-10 18:53:48', '管理员');
INSERT INTO `sys_user` VALUES (2, '000000', 105, 'lionli', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@qq.com', '15666666666', '1', NULL, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-04-10 00:21:52', 103, 1, '2024-04-10 00:21:52', NULL, NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, '000000', 108, 'test', '本部门及以下 密码666666', 'sys_user', '', '', '0', NULL, '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '0', '127.0.0.1', '2024-04-10 00:22:13', 103, 1, '2024-04-10 00:22:13', 3, '2024-04-10 00:22:13', NULL);
INSERT INTO `sys_user` VALUES (4, '000000', 102, 'test1', '仅本人 密码666666', 'sys_user', '', '', '0', NULL, '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '0', '127.0.0.1', '2024-04-10 00:22:13', 103, 1, '2024-04-10 00:22:13', 4, '2024-04-10 00:22:13', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (4, 4);

-- ----------------------------
-- Table structure for test_demo
-- ----------------------------
DROP TABLE IF EXISTS `test_demo`;
CREATE TABLE `test_demo`  (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `order_num` int NULL DEFAULT 0 COMMENT '排序号',
  `test_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '值',
  `version` int NULL DEFAULT 0 COMMENT '版本',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '测试单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_demo
-- ----------------------------
INSERT INTO `test_demo` VALUES (1, '000000', 102, 4, 1, '测试数据权限', '测试', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (2, '000000', 102, 3, 2, '子节点1', '111', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (3, '000000', 102, 3, 3, '子节点2', '222', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (4, '000000', 108, 4, 4, '测试数据', 'demo', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (5, '000000', 108, 3, 13, '子节点11', '1111', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (6, '000000', 108, 3, 12, '子节点22', '2222', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (7, '000000', 108, 3, 11, '子节点33', '3333', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (8, '000000', 108, 3, 10, '子节点44', '4444', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (9, '000000', 108, 3, 9, '子节点55', '5555', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (10, '000000', 108, 3, 8, '子节点66', '6666', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (11, '000000', 108, 3, 7, '子节点77', '7777', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (12, '000000', 108, 3, 6, '子节点88', '8888', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (13, '000000', 108, 3, 5, '子节点99', '9999', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree`  (
  `id` bigint NOT NULL COMMENT '主键',
  `tenant_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '000000' COMMENT '租户编号',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父id',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `tree_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '值',
  `version` int NULL DEFAULT 0 COMMENT '版本',
  `create_dept` bigint NULL DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '测试树表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_tree
-- ----------------------------
INSERT INTO `test_tree` VALUES (1, '000000', 0, 102, 4, '测试数据权限', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (2, '000000', 1, 102, 3, '子节点1', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (3, '000000', 2, 102, 3, '子节点2', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (4, '000000', 0, 108, 4, '测试树1', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (5, '000000', 4, 108, 3, '子节点11', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (6, '000000', 4, 108, 3, '子节点22', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (7, '000000', 4, 108, 3, '子节点33', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (8, '000000', 5, 108, 3, '子节点44', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (9, '000000', 6, 108, 3, '子节点55', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (10, '000000', 7, 108, 3, '子节点66', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (11, '000000', 7, 108, 3, '子节点77', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (12, '000000', 10, 108, 3, '子节点88', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (13, '000000', 10, 108, 3, '子节点99', 0, 103, '2024-04-10 00:22:13', 1, NULL, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
