-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: code-generator
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `d_code_generator_params`
--

DROP TABLE IF EXISTS `d_code_generator_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_code_generator_params` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `title` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标题',
  `package_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '包名',
  `module_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '模块名',
  `author` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '作者',
  `is_remove_prefix` tinyint(1) DEFAULT NULL COMMENT '是否去表前缀',
  `api` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '前端接口片段',
  `java_project_address` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '后端项目地址',
  `vue_project_address` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '前端项目地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '修改人',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '删除人',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `version` int DEFAULT '0' COMMENT '乐观锁',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_code_generator_params`
--

LOCK TABLES `d_code_generator_params` WRITE;
/*!40000 ALTER TABLE `d_code_generator_params` DISABLE KEYS */;
INSERT INTO `d_code_generator_params` VALUES ('7ffcc0a88713c270a1a0d7c503a0fd1a','参数模板1','cn.liulingfengyu','demo','LLFY',1,'api','F:/code/java','F:/code/vue','2024-10-18 11:07:28','7249c37da6e348b58d22f6fa601f38dc','2024-11-01 00:43:33','7249c37da6e348b58d22f6fa601f38dc',NULL,NULL,0,7,'40c4ffc082d942fe96c67d4b7c6a8890');
/*!40000 ALTER TABLE `d_code_generator_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_database_connection`
--

DROP TABLE IF EXISTS `d_database_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_database_connection` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `title` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标题',
  `url` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地址',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码',
  `remark` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '修改人',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '删除人',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '删除状态',
  `version` int DEFAULT '0' COMMENT '乐观锁',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `d_database_connection_id_index` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='数据库连接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_database_connection`
--

LOCK TABLES `d_database_connection` WRITE;
/*!40000 ALTER TABLE `d_database_connection` DISABLE KEYS */;
INSERT INTO `d_database_connection` VALUES ('8b2721600b8ff826159b85561f8ad534','数据库连接1','jdbc:mysql://127.0.0.1:3306','root','1q@w3e4r','测试数据库','2024-10-12 15:29:30','7249c37da6e348b58d22f6fa601f38dc','2024-10-31 20:44:54','7249c37da6e348b58d22f6fa601f38dc',NULL,NULL,0,2,'40c4ffc082d942fe96c67d4b7c6a8890');
/*!40000 ALTER TABLE `d_database_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_table_info`
--

DROP TABLE IF EXISTS `d_table_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_table_info` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `database_connection_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '数据库连接id',
  `database_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '数据库名称',
  `table_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表名称',
  `column_name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '字段称',
  `column_comment` varchar(90) DEFAULT NULL COMMENT '字段描述',
  `is_primary_key` tinyint(1) DEFAULT '0' COMMENT '是否是主键',
  `is_autofill` tinyint(1) DEFAULT '0' COMMENT '是否自动填充',
  `autofill_rule` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '自动填充规则 INSERT；INSERT_UPDATE；UPDATE',
  `is_logic_delete` tinyint(1) DEFAULT '0' COMMENT '是否逻辑删除',
  `is_version` tinyint(1) DEFAULT '0' COMMENT '是否乐观锁',
  `is_show` tinyint(1) DEFAULT '0' COMMENT '是否展示',
  `is_condition` tinyint(1) DEFAULT '0' COMMENT '是否作为条件',
  `is_fuzzy_query` tinyint(1) DEFAULT '0' COMMENT '是否模糊查询',
  `is_add_param` tinyint(1) DEFAULT '0' COMMENT '是否作为新增参数',
  `is_update_param` tinyint(1) DEFAULT '0' COMMENT '是否作为修改参数',
  `ui_type` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'UI类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '修改人',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '删除人',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `version` int DEFAULT '0' COMMENT '乐观锁',
  `tenant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='代码生成属性信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_table_info`
--

LOCK TABLES `d_table_info` WRITE;
/*!40000 ALTER TABLE `d_table_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `d_table_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-20 16:04:38
