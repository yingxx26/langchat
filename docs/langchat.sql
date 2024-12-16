/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : langchat

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 16/12/2024 22:15:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aigc_app
-- ----------------------------
DROP TABLE IF EXISTS `aigc_app`;
CREATE TABLE `aigc_app`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `model_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联模型',
  `knowledge_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联知识库',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `prompt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '提示词',
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `save_time` datetime(0) NULL DEFAULT NULL COMMENT '保存时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '提示词表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aigc_app
-- ----------------------------
INSERT INTO `aigc_app` VALUES ('076af303d64b60acbf6af8bf774ed005', 'c725fc2285298a04efa33ebe3faf5b79', '[\"25c07e67362e6a9272ae9dd80f2fd9fb\"]', NULL, 'yxxtest', '用中文回答问题', NULL, '2024-11-20 11:50:02', '2024-11-20 10:52:02');
INSERT INTO `aigc_app` VALUES ('a2165bbcb875ec552e58f2f7e183cb38', 'c725fc2285298a04efa33ebe3faf5b79', '[\"6f45a7a12dab9254434b41128ef97cf1\"]', NULL, 'yxx', '用中文问答问题', NULL, '2024-11-20 11:51:15', '2024-11-19 21:08:22');
INSERT INTO `aigc_app` VALUES ('e16a582b47d3041cf14074d5451dff7a', '0c21c2f8ebd3aa3757ef1bae81154cc4', '[\"393704ac13f67fde5da674ddd0742b03\"]', 'http://cdn.tycoding.cn/tycoding.jpg', 'LangChat官方应用', '你是一个专业的文档分析师，你擅长从文档中提取关键内容并总结分析含义，下面你需要根据用户的问题做出解答。\n\n## 限制\n不要回答和文档无关的内容', '快速解答LangChat项目相关的内容，LangChat官方助手', '2024-11-20 11:50:48', '2024-08-04 17:49:24');

-- ----------------------------
-- Table structure for aigc_app_api
-- ----------------------------
DROP TABLE IF EXISTS `aigc_app_api`;
CREATE TABLE `aigc_app_api`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `app_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '应用ID',
  `api_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Key',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '应用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for aigc_conversation
-- ----------------------------
DROP TABLE IF EXISTS `aigc_conversation`;
CREATE TABLE `aigc_conversation`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户ID',
  `prompt_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '提示词ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '对话窗口表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for aigc_docs
-- ----------------------------
DROP TABLE IF EXISTS `aigc_docs`;
CREATE TABLE `aigc_docs`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `knowledge_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '知识库ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `origin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容或链接',
  `size` int(0) NULL DEFAULT NULL COMMENT '文件大小',
  `slice_num` int(0) NULL DEFAULT NULL COMMENT '切片数量',
  `slice_status` tinyint(1) NULL DEFAULT NULL COMMENT '切片状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文档表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aigc_docs
-- ----------------------------
INSERT INTO `aigc_docs` VALUES ('129b09e0787fb298bdbc5e268f824038', '25c07e67362e6a9272ae9dd80f2fd9fb', '新建文本文档 (3).txt', 'UPLOAD', 'http://127.0.0.1:8100/langchat/20241120673d4e999d948448ce23f558.txt', NULL, NULL, 188, 1, 1, '2024-11-20 10:51:06');
INSERT INTO `aigc_docs` VALUES ('51ae6d7356eec12b30dceb7975846c4e', '393704ac13f67fde5da674ddd0742b03', 'story-about-happy-carrot.pdf', 'UPLOAD', NULL, NULL, NULL, 35359, NULL, 0, '2024-08-08 17:02:41');
INSERT INTO `aigc_docs` VALUES ('8933fc0e6b449a153adc1789a4e1781c', '393704ac13f67fde5da674ddd0742b03', 'guide1', 'INPUT', NULL, NULL, 'LangChat 是一个基于Java生态的企业AI知识库和大模型应用解决方案，帮助企业快速搭建AI大模型应用。 同时，LangChat也集成了RBAC权限体系，为企业提供开箱即用的AI大模型产品解决方案。\n\nLangChat 使用Java生态，前后端分离，并采用最新的技术栈开发。后端基于SpringBoot3，前端基于Vue3。 LangChat不仅为企业提供AI领域的产品解决方案，也是一个完整的Java企业级应用案例。这个系统带你全面了解SpringBoot3和Vue3的前后端开发流程、业务模块化，以及AI应用集成方案。 无论是企业开发，还是个人学习，LangChat都为你提供丰富的学习案例', NULL, 1, 1, '2024-08-04 18:18:46');
INSERT INTO `aigc_docs` VALUES ('c49454bc777e3846f769813fa5fa2761', '6f45a7a12dab9254434b41128ef97cf1', '新建文本文档 (3).txt', 'UPLOAD', 'http://127.0.0.1:8100/langchat/20241119673c8c759d945395cfd84bbc.txt', NULL, NULL, 188, 1, 1, '2024-11-19 21:02:46');
INSERT INTO `aigc_docs` VALUES ('ec0c960461a615bb7c7648d7ee5801b5', '393704ac13f67fde5da674ddd0742b03', 'story-about-happy-carrot.pdf', 'UPLOAD', 'http://127.0.0.1/langchat/2024080866b4b069cdb262aeea8da409.pdf', NULL, NULL, 35359, 37, 1, '2024-08-08 19:47:54');
INSERT INTO `aigc_docs` VALUES ('f4a465ea6bfc25c34707f1e132356192', '393704ac13f67fde5da674ddd0742b03', 'story-about-happy-carrot.pdf', 'UPLOAD', NULL, NULL, NULL, 35359, NULL, 0, '2024-08-06 22:57:32');

-- ----------------------------
-- Table structure for aigc_docs_slice
-- ----------------------------
DROP TABLE IF EXISTS `aigc_docs_slice`;
CREATE TABLE `aigc_docs_slice`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `vector_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '向量库的ID',
  `docs_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文档ID',
  `knowledge_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '知识库ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文档名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '切片内容',
  `word_num` int(0) NULL DEFAULT NULL COMMENT '字符数',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文档切片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aigc_docs_slice
-- ----------------------------
INSERT INTO `aigc_docs_slice` VALUES ('29552f5f3f1f74ec96568bd69d2edf06', 'b6441062-9a7e-4bff-8776-a959044f6f08', 'c49454bc777e3846f769813fa5fa2761', '6f45a7a12dab9254434b41128ef97cf1', '新建文本文档 (3).txt', '我叫应学欣，缜云监狱坐落在华夏国西南边境，这个监狱的名字或许不是那么如雷贯耳，但这个监狱的重量，却丝毫不弱于京城的秦城监狱。', 62, 1, '2024-11-19 21:02:49');
INSERT INTO `aigc_docs_slice` VALUES ('e8c6f455a2d3386e0b25cf1708e4beab', '6489d18c-9504-4ecc-99c5-755829c30882', '129b09e0787fb298bdbc5e268f824038', '25c07e67362e6a9272ae9dd80f2fd9fb', '新建文本文档 (3).txt', '我叫应学欣，缜云监狱坐落在华夏国西南边境，这个监狱的名字或许不是那么如雷贯耳，但这个监狱的重量，却丝毫不弱于京城的秦城监狱。', 62, 1, '2024-11-20 10:51:12');

-- ----------------------------
-- Table structure for aigc_embed_store
-- ----------------------------
DROP TABLE IF EXISTS `aigc_embed_store`;
CREATE TABLE `aigc_embed_store`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `port` int(0) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `database_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dimension` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aigc_embed_store
-- ----------------------------
INSERT INTO `aigc_embed_store` VALUES ('1', 'aitest', 'milvus', '192.168.3.10', 19530, 'root', '123456', 'aitest', 'aitestCollection', 128);

-- ----------------------------
-- Table structure for aigc_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `aigc_knowledge`;
CREATE TABLE `aigc_knowledge`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '知识库名称',
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `create_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建时间',
  `embed_store_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `embed_model_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '知识库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aigc_knowledge
-- ----------------------------
INSERT INTO `aigc_knowledge` VALUES ('25c07e67362e6a9272ae9dd80f2fd9fb', 'yxxtext', 'aa', NULL, '1732071044499', '1', 'e920affc2f0a1c8b28e4ad0a789ad090');
INSERT INTO `aigc_knowledge` VALUES ('393704ac13f67fde5da674ddd0742b03', 'LangChat文档', 'LangChat官方文档', NULL, '1722766331165', NULL, NULL);
INSERT INTO `aigc_knowledge` VALUES ('6f45a7a12dab9254434b41128ef97cf1', 'yxx知识库', 'test', NULL, '1731930963650', '1', 'e920affc2f0a1c8b28e4ad0a789ad090');

-- ----------------------------
-- Table structure for aigc_message
-- ----------------------------
DROP TABLE IF EXISTS `aigc_message`;
CREATE TABLE `aigc_message`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户ID',
  `conversation_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会话ID',
  `chat_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息的ID',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `role` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色，user和assistant',
  `model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型名称',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '消息内容',
  `tokens` int(0) NULL DEFAULT NULL,
  `prompt_tokens` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `conversation_id`(`conversation_id`) USING BTREE,
  INDEX `role`(`role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '对话消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aigc_message
-- ----------------------------
INSERT INTO `aigc_message` VALUES ('051b5528d163bc2ed7523962f6953394', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', '5c0c0ac6-9175-4b14-9a96-41cf44855115', 'administrator', 'unknown', 'user', NULL, '我叫什么名字', 0, 0, '2024-11-18 22:08:36');
INSERT INTO `aigc_message` VALUES ('0c0d970019df785e796b0f6ca69fb0c6', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', '59bd5b8a-1451-4ce2-acff-3967cada3fbf', 'administrator', 'unknown', 'user', NULL, '通风管', 0, 0, '2024-11-05 20:52:31');
INSERT INTO `aigc_message` VALUES ('148ce5b1ea45b93f384481f4540f4df8', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', 'a3166475-38d2-4f41-b1a7-d7e36a4052e2', 'administrator', 'unknown', 'user', NULL, '可以用汉语对话么', 0, 0, '2024-11-05 20:54:50');
INSERT INTO `aigc_message` VALUES ('29d5513a338de85d306613d0ae39a1b4', '91b4524a46a949601e7f3b004ed76034', 'c722140565ec405080961c1e3843026b', '43738a33-4de0-4883-9a39-5599e473af29', 'administrator', 'unknown', 'assistant', NULL, '  What is your name?\n\n你叫什么名字？\n\nAnswer:\n我叫应学欣。', 21, 53, '2024-11-20 11:51:21');
INSERT INTO `aigc_message` VALUES ('2c1ba854fa8361293bb0aafb085bfa79', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', '5f5feeb6-d303-46d7-b036-3be3edb00bfc', 'administrator', 'unknown', 'user', NULL, '我叫什么', 0, 0, '2024-11-19 21:08:44');
INSERT INTO `aigc_message` VALUES ('5b53fa0f6351d5eb159e31eb309bbea8', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', '3b3aba18-0e56-4905-b80b-5942cd83eaa5', 'administrator', 'unknown', 'assistant', NULL, '  Oh, my apologies! I didn\'t catch your name. Can you please tell me your name again?', 23, 641, '2024-11-19 21:06:42');
INSERT INTO `aigc_message` VALUES ('5d40a5bf5e8c5cd9c9a0874353afddb5', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', '72dc960c-c182-490d-ab40-a25984401d43', 'administrator', 'unknown', 'user', NULL, '大', 0, 0, '2024-11-19 21:46:22');
INSERT INTO `aigc_message` VALUES ('6477dc92e293055eee3aabf34f090681', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', '7d89050f-d3a4-4f25-8eda-64f16985c17d', 'administrator', 'unknown', 'user', NULL, '用汉语和我对话', 0, 0, '2024-11-05 20:55:27');
INSERT INTO `aigc_message` VALUES ('7b370c0e0b61d12805ed8b032fa5a796', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', 'c6cd778f-9913-44ea-a01a-03ce171b0e80', 'administrator', 'unknown', 'user', NULL, '131', 0, 0, '2024-11-04 11:32:59');
INSERT INTO `aigc_message` VALUES ('8a5d5f41a49a56ae94b2b47a7e129e5b', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', '5c0c0ac6-9175-4b14-9a96-41cf44855115', 'administrator', 'unknown', 'assistant', NULL, '  Sorry, I didn\'t catch your name. Can you tell me again?', 17, 622, '2024-11-18 22:08:38');
INSERT INTO `aigc_message` VALUES ('8c65941bdff092cbcc3a85e5b29efd3a', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', 'e6b10708-9389-48f1-966c-3308aac57396', 'administrator', 'unknown', 'assistant', NULL, '  Hi! I\'m 小明 (Xiǎo Míng). Nice to meet you!', 19, 601, '2024-11-05 20:55:56');
INSERT INTO `aigc_message` VALUES ('8d5b0ca1c08598e4206d67be5b3dad72', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', 'e6b10708-9389-48f1-966c-3308aac57396', 'administrator', 'unknown', 'user', NULL, '你好 我叫应先生，你叫什么', 0, 0, '2024-11-05 20:55:54');
INSERT INTO `aigc_message` VALUES ('a198fc0faca9e91e9a279f0f27411bef', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', 'a3166475-38d2-4f41-b1a7-d7e36a4052e2', 'administrator', 'unknown', 'assistant', NULL, '  Sure! Here\'s a possible conversation in Mandarin Chinese:\n\nA: 你好！今天天气很好，right？\nB: 是的，真的很好。我喜欢这种气候。\nA: 我也是。可以出去散步，很舒服。\nB: 对，我也喜欢出去散步。可以感受到大自然的美丽。\nA: 是的，很有吸引力。我喜欢在这种气候下读书或者做些小作品。\nB: 我也是。我喜欢在这种气候下做些家务工作，比如做饭或者洗衣服。\nA: 哈哈，我也喜欢做些家务工作。但是我觉得在这种气候下，我更喜欢放松一下，不做什么事情。\nB: 哈哈，我也有时候喜欢放松一下。可以感受到生活的美好。\n\nHere\'s a possible translation in English:\n\nA: Hi! The weather is great today, isn\'t it?\nB: Yes, it\'s really nice. I like this kind of weather.\nA: Me too. It\'s comfortable to go out for a walk.\nB: Yeah, I also like going out for a walk. I can feel the beauty of nature.\nA: Yeah, it\'s very attractive. I like to read a book or do some small work in this kind of weather.\nB: Me too. I like to do some housework, like cooking or laundry, in this kind of weather.\nA: Haha, I also like to do some housework. But I feel like in this kind of weather, I prefer to relax and do nothing.', 311, 168, '2024-11-05 20:55:20');
INSERT INTO `aigc_message` VALUES ('b72be1d840b5c93dcb1d54c9f3ebe6ab', '91b4524a46a949601e7f3b004ed76034', 'f05051978864468da433286e92c24fcc', 'd366128b-d481-44d5-a21b-c71998ac3579', 'administrator', 'unknown', 'assistant', NULL, '  My name is Ying Xueyan, and I am imprisoned in a certain prison located in the southwestern border of the Great Xia Empire. While the name of this prison may not be as famous as the Qin Castle Prison in the capital city, its weight and importance are by no means any less.', 59, 52, '2024-11-20 11:49:52');
INSERT INTO `aigc_message` VALUES ('be303bfe43487ad618b6e44c3b497deb', '91b4524a46a949601e7f3b004ed76034', '9a10bf9c9ac14738a59223a3dda8d4ad', 'c365ed43-7164-4fae-9b48-0bcdc6729238', 'administrator', 'unknown', 'assistant', NULL, '  My name is Ying Xueqin, and I am imprisoned in a certain prison located in the southwestern border of the Great Xia Empire. While the name of this prison may not be as famous as the Qin Castle Prison in the capital city, its weight and importance are by no means any less.', 59, 51, '2024-11-20 11:49:25');
INSERT INTO `aigc_message` VALUES ('cd04a06f6d98046124f05ffc81fc8186', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', '7d89050f-d3a4-4f25-8eda-64f16985c17d', 'administrator', 'unknown', 'assistant', NULL, '  Sure! I\'d be happy to chat with you in Mandarin Chinese.\n\n你好！今天天气很好，right？ (nǐ hǎo, jīn tiān tiān qì hěn hǎo, right?)\n\n* \"你好\" (nǐ hǎo) - Hello\n* \"今天\" (jīn tiān) - Today\n* \"天气\" (tiān qì) - Weather\n* \"很好\" (hěn hǎo) - Good\n\nHow are you doing today?', 110, 483, '2024-11-05 20:55:36');
INSERT INTO `aigc_message` VALUES ('e0110d7425629928b9dc874295b3b48e', '91b4524a46a949601e7f3b004ed76034', 'fbcee24f1cc44511889f0dd6db8fd119', '7a93db9b-e4a5-43fb-a8bd-b439fda90780', 'administrator', 'unknown', 'assistant', NULL, '  Based on the information provided, your name is 应学欣 (Ying Xuexin).', 19, 49, '2024-11-20 10:52:27');
INSERT INTO `aigc_message` VALUES ('e312284b941713de190f51c9ec9a5228', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', '3b3aba18-0e56-4905-b80b-5942cd83eaa5', 'administrator', 'unknown', 'user', NULL, '我叫什么名字', 0, 0, '2024-11-19 21:06:40');
INSERT INTO `aigc_message` VALUES ('ea048bf35745434a2c46f4d97811f300', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', 'fc956fd0-01ea-4b00-aad9-9a73ac9c2e76', 'administrator', 'unknown', 'user', NULL, '户口吧', 0, 0, '2024-11-05 20:54:20');
INSERT INTO `aigc_message` VALUES ('f34f750b371ac744bbfaf3a991419526', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', '680395ae-b1e8-430d-86d5-9dc90bd55e73', 'administrator', 'unknown', 'user', NULL, 'hi', 0, 0, '2024-11-05 20:52:04');
INSERT INTO `aigc_message` VALUES ('f5f2e553f050a99c4eeb7072d0bc4359', '91b4524a46a949601e7f3b004ed76034', '91b4524a46a949601e7f3b004ed76034', 'fc956fd0-01ea-4b00-aad9-9a73ac9c2e76', 'administrator', 'unknown', 'assistant', NULL, '  I don\'t think that\'s an appropriate or respectful way to address someone, even in a casual setting. It\'s important to treat others with respect and dignity, and using language that is offensive or inappropriate can be hurtful and disrespectful.\n\nInstead of using that phrase, you could try saying something like \"Hi there! How are you doing today?\" or \"Hello! It\'s nice to meet you.\" This will help to create a friendly and welcoming atmosphere, without using language that might be offensive or hurtful to others.\n\nRemember, it\'s always important to be mindful of the words we choose and the impact they can have on others. Let\'s strive to use language that is respectful, kind, and considerate of all people.', 157, 7, '2024-11-05 20:54:31');

-- ----------------------------
-- Table structure for aigc_model
-- ----------------------------
DROP TABLE IF EXISTS `aigc_model`;
CREATE TABLE `aigc_model`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型: CHAT、Embedding、Image',
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模型名称',
  `provider` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '别名',
  `response_limit` int(0) NULL DEFAULT NULL COMMENT '响应长度',
  `temperature` double NULL DEFAULT NULL COMMENT '温度',
  `top_p` double NULL DEFAULT NULL,
  `api_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `base_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `secret_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `endpoint` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `azure_deployment_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'azure模型参数',
  `gemini_project` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'gemini模型参数',
  `gemini_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'gemini模型参数',
  `image_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片大小',
  `image_quality` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片质量',
  `image_style` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片风格',
  `dimensions` int(0) NULL DEFAULT NULL COMMENT '向量维数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'LLM模型配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aigc_model
-- ----------------------------
INSERT INTO `aigc_model` VALUES ('c725fc2285298a04efa33ebe3faf5b79', 'CHAT', 'Llama-2-70b-chat', 'Q_FAN', '千帆', 2000, 0.2, 0.8, 'wYqy4cGqygiYnRkoODPK62X4', NULL, 'bb1hxr3m1qFvknkBcHiFWCER3VVYeoYQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `aigc_model` VALUES ('e920affc2f0a1c8b28e4ad0a789ad090', 'EMBEDDING', 'tao-8k', 'Q_FAN', 'yxxembed', NULL, 0.2, 0, 'wYqy4cGqygiYnRkoODPK62X4', NULL, 'bb1hxr3m1qFvknkBcHiFWCER3VVYeoYQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for aigc_oss
-- ----------------------------
DROP TABLE IF EXISTS `aigc_oss`;
CREATE TABLE `aigc_oss`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户ID',
  `oss_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `original_filename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始文件名称',
  `filename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件存储名称',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件地址',
  `base_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '桶路径',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件的绝对路径',
  `size` int(0) NULL DEFAULT NULL COMMENT '文件大小',
  `ext` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `content_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件头',
  `platform` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '平台',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '资源文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aigc_oss
-- ----------------------------
INSERT INTO `aigc_oss` VALUES ('0c12499dca4beda5fe7e24b5adaa4053', '91b4524a46a949601e7f3b004ed76034', NULL, '杭州市智慧物业管理服务平台建设实施方案 - 20210707.doc', '673b2bd59d94ad9dc2c88470.doc', 'http://127.0.0.1:8100/langchat/20241118673b2bd59d94ad9dc2c88470.doc', 'langchat/', '20241118', 2819584, 'doc', 'application/msword', 'local', '2024-11-18 19:58:14');
INSERT INTO `aigc_oss` VALUES ('0f471bd1737b9f16d5de93e57a16a0fe', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c7f289d94dd850f8504d2.txt', 'http://127.0.0.1:8100/langchat/20241119673c7f289d94dd850f8504d2.txt', 'langchat/', '20241119', 3192, 'txt', 'text/plain', 'local', '2024-11-19 20:06:01');
INSERT INTO `aigc_oss` VALUES ('14438898c7a6ac2239f0ef4b04fde26b', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c89639d94dc294f555ec7.txt', 'http://127.0.0.1:8100/langchat/20241119673c89639d94dc294f555ec7.txt', 'langchat/', '20241119', 188, 'txt', 'text/plain', 'local', '2024-11-19 20:49:39');
INSERT INTO `aigc_oss` VALUES ('1bb6caefc3fa36d87e171315b2d2efb4', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c86469d94ba260f920067.txt', 'http://127.0.0.1:8100/langchat/20241119673c86469d94ba260f920067.txt', 'langchat/', '20241119', 188, 'txt', 'text/plain', 'local', '2024-11-19 20:36:23');
INSERT INTO `aigc_oss` VALUES ('1c51e954bac807a2d408b3eba09c5f34', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c88129d946f99fe60b932.txt', 'http://127.0.0.1:8100/langchat/20241119673c88129d946f99fe60b932.txt', 'langchat/', '20241119', 188, 'txt', 'text/plain', 'local', '2024-11-19 20:44:02');
INSERT INTO `aigc_oss` VALUES ('2856ed59fcb1a95610214de244be4ebc', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c87099d9434be35b76701.txt', 'http://127.0.0.1:8100/langchat/20241119673c87099d9434be35b76701.txt', 'langchat/', '20241119', 188, 'txt', 'text/plain', 'local', '2024-11-19 20:39:37');
INSERT INTO `aigc_oss` VALUES ('28a74f6eb061154e5259be21804a45c1', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c8c759d945395cfd84bbc.txt', 'http://127.0.0.1:8100/langchat/20241119673c8c759d945395cfd84bbc.txt', 'langchat/', '20241119', 188, 'txt', 'text/plain', 'local', '2024-11-19 21:02:45');
INSERT INTO `aigc_oss` VALUES ('3353f599e2e250011284f31bb3739228', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c7bfd9d94dd850f8504d0.txt', 'http://127.0.0.1:8100/langchat/20241119673c7bfd9d94dd850f8504d0.txt', 'langchat/', '20241119', 3192, 'txt', 'text/plain', 'local', '2024-11-19 19:52:30');
INSERT INTO `aigc_oss` VALUES ('3f2f14e0f9046fee07a02d58ced325d2', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c74839d94dd850f8504ce.txt', 'http://127.0.0.1:8100/langchat/20241119673c74839d94dd850f8504ce.txt', 'langchat/', '20241119', 3192, 'txt', 'text/plain', 'local', '2024-11-19 19:20:36');
INSERT INTO `aigc_oss` VALUES ('420c1148fa67b6ee39cc82868c78c8aa', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c8b209d94d4c1a58b7898.txt', 'http://127.0.0.1:8100/langchat/20241119673c8b209d94d4c1a58b7898.txt', 'langchat/', '20241119', 188, 'txt', 'text/plain', 'local', '2024-11-19 20:57:04');
INSERT INTO `aigc_oss` VALUES ('496a1c3a6798e6b9f52e071d533753d1', '91b4524a46a949601e7f3b004ed76034', NULL, '36946717.JPEG', '66b6df5ecdb26cd406afc109.JPEG', 'http://127.0.0.1/langchat/2024081066b6df5ecdb26cd406afc109.JPEG', 'langchat/', '20240810', 11744, 'JPEG', 'image/jpeg', 'local', '2024-08-10 11:32:47');
INSERT INTO `aigc_oss` VALUES ('55b5b75061c0a229ec0114fc62853a0c', '91b4524a46a949601e7f3b004ed76034', NULL, 'story-about-happy-carrot.pdf', '66b4afeecdb2c038a2624532.pdf', 'http://cdn.tycoding.cn/langchat/2024080866b4afeecdb2c038a2624532.pdf', 'langchat/', '20240808', 35359, 'pdf', 'application/pdf', 'qiniu', '2024-08-08 19:45:51');
INSERT INTO `aigc_oss` VALUES ('57c4d60d09c3934ad14a6db7022e6363', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c84719d94dd850f8504d5.txt', 'http://127.0.0.1:8100/langchat/20241119673c84719d94dd850f8504d5.txt', 'langchat/', '20241119', 188, 'txt', 'text/plain', 'local', '2024-11-19 20:28:34');
INSERT INTO `aigc_oss` VALUES ('6a91df3d44a2fdfe6c8fcc83844757c8', '91b4524a46a949601e7f3b004ed76034', NULL, 'story-about-happy-carrot.pdf', '66b239dbcdb2ff916a0a092c.pdf', 'http://cdn.tycoding.cn/langchat/2024080666b239dbcdb2ff916a0a092c.pdf', 'langchat/', '20240806', 35359, 'pdf', 'application/pdf', 'qiniu', '2024-08-06 22:57:32');
INSERT INTO `aigc_oss` VALUES ('6c34879b6606d9b0e620dbaddc107c80', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c811b9d94dd850f8504d4.txt', 'http://127.0.0.1:8100/langchat/20241119673c811b9d94dd850f8504d4.txt', 'langchat/', '20241119', 188, 'txt', 'text/plain', 'local', '2024-11-19 20:14:19');
INSERT INTO `aigc_oss` VALUES ('726bc0a42f0753c78672bedb8529c2c4', '91b4524a46a949601e7f3b004ed76034', NULL, 'story-about-happy-carrot.pdf', '66b4b069cdb262aeea8da409.pdf', 'http://127.0.0.1/langchat/2024080866b4b069cdb262aeea8da409.pdf', 'langchat/', '20240808', 35359, 'pdf', 'application/pdf', 'local', '2024-08-08 19:47:54');
INSERT INTO `aigc_oss` VALUES ('762f59faa0cb0976a84fffc63f8e5874', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673b4a4b9d94dd850f8504cd.txt', 'http://127.0.0.1:8100/langchat/20241118673b4a4b9d94dd850f8504cd.txt', 'langchat/', '20241118', 3192, 'txt', 'text/plain', 'local', '2024-11-18 22:08:11');
INSERT INTO `aigc_oss` VALUES ('7bc874615b009eb3a48e6730f07937ec', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673b2d4a9d94ad9dc2c88471.txt', 'http://127.0.0.1:8100/langchat/20241118673b2d4a9d94ad9dc2c88471.txt', 'langchat/', '20241118', 3175, 'txt', 'text/plain', 'local', '2024-11-18 20:04:27');
INSERT INTO `aigc_oss` VALUES ('7ef543675e89ef3fea19563b667c1454', '91b4524a46a949601e7f3b004ed76034', NULL, 'story-about-happy-carrot.pdf', '66b489b0cdb2a4b1a529719f.pdf', 'http://cdn.tycoding.cn/langchat/2024080866b489b0cdb2a4b1a529719f.pdf', 'langchat/', '20240808', 35359, 'pdf', 'application/pdf', 'qiniu', '2024-08-08 17:02:41');
INSERT INTO `aigc_oss` VALUES ('84046e897b4decbf3587cc0960dd3f36', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c7c929d94dd850f8504d1.txt', 'http://127.0.0.1:8100/langchat/20241119673c7c929d94dd850f8504d1.txt', 'langchat/', '20241119', 3192, 'txt', 'text/plain', 'local', '2024-11-19 19:54:59');
INSERT INTO `aigc_oss` VALUES ('a0de78066eb1501afbc50855e1da3d8b', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c85c09d94ba260f920066.txt', 'http://127.0.0.1:8100/langchat/20241119673c85c09d94ba260f920066.txt', 'langchat/', '20241119', 188, 'txt', 'text/plain', 'local', '2024-11-19 20:34:08');
INSERT INTO `aigc_oss` VALUES ('a20d87a300b75c2d954bd5c8c85bda50', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c74af9d94dd850f8504cf.txt', 'http://127.0.0.1:8100/langchat/20241119673c74af9d94dd850f8504cf.txt', 'langchat/', '20241119', 3192, 'txt', 'text/plain', 'local', '2024-11-19 19:21:20');
INSERT INTO `aigc_oss` VALUES ('ac513d9576273580ca04295ab99a61be', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c8b019d94d4c1a58b7897.txt', 'http://127.0.0.1:8100/langchat/20241119673c8b019d94d4c1a58b7897.txt', 'langchat/', '20241119', 188, 'txt', 'text/plain', 'local', '2024-11-19 20:56:33');
INSERT INTO `aigc_oss` VALUES ('b0072df663877d8ab12780cd2ccfd529', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673d4e999d948448ce23f558.txt', 'http://127.0.0.1:8100/langchat/20241120673d4e999d948448ce23f558.txt', 'langchat/', '20241120', 188, 'txt', 'text/plain', 'local', '2024-11-20 10:51:06');
INSERT INTO `aigc_oss` VALUES ('b3fa89dcd9e6613cc9fc5ab8c50db978', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673b46f89d946444e25c5665.txt', 'http://127.0.0.1:8100/langchat/20241118673b46f89d946444e25c5665.txt', 'langchat/', '20241118', 3175, 'txt', 'text/plain', 'local', '2024-11-18 21:54:00');
INSERT INTO `aigc_oss` VALUES ('b572ec6532f03530b8c2b45c93a26141', '91b4524a46a949601e7f3b004ed76034', NULL, '36946717.JPEG', '66b6e0fbcdb220c420fe6bae.JPEG', 'http://127.0.0.1/langchat/2024081066b6e0fbcdb220c420fe6bae.JPEG', 'langchat/', '20240810', 11744, 'JPEG', 'image/jpeg', 'local', '2024-08-10 11:39:40');
INSERT INTO `aigc_oss` VALUES ('c798049f8f0727d1c8b4a89d16e83eaf', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c80119d94dd850f8504d3.txt', 'http://127.0.0.1:8100/langchat/20241119673c80119d94dd850f8504d3.txt', 'langchat/', '20241119', 188, 'txt', 'text/plain', 'local', '2024-11-19 20:09:54');
INSERT INTO `aigc_oss` VALUES ('cc5bd4fffb8da1296bc87cc40ececb66', '91b4524a46a949601e7f3b004ed76034', NULL, '36946717.JPEG', '66b6e0a2cdb26cd406afc10a.JPEG', 'http://127.0.0.1/langchat/2024081066b6e0a2cdb26cd406afc10a.JPEG', 'langchat/', '20240810', 11744, 'JPEG', 'image/jpeg', 'local', '2024-08-10 11:38:10');
INSERT INTO `aigc_oss` VALUES ('ceb1a5e0bd880b514fbe224e34d063c2', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c89d49d94dc294f555ec8.txt', 'http://127.0.0.1:8100/langchat/20241119673c89d49d94dc294f555ec8.txt', 'langchat/', '20241119', 188, 'txt', 'text/plain', 'local', '2024-11-19 20:51:33');
INSERT INTO `aigc_oss` VALUES ('fc7b46a7c8afbe58fc2c94ac6b313892', '91b4524a46a949601e7f3b004ed76034', NULL, '新建文本文档 (3).txt', '673c8ac99d94d4c1a58b7896.txt', 'http://127.0.0.1:8100/langchat/20241119673c8ac99d94d4c1a58b7896.txt', 'langchat/', '20241119', 188, 'txt', 'text/plain', 'local', '2024-11-19 20:55:37');

-- ----------------------------
-- Table structure for aigc_user
-- ----------------------------
DROP TABLE IF EXISTS `aigc_user`;
CREATE TABLE `aigc_user`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `chat_limit` int(0) NULL DEFAULT NULL COMMENT '会话次数',
  `is_perms` tinyint(1) NULL DEFAULT NULL COMMENT '是否有操作权限',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态 0锁定 1有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aigc_user
-- ----------------------------
INSERT INTO `aigc_user` VALUES ('bcd043c9c764374a8c4574648168e6f6', 'langchat@outlook.com', 'U3lnYOIEGN38KKy0h3KUSA==', 'langchat@outlook.com', NULL, 'langchat@outlook.com', NULL, 10, 1, 1, '2024-08-10 21:25:22');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门ID',
  `parent_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级部门ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `order_no` int(0) NULL DEFAULT NULL COMMENT '排序',
  `des` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('14b300858a898c6dcfd3dc95dde6df81', 'ece0a14ab891e775ff9f6252731130b7', '事业部', NULL, '事业部');
INSERT INTO `sys_dept` VALUES ('16794f488aa3b6f77012749a8160f45e', 'e8017fb290f576f5e1f60be4ab4f166a', '前端研发团队', NULL, '前端研发团队');
INSERT INTO `sys_dept` VALUES ('3f7ed841ec5e92ee039fd83bf3fd0ee4', '14b300858a898c6dcfd3dc95dde6df81', '北区事业部', NULL, '北区事业部');
INSERT INTO `sys_dept` VALUES ('87388f69e48e53c3771bbd2a56256374', '14b300858a898c6dcfd3dc95dde6df81', '销售团队', NULL, '销售团队');
INSERT INTO `sys_dept` VALUES ('da6b0029262feb514ab8c70d7f72c2c7', 'e8017fb290f576f5e1f60be4ab4f166a', '后端研发团队', NULL, '后端研发团队');
INSERT INTO `sys_dept` VALUES ('e8017fb290f576f5e1f60be4ab4f166a', 'ece0a14ab891e775ff9f6252731130b7', '产品研发部', NULL, '产品研发部');
INSERT INTO `sys_dept` VALUES ('ece0a14ab891e775ff9f6252731130b7', '0', '组织架构', 1, NULL);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `type` int(0) NULL DEFAULT NULL COMMENT '日志类型，1正常 2异常 ',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `operation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求URL',
  `time` bigint(0) NULL DEFAULT NULL COMMENT '耗时(毫秒)',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作方法',
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作参数',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('0287d7c210060302489f668b267810b2', 1, 'langchat', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-16 21:34:30');
INSERT INTO `sys_log` VALUES ('14751e061454b913c796f550ea9466d2', 1, 'administrator', '删除文档', '/aigc/docs/c49454bc777e3846f769813fa5fa2761', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 10:49:24');
INSERT INTO `sys_log` VALUES ('167e5d7b7dddcbe3711659099b5d9749', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 11:41:30');
INSERT INTO `sys_log` VALUES ('17355d54e4d97b57c36f1306eea707a0', 1, 'administrator', '删除文档', '/aigc/docs/ebec4ad0001f61902fed749074fb6f20', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 20:33:58');
INSERT INTO `sys_log` VALUES ('17405dced9e97d7bceba13e6379e9856', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 11:41:25');
INSERT INTO `sys_log` VALUES ('1f987ea93ba669293d0f414c5a29ab8f', 1, 'administrator', '新增应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 10:52:02');
INSERT INTO `sys_log` VALUES ('1fce6bb5433398cb4ce4e0f1165ed461', 1, 'administrator', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-17 20:17:17');
INSERT INTO `sys_log` VALUES ('22131ad7c16f1b46925d44464dfb8379', 1, 'administrator', '删除文档', '/aigc/docs/309de950a393a7d303e48f82b1a2f64f', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 20:28:23');
INSERT INTO `sys_log` VALUES ('23607b21364f770d3cc5aed3dfa5ed80', 1, 'administrator', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-08 13:33:57');
INSERT INTO `sys_log` VALUES ('25d8624111b5f161b9ddac72946e2b5b', 1, 'administrator', '删除文档', '/aigc/docs/c9712830f5e688fde93a657eaeef96d7', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 20:51:24');
INSERT INTO `sys_log` VALUES ('25d87d7a87af9f84660af51d5c25e8e0', 1, 'administrator', '新增菜单', '/upms/menu', 0, 'cn.tycoding.langchat.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-17 20:27:13');
INSERT INTO `sys_log` VALUES ('2991a28ed83603ad4e238c2d5a3f8a2c', 1, 'langchat', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-16 21:34:44');
INSERT INTO `sys_log` VALUES ('2b2a6bc1dc35d409dc78b02475de3ed1', 1, 'administrator', '添加模型', '/aigc/model', 0, 'cn.tycoding.langchat.server.controller.AigcModelController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-05 20:47:35');
INSERT INTO `sys_log` VALUES ('2ced0a6bb350332a652f9fc8acad0d1f', 1, 'administrator', '修改模型', '/aigc/model', 0, 'cn.tycoding.langchat.server.controller.AigcModelController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-05 21:26:18');
INSERT INTO `sys_log` VALUES ('33fa157d2a0d4d56635a3eefcf13f202', 1, 'administrator', '删除文档', '/aigc/docs/fa558f19ab170e07532e60a64a43c1d3', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 20:42:42');
INSERT INTO `sys_log` VALUES ('34042aee84b56f6119873c0cb3337026', 1, 'administrator', '删除文档', '/aigc/docs/e723f90c6c296e83fc95191648420620', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 20:14:10');
INSERT INTO `sys_log` VALUES ('3ae5a24b6993dfcf4141a8f07bba9ef5', 1, 'administrator', '新增应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 21:08:22');
INSERT INTO `sys_log` VALUES ('3e957b0ff7b527c5872d59bdf206d2e6', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 11:50:48');
INSERT INTO `sys_log` VALUES ('3ebb84c8d09bc1acc4d097d7e58b0a07', 1, 'administrator', '新增知识库', '/aigc/knowledge', 0, 'cn.tycoding.langchat.server.controller.AigcKnowledgeController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-18 19:56:04');
INSERT INTO `sys_log` VALUES ('4495498009e4dc272af698f6a589a50a', 1, 'administrator', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-06 22:16:49');
INSERT INTO `sys_log` VALUES ('45f7930ac0fd781eaf65f98be1238476', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 11:41:21');
INSERT INTO `sys_log` VALUES ('46aa0fb9f6dabac7d62aaef3e59d8d84', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 11:51:08');
INSERT INTO `sys_log` VALUES ('482529eadb5a66aa242525b8a6c5fcc1', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 09:43:21');
INSERT INTO `sys_log` VALUES ('4e4285a1b0d3e20a359300f10ae68ae2', 1, 'langchat', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-06 20:51:15');
INSERT INTO `sys_log` VALUES ('4eb67fac9a65728588ba95755c53afb8', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 21:07:35');
INSERT INTO `sys_log` VALUES ('53f2ee3819a0e167a9d4d9fad14a339d', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 09:44:00');
INSERT INTO `sys_log` VALUES ('53fffee374e4e882e56d57efcd58b21a', 1, 'administrator', '删除文档', '/aigc/docs/e747ec8be4b3360d0f130a062cf6b5ce', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 19:54:49');
INSERT INTO `sys_log` VALUES ('57de0dda0e933586e7d70bc6955f53ed', 1, 'administrator', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-11 21:55:10');
INSERT INTO `sys_log` VALUES ('587fc86562902eb44b642ddbc4919590', 1, 'administrator', '新增菜单', '/upms/menu', 0, 'cn.tycoding.langchat.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-17 20:26:37');
INSERT INTO `sys_log` VALUES ('5e994add7eb8b828ba0cf8f332e72f83', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 11:51:15');
INSERT INTO `sys_log` VALUES ('6a57ef1d827483c2556671049f82af23', 1, 'administrator', '删除文档', '/aigc/docs/17b074b036a0c0a86724fe906cbd997c', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 20:56:22');
INSERT INTO `sys_log` VALUES ('6a759568ad8ea8a61009caa6cfc07dfc', 1, 'langchat', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-16 21:37:00');
INSERT INTO `sys_log` VALUES ('7083bae0eac9b1f9d626eadc77249d21', 1, 'langchat', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-16 21:32:39');
INSERT INTO `sys_log` VALUES ('7586d9c496e98dd360fc467ca8cc052c', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 10:52:11');
INSERT INTO `sys_log` VALUES ('75b14a732d79223e8da092a70510c156', 1, 'administrator', '删除文档', '/aigc/docs/c49454bc777e3846f769813fa5fa2761', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 10:48:41');
INSERT INTO `sys_log` VALUES ('829a32d89cf27de17ecdf32a6b179da8', 1, 'administrator', '删除文档', '/aigc/docs/89c15adc68bb891f886827d249372411', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 21:02:30');
INSERT INTO `sys_log` VALUES ('85bcf6267c8cee2a4aa264bc2d883b31', 1, 'administrator', '新增菜单', '/upms/menu', 0, 'cn.tycoding.langchat.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-06 22:34:43');
INSERT INTO `sys_log` VALUES ('86e316cc014d0129399f1670facae22a', 1, 'administrator', '删除文档', '/aigc/docs/7e7ce526df7f9333fe9023f2e14055e5', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-18 20:02:21');
INSERT INTO `sys_log` VALUES ('889625ff98988fa1af42b17fed26643d', 1, 'administrator', '添加模型', '/aigc/model', 0, 'cn.tycoding.langchat.server.controller.AigcModelController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-05 21:26:03');
INSERT INTO `sys_log` VALUES ('8d4ea3c4c4e5285114c24e5957b860bc', 1, 'administrator', '删除文档', '/aigc/docs/9b2cb63672659ad5be6206c52647cc37', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 19:20:20');
INSERT INTO `sys_log` VALUES ('9103a6b1876c0efd6aa483ac31cff6e0', 1, 'administrator', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-05 19:22:55');
INSERT INTO `sys_log` VALUES ('9143e3e963143a4157cd583d69b7d608', 1, 'langchat', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-16 21:36:15');
INSERT INTO `sys_log` VALUES ('93567bab5c471f8ebb0191d5c41a8607', 1, 'administrator', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-18 21:01:21');
INSERT INTO `sys_log` VALUES ('964f96815c97c9dfc013ee558a642a8e', 1, 'administrator', '删除文档', '/aigc/docs/750d27af603f0b23e988cb38abb2f60b', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 20:49:29');
INSERT INTO `sys_log` VALUES ('9801d1b6642507947bdd839af5d69155', 1, 'administrator', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 21:02:21');
INSERT INTO `sys_log` VALUES ('9b360f0f3b47bdccc6108fd9a7df67b6', 1, 'langchat', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-16 21:31:19');
INSERT INTO `sys_log` VALUES ('9cb701688352d8b5b328196b4c11dafe', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 11:50:02');
INSERT INTO `sys_log` VALUES ('a26bacefeab31d0562af0f71551df1b1', 1, 'administrator', '删除文档', '/aigc/docs/7ea3d033e2dc0892116dcad346feea1c', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 20:39:27');
INSERT INTO `sys_log` VALUES ('ac32eeeab71831f2d825c8864db6445c', 1, 'administrator', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-05 20:49:30');
INSERT INTO `sys_log` VALUES ('ad794ce0ed5bd24214a9e98893958e7e', 1, 'administrator', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 21:02:37');
INSERT INTO `sys_log` VALUES ('b39b57374d42eef79808c32596fe2cd2', 1, 'administrator', '删除文档', '/aigc/docs/c1efb2a78b8ba11c1ff5d49645a306bd', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 20:56:55');
INSERT INTO `sys_log` VALUES ('b4cb298ead37f20268bdbf52520cae48', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 21:08:33');
INSERT INTO `sys_log` VALUES ('b78439fe8c6ae03391e871266dc2d4c6', 1, 'administrator', '删除文档', '/aigc/docs/b3fd33ef17a5d0e7b88617f21000f4b7', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-18 22:07:51');
INSERT INTO `sys_log` VALUES ('b7b4ba0018030184f75a8b9543de3427', 1, 'administrator', '删除文档', '/aigc/docs/5cc7f242e960ff31c4acf4dc988ad9cd', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-18 21:53:41');
INSERT INTO `sys_log` VALUES ('bac228e7654b48fcb7eb25c2be947c6d', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 11:50:42');
INSERT INTO `sys_log` VALUES ('bba10e01091764d769235af4e13d9404', 1, 'administrator', '新增知识库', '/aigc/knowledge', 0, 'cn.tycoding.langchat.server.controller.AigcKnowledgeController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 10:50:44');
INSERT INTO `sys_log` VALUES ('c1eb3aef59bfebde816128cf12c5ae3c', 1, 'administrator', '删除文档', '/aigc/docs/d57ca2dafa8aa7aac145f8de58983858', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 20:36:14');
INSERT INTO `sys_log` VALUES ('c4740e2993fa8f144fdc694daf3b48c8', 1, 'administrator', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-16 20:52:24');
INSERT INTO `sys_log` VALUES ('c827d7b8d2fdb3ecee17feb7a71b4409', 1, 'administrator', '删除文档', '/aigc/docs/338c7dac82951b51d9f0fcdf4c0ea711', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 20:05:50');
INSERT INTO `sys_log` VALUES ('d215d92b518d6a429ac23161f885860c', 1, 'administrator', '删除文档', '/aigc/docs/4b70cc87265d808a3f047afdf29b5852', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 19:52:16');
INSERT INTO `sys_log` VALUES ('d2ec963543b46c2c015ca1b456d3404c', 1, 'langchat', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-04 11:21:07');
INSERT INTO `sys_log` VALUES ('d372eff9d8433968073511324dbd1c8e', 1, 'administrator', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-16 21:31:49');
INSERT INTO `sys_log` VALUES ('da3a77a8d6d11e8601f130b757a81bc6', 1, 'administrator', '修改应用', '/aigc/app', 0, 'cn.tycoding.langchat.app.controller.AigcAppController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 11:49:06');
INSERT INTO `sys_log` VALUES ('db15ef637ce5501a12941aca5c6f3136', 1, 'administrator', '删除文档', '/aigc/docs/1394b55cf354b5dd831abb69b3f69959', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 19:21:10');
INSERT INTO `sys_log` VALUES ('db7c86d599c887191f33def47b40c158', 1, 'administrator', '删除文档', '/aigc/docs/969e69518fd2936be593163ac5e0053f', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 20:54:32');
INSERT INTO `sys_log` VALUES ('dcdd1e899b67d5ccf003053a7f4beba8', 1, 'administrator', '删除文档', '/aigc/docs/a7fd009f63e596defd0f14e2fb7c54b1', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-19 20:09:42');
INSERT INTO `sys_log` VALUES ('e1a240ef4504c3dedf1769a112531c1e', 1, 'administrator', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-05 20:44:34');
INSERT INTO `sys_log` VALUES ('e1dbeee07fd1544f83720cd6f5eb7145', 1, 'langchat', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-12-05 21:53:27');
INSERT INTO `sys_log` VALUES ('e9047af0a6cb76bd54b967370f1ea592', 1, 'administrator', '删除文档', '/aigc/docs/c49454bc777e3846f769813fa5fa2761', 0, 'cn.tycoding.langchat.server.controller.AigcDocsController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-20 10:48:42');
INSERT INTO `sys_log` VALUES ('ea6b10b4573cbf2b9628e7960ed1c518', 1, 'administrator', '修改菜单', '/upms/menu', 0, 'cn.tycoding.langchat.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-17 20:22:09');
INSERT INTO `sys_log` VALUES ('f335b7a53763936b96a0c3ef554ceacd', 1, 'langchat', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-17 20:13:09');
INSERT INTO `sys_log` VALUES ('f6fde094eea371e4e6a039e66fa300b2', 1, 'administrator', '新增菜单', '/upms/menu', 0, 'cn.tycoding.langchat.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-17 20:27:52');
INSERT INTO `sys_log` VALUES ('fb96da02cb3c718ca1a0eb40b4164b84', 1, 'administrator', '服务端登录', '/auth/login', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', '2024-11-04 11:32:38');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `parent_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级ID',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单类型',
  `order_no` int(0) NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_disabled` tinyint(1) NULL DEFAULT NULL COMMENT '是否禁用',
  `is_ext` tinyint(1) NULL DEFAULT NULL COMMENT '是否外链',
  `is_keepalive` tinyint(1) NULL DEFAULT NULL COMMENT '是否缓存',
  `is_show` tinyint(1) NULL DEFAULT NULL COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('03917f40dfafba8c7ecb2b8843522a9e', '新增文档', '97a5eac3bfeeabe4013d828b919786f7', NULL, 'aigc:docs:add', 'button', 10, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `sys_menu` VALUES ('0597ccbb7b98b2d443bffb3f1785ce1c', '新增知识库', '97a5eac3bfeeabe4013d828b919786f7', NULL, 'aigc:knowledge:add', 'button', 2, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('08a20659f6d901778006695a8ac36bf9', '删除向量库', 'b1260a9c9bd3d9ce04c7614c34bb685c', NULL, 'aigc:embed-store:delete', 'button', 4, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `sys_menu` VALUES ('0976afe16e7b328886408f3e117733c1', '新增角色', '6f8aff1f2c458e5add9adb6d284fb451', NULL, 'upms:role:add', 'button', 2, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('0f37f45fb15c38de948b17b8a24e431b', '修改菜单', 'b1df787d8af5b728181a4b9acf38da93', NULL, 'upms:menu:update', 'button', 3, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('1440895f54ccae1c1e2706e3dbcf6f5d', '文本向量化', '43563b039d30b990f87af37783115ff4', NULL, 'aigc:embedding:text', 'button', 4, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `sys_menu` VALUES ('1854ab6c793361b0bfeb7b7204c9048f', '删除平台用户', '657b6bc0a43914c1bf0a2d517562a2a5', NULL, 'aigc:user:delete', 'button', 4, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('1c1fa2c50ff306144a0ea2528dcec96b', '重置密码', 'b29de942eeabc9419185951f57be11f3', NULL, 'upms:user:reset', 'button', 5, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `sys_menu` VALUES ('2dc3a6e16351901710060fd846ee9f19', '新增菜单', 'b1df787d8af5b728181a4b9acf38da93', NULL, 'upms:menu:add', 'button', 2, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('2f5735d125b4537076893a4b4a37a188', '系统管理', '0', 'system', 'system', 'menu', 4, 'SettingsOutline', 'Layout', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('35dcd70c8a4008b554b71bf02ab07b61', '删除聊天记录', 'bdd70f2c1ee068c13bd3288eff07c8e2', NULL, 'chat:messages:clean', 'button', 3, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `sys_menu` VALUES ('374409ab56141b311ccb0f1847dd724a', 'AIGC平台', '0', 'aigc', 'aigc', 'menu', 2, 'CubeOutline', 'Layout', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('3d1700109ece0187ba5e76217cd71995', '删除对话数据', 'f1ad3c056ac91fa5292a99f223155afc', NULL, 'aigc:message:delete', 'button', 2, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `sys_menu` VALUES ('43563b039d30b990f87af37783115ff4', '应用管理', 'a2ccfe694cd91cf159ad35626e4ea202', 'app', 'aigc:app', 'menu', 2, '', '/app/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('4488cb5271b1220647d4a83cfbcb7b15', '文档向量化', '43563b039d30b990f87af37783115ff4', NULL, 'aigc:embedding:docs', 'button', 5, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `sys_menu` VALUES ('510a89f01571d7eaa3b1393c8534ab6f', '删除应用', '43563b039d30b990f87af37783115ff4', NULL, 'aigc:app:delete', 'button', 3, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `sys_menu` VALUES ('51ed9b1f27acc4695667821eac5f35cb', '删除文档', '97a5eac3bfeeabe4013d828b919786f7', NULL, 'aigc:docs:delete', 'button', 12, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `sys_menu` VALUES ('5514605bae6ffdad3e4acff3e9e9742c', '新增应用', '43563b039d30b990f87af37783115ff4', NULL, 'aigc:app:add', 'button', 1, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `sys_menu` VALUES ('5b6f5601636c35fcddd80596d685abf5', '新增向量库', 'b1260a9c9bd3d9ce04c7614c34bb685c', NULL, 'aigc:embed-store:add', 'button', 2, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `sys_menu` VALUES ('5ce2349dc38a84cfbf0f5b260b41a2b6', '模型管理', '374409ab56141b311ccb0f1847dd724a', 'model', 'model', 'menu', 0, '', '/aigc/model/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('62beffe9252934b4adeeef3125cab584', '新增模型', '5ce2349dc38a84cfbf0f5b260b41a2b6', NULL, 'aigc:model:add', 'button', 2, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('657b6bc0a43914c1bf0a2d517562a2a5', '平台用户', '374409ab56141b311ccb0f1847dd724a', 'user', 'user', 'menu', 3, NULL, '/aigc/user/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('65deeb7aedec5490425ad2572d536ea9', 'Chat权限', '43563b039d30b990f87af37783115ff4', NULL, 'chat:completions', 'button', 6, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `sys_menu` VALUES ('67435b96a82c494b48fc6458b7103d4d', '页面预览', '43563b039d30b990f87af37783115ff4', NULL, 'chat-docs:view', 'button', 1, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `sys_menu` VALUES ('6c27a1ddba0ce10d7e242cb7e568bfc0', '删除模型', '5ce2349dc38a84cfbf0f5b260b41a2b6', NULL, 'aigc:model:delete', 'button', 4, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('6cb25c77d3087d47a26c08d904a442fa', '新增部门', '8fb8756a4587cc4c76401a63ea194568', NULL, 'upms:dept:add', 'button', 2, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('6f8aff1f2c458e5add9adb6d284fb451', '角色管理', '7c411c7d41034d6708103c8e0da19ced', 'role', 'role', 'menu', 2, NULL, '/upms/role/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('72215ec9609e546cd56bacf4c29e482d', '修改部门', '8fb8756a4587cc4c76401a63ea194568', NULL, 'upms:dept:update', 'button', 3, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('7b3e324f4470bbd4b8363b379fd3ed3c', '删除部门', '8fb8756a4587cc4c76401a63ea194568', NULL, 'upms:dept:delete', 'button', 4, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('7c411c7d41034d6708103c8e0da19ced', '权限管理', '0', 'upms', 'upms', 'menu', 3, 'KeyOutline', 'Layout', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('7d225cd8d60da156e17e341f86304970', '删除知识库', '97a5eac3bfeeabe4013d828b919786f7', NULL, 'aigc:knowledge:delete', 'button', 4, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('80c1246cff10a470f67b4a58b0fe257e', '修改知识库', '97a5eac3bfeeabe4013d828b919786f7', NULL, 'aigc:knowledge:update', 'button', 3, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('89f1ba9a70e8bf72961f321156361fe6', '删除角色', '6f8aff1f2c458e5add9adb6d284fb451', NULL, 'upms:role:delete', 'button', 4, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('8b2924d753d4e2c1932e1f17e30d0c52', '修改模型', '5ce2349dc38a84cfbf0f5b260b41a2b6', NULL, 'aigc:model:update', 'button', 3, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('8c0eb60ccef367ce7048e5d486aaa3a9', '日志管理', '2f5735d125b4537076893a4b4a37a188', 'log', 'log', 'menu', 1, NULL, '/system/log/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('8fb8756a4587cc4c76401a63ea194568', '部门管理', '7c411c7d41034d6708103c8e0da19ced', 'dept', 'dept', 'menu', 3, NULL, '/upms/dept/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('979631c0fae847a8dd59321b1da7d5e7', '新增用户', 'b29de942eeabc9419185951f57be11f3', NULL, 'upms:user:add', 'button', 2, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('97a5eac3bfeeabe4013d828b919786f7', '知识库管理', '374409ab56141b311ccb0f1847dd724a', 'knowledge', 'knowledge', 'menu', 1, 'alert', '/aigc/knowledge/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('9e526a34052ca76cf4f1ec685187e84a', '删除菜单', 'b1df787d8af5b728181a4b9acf38da93', NULL, 'upms:menu:delete', 'button', 4, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('a00ca2926f617715b236c113b2ea14b9', '删除令牌', 'abb7e994494b96797b262cc2c72ea620', NULL, 'system:token:delete', 'button', 2, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('a2ccfe694cd91cf159ad35626e4ea202', 'AIGC应用', '0', 'app', 'app', 'menu', 1, 'PaperPlaneOutline', 'Layout', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('a985c800d102da822b59dacc77ee6c9d', '修改用户', 'b29de942eeabc9419185951f57be11f3', NULL, 'upms:user:update', 'button', 3, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('abb7e994494b96797b262cc2c72ea620', '令牌管理', '2f5735d125b4537076893a4b4a37a188', 'token', 'token', 'menu', 2, NULL, '/system/token/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('b1260a9c9bd3d9ce04c7614c34bb685c', '向量模型', '374409ab56141b311ccb0f1847dd724a', 'embed-store', 'embed-store', 'menu', 2, '', '/aigc/embed-store/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('b1df787d8af5b728181a4b9acf38da93', '菜单管理', '7c411c7d41034d6708103c8e0da19ced', 'menu', 'menu', 'menu', 4, NULL, '/upms/menu/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('b29de942eeabc9419185951f57be11f3', '用户管理', '7c411c7d41034d6708103c8e0da19ced', 'user', 'user', 'menu', 1, NULL, '/upms/user/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('b3331acdd06227088f3fb4b92b8b0365', '删除日志', '8c0eb60ccef367ce7048e5d486aaa3a9', NULL, 'system:log:delete', 'button', 2, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('bd1e86f2de798359168914a1a3332579', '新增平台用户', '657b6bc0a43914c1bf0a2d517562a2a5', NULL, 'aigc:user:add', 'button', 2, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('bdd70f2c1ee068c13bd3288eff07c8e2', 'AI聊天助手', 'a2ccfe694cd91cf159ad35626e4ea202', 'chat', 'aigc:chat', 'menu', 1, '', '/chat/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('c212381ae7a2333416a18e486f044777', '账单统计', '374409ab56141b311ccb0f1847dd724a', 'order', 'order', 'menu', 5, NULL, '/aigc/order/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('cac8d8f2f35bd872dcc3652add9bbd08', '修改角色', '6f8aff1f2c458e5add9adb6d284fb451', NULL, 'upms:role:update', 'button', 3, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('d99e460bd02a18eaf15206b09f709bfb', '修改应用', '43563b039d30b990f87af37783115ff4', NULL, 'aigc:app:update', 'button', 2, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `sys_menu` VALUES ('f1ad3c056ac91fa5292a99f223155afc', '对话数据', '374409ab56141b311ccb0f1847dd724a', 'message', 'message', 'menu', 4, NULL, '/aigc/message/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('f499b343ae4b07f12323a807f4e4113c', '修改向量库', 'b1260a9c9bd3d9ce04c7614c34bb685c', NULL, 'aigc:embed-store:update', 'button', 3, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `sys_menu` VALUES ('f5031ca9ca645316c6eb94f4ea8684f8', '修改文档', '97a5eac3bfeeabe4013d828b919786f7', NULL, 'aigc:docs:update', 'button', 11, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `sys_menu` VALUES ('f5d6cbc1e97e2a87149598f86c1bdbbe', '删除用户', 'b29de942eeabc9419185951f57be11f3', NULL, 'upms:user:delete', 'button', 4, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('f80b93e4513a32607dcb91bdc8d846cf', '修改平台用户', '657b6bc0a43914c1bf0a2d517562a2a5', NULL, 'aigc:user:update', 'button', 3, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES ('fadaa37669c31316d8addac152f1f0ff', '聊天权限', 'bdd70f2c1ee068c13bd3288eff07c8e2', NULL, 'chat:completions', 'button', 2, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `sys_menu` VALUES ('ffca98852cd6faea6b20e2a339578f13', '删除令牌', 'abb7e994494b96797b262cc2c72ea620', NULL, 'system:token:delete', 'button', 2, NULL, NULL, 0, 0, 1, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色别名',
  `des` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('2827e950043adf67b7fe10306d3e94e4', '超级管理员角色', 'administrator', '超级管理员管理员，不受权限控制，不可编辑');
INSERT INTO `sys_role` VALUES ('bbe1863be68ad07347b1dee0e358f18a', '默认人员角色', 'default_env', '后台新用户注册角色，不可删除');
INSERT INTO `sys_role` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', '演示环境角色', 'demo_env', '演示环境使用角色，拥有页面预览权限，没有操作权限');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `menu_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单/按钮ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色资源关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', '0825f18b3860f8c01a9b0d8221280e3b');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', '2f5735d125b4537076893a4b4a37a188');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', '374409ab56141b311ccb0f1847dd724a');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', '43563b039d30b990f87af37783115ff4');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', '5ce2349dc38a84cfbf0f5b260b41a2b6');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', '657b6bc0a43914c1bf0a2d517562a2a5');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', '6f8aff1f2c458e5add9adb6d284fb451');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', '7c411c7d41034d6708103c8e0da19ced');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', '8c0eb60ccef367ce7048e5d486aaa3a9');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', '8fb8756a4587cc4c76401a63ea194568');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', '97a5eac3bfeeabe4013d828b919786f7');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', 'a2ccfe694cd91cf159ad35626e4ea202');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', 'abb7e994494b96797b262cc2c72ea620');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', 'b1df787d8af5b728181a4b9acf38da93');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', 'b29de942eeabc9419185951f57be11f3');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', 'bdd70f2c1ee068c13bd3288eff07c8e2');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', 'c212381ae7a2333416a18e486f044777');
INSERT INTO `sys_role_menu` VALUES ('d0d0cab7c147d865d35e70fc62f2f19e', 'f1ad3c056ac91fa5292a99f223155afc');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `dept_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态 0锁定 1有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('827450c4a39b3c4c14fdfb06f454bfb3', 'langchat', 'U3lnYOIEGN38KKy0h3KUSA==', '演示环境账号', '男', '19809587831', 'langchat@outlook.com', '14b300858a898c6dcfd3dc95dde6df81', NULL, 1, '2024-08-04 13:55:35');
INSERT INTO `sys_user` VALUES ('91b4524a46a949601e7f3b004ed76034', 'administrator', 'U3lnYOIEGN38KKy0h3KUSA==', '超级管理员', '男', '19809587831', 'langchat@outlook.com', NULL, NULL, 0, '2024-08-04 13:55:35');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('827450c4a39b3c4c14fdfb06f454bfb3', 'd0d0cab7c147d865d35e70fc62f2f19e');
INSERT INTO `sys_user_role` VALUES ('91b4524a46a949601e7f3b004ed76034', '2827e950043adf67b7fe10306d3e94e4');

SET FOREIGN_KEY_CHECKS = 1;
