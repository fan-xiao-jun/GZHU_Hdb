/*
Navicat MySQL Data Transfer

Source Server         : aa
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : hongdb

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2022-06-11 23:33:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `username` varchar(32) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('fxj', '抢沙发', '2022-6-7');
INSERT INTO `comment` VALUES ('xm', '哈哈哈哈哈哈哈哈哈', '2022-6-7 17:36:31');
INSERT INTO `comment` VALUES ('xh', 'aaaaaaaaaaa', '2022-6-7 20:01:08');
INSERT INTO `comment` VALUES ('xm', '11111', '2022-6-7 23:06:35');
INSERT INTO `comment` VALUES ('xm', '55555', '2022-6-8 16:24:44');
INSERT INTO `comment` VALUES ('xh', '测试', '2022-6-10 14:29:05');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `Nno` int(11) DEFAULT NULL,
  `picsrc` varchar(30) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('0', 'image/news/0.jpg', '浙江金华：钱塘江1号洪水安全过境', '据钱塘江兰溪水文站报告，6月6日10时35分达到警戒水位28米，钱塘江流域发生今年第1场编号洪水。11时达到洪峰水位28.01米，洪峰流量7330立方米每秒。12时实测兰江水位27.99米，13时水位27.92米，目前正在回落，安全经过金华境内。胡肖飞摄（人民图片网）');
INSERT INTO `news` VALUES ('1', 'image/news/1.jpg', '济莱高铁历城站混凝土主体结构提前封顶', '6月6日，济（南）莱（芜）高铁历城站混凝土主体结构提前完成封顶作业。济莱高铁是山东省重点基建工程，为设计时速350公里的市域内高铁。目前各施工单位积极统筹疫情防控和项目建设，济莱高铁工程正有序推进中。新华社记者 郭绪雷 摄');
INSERT INTO `news` VALUES ('2', 'image/news/2.jpg', '山东青岛：7000多万单位优质鱼虾蟹苗“播种”大海', '2022年6月6日，山东青岛西海岸新区组织开展渔业资源增殖放流活动，7000多万单位的日本对虾、褐牙鲆、三疣梭子蟹等优质水产品苗种被投放到黄海近海。');
INSERT INTO `news` VALUES ('3', 'image/news/3.jpg', '建筑人的工地“十二时辰”', '卯时，迎着朝阳，在项目慈东高架桥施工现场，工人们准备完毕，开始了一天的工作。景汉锋摄');
INSERT INTO `news` VALUES ('4', 'image/news/4.jpg', '2022年全国高考正式拉开大幕', '按照教育部此前印发的通知，2022年全国高考定于6月7日开始举行。今年全国高考设普通考场33万个，安排监考及考务人员102万人。其中，北京全市共18个考区，共设常规考点99个、常规考场1714个、备用考场321个，设置备用考点55个。');
INSERT INTO `news` VALUES ('5', 'image/news/5.jpg', '快递物流集散中心助力“黔货出山”', '贵州快递物流集聚区是西南地区最大的快递物流集散中心之一，被评为国家第三批示范物流园区，贵州90%的包裹都在此地集散，无数“黔货出山”的包裹由此发往全国。目前，园区入驻快递物流、电商仓配及商贸市场类企业（项目）50家，日均进出港快件分拣处理量400万票（件）以上。新华社记者 欧东衢 摄');

-- ----------------------------
-- Table structure for queandans
-- ----------------------------
DROP TABLE IF EXISTS `queandans`;
CREATE TABLE `queandans` (
  `QNO` int(11) NOT NULL,
  `question` varchar(100) NOT NULL,
  `optionA` varchar(500) DEFAULT NULL,
  `optionB` varchar(500) DEFAULT NULL,
  `optionC` varchar(500) DEFAULT NULL,
  `optionD` varchar(500) DEFAULT NULL,
  `answer` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`QNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of queandans
-- ----------------------------
INSERT INTO `queandans` VALUES ('0', '1934年大事要事?', '建立井冈山革命根据地', '国共第一次合作', '古田会议', '红军长征', 'D');
INSERT INTO `queandans` VALUES ('1', '1964年大事要事?', '第一颗原子弹爆炸', '建立革命统一战线', '第一个民族民主革命纲领', '香港回归', 'A');
INSERT INTO `queandans` VALUES ('2', '1919年大事要事?', '国共第一次合作', '东方红一号', '五四运动', '红军长征', 'C');
INSERT INTO `queandans` VALUES ('3', '1977年大事要事?', '古田会议', '抗日战争胜利', '改革开放', '恢复高考', 'D');
INSERT INTO `queandans` VALUES ('4', '1935年大事要事?', '建立井冈山革命根据地', '遵义会议', '五四运动', '澳门回归', 'B');
INSERT INTO `queandans` VALUES ('5', '1921年大事要事?', '第一颗原子弹爆炸', '中国共产党第一次全国代表大会', '国共第一次合作', '第一个民族民主革命纲领', 'B');
INSERT INTO `queandans` VALUES ('6', '1950年大事要事?', '平型关大捷', '古田会议', '抗美援朝', '中华人民共和国成立', 'C');
INSERT INTO `queandans` VALUES ('7', '1970年大事要事?', '东方红一号', '改革开放', '香港回归', '第一颗原子弹爆炸', 'A');
INSERT INTO `queandans` VALUES ('8', '1978年大事要事?', '遵义会议', '中华人民共和国恢复联合国合法席位', '恢复高考', '改革开放', 'D');
INSERT INTO `queandans` VALUES ('9', '1949年大事要事?', '抗日战争胜利', '平型关大捷', '中华人民共和国成立', '中国共产党第一次全国代表大会', 'C');
INSERT INTO `queandans` VALUES ('10', '1927年大事要事?', '建立井冈山革命根据地', '国共第一次合作', '古田会议', '第一个民族民主革命纲领', 'A');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(32) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `upower` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('root', '管理员', '888', '0', '', '1');
INSERT INTO `user` VALUES ('fxj', '范晓君', '12345', '22', '女', '0');
INSERT INTO `user` VALUES ('xm', '小明', '123', '23', '男', '0');
INSERT INTO `user` VALUES ('xh', '小红', '123', '33', '女', '0');
INSERT INTO `user` VALUES ('cc', '张三', '123', '21', '男', '0');
INSERT INTO `user` VALUES ('c1', '小红', '123', '22', '女', '0');

-- ----------------------------
-- Table structure for userans
-- ----------------------------
DROP TABLE IF EXISTS `userans`;
CREATE TABLE `userans` (
  `uid` varchar(32) DEFAULT NULL,
  `QNO1` int(11) DEFAULT NULL,
  `QNO2` int(11) DEFAULT NULL,
  `QNO3` int(11) DEFAULT NULL,
  `QNO4` int(11) DEFAULT NULL,
  `QNO5` int(11) DEFAULT NULL,
  `uanswer1` varchar(30) DEFAULT NULL,
  `uanswer2` varchar(30) DEFAULT NULL,
  `uanswer3` varchar(30) DEFAULT NULL,
  `uanswer4` varchar(30) DEFAULT NULL,
  `uanswer5` varchar(30) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `totalPoint` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userans
-- ----------------------------
INSERT INTO `userans` VALUES ('fxj', '4', '5', '6', '7', '8', 'B', 'C', 'C', 'D', 'A', '0', '40');
INSERT INTO `userans` VALUES ('xm', '3', '4', '5', '6', '7', 'A', 'B', 'B', 'C', 'D', '0', '60');
INSERT INTO `userans` VALUES ('xm', '1', '2', '3', '4', '5', 'A', 'C', 'D', 'B', 'B', '1', '100');
INSERT INTO `userans` VALUES ('xm', '2', '3', '4', '5', '6', 'A', 'C', 'B', 'A', 'B', '2', '20');
