/*
Navicat MySQL Data Transfer

Source Server         : mysql56
Source Server Version : 50623
Source Host           : 127.0.0.1:3308
Source Database       : sgdc

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2016-04-25 17:40:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for datadictionaryinfo
-- ----------------------------
DROP TABLE IF EXISTS `datadictionaryinfo`;
CREATE TABLE `datadictionaryinfo` (
  `DD_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '数据字典ID',
  `DD_Type` varchar(25) NOT NULL DEFAULT '' COMMENT '数据字典类型',
  `DD_Value` varchar(25) NOT NULL DEFAULT '' COMMENT '数据字典值',
  `DD_Desc` varchar(25) NOT NULL DEFAULT '' COMMENT '数据字典描述',
  `DD_Ext1` varchar(255) DEFAULT NULL COMMENT '数据字典扩展信息1',
  `DD_Ext2` varchar(255) DEFAULT NULL COMMENT '数据字典扩展信息2',
  `DD_Ext3` varchar(255) DEFAULT NULL COMMENT '数据字典扩展信息3',
  PRIMARY KEY (`DD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='数据字典信息';

-- ----------------------------
-- Records of datadictionaryinfo
-- ----------------------------
INSERT INTO `datadictionaryinfo` VALUES ('4', '文档类别', '规章制度', '规章制度', '', '', '');
INSERT INTO `datadictionaryinfo` VALUES ('5', '文档类别', '电报', '电报', '', '', '');
INSERT INTO `datadictionaryinfo` VALUES ('6', '文档类别', '技术文档', '技术文档', '', '', '');
INSERT INTO `datadictionaryinfo` VALUES ('7', '文档类别', '事故案例', '事故案例', '', '', '');
INSERT INTO `datadictionaryinfo` VALUES ('8', '单位', '管理员', '管理员', null, null, null);
INSERT INTO `datadictionaryinfo` VALUES ('9', '单位', '机关', '机关', null, null, null);
INSERT INTO `datadictionaryinfo` VALUES ('10', '管理员职别', '管理员', '这是管理员职别', null, null, null);
INSERT INTO `datadictionaryinfo` VALUES ('11', '管理员部门', '管理员', '这是管理员下拉列表', null, null, null);
INSERT INTO `datadictionaryinfo` VALUES ('12', '机关部门', '办公室', '09办公室 描述', null, null, null);
INSERT INTO `datadictionaryinfo` VALUES ('13', '机关部门', '段领导', '00段领导 描述', null, null, null);
INSERT INTO `datadictionaryinfo` VALUES ('14', '机关职别', '段长', '这是机关职别', null, null, null);
INSERT INTO `datadictionaryinfo` VALUES ('15', '机关职别', '书记', '这是机关职别', null, null, null);
INSERT INTO `datadictionaryinfo` VALUES ('16', '机关部门', '佛挡杀佛打算', 'fdas ', '', '', '');

-- ----------------------------
-- Table structure for documentinfo
-- ----------------------------
DROP TABLE IF EXISTS `documentinfo`;
CREATE TABLE `documentinfo` (
  `D_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `D_Type` varchar(25) NOT NULL DEFAULT '' COMMENT '文档类型',
  `D_Head` varchar(100) NOT NULL DEFAULT '' COMMENT '文档标题',
  `D_Subhead` varchar(80) DEFAULT NULL COMMENT '文档副标题',
  `D_Content` text NOT NULL COMMENT '文档内容',
  `D_CreateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '文档创建时间',
  `D_UpdateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '文档修改时间',
  `D_Ext1` varchar(255) DEFAULT NULL COMMENT '文档扩展信息1',
  `D_Ext2` varchar(255) DEFAULT NULL COMMENT '文档扩展信息2',
  `D_Ext3` varchar(255) DEFAULT NULL COMMENT '文档扩展信息3',
  PRIMARY KEY (`D_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='基本文档信息';

-- ----------------------------
-- Records of documentinfo
-- ----------------------------
INSERT INTO `documentinfo` VALUES ('1', '电报', '电报001', '副标题是什么了', '这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.', '2016-04-09 17:28:13', '2016-04-09 17:28:13', '11', '22', '33');
INSERT INTO `documentinfo` VALUES ('2', '规章制度', '1', '2', '%3Cp%20style%3D%22text-align%3Acenter%3B%22%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20align%3D%22center%22%20style%3D%22margin-left%3A0cm%3Btext-align%3Acenter%3B%22%3E%0A%09%09%3Cb%3E%E3%80%8A%3C%2Fb%3E%3Cb%3EWeb%3C%2Fb%3E%3Cb%3E%E6%8A%80%E6%9C%AF%E4%B8%8E%E5%BC%80%E5%8F%91%EF%BC%88%3C%2Fb%3E%3Cb%3EASP.NET%3C%2Fb%3E%3Cb%3E%EF%BC%89%E3%80%8B%3C%2Fb%3E%3Cb%3E%3C%2Fb%3E%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20align%3D%22center%22%20style%3D%22margin-left%3A0cm%3Btext-align%3Acenter%3B%22%3E%0A%09%09%3Cb%3E%E8%AF%BE%E7%A8%8B%E8%AE%BE%E8%AE%A1%E8%AF%B4%E6%98%8E%E4%B9%A6%3C%2Fb%3E%3Cb%3E%3C%2Fb%3E%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22margin-left%3A0cm%3B%22%3E%0A%09%09%3Cspan%3E%26nbsp%3B%3C%2Fspan%3E%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22margin-left%3A0cm%3B%22%3E%0A%09%09%3Cspan%3E%26nbsp%3B%3C%2Fspan%3E%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22margin-left%3A0cm%3B%22%3E%0A%09%09%3Cspan%3E%26nbsp%3B%3C%2Fspan%3E%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22margin-left%3A0cm%3B%22%3E%0A%09%09%3Cspan%3E%26nbsp%3B%3C%2Fspan%3E%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22margin-left%3A0cm%3B%22%3E%0A%09%09%3Cspan%3E%26nbsp%3B%3C%2Fspan%3E%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22margin-left%3A0cm%3Btext-indent%3A91.1pt%3B%22%3E%0A%09%09%E8%AE%BE%20%E8%AE%A1%20%E9%A2%98%20%E7%9B%AE%EF%BC%9A%3Cu%3E%20%3C%2Fu%3E%3Cu%3E%E7%BD%91%E4%B8%8A%E6%8A%95%E7%A5%A8%E7%B3%BB%E7%BB%9F%3C%2Fu%3E%3Cu%3E%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%20%3C%2Fu%3E%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22margin-left%3A0cm%3Btext-indent%3A91.1pt%3B%22%3E%0A%09%09%E6%8C%87%20%E5%AF%BC%20%E8%80%81%20%E5%B8%88%EF%BC%9A%3Cu%3E%20%3C%2Fu%3E%3Cspan%3E%3C%2Fspan%3E%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22margin-left%3A0cm%3Btext-indent%3A91.1pt%3B%22%3E%0A%09%09%E5%AD%A6%20%E7%94%9F%20%E5%AD%A6%20%E5%8F%B7%EF%BC%9A%3Cu%3E%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%20%3C%2Fu%3E%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22margin-left%3A0cm%3Btext-indent%3A91.1pt%3B%22%3E%0A%09%09%E5%AD%A6%20%E7%94%9F%20%E5%A7%93%20%E5%90%8D%EF%BC%9A%3Cu%3E%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%20%3C%2Fu%3E%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22margin-left%3A0cm%3Btext-indent%3A91.1pt%3B%22%3E%0A%09%09%E5%90%8C%26nbsp%3B%20%E7%BB%84%26nbsp%3B%26nbsp%3B%0A%E4%BA%BA%EF%BC%9A%3Cu%3E%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%20%3C%2Fu%3E%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22text-indent%3A90.0pt%3B%22%3E%0A%09%09%26nbsp%3B%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22text-indent%3A90.0pt%3B%22%3E%0A%09%09%26nbsp%3B%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22text-indent%3A90.0pt%3B%22%3E%0A%09%09%26nbsp%3B%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22text-indent%3A90.0pt%3B%22%3E%0A%09%09%26nbsp%3B%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22text-indent%3A90.0pt%3B%22%3E%0A%09%09%26nbsp%3B%0A%09%3C%2Fp%3E%0A%09%3Cp%20class%3D%22MsoNormal%22%20style%3D%22text-indent%3A90.0pt%3B%22%3E%0A%09%09%E6%97%B6%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%26nbsp%3B%20%E9%97%B4%EF%BC%9A%3Cu%3E%20201%20%3C%2Fu%3E%3Cu%3E%E5%B9%B4%3C%2Fu%3E%3Cu%3E%26nbsp%3B%20%3C%2Fu%3E%3Cu%3E%E6%9C%88%3C%2Fu%3E%3Cu%3E%26nbsp%3B%20%3C%2Fu%3E%3Cu%3E%E6%97%A5%3C%2Fu%3E%3Cu%3E%20%3Cspan%3E%3C%2Fspan%3E%3C%2Fu%3E%0A%09%3C%2Fp%3E%0A%3C%2Fp%3E%0A%3Cp%3E%0A%09%3Cbr%20%2F%3E%0A%3C%2Fp%3E%0A%3Cp%3E%0A%09%3Cbr%20%2F%3E%0A%3C%2Fp%3E', '2016-04-09 17:28:43', '2016-04-23 16:58:16', '4', '5', '6');

-- ----------------------------
-- Table structure for shiguhouguoinfo
-- ----------------------------
DROP TABLE IF EXISTS `shiguhouguoinfo`;
CREATE TABLE `shiguhouguoinfo` (
  `HG_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '事故后果ID',
  `JB_ID` int(11) NOT NULL DEFAULT '0' COMMENT '事故基本ID',
  `HG_ZD_ShangXing` varchar(15) NOT NULL DEFAULT '' COMMENT '后果中断时间上行',
  `HG_ZD_XiaXing` varchar(15) NOT NULL DEFAULT '' COMMENT '后果中断时间下行',
  `HG_DW_ShangXing` varchar(15) NOT NULL DEFAULT '' COMMENT '后果耽误时间上行',
  `HG_DW_XiaXing` varchar(15) NOT NULL DEFAULT '' COMMENT '后果耽误时间下行',
  `HG_TG_DongCheZu` varchar(15) NOT NULL DEFAULT '' COMMENT '后果脱轨动车组',
  `HG_TG_JiChe` varchar(15) NOT NULL DEFAULT '' COMMENT '后果脱轨机车',
  `HG_TG_KeChe` varchar(15) NOT NULL DEFAULT '' COMMENT '后果脱轨客车',
  `HG_TG_HuoChe` varchar(15) NOT NULL DEFAULT '' COMMENT '后果脱轨货车',
  `HG_SS_DongCheZu` varchar(15) NOT NULL DEFAULT '' COMMENT '后果设备损失动车组',
  `HG_SS_JiChe` varchar(15) NOT NULL DEFAULT '' COMMENT '后果设备损失机车',
  `HG_SS_CheLiang` varchar(15) NOT NULL DEFAULT '' COMMENT '后果设备损失车辆',
  `HG_SS_QiTa` varchar(15) NOT NULL DEFAULT '' COMMENT '后果设备损失其它',
  `HG_ZhiJieSunShi` varchar(10) NOT NULL DEFAULT '' COMMENT '后果直接损失',
  `HG_XZ_JiDongChe` varchar(10) NOT NULL DEFAULT '' COMMENT '后果相撞机动车',
  `HG_XZ_FeiJiDongChe` varchar(10) NOT NULL DEFAULT '' COMMENT '后果相撞非机动车',
  `HG_XZ_XingRen` varchar(10) NOT NULL DEFAULT '' COMMENT '后果相撞行人',
  `HG_XZ_DaoKouQingKuang` varchar(15) NOT NULL DEFAULT '' COMMENT '后果相撞道口情况',
  `HG_XZ_GongTieBingXing` varchar(15) NOT NULL DEFAULT '' COMMENT '后果相撞公铁并行',
  `HG_XZ_FangHuZhaLan` varchar(15) NOT NULL DEFAULT '' COMMENT '后果相撞防护栅栏',
  `HG_XZ_GongTieLiJiao` varchar(15) NOT NULL DEFAULT '' COMMENT '后果相撞公铁立交',
  `HG_XZ_SuDuQuDuan` varchar(15) NOT NULL DEFAULT '' COMMENT '后果相撞速度区段',
  `HG_XZ_QuXianBanJing` varchar(10) NOT NULL DEFAULT '' COMMENT '后果相撞曲线半径',
  `HG_XZ_PoDu` varchar(5) NOT NULL DEFAULT '' COMMENT '后果相撞坡度',
  `HG_SW_XingMing` varchar(25) NOT NULL DEFAULT '' COMMENT '后果伤亡人员姓名',
  `HG_SW_DanWei` varchar(75) NOT NULL DEFAULT '' COMMENT '后果伤亡人员单位',
  `HG_SW_XingBie` varchar(15) NOT NULL DEFAULT '' COMMENT '后果伤亡人员性别',
  `HG_SW_NianLing` varchar(15) NOT NULL DEFAULT '' COMMENT '后果伤亡人员年龄',
  `HG_SW_MinZu` varchar(15) NOT NULL DEFAULT '' COMMENT '后果伤亡人员民族',
  `HG_SW_GongZhong` varchar(25) NOT NULL DEFAULT '' COMMENT '后果伤亡人员工种',
  `HG_SW_ShangHaiChengDu` varchar(25) NOT NULL DEFAULT '' COMMENT '后果伤亡人员伤害程度',
  `HG_SW_RenYuanShuXing` varchar(25) NOT NULL COMMENT '后果伤亡人员人员属性',
  `HG_SiW_LuNei` varchar(10) NOT NULL DEFAULT '' COMMENT '后果死亡人数路内',
  `HG_SiW_LuWai` varchar(10) NOT NULL DEFAULT '' COMMENT '后果死亡人数路外',
  `HG_ZS_LuNei` varchar(10) NOT NULL DEFAULT '' COMMENT '后果重伤人数路内',
  `HG_ZS_LuWai` varchar(10) NOT NULL COMMENT '后果重伤人数路外',
  `HG_QS_LuNei` varchar(10) NOT NULL DEFAULT '' COMMENT '后果轻伤人数路内',
  `HG_QS_LuWai` varchar(10) NOT NULL DEFAULT '' COMMENT '后果轻伤人数路外',
  `HG_ShiGuGaiKuang` varchar(300) NOT NULL DEFAULT '' COMMENT '后果事故概况',
  `HG_Ext1` varchar(255) DEFAULT NULL COMMENT '后果扩展信息1',
  `HG_Ext2` varchar(255) DEFAULT NULL COMMENT '后果扩展信息2',
  `HG_Ext3` varchar(255) DEFAULT NULL COMMENT '后果扩展信息3',
  PRIMARY KEY (`HG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='事故基本信息后果部分';

-- ----------------------------
-- Records of shiguhouguoinfo
-- ----------------------------
INSERT INTO `shiguhouguoinfo` VALUES ('1', '3', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '37', '36', '1', null, null, null);

-- ----------------------------
-- Table structure for shiguhouguoshangwanginfo
-- ----------------------------
DROP TABLE IF EXISTS `shiguhouguoshangwanginfo`;
CREATE TABLE `shiguhouguoshangwanginfo` (
  `SW_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '伤亡ID',
  `JB_ID` int(11) NOT NULL COMMENT '基本ID',
  `SW_Name` varchar(25) NOT NULL DEFAULT '' COMMENT '伤亡人员名称',
  `SW_Unit` varchar(75) NOT NULL DEFAULT '' COMMENT '伤亡人员单位',
  `SW_Sex` varchar(5) NOT NULL DEFAULT '' COMMENT '伤亡人员性别',
  `SW_Age` int(11) NOT NULL DEFAULT '0' COMMENT '伤亡人员年龄',
  `SW_MinZu` varchar(10) NOT NULL DEFAULT '' COMMENT '伤亡人员民族',
  `SW_ShangHaiChengDu` varchar(255) NOT NULL DEFAULT '' COMMENT '伤亡人员伤害程度',
  `SW_RenYuanShuXing` varchar(50) NOT NULL DEFAULT '' COMMENT '伤亡人员属性',
  `SW_Ext1` varchar(255) DEFAULT NULL COMMENT '伤亡人员扩展信息1',
  `SW_Ext2` varchar(255) DEFAULT NULL COMMENT '伤亡人员扩展信息2',
  `SW_Ext3` varchar(255) DEFAULT NULL COMMENT '伤亡人员扩展信息3',
  PRIMARY KEY (`SW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='事故基本信息后果伤亡信息';

-- ----------------------------
-- Records of shiguhouguoshangwanginfo
-- ----------------------------

-- ----------------------------
-- Table structure for shigujibeninfo
-- ----------------------------
DROP TABLE IF EXISTS `shigujibeninfo`;
CREATE TABLE `shigujibeninfo` (
  `JB_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '事故基本情况ID',
  `JB_DD_Ju` varchar(25) NOT NULL DEFAULT '' COMMENT '基本地点局',
  `JB_DD_Xian` varchar(25) NOT NULL DEFAULT '' COMMENT '基本地点线路',
  `JB_DD_XianBie` varchar(15) NOT NULL DEFAULT '' COMMENT '基本地点线别',
  `JB_DD_QiDian` varchar(25) NOT NULL DEFAULT '' COMMENT '基本地点起点',
  `JB_DD_ZhongDian` varchar(25) NOT NULL DEFAULT '' COMMENT '基本地点终点',
  `JB_DD_XingBie` varchar(15) NOT NULL DEFAULT '' COMMENT '基本地点行别',
  `JB_DD_GongLi` varchar(10) NOT NULL DEFAULT '' COMMENT '基本地点公里数',
  `JB_DD_MiShu` varchar(10) NOT NULL DEFAULT '' COMMENT '基本地点米数',
  `JB_DD_Sheng` varchar(10) NOT NULL DEFAULT '' COMMENT '基本地点省份',
  `JB_DD_Shi` varchar(15) NOT NULL DEFAULT '' COMMENT '基本地点市',
  `JB_DD_Qu` varchar(15) NOT NULL DEFAULT '' COMMENT '基本地点区',
  `JB_DD_DanWei` varchar(25) NOT NULL DEFAULT '' COMMENT '基本地点单位',
  `JB_DD_ChangSuo` varchar(25) NOT NULL DEFAULT '' COMMENT '基本地点场所',
  `JB_LC_CheCi` varchar(15) NOT NULL DEFAULT '' COMMENT '基本列车车次',
  `JB_LC_CheHao` varchar(15) NOT NULL DEFAULT '' COMMENT '基本列车车号',
  `JB_LC_QiDian` varchar(25) NOT NULL DEFAULT '' COMMENT '基本列车起点',
  `JB_LC_ZhongDian` varchar(25) NOT NULL DEFAULT '' COMMENT '基本列车终点',
  `JB_LC_PeiShu` varchar(25) NOT NULL DEFAULT '' COMMENT '基本列车配属',
  `JB_LC_DanDang` varchar(25) NOT NULL DEFAULT '' COMMENT '基本列车担当',
  `JB_LC_LvKe` varchar(15) NOT NULL DEFAULT '' COMMENT '基本列车旅客',
  `JB_JC_XingHao` varchar(15) NOT NULL DEFAULT '' COMMENT '基本机车型号',
  `JB_JC_BianHao` varchar(15) NOT NULL DEFAULT '' COMMENT '基本机车编号',
  `JB_JC_PeiShu` varchar(15) NOT NULL DEFAULT '' COMMENT '基本机车配属',
  `JB_JC_DanDang` varchar(15) NOT NULL DEFAULT '' COMMENT '基本机车担当',
  `JB_JC_SuDu` varchar(15) NOT NULL DEFAULT '' COMMENT '基本机车速度',
  `JB_JC_GongDian` varchar(25) NOT NULL DEFAULT '' COMMENT '基本机车供电',
  `JB_JC_XinHao` varchar(15) NOT NULL DEFAULT '' COMMENT '基本机车信号',
  `JB_BZ_DunWei` varchar(10) NOT NULL DEFAULT '' COMMENT '基本编组吨位',
  `JB_BZ_ShuLiang` varchar(10) NOT NULL DEFAULT '' COMMENT '基本编组车辆数量',
  `JB_BZ_JiChang` varchar(10) NOT NULL DEFAULT '' COMMENT '基本编组计长',
  `JB_BZ_ZhongChe` varchar(10) NOT NULL DEFAULT '' COMMENT '基本编组重车',
  `JB_BZ_KongChe` varchar(10) NOT NULL DEFAULT '' COMMENT '基本编组空车',
  `JB_BZ_LieWei` varchar(10) NOT NULL DEFAULT '' COMMENT '基本编组列尾',
  `JB_BZ_WeiXianPin` varchar(10) NOT NULL DEFAULT '' COMMENT '基本编组危险品',
  `JB_BZ_ChaoXianChe` varchar(10) NOT NULL DEFAULT '' COMMENT '基本编组超限车',
  `JB_GXR_SiJi` varchar(10) NOT NULL DEFAULT '' COMMENT '基本关系人司机',
  `JB_GXR_FuSiJi` varchar(10) NOT NULL DEFAULT '' COMMENT '基本关系人副司机',
  `JB_GXR_YunZhuanCheZhang` varchar(10) NOT NULL DEFAULT '' COMMENT '基本关系人运转车长',
  `JB_GXR_LieCheZhang` varchar(10) NOT NULL DEFAULT '' COMMENT '基本关系人列车长',
  `JB_GXR_ZhiBanYuan` varchar(10) NOT NULL DEFAULT '' COMMENT '基本关系人值班员',
  `JB_TianQi` varchar(15) NOT NULL DEFAULT '' COMMENT '基本天气',
  `JB_ShiGuXingZhi` varchar(25) NOT NULL DEFAULT '' COMMENT '基本事故性质',
  `JB_FS_ShangXing` timestamp NULL DEFAULT NULL COMMENT '基本发生时间上行',
  `JB_FS_XiaXing` timestamp NULL DEFAULT NULL COMMENT '基本发生时间下行',
  `JB_FJ_ShangXing` timestamp NULL DEFAULT NULL COMMENT '基本复旧时间上行',
  `JB_FJ_XiaXing` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '基本复旧时间下行',
  `JB_KT_ShangXing` timestamp NULL DEFAULT NULL COMMENT '基本开通时间上行',
  `JB_KT_XiaXing` timestamp NULL DEFAULT NULL COMMENT '基本开通时间下行',
  `JB_CreatTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '基本信息创建时间',
  `JB_UpdateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '基本信息修改时间',
  `JB_ZB_X` decimal(18,10) DEFAULT NULL COMMENT '基本坐标X',
  `JB_ZB_Y` decimal(18,10) DEFAULT NULL COMMENT '基本坐标Y',
  `JB_ZB_Z` decimal(18,10) DEFAULT NULL COMMENT '基本坐标Z',
  `JB_Ext1` varchar(255) DEFAULT NULL COMMENT '基本扩展信息1',
  `JB_Ext2` varchar(255) DEFAULT NULL COMMENT '基本扩展信息2',
  `JB_Ext3` varchar(255) DEFAULT NULL COMMENT '基本扩展信息3',
  PRIMARY KEY (`JB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='事故基本信息基本部分';

-- ----------------------------
-- Records of shigujibeninfo
-- ----------------------------
INSERT INTO `shigujibeninfo` VALUES ('3', '西安铁路局', '陇海线', '繁忙', '窑村', '临潼', '上行', '1048', '528', '陕西', '西安', '临潼', '西安车务段', '区间', 'Z20', '15', '西安', '北京西', '西安客车车辆段', '西安客运段', '1158', '和谐D3D', '329', '西安', '西安', '120', '电气化区段', '自动闭塞', '1062', '18', '43.2', '是', '否', '否', '否', '否', '席志平', '无', '无', '无', '宋万群', '雨', '列出脱轨', '2016-04-15 16:36:00', '2016-04-29 13:39:00', '2016-04-28 14:36:00', '2016-04-12 16:39:00', '2016-04-29 19:40:00', '2016-04-26 16:39:00', '2016-04-15 14:26:08', '2016-04-25 10:29:40', '109.2758220000', '34.0871950000', null, null, null, null);
INSERT INTO `shigujibeninfo` VALUES ('4', 'aa', 'bb', '', 'cc', 'dd', 'ee', 'dddd', 'ff', '', '', '', '', '', '22', '', '', '', '', '', '', '33', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null, '2016-04-25 10:48:48', '2016-04-25 10:55:41', '108.8197690000', '34.1930260000', null, null, null, null);
INSERT INTO `shigujibeninfo` VALUES ('5', '1', '2', '', '3', '4', '5', '6', '7', '', '', '', '', '', '8', '', '', '', '', '', '', '9', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, null, null, null, null, null, '2016-04-25 10:58:01', '2016-04-25 13:08:25', '109.5136920000', '34.3228750000', null, null, null, null);

-- ----------------------------
-- Table structure for shiguzerendanweiinfo
-- ----------------------------
DROP TABLE IF EXISTS `shiguzerendanweiinfo`;
CREATE TABLE `shiguzerendanweiinfo` (
  `ZRDW_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '责任单位ID',
  `JB_ID` int(11) NOT NULL DEFAULT '0' COMMENT '基本ID',
  `ZRDW_DanWei` varchar(75) NOT NULL DEFAULT '' COMMENT '责任单位名称',
  `ZRDW_DanWeiShuXing` varchar(25) NOT NULL DEFAULT '' COMMENT '责任单位属性',
  `ZRDW_BuMen` varchar(75) NOT NULL DEFAULT '' COMMENT '责任单位部门',
  `ZRDW_ChengDu` varchar(25) NOT NULL DEFAULT '' COMMENT '责任单位程度',
  `ZRDW_Ext1` varchar(255) DEFAULT NULL COMMENT '责任单位扩展信息1',
  `ZRDW_Ext2` varchar(255) DEFAULT NULL COMMENT '责任单位扩展信息2',
  `ZRDW_Ext3` varchar(255) DEFAULT NULL COMMENT '责任单位扩展信息3',
  PRIMARY KEY (`ZRDW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='事故基本信息责任单位信息';

-- ----------------------------
-- Records of shiguzerendanweiinfo
-- ----------------------------

-- ----------------------------
-- Table structure for shiguzereninfo
-- ----------------------------
DROP TABLE IF EXISTS `shiguzereninfo`;
CREATE TABLE `shiguzereninfo` (
  `ZR_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '责任ID',
  `JB_ID` int(11) NOT NULL DEFAULT '0' COMMENT '基本ID',
  `ZR_ZeRenDanWei` varchar(75) NOT NULL DEFAULT '' COMMENT '责任单位',
  `ZR_ZeRenDanWeiShuXing` varchar(75) NOT NULL DEFAULT '' COMMENT '责任单位属性',
  `ZR_ZeRenBuMen` varchar(75) NOT NULL DEFAULT '' COMMENT '责任部门',
  `ZR_ZeRenChengDu` varchar(75) NOT NULL DEFAULT '' COMMENT '责任程度',
  `ZR_YuanYinLeiBie` varchar(15) NOT NULL DEFAULT '' COMMENT '原因类别',
  `ZR_ShiGuLeiBie` varchar(15) NOT NULL DEFAULT '' COMMENT '事故类别',
  `ZR_ShiGuDengJi` varchar(15) NOT NULL DEFAULT '' COMMENT '事故等级',
  `ZR_ZhiBanJianCha` varchar(25) NOT NULL DEFAULT '' COMMENT '值班监察',
  `ZR_TianBaoShiJian` timestamp NULL DEFAULT NULL COMMENT '填报时间',
  `ZR_BaoGaoCiShu` varchar(10) NOT NULL DEFAULT '' COMMENT '报告次数',
  `ZR_ShiGuDiaoChaBaoGao` varchar(25) NOT NULL DEFAULT '' COMMENT '事故调查报告',
  `ZR_XianChangDianChaZiLiao` varchar(25) NOT NULL DEFAULT '' COMMENT '现场调查有关资料',
  `ZR_SunShiJiSuanZiLiao` varchar(25) NOT NULL DEFAULT '' COMMENT '损失计算资料',
  `ZR_ShiGuRenDingShu` varchar(25) NOT NULL DEFAULT '' COMMENT '事故认定书',
  `ZR_AnJianBaoEr` varchar(25) NOT NULL DEFAULT '' COMMENT '安监报二',
  `ZR_QiTa` varchar(25) NOT NULL DEFAULT '' COMMENT '其它',
  `ZR_TePaiBanDiaoChaBaoGao` varchar(25) NOT NULL DEFAULT '' COMMENT '特派办调查报告',
  `ZR_SheDuDiaoChaBaoGao` varchar(25) NOT NULL DEFAULT '' COMMENT '深度调查报告',
  `ZR_Ext1` varchar(255) DEFAULT NULL COMMENT '责任扩展信息1',
  `ZR_Ext2` varchar(255) DEFAULT NULL COMMENT '责任扩展信息2',
  `ZR_Ext3` varchar(255) DEFAULT NULL COMMENT '责任扩展信息3',
  PRIMARY KEY (`ZR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='事故基本信息责任部分';

-- ----------------------------
-- Records of shiguzereninfo
-- ----------------------------
INSERT INTO `shiguzereninfo` VALUES ('1', '3', '2', '3', '4', '5', '6', '7', '8', '9', '2016-04-17 03:43:00', '11', '12', '13', '14', '15', '16', '17', '18', '19', null, null, null);

-- ----------------------------
-- Table structure for systemloginfo
-- ----------------------------
DROP TABLE IF EXISTS `systemloginfo`;
CREATE TABLE `systemloginfo` (
  `SL_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统日志标识ID',
  `SL_UserID` int(11) NOT NULL DEFAULT '0' COMMENT '操作人员Id',
  `SL_UserName` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人员姓名',
  `SL_Type` char(25) NOT NULL DEFAULT '' COMMENT '日志类型',
  `SL_Desc` varchar(3000) NOT NULL DEFAULT '' COMMENT '日志内容',
  `SL_CreateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '日志创建时间',
  `SL_Ext1` varchar(255) DEFAULT NULL COMMENT '日志扩展1',
  `SL_Ext2` varchar(255) DEFAULT NULL COMMENT '日志扩展2',
  `SL_Ext3` varchar(255) DEFAULT NULL COMMENT '日志扩展3',
  PRIMARY KEY (`SL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='系统日志信息';

-- ----------------------------
-- Records of systemloginfo
-- ----------------------------
INSERT INTO `systemloginfo` VALUES ('1', '1', '管理员', '删除', '系统参数 DD_ID:2, DD_Type:测试, DD_Value:测试2, DD_Desc:测试2, DD_Status:\'\', DD_Ext1:1, DD_Ext2:2, DD_Ext3:3', '2016-04-09 15:09:48', null, null, null);
INSERT INTO `systemloginfo` VALUES ('2', '1', '管理员', '新增', '系统参数 DD_ID:3, DD_Type:测试, DD_Value:ceshi111, DD_Desc:ceshi111, DD_Ext1:11, DD_Ext2:22, DD_Ext3:33', '2016-04-09 15:25:16', null, null, null);
INSERT INTO `systemloginfo` VALUES ('3', '1', '管理员', '修改', '系统参数 DD_ID:3', '2016-04-09 15:28:59', null, null, null);
INSERT INTO `systemloginfo` VALUES ('4', '1', '管理员', '修改', '系统参数 DD_ID:1, DD_Ext1:\'\' -> 1, DD_Ext2:\'\' -> 2, DD_Ext3:\'\' -> 3', '2016-04-09 15:30:43', null, null, null);
INSERT INTO `systemloginfo` VALUES ('5', '1', '管理员', '修改', '系统参数 DD_ID:1', '2016-04-09 15:31:57', null, null, null);
INSERT INTO `systemloginfo` VALUES ('6', '1', '管理员', '新增', '系统参数 DD_ID:4, DD_Type:文档类别, DD_Value:规章制度, DD_Desc:规章制度, DD_Ext1:\'\', DD_Ext2:\'\', DD_Ext3:\'\'', '2016-04-09 16:53:23', null, null, null);
INSERT INTO `systemloginfo` VALUES ('7', '1', '管理员', '删除', '系统参数 DD_ID:3, DD_Type:测试, DD_Value:ceshi111, DD_Desc:ceshi111, DD_Ext1:11, DD_Ext2:22, DD_Ext3:33', '2016-04-09 16:53:28', null, null, null);
INSERT INTO `systemloginfo` VALUES ('8', '1', '管理员', '删除', '系统参数 DD_ID:1, DD_Type:测试, DD_Value:测试1, DD_Desc:测试1, DD_Ext1:1, DD_Ext2:2, DD_Ext3:3', '2016-04-09 16:53:30', null, null, null);
INSERT INTO `systemloginfo` VALUES ('9', '1', '管理员', '新增', '系统参数 DD_ID:5, DD_Type:文档类别, DD_Value:电报, DD_Desc:电报, DD_Ext1:\'\', DD_Ext2:\'\', DD_Ext3:\'\'', '2016-04-09 16:53:50', null, null, null);
INSERT INTO `systemloginfo` VALUES ('10', '1', '管理员', '新增', '系统参数 DD_ID:6, DD_Type:文档类别, DD_Value:技术文档, DD_Desc:技术文档, DD_Ext1:\'\', DD_Ext2:\'\', DD_Ext3:\'\'', '2016-04-09 16:54:04', null, null, null);
INSERT INTO `systemloginfo` VALUES ('11', '1', '管理员', '新增', '系统参数 DD_ID:7, DD_Type:文档类别, DD_Value:事故案例, DD_Desc:事故案例, DD_Ext1:\'\', DD_Ext2:\'\', DD_Ext3:\'\'', '2016-04-09 16:54:18', null, null, null);
INSERT INTO `systemloginfo` VALUES ('12', '1', '管理员', '新增', '系统参数 D_ID:1, D_Type:电报, D_Head:电报001, D_Subhead:副标题是什么了, D_Content:这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是.这事测试内容,嗯,就是., D_CreateTime:2016/4/9 17:28:12, D_UpdateTime:2016/4/9 17:28:12, D_Ext1:11, D_Ext2:22, D_Ext3:33', '2016-04-09 17:28:13', null, null, null);
INSERT INTO `systemloginfo` VALUES ('13', '1', '管理员', '新增', '系统参数 D_ID:2, D_Type:规章制度, D_Head:1, D_Subhead:2, D_Content:3, D_CreateTime:2016/4/9 17:28:42, D_UpdateTime:2016/4/9 17:28:42, D_Ext1:4, D_Ext2:5, D_Ext3:6', '2016-04-09 17:28:43', null, null, null);
INSERT INTO `systemloginfo` VALUES ('14', '1', '管理员', '修改', '系统参数 D_ID:2, D_Content:3 -> 33333333, D_UpdateTime:2016/4/9 17:28:43 -> 2016/4/9 17:38:06', '2016-04-09 17:38:07', null, null, null);
INSERT INTO `systemloginfo` VALUES ('15', '1', '管理员', '新增', '系统参数 D_ID:3, D_Type:技术文档, D_Head:1, D_Subhead:w, D_Content:ds, D_CreateTime:2016/4/9 17:39:32, D_UpdateTime:2016/4/9 17:39:32, D_Ext1:DSA, D_Ext2:FX, D_Ext3:X', '2016-04-09 17:39:33', null, null, null);
INSERT INTO `systemloginfo` VALUES ('16', '1', '管理员', '删除', '系统参数 D_ID:3, D_Type:技术文档, D_Head:1, D_Subhead:w, D_Content:ds, D_CreateTime:2016/4/9 17:39:33, D_UpdateTime:2016/4/9 17:39:33, D_Ext1:DSA, D_Ext2:FX, D_Ext3:X', '2016-04-09 17:40:02', null, null, null);
INSERT INTO `systemloginfo` VALUES ('17', '1', '管理员', '删除', '系统参数 User_ID:2, User_No:lisi002, User_Name:李四, User_Phone:15012345678, User_Uint:单位, User_Department:部门, User_Pwd:123456, User_Role:记录员, User_Status:正常, User_CreateTime:2016/4/6 10:04:34, User_RoleID:2, User_Ext1:\'\', User_Ext2:\'\', User_Ext3:\'\'', '2016-04-11 17:03:27', null, null, null);
INSERT INTO `systemloginfo` VALUES ('18', '1', '管理员', '删除', '系统参数 User_ID:1, User_No:G001, User_Name:管理员, User_Phone:18099998888, User_Uint:单位, User_Department:部门, User_Pwd:123456, User_Role:管理员, User_Status:正常, User_CreateTime:2016/4/6 10:03:49, User_RoleID:1, User_Ext1:\'\', User_Ext2:\'\', User_Ext3:\'\'', '2016-04-11 17:05:22', null, null, null);
INSERT INTO `systemloginfo` VALUES ('19', '5', '李四', '修改', '事故基本信息 JB_ID:3, JB_ID:3 -> 3, JB_FS_ShangXing:2016/4/15 16:36:00 -> 2016/4/15 16:36:00, JB_FS_XiaXing:2016/4/29 13:39:00 -> 2016/4/29 13:39:00, JB_FJ_ShangXing:2016/4/28 14:36:00 -> 2016/4/28 14:36:00, JB_FJ_XiaXing:2016/4/12 16:39:00 -> 2016/4/12 16:39:00, JB_KT_ShangXing:2016/4/29 19:40:00 -> 2016/4/29 19:40:00, JB_KT_XiaXing:2016/4/26 16:39:00 -> 2016/4/26 16:39:00, JB_CreatTime:2016/4/15 14:26:08 -> 2016/4/15 14:26:08, JB_UpdateTime:2016/4/25 1:33:01 -> 2016/4/25 1:38:25, JB_ZB_X:108.9399270000 -> 108.937052, JB_ZB_Y:34.2952030000 -> 34.305223', '2016-04-25 01:38:26', null, null, null);
INSERT INTO `systemloginfo` VALUES ('20', '5', '李四', '修改', '系统参数 DD_ID:16, DD_Value:aaaa -> 佛挡杀佛打算', '2016-04-25 01:53:05', null, null, null);
INSERT INTO `systemloginfo` VALUES ('21', '5', '李四', '修改', '事故基本信息 JB_ID:3, JB_UpdateTime:2016/4/25 1:38:26 -> 2016/4/25 1:53:24, JB_ZB_X:108.9370520000 -> 108.937627, JB_ZB_Y:34.3052230000 -> 34.287568', '2016-04-25 01:53:25', null, null, null);
INSERT INTO `systemloginfo` VALUES ('22', '5', '李四', '修改', '事故基本信息 JB_ID:3, JB_UpdateTime:2016/4/25 1:53:25 -> 2016/4/25 9:37:57, JB_ZB_X:108.9376270000 -> 109.248225, JB_ZB_Y:34.2875680000 -> 34.157963', '2016-04-25 09:37:58', null, null, null);
INSERT INTO `systemloginfo` VALUES ('23', '5', '李四', '修改', '事故基本信息 JB_ID:3, JB_UpdateTime:2016/4/25 9:37:58 -> 2016/4/25 10:16:07, JB_ZB_X:109.2482250000 -> 109.006186, JB_ZB_Y:34.1579630000 -> 34.248248', '2016-04-25 10:16:08', null, null, null);
INSERT INTO `systemloginfo` VALUES ('24', '5', '李四', '修改', '事故基本信息 JB_ID:3, JB_UpdateTime:2016/4/25 10:16:08 -> 2016/4/25 10:18:39, JB_ZB_X:109.0061860000 -> 109.163713, JB_ZB_Y:34.2482480000 -> 34.150315', '2016-04-25 10:18:40', null, null, null);
INSERT INTO `systemloginfo` VALUES ('25', '5', '李四', '修改', '事故基本信息 JB_ID:3, JB_UpdateTime:2016/4/25 10:18:40 -> 2016/4/25 10:20:08, JB_ZB_X:109.1637130000 -> 109.136117, JB_ZB_Y:34.1503150000 -> 34.21482', '2016-04-25 10:20:09', null, null, null);
INSERT INTO `systemloginfo` VALUES ('26', '5', '李四', '修改', '事故基本信息 JB_ID:3, JB_UpdateTime:2016/4/25 10:20:08 -> 2016/4/25 10:20:17, JB_ZB_X:109.1361170000 -> 109.093573, JB_ZB_Y:34.2148200000 -> 34.20049', '2016-04-25 10:20:18', null, null, null);
INSERT INTO `systemloginfo` VALUES ('27', '5', '李四', '修改', '事故基本信息 JB_ID:3, JB_UpdateTime:2016/4/25 10:20:18 -> 2016/4/25 10:20:31, JB_ZB_X:109.0935730000 -> 109.143591, JB_ZB_Y:34.2004900000 -> 34.1723', '2016-04-25 10:20:32', null, null, null);
INSERT INTO `systemloginfo` VALUES ('28', '5', '李四', '修改', '事故基本信息 JB_ID:3, JB_UpdateTime:2016/4/25 10:20:32 -> 2016/4/25 10:20:59, JB_ZB_X:109.1435910000 -> 109.187285, JB_ZB_Y:34.1723000000 -> 34.138364', '2016-04-25 10:20:59', null, null, null);
INSERT INTO `systemloginfo` VALUES ('29', '5', '李四', '修改', '事故基本信息 JB_ID:3, JB_UpdateTime:2016/4/25 10:20:59 -> 2016/4/25 10:29:40, JB_ZB_X:109.1872850000 -> 109.275822, JB_ZB_Y:34.1383640000 -> 34.087195', '2016-04-25 10:29:40', null, null, null);
INSERT INTO `systemloginfo` VALUES ('30', '5', '李四', '新增', '事故基本信息 JB_ID:4, JB_DD_Ju:aa, JB_DD_Xian:bb, JB_DD_XianBie:\'\', JB_DD_QiDian:cc, JB_DD_ZhongDian:dd, JB_DD_XingBie:ee, JB_DD_GongLi:dddd, JB_DD_MiShu:ff, JB_DD_Sheng:\'\', JB_DD_Shi:\'\', JB_DD_Qu:\'\', JB_DD_DanWei:\'\', JB_DD_ChangSuo:\'\', JB_LC_CheCi:22, JB_LC_CheHao:\'\', JB_LC_QiDian:\'\', JB_LC_ZhongDian:\'\', JB_LC_PeiShu:\'\', JB_LC_DanDang:\'\', JB_LC_LvKe:\'\', JB_JC_XingHao:33, JB_JC_BianHao:\'\', JB_JC_PeiShu:\'\', JB_JC_DanDang:\'\', JB_JC_SuDu:\'\', JB_JC_GongDian:\'\', JB_JC_XinHao:\'\', JB_BZ_DunWei:\'\', JB_BZ_ShuLiang:\'\', JB_BZ_JiChang:\'\', JB_BZ_ZhongChe:\'\', JB_BZ_KongChe:\'\', JB_BZ_LieWei:\'\', JB_BZ_WeiXianPin:\'\', JB_BZ_ChaoXianChe:\'\', JB_GXR_SiJi:\'\', JB_GXR_FuSiJi:\'\', JB_GXR_YunZhuanCheZhang:\'\', JB_GXR_LieCheZhang:\'\', JB_GXR_ZhiBanYuan:\'\', JB_TianQi:\'\', JB_ShiGuXingZhi:\'\', JB_FS_ShangXing:\'\', JB_FS_XiaXing:\'\', JB_FJ_ShangXing:\'\', JB_FJ_XiaXing:\'\', JB_KT_ShangXing:\'\', JB_KT_XiaXing:\'\', JB_CreatTime:2016/4/25 10:48:48, JB_UpdateTime:2016/4/25 10:48:48, JB_ZB_X:\'\', JB_ZB_Y:\'\', JB_ZB_Z:\'\', JB_Ext1:\'\', JB_Ext2:\'\', JB_Ext3:\'\'', '2016-04-25 10:48:48', null, null, null);
INSERT INTO `systemloginfo` VALUES ('31', '5', '李四', '修改', '事故基本信息 JB_ID:4, JB_UpdateTime:2016/4/25 10:48:48 -> 2016/4/25 10:55:40, JB_ZB_X:\'\' -> 108.819769, JB_ZB_Y:\'\' -> 34.193026', '2016-04-25 10:55:41', null, null, null);
INSERT INTO `systemloginfo` VALUES ('32', '5', '李四', '新增', '事故基本信息 JB_ID:5, JB_DD_Ju:1, JB_DD_Xian:2, JB_DD_XianBie:\'\', JB_DD_QiDian:3, JB_DD_ZhongDian:4, JB_DD_XingBie:5, JB_DD_GongLi:6, JB_DD_MiShu:7, JB_DD_Sheng:\'\', JB_DD_Shi:\'\', JB_DD_Qu:\'\', JB_DD_DanWei:\'\', JB_DD_ChangSuo:\'\', JB_LC_CheCi:8, JB_LC_CheHao:\'\', JB_LC_QiDian:\'\', JB_LC_ZhongDian:\'\', JB_LC_PeiShu:\'\', JB_LC_DanDang:\'\', JB_LC_LvKe:\'\', JB_JC_XingHao:9, JB_JC_BianHao:\'\', JB_JC_PeiShu:\'\', JB_JC_DanDang:\'\', JB_JC_SuDu:\'\', JB_JC_GongDian:\'\', JB_JC_XinHao:\'\', JB_BZ_DunWei:\'\', JB_BZ_ShuLiang:\'\', JB_BZ_JiChang:\'\', JB_BZ_ZhongChe:\'\', JB_BZ_KongChe:\'\', JB_BZ_LieWei:\'\', JB_BZ_WeiXianPin:\'\', JB_BZ_ChaoXianChe:\'\', JB_GXR_SiJi:\'\', JB_GXR_FuSiJi:\'\', JB_GXR_YunZhuanCheZhang:\'\', JB_GXR_LieCheZhang:\'\', JB_GXR_ZhiBanYuan:\'\', JB_TianQi:\'\', JB_ShiGuXingZhi:\'\', JB_FS_ShangXing:\'\', JB_FS_XiaXing:\'\', JB_FJ_ShangXing:\'\', JB_FJ_XiaXing:\'\', JB_KT_ShangXing:\'\', JB_KT_XiaXing:\'\', JB_CreatTime:2016/4/25 10:58:00, JB_UpdateTime:2016/4/25 10:58:00, JB_ZB_X:\'\', JB_ZB_Y:\'\', JB_ZB_Z:\'\', JB_Ext1:\'\', JB_Ext2:\'\', JB_Ext3:\'\'', '2016-04-25 10:58:01', null, null, null);
INSERT INTO `systemloginfo` VALUES ('33', '5', '李四', '修改', '事故基本信息 JB_ID:5, JB_UpdateTime:2016/4/25 10:58:01 -> 2016/4/25 11:14:44, JB_ZB_X:\'\' -> 108.977871, JB_ZB_Y:\'\' -> 34.158142', '2016-04-25 11:14:45', null, null, null);
INSERT INTO `systemloginfo` VALUES ('34', '5', '李四', '修改', '事故基本信息 JB_ID:5, JB_UpdateTime:2016/4/25 11:14:45 -> 2016/4/25 11:46:17, JB_ZB_X:108.9778710000 -> 108.526562, JB_ZB_Y:34.1581420000 -> 33.979195', '2016-04-25 11:46:17', null, null, null);
INSERT INTO `systemloginfo` VALUES ('35', '5', '李四', '修改', '事故基本信息 JB_ID:5, JB_UpdateTime:2016/4/25 11:46:17 -> 2016/4/25 12:55:26, JB_ZB_X:108.5265620000 -> 109.095153, JB_ZB_Y:33.9791950000 -> 34.404881', '2016-04-25 12:55:27', null, null, null);
INSERT INTO `systemloginfo` VALUES ('36', '5', '李四', '修改', '事故基本信息 JB_ID:5, JB_UpdateTime:2016/4/25 12:55:27 -> 2016/4/25 12:55:48, JB_ZB_X:109.0951530000 -> 108.892208, JB_ZB_Y:34.4048810000 -> 34.37676', '2016-04-25 12:55:49', null, null, null);
INSERT INTO `systemloginfo` VALUES ('37', '5', '李四', '修改', '事故基本信息 JB_ID:5, JB_UpdateTime:2016/4/25 12:55:49 -> 2016/4/25 13:08:25, JB_ZB_X:108.8922080000 -> 109.513692, JB_ZB_Y:34.3767600000 -> 34.322875', '2016-04-25 13:08:26', null, null, null);
INSERT INTO `systemloginfo` VALUES ('38', '5', '管理员', '登录', '管理员 登录了系统.', '2016-04-25 15:24:04', null, null, null);
INSERT INTO `systemloginfo` VALUES ('39', '5', '管理员', '退出', '管理员 退出了系统.', '2016-04-25 15:27:52', null, null, null);
INSERT INTO `systemloginfo` VALUES ('40', '5', '管理员', '登录', '管理员 登录了系统.', '2016-04-25 15:28:13', null, null, null);
INSERT INTO `systemloginfo` VALUES ('41', '5', '管理员', '退出', '管理员 退出了系统.', '2016-04-25 15:28:16', null, null, null);
INSERT INTO `systemloginfo` VALUES ('42', '5', '管理员', '登录', '管理员 登录了系统.', '2016-04-25 15:44:52', null, null, null);
INSERT INTO `systemloginfo` VALUES ('43', '5', '管理员', '退出', '管理员 退出了系统.', '2016-04-25 15:44:57', null, null, null);
INSERT INTO `systemloginfo` VALUES ('44', '5', '管理员', '登录', '管理员 登录了系统.', '2016-04-25 15:44:58', null, null, null);
INSERT INTO `systemloginfo` VALUES ('45', '5', '管理员', '登录', '管理员 登录了系统.', '2016-04-25 15:52:32', null, null, null);
INSERT INTO `systemloginfo` VALUES ('46', '5', '管理员', '登录', '管理员 登录了系统.', '2016-04-25 16:17:00', null, null, null);
INSERT INTO `systemloginfo` VALUES ('47', '5', '管理员', '登录', '管理员 登录了系统.', '2016-04-25 17:10:38', null, null, null);
INSERT INTO `systemloginfo` VALUES ('48', '5', '管理员', '登录', '管理员 登录了系统.', '2016-04-25 17:14:28', null, null, null);
INSERT INTO `systemloginfo` VALUES ('49', '5', '管理员', '修改', '用户管理 重置用户 5 密码', '2016-04-25 17:23:37', null, null, null);
INSERT INTO `systemloginfo` VALUES ('50', '5', '管理员', '修改', '用户管理 重置用户 5 密码.', '2016-04-25 17:27:38', null, null, null);
INSERT INTO `systemloginfo` VALUES ('51', '5', '管理员', '退出', '管理员 退出了系统.', '2016-04-25 17:27:51', null, null, null);
INSERT INTO `systemloginfo` VALUES ('52', '5', '管理员', '登录', '管理员 登录了系统.', '2016-04-25 17:28:02', null, null, null);
INSERT INTO `systemloginfo` VALUES ('53', '5', '管理员', '退出', '管理员 退出了系统.', '2016-04-25 17:29:59', null, null, null);
INSERT INTO `systemloginfo` VALUES ('54', '5', '管理员', '登录', '管理员 登录了系统.', '2016-04-25 17:30:03', null, null, null);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `User_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `User_No` varchar(20) NOT NULL COMMENT '用户编号',
  `User_Name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `User_Phone` varchar(25) NOT NULL DEFAULT '' COMMENT '用户电话',
  `User_Uint` varchar(100) NOT NULL DEFAULT '' COMMENT '用户所在单位',
  `User_Department` varchar(100) NOT NULL DEFAULT '' COMMENT '用户所在部门',
  `User_Pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '用户密码',
  `User_Role` varchar(100) NOT NULL DEFAULT '' COMMENT '用户角色',
  `User_Status` varchar(10) NOT NULL DEFAULT '正常' COMMENT '用户状态(正常,已删除)',
  `User_CreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
  `User_RoleID` int(11) NOT NULL DEFAULT '1' COMMENT '用户角色ID',
  `User_Ext1` varchar(255) DEFAULT NULL COMMENT '用户扩展信息1',
  `User_Ext2` varchar(255) DEFAULT NULL COMMENT '用户扩展信息2',
  `User_Ext3` varchar(255) DEFAULT NULL COMMENT '用户扩展信息3',
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='人员信息';

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('4', 'zhangsan001', '张三', '18098987878', '机关', '段领导', '4QrcOUm6Wau+VuBX8g+IPg==', '段长', '', '2016-04-11 17:25:18', '1', '', null, null);
INSERT INTO `userinfo` VALUES ('5', 'admin', '管理员', '18256457845', '管理员', '管理员', '4QrcOUm6Wau+VuBX8g+IPg==', '管理员', '', '2016-04-11 19:52:55', '0', '是', null, null);
INSERT INTO `userinfo` VALUES ('6', 'ddd', 'dd', '029-32323333', '机关', '段领导', '4QrcOUm6Wau+VuBX8g+IPg==', '书记', '', '2016-04-23 11:35:45', '1', '是', null, null);

-- ----------------------------
-- View structure for v_shigu
-- ----------------------------
DROP VIEW IF EXISTS `v_shigu`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_shigu` AS select 
jb.*
,HG_ID 
,HG_ZD_ShangXing
,HG_ZD_XiaXing
,HG_DW_ShangXing
,HG_DW_XiaXing
,HG_TG_DongCheZu
,HG_TG_JiChe
,HG_TG_KeChe
,HG_TG_HuoChe
,HG_SS_DongCheZu
,HG_SS_JiChe
,HG_SS_CheLiang
,HG_SS_QiTa
,HG_ZhiJieSunShi
,HG_XZ_JiDongChe
,HG_XZ_FeiJiDongChe
,HG_XZ_XingRen
,HG_XZ_DaoKouQingKuang
,HG_XZ_GongTieBingXing
,HG_XZ_FangHuZhaLan
,HG_XZ_GongTieLiJiao
,HG_XZ_SuDuQuDuan
,HG_XZ_QuXianBanJing
,HG_XZ_PoDu
,HG_SW_XingMing
,HG_SW_DanWei
,HG_SW_XingBie
,HG_SW_NianLing
,HG_SW_MinZu
,HG_SW_GongZhong
,HG_SW_ShangHaiChengDu
,HG_SW_RenYuanShuXing
,HG_SiW_LuNei
,HG_SiW_LuWai
,HG_ZS_LuNei
,HG_ZS_LuWai
,HG_QS_LuNei
,HG_QS_LuWai
,HG_ShiGuGaiKuang
,HG_Ext1
,HG_Ext2
,HG_Ext3
,ZR_ID 
,ZR_ZeRenDanWei
,ZR_ZeRenDanWeiShuXing
,ZR_ZeRenBuMen
,ZR_ZeRenChengDu
,ZR_YuanYinLeiBie
,ZR_ShiGuLeiBie
,ZR_ShiGuDengJi
,ZR_ZhiBanJianCha
,ZR_TianBaoShiJian
,ZR_BaoGaoCiShu
,ZR_ShiGuDiaoChaBaoGao
,ZR_XianChangDianChaZiLiao
,ZR_SunShiJiSuanZiLiao
,ZR_ShiGuRenDingShu
,ZR_AnJianBaoEr
,ZR_QiTa
,ZR_TePaiBanDiaoChaBaoGao
,ZR_SheDuDiaoChaBaoGao
,ZR_Ext1
,ZR_Ext2
,ZR_Ext3
from sgdc.shigujibeninfo jb
left join sgdc.shiguhouguoinfo hg on (jb.JB_ID = hg.JB_ID)
left join sgdc.shiguzereninfo zr on (jb.JB_ID = zr.JB_ID) ;
