/*
 Navicat Premium Dump SQL

 Source Server         : mysql@154.8.144.189
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : 154.8.144.189:13306
 Source Schema         : code-generator

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 30/09/2025 15:33:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for d_code_generator_params
-- ----------------------------
DROP TABLE IF EXISTS `d_code_generator_params`;
CREATE TABLE `d_code_generator_params`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `title` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `package_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '包名',
  `module_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块名',
  `module_cn_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块中文名',
  `author` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `is_remove_prefix` tinyint(1) NULL DEFAULT NULL COMMENT '是否去表前缀',
  `api` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前端接口片段',
  `java_project_address` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '后端项目地址',
  `vue_project_address` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前端项目地址',
  `module_icon` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块图标',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `delete_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除人',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `version` int NULL DEFAULT 0 COMMENT '乐观锁',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成参数' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for d_database_connection
-- ----------------------------
DROP TABLE IF EXISTS `d_database_connection`;
CREATE TABLE `d_database_connection`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `title` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `url` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `remark` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `delete_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除人',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '删除状态',
  `version` int NULL DEFAULT 0 COMMENT '乐观锁',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `d_database_connection_id_index`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据库连接' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for d_table_info
-- ----------------------------
DROP TABLE IF EXISTS `d_table_info`;
CREATE TABLE `d_table_info`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `is_generate_tree_select` tinyint(1) NULL DEFAULT NULL COMMENT '是否生成树结构查询接口',
  `is_generate_menu` tinyint(1) NULL DEFAULT NULL COMMENT '是否生成菜单',
  `is_cache` tinyint(1) NULL DEFAULT NULL COMMENT '是否开启缓存',
  `cache_key` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缓存key字段',
  `cache_value` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缓存value字段',
  `database_connection_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据库连接id',
  `database_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `table_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表名称',
  `table_icon` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页面图标',
  `column_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段称',
  `column_comment` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字段描述',
  `is_primary_key` tinyint(1) NULL DEFAULT 0 COMMENT '是否是主键',
  `is_autofill` tinyint(1) NULL DEFAULT 0 COMMENT '是否自动填充',
  `autofill_rule` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '自动填充规则 INSERT；INSERT_UPDATE；UPDATE',
  `is_logic_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否逻辑删除',
  `is_version` tinyint(1) NULL DEFAULT 0 COMMENT '是否乐观锁',
  `is_show` tinyint(1) NULL DEFAULT 0 COMMENT '是否展示',
  `is_show_details` tinyint(1) NULL DEFAULT NULL COMMENT '是否在详情中展示',
  `is_condition` tinyint(1) NULL DEFAULT 0 COMMENT '是否作为条件',
  `is_fuzzy_query` tinyint(1) NULL DEFAULT 0 COMMENT '是否模糊查询',
  `is_add_param` tinyint(1) NULL DEFAULT 0 COMMENT '是否作为新增参数',
  `is_update_param` tinyint(1) NULL DEFAULT 0 COMMENT '是否作为修改参数',
  `is_required_field` tinyint(1) NULL DEFAULT NULL COMMENT '是否必填',
  `ui_type` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'UI类型',
  `dict_group` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典分组',
  `is_show_dict` tinyint(1) NULL DEFAULT 0 COMMENT '是否展示字典数据',
  `associated_database` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联数据库',
  `associated_table` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联表',
  `dropdown_key` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '下拉Key字段',
  `dropdown_value` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '下拉Value字段',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改人',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `delete_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '删除人',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `version` int NULL DEFAULT 0 COMMENT '乐观锁',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成属性信息' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
