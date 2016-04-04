/*
Navicat MySQL Data Transfer

Source Server         : my56
Source Server Version : 50623
Source Host           : 127.0.0.1:3308
Source Database       : sgdc

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2016-04-05 01:35:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for datadictionaryinfo
-- ----------------------------
DROP TABLE IF EXISTS `datadictionaryinfo`;
CREATE TABLE `datadictionaryinfo` (
  `DD_ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '数据字典ID',
  `DD_Type` char(100) NOT NULL DEFAULT '' COMMENT '数据字典类型',
  `DD_Value` char(255) NOT NULL DEFAULT '' COMMENT '数据字典值',
  `DD_Desc` char(255) NOT NULL DEFAULT '' COMMENT '数据字典描述',
  `DD_Ext1` varchar(255) DEFAULT NULL COMMENT '数据字典扩展信息1',
  `DD_Ext2` varchar(255) DEFAULT NULL COMMENT '数据字典扩展信息2',
  `DD_Ext3` varchar(255) DEFAULT NULL COMMENT '数据字典扩展信息3',
  PRIMARY KEY (`DD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of datadictionaryinfo
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='事故基本信息后果部分';

-- ----------------------------
-- Records of shiguhouguoinfo
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
  `JB_JC_XingHao` varchar(15) NOT NULL DEFAULT '' COMMENT '基本机车型号s',
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
  `JB_Ext1` varchar(255) DEFAULT NULL COMMENT '基本扩展信息1',
  `JB_Ext2` varchar(255) DEFAULT NULL COMMENT '基本扩展信息2',
  `JB_Ext3` varchar(255) DEFAULT NULL COMMENT '基本扩展信息3',
  PRIMARY KEY (`JB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='事故基本信息基本部分';

-- ----------------------------
-- Records of shigujibeninfo
-- ----------------------------

-- ----------------------------
-- Table structure for shiguzerenrendinginfo
-- ----------------------------
DROP TABLE IF EXISTS `shiguzerenrendinginfo`;
CREATE TABLE `shiguzerenrendinginfo` (
  `ZR_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '责任ID',
  `JB_ID` int(11) NOT NULL DEFAULT '0' COMMENT '基本ID',
  `ZR_ZeRenDanWei` varchar(75) NOT NULL DEFAULT '' COMMENT '责任单位',
  `ZR_ZeRenDanWeiShuXing` varchar(75) NOT NULL DEFAULT '' COMMENT '责任单位属性',
  `ZR_ZeRenBuMen` varchar(75) NOT NULL DEFAULT '' COMMENT '责任部门',
  `ZR_ZeRenChengDu` varchar(75) NOT NULL DEFAULT '' COMMENT '责任程度',
  `ZR_YuanYinLeiBie` varchar(15) NOT NULL DEFAULT '' COMMENT '原因类别',
  `ZR_ShiGuLeiBie` varchar(15) NOT NULL DEFAULT '' COMMENT '事故类别',
  `ZR_XingChe` varchar(15) NOT NULL DEFAULT '' COMMENT '行车',
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
  `ZR_Ext1` varchar(255) DEFAULT NULL,
  `ZR_Ext2` varchar(255) DEFAULT NULL,
  `ZR_Ext3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ZR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='事故基本信息责任部分';

-- ----------------------------
-- Records of shiguzerenrendinginfo
-- ----------------------------

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
  `User_Ext1` varchar(255) DEFAULT NULL,
  `User_Ext2` varchar(255) DEFAULT NULL,
  `User_Ext3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员信息';

-- ----------------------------
-- Records of userinfo
-- ----------------------------

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
,ZR_XingChe
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
left join sgdc.shiguzerenrendinginfo zr on (jb.JB_ID = zr.JB_ID) ;
