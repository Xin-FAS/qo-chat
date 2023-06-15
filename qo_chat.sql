/*
 Navicat Premium Data Transfer

 Source Server         : fas
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 121.4.252.73:3307
 Source Schema         : qo_chat

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 20/05/2023 16:36:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for friend
-- ----------------------------
DROP TABLE IF EXISTS `friend`;
CREATE TABLE `friend`  (
  `from_user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '请求发送用户',
  `to_user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '需要接受用户',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `is_agree` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '2' COMMENT '0同意 1不同意 2待同意',
  PRIMARY KEY (`from_user`, `to_user`) USING BTREE,
  INDEX `to_user`(`to_user`) USING BTREE,
  CONSTRAINT `friend_ibfk_1` FOREIGN KEY (`from_user`) REFERENCES `user` (`qo_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friend_ibfk_2` FOREIGN KEY (`to_user`) REFERENCES `user` (`qo_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of friend
-- ----------------------------

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`  (
  `group_num` bigint NOT NULL COMMENT '群号',
  `group_user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '群主',
  `group_remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '群公告',
  `group_avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '群头像',
  `group_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '群昵称',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`group_num`) USING BTREE,
  INDEX `group_ibfk_1`(`group_user`) USING BTREE,
  CONSTRAINT `group_ibfk_1` FOREIGN KEY (`group_user`) REFERENCES `user` (`qo_num`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group
-- ----------------------------

-- ----------------------------
-- Table structure for gu
-- ----------------------------
DROP TABLE IF EXISTS `gu`;
CREATE TABLE `gu`  (
  `group_num` bigint NOT NULL COMMENT '群号',
  `user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '群内用户',
  `group_agree` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '2' COMMENT '0通过 1拒绝 2待处理',
  `user_agree` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '2' COMMENT '0通过 1拒绝 2待处理',
  `create_time` timestamp NOT NULL COMMENT '创建日期',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`group_num`, `user`) USING BTREE,
  INDEX `user`(`user`) USING BTREE,
  CONSTRAINT `gu_ibfk_2` FOREIGN KEY (`user`) REFERENCES `user` (`qo_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gu
-- ----------------------------

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `record_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息id',
  `record_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息发送人',
  `record_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息内容',
  `record_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------

-- ----------------------------
-- Table structure for rg
-- ----------------------------
DROP TABLE IF EXISTS `rg`;
CREATE TABLE `rg`  (
  `r_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '记录id',
  `g_num` bigint NOT NULL COMMENT '群号',
  PRIMARY KEY (`r_id`, `g_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rg
-- ----------------------------

-- ----------------------------
-- Table structure for rt
-- ----------------------------
DROP TABLE IF EXISTS `rt`;
CREATE TABLE `rt`  (
  `r_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '记录id',
  `t_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '聊天id',
  PRIMARY KEY (`r_id`, `t_id`) USING BTREE,
  INDEX `t_id`(`t_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rt
-- ----------------------------

-- ----------------------------
-- Table structure for talk
-- ----------------------------
DROP TABLE IF EXISTS `talk`;
CREATE TABLE `talk`  (
  `talk_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `talk_user1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户1',
  `talk_user2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户2',
  PRIMARY KEY (`talk_id`) USING BTREE,
  INDEX `talk_user1`(`talk_user1`) USING BTREE,
  INDEX `talk_user2`(`talk_user2`) USING BTREE,
  CONSTRAINT `talk_ibfk_1` FOREIGN KEY (`talk_user1`) REFERENCES `user` (`qo_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `talk_ibfk_2` FOREIGN KEY (`talk_user2`) REFERENCES `user` (`qo_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of talk
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `qo_num` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '加密密码',
  `nickname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '昵称',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `create_time` timestamp NOT NULL COMMENT '创建日期',
  `update_time` timestamp NOT NULL COMMENT '更新日期',
  `del_logic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`qo_num`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
