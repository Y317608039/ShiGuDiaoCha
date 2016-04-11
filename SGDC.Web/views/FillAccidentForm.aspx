<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FillAccidentForm.aspx.cs" Inherits="views_FillAccidentForm" %>
<!DOCTYPE html>
<!-- 事故调查表格页面 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>事故调查表格页面</title>
    <link type="text/css" href="~/easyui/themes/default/easyui.css" rel="stylesheet"/>
    <link type="text/css" href="~/easyui/themes/icon.css" rel="stylesheet" />
    <script type="text/javascript" src="~/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="~/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="~/easyui/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        .inputTxt {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            width: 100%;
            height: 100%;
            FONT-SIZE: 9pt;
        }

        .tdprintableleft {
            height: 25px;
            padding-left: 1px;
            padding-right: 1px;
        }
    </style>
</head>
<body class="easyui-layout">
<div id="tt" class="easyui-tabs" style="width: 100%; height: 100%;">
<!-- 基本情况 -->
<div title="基本情况" style="padding: 0px;" data-options="iconCls:'icon-reload',closable:false">
<table class="tableprintable" border="1" cellSpacing="0" borderColor="#000000" width="100%">
<tbody>
<tr>
    <td class="tdprintabtop" vAlign="center" rowSpan="10" width="4%" align="middle">
        基<br/><br/>本<br/><br/>情<br/><br/>况
    </td>
    <td class="tdprintabtop" rowSpan="2" width="5%" align="middle">
        <NOBR>地点</NOBR>
    </td>
    <td class="tdprintableleft" height="25" vAlign="center" width="6%" align="left">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_DD_Ju" name="txtJB_DD_Ju"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">局</td>
    <td class="tdprintableleft" vAlign="center" width="4%" colSpan="2" align="middle" height="25">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_DD_Xian" name="txtJB_DD_Xian"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle" height="25">线</td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">
        <NOBR>线别</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%" align="justify" height="25">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_DD_XianBie" name="txtJB_DD_XianBie"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_DD_QiDian" name="txtJB_DD_QiDian"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">
        <NOBR>站至</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_DD_ZhongDian" name="txtJB_DD_ZhongDian"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">站</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <NOBR>上下行</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_DD_XingBie" name="txtJB_DD_XingBie"/>
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_DD_GongLi" name="txtJB_DD_GongLi"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">
        <NOBR>公里股道</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" width="4%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_DD_MiShu" name="txtJB_DD_MiShu"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">米</td>
</tr>
<tr>
    <td class="tdprintableleft" height="25" vAlign="center" width="6%"align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_DD_Sheng name="txtJB_DD_Sheng"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">省</td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_DD_Shi" name="txtJB_DD_Shi"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">市</td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_DD_Qu" name="txtJB_DD_Qu"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">区</td>
    <td class="tdprintabtop" vAlign="center" width="4%"
        align="middle">
        <NOBR>单位</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="3" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_DD_DanWei" name="txtJB_DD_DanWei"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>场所</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="6"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_DD_ChangSuo" name="txtJB_DD_ChangSuo"/>
    </td>
</tr>
<tr>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>列车</NOBR>
    </td>
    <td class="tdprintableleft" height="25" vAlign="center" width="6%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_LC_CheCi" name="txtJB_LC_CheCi"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">次</td>
    <td class="tdprintableleft" vAlign="center" width="4%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_LC_CheHao" name="txtJB_LC_CheHao"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">车</td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_LC_QiDian" name="txtJB_LC_QiDian"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">
        <NOBR>站至</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_LC_ZhongDian" name="txtJB_LC_ZhongDian"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">站</td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_LC_PeiShu" name="txtJB_DD_PeiShu"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>配属</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_LC_DanDnag" name="txtJB_LC_DanDnag"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>担当</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_LC_LvKe" name="txtJB_LC_LvKe"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%"
        align="middle">
        <NOBR>旅客</NOBR>
    </td>
</tr>
<tr>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>机车</NOBR>
    </td>
    <td class="tdprintableleft" height="25" vAlign="center" width="6%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_JC_XingHao" name="txtJB_JC_XingHao"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">型</td>
    <td class="tdprintableleft" vAlign="center" width="4%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_JC_BianHao" name="txtJB_JC_BianHao"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">号</td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_JC_PeiShu" name="txtJB_JC_PeiShu"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>配属</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_JC_DanDang" name="txtJB_JC_DanDang"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>担当</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_JC_SuDu" name="txtJB_JC_SuDu"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>速度</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_JC_GongDian" name="txtJB_JC_GongDian"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>供电</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_JC_XinHao" name="txtJB_JC_XinHao"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%"
        align="middle">
        <NOBR>信号</NOBR>
    </td>
</tr>
<tr>
    <td class="tdprintabtop" vAlign="center" width="4%"
        align="middle">
        <NOBR>编组</NOBR>
    </td>
    <td class="tdprintableleft" height="25" vAlign="center" width="6%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_BZ_DunWei" name="txtJB_BZ_DunWei"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">吨</td>
    <td class="tdprintableleft" vAlign="center" width="4%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_BZ_ShuLiang" name="txtJB_BZ_ShuLiang"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">辆</td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_BZ_JiChang" name="txtJB_BZ_JiChang"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>计长</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_BZ_ZhongChe" name="txtJB_BZ_ZhongChe"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%"
        align="middle">
        <NOBR>重车</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_BZ_KongChe" name="txtJB_BZ_KongChe"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%"
        align="middle">
        <NOBR>空车</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_BZ_LieWei" name="txtJB_BZ_LieWei"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>列尾</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_BZ_WeiXianPin" name="txtJB_BZ_WeiXianPin"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>危险品</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_BZ_ChaoXianChe" name="txtJB_BZ_ChaoXianChe"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%"
        align="middle">
        <NOBR>超限车</NOBR>
    </td>
</tr>
<tr>
    <td class="tdprintabtop" vAlign="center" rowSpan="2" width="5%"
        align="middle">
        关<br/>系<br/>人
    </td>
    <td class="tdprintabtop" height="25" vAlign="center" width="6%"
        align="middle">
        <NOBR>司机</NOBR>
    </td>
    <td class="tdprintabtop" vAlign="center" colSpan="2"
        align="middle">
        <NOBR>副司机</NOBR>
    </td>
    <td class="tdprintabtop" vAlign="center" colSpan="2"
        align="middle">
        <NOBR>运转车长</NOBR>
    </td>
    <td class="tdprintabtop" vAlign="center" colSpan="2"
        align="middle">
        <NOBR>列车长</NOBR>
    </td>
    <td class="tdprintabtop" vAlign="center" colSpan="2"
        align="middle">
        <NOBR>值班员</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">

    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">

    </td>
    <td class="tdprintabtop" vAlign="center" rowSpan="2" width="5%"
        align="middle">
        <NOBR>天气</NOBR><br/><NOBR>情况</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" rowSpan="2" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_TianQi" name="txtJB_TianQi"/>
    </td>
    <td class="tdprintabtop" vAlign="center" rowSpan="2" width="5%"
        align="middle">
        <NOBR>事故<br/>性质</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" rowSpan="2" width="5%" colSpan="3"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_GXR_SiJi" name="txtJB_GXR_SiJi"/>
    </td>
</tr>
<tr>
    <td class="tdprintableleft" height="25" vAlign="center" width="6%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_GXR_FuSiJi" name="txtJB_GXR_FuSiJi"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" height="25" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_GXR_YunZhuanCheZhang" name="txtJB_GXR_YunZhuanCheZhang"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" height="25"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_GXR_LieCheZhang" name="txtJB_GXR_LieCheZhang"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" height="25"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_GXR_ZhiBanYuan" name="txtJB_GXR_ZhiBanYuan"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" height="25"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_ShiGuXingZhi" name="txtJB_ShiGuXingZhi"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" height="25"
        align="middle">

    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" height="25"
        align="middle">

    </td>
</tr>
<tr>
    <td class="tdprintabtop" height="25" vAlign="center" width="5%"
        align="middle">
        <NOBR>发生</NOBR> <NOBR>时间</NOBR>
    </td>
    <td class="tdprintabtop" height="21" vAlign="center" width="6%"
        align="middle">
        <NOBR>上行</NOBR>(单)
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FS_ShangXing_M" name="txtJB_FS_ShangXing_M"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">月</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FS_ShangXing_D" name="txtJB_FS_ShangXing_D"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">日</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FS_ShangXing_H" name="txtJB_FS_ShangXing_H"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">时</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FS_ShangXing_MIN" name="txtJB_FS_ShangXing_MIN"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">分</td>
    <td class="tdprintabtop" vAlign="center" width="5%" colSpan="2"
        align="middle">
        下行
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FS_XiaXing_M" name="txtJB_FS_XiaXing_M"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">月</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FS_XiaXing_D" name="txtJB_FS_XiaXing_D"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">日</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FS_XiaXing_H" name="txtJB_FS_XiaXing_H"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">时</td>
    <td class="tdprintableleft" vAlign="center" width="4%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FS_XiaXing_MIN" name="txtJB_FS_XiaXing_MIN"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">分</td>
</tr>
<tr>
    <td class="tdprintabtop" height="25" vAlign="center" width="4%"
        align="middle">
        <NOBR>复旧</NOBR><br/>时间
    </td>
    <td class="tdprintabtop" height="21" vAlign="center" width="6%"
        align="middle">
        <NOBR>上行</NOBR>(单)
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FJ_ShangXing_M" name="txtJB_FJ_ShangXing_M"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">月</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FJ_ShangXing_D" name="txtJB_FJ_ShangXing_D"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">日</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FJ_ShangXing_H" name="txtJB_FJ_ShangXing_H"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">时</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FJ_ShangXing_MIN" name="txtJB_FJ_ShangXing_MIN"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">分</td>
    <td class="tdprintabtop" vAlign="center" width="5%" colSpan="2"
        align="middle">
        <NOBR>下行</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FJ_XiaXing_M" name="txtJB_FJ_XiaXing_M"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">月</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FJ_XiaXing_D" name="txtJB_FJ_XiaXing_D"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">日</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FJ_XiaXing_H" name="txtJB_FJ_XiaXing_H"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">时</td>
    <td class="tdprintableleft" vAlign="center" width="4%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_FJ_XiaXing_MIN" name="txtJB_FJ_XiaXing_MIN"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">分</td>
</tr>
<tr>
    <td class="tdprintabtop" height="25" vAlign="center" width="5%"
        align="middle">
        <NOBR>开通</NOBR><br/><NOBR>时间</NOBR>
    </td>
    <td class="tdprintabtop" height="21" vAlign="center" width="6%"
        align="middle">
        <NOBR>上行</NOBR>(单)
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_KT_ShangXing_M" name="txtJB_KT_ShangXing_M"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">月</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_KT_ShangXing_D" name="txtJB_KT_ShangXing_D"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">日</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_KT_ShangXing_H" name="txtJB_KT_ShangXing_H"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">时</td>
    <td class="tdprintableleft" vAlign="center" width="5%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_KT_ShangXing_MIN" name="txtJB_KT_ShangXing_MIN"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">分</td>
    <td class="tdprintabtop" vAlign="center" width="5%" colSpan="2"
        align="middle">
        <NOBR>下行</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_KT_XiaXing_M" name="txtJB_KT_XiaXing_M"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">月</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_KT_XiaXing_D" name="txtJB_KT_XiaXing_D"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">日</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_KT_XiaXing_H" name="txtJB_KT_XiaXing_H"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">时</td>
    <td class="tdprintableleft" vAlign="center" width="4%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_KT_XiaXing_MIN" name="txtJB_KT_XiaXing_MIN"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">分</td>
</tr>


</tbody>
</table>
</div>
<!-- 后果 -->
<div title="事故后果" data-options="iconCls:'icon-reload',closable:false">
<table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
<tr>
    <td class="tdprintabtop" vAlign="center" rowSpan="9" width="4%" align="middle">
        事<br/><br/>故<br/><br/>后<br/><br/>果
    </td>
    <td class="tdprintabtop" height="25" vAlign="center" width="5%"
        align="middle">
        <NOBR>中断</NOBR><br/><NOBR>时间</NOBR>
    </td>
    <td class="tdprintabtop" vAlign="center" width="6%"
        align="middle">
        <NOBR>上行</NOBR>(单)
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="3"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_ZD_ShangXing" name="txtHG_ZD_ShangXing"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">
        <NOBR>下行<NOBR></NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="4"align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_ZD_XiaXing" name="txtHG_ZD_XiaXing"/>
    </td>
    <td class="tdprintabtop" vAlign="center" colSpan="2"
        align="middle">
        <NOBR>耽误列</NOBR><br/><NOBR>车时间</NOBR>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>上行</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="3" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_DW_ShangXing" name="txtHG_DW_ShangXing"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>下行</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="3"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_DW_XiaXing" name="txtHG_DW_XiaXing"/>
    </td>
</tr>
<tr>
    <td class="tdprintabtop" vAlign="center" rowSpan="2" width="5%"
        align="middle">
        <NOBR>脱轨</NOBR><br/><NOBR>情况</NOBR>
    </td>
    <td class="tdprintabtop" height="25" vAlign="center" width="6%"
        align="middle">
        <NOBR>动车组</NOBR>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%"
        align="middle">
        <NOBR>机车</NOBR>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%"
        align="middle">
        <NOBR>客车</NOBR>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%"
        align="middle">
        <NOBR>货车</NOBR>
    </td>
    <td class="tdprintabtop" vAlign="center" rowSpan="2" width="4%"
        align="middle">
        <NOBR>设备</NOBR><br/><NOBR>损失</NOBR>
    </td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">动车组</td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">机车</td>
    <td class="tdprintabtop" vAlign="center" colSpan="4" align="middle">车辆</td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">其它</td>
    <td class="tdprintabtop" vAlign="center" rowSpan="2" width="5%"
        align="middle">
        直接<br/>损失
    </td>
    <td class="tdprintableleft" vAlign="center" rowSpan="2" colSpan="2"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_ZhiJieSunShi" name="txtHG_ZhiJieSunShi"/>
    </td>
    <td class="tdprintabtop" vAlign="center" rowSpan="2" width="5%"
        align="middle">
        万元
    </td>
</tr>
<tr>
    <td class="tdprintableleft" height="25" vAlign="center" width="6%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_TG_DongCheZu" name="txtHG_TG_DongCheZu"/>

    </td>
    <td class="tdprintableleft" vAlign="center" width="5%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_TG_DongJiChe" name="txtHG_TG_DongJiChe"/>

    </td>
    <td class="tdprintableleft" vAlign="center" width="4%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_TG_DongKeChe" name="txtHG_TG_DongKeChe"/>
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_TG_HuoChe" name="txtHG_TG_HuoChe"/>

    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_SS_DongCheZu" name="txtHG_SS_DongCheZu"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_SS_JiChe" name="txtHG_SS_JiChe"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="4" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_SS_CheLiang" name="txtHG_SS_CheLiang"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_SS_QiTa" name="txtHG_SS_QiTa"/>
    </td>
</tr>
<tr>
    <td class="tdprintabtop" vAlign="center" rowSpan="2" width="5%" align="middle">
        相撞<br/>情况
    </td>
    <td class="tdprintabtop" height="25" vAlign="center" width="6%" align="middle">
        机动车
    </td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">非机动车</td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">行人 </td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">道口情况</td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">公铁并行</td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">防护栅栏</td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">公铁立交</td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">速度区段</td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">曲线半径</td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">坡度 </td>
</tr>
<tr>
    <td class="tdprintableleft" height="25" vAlign="center" width="6%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_XG_JiDongChe" name="txtJB_XG_JiDongChe"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_XG_FeiJiDongChe" name="txtJB_XG_FeiJiDongChe"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_XG_XingRen" name="txtJB_XG_XingRen"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_XG_DaoKouQingKuang" name="txtJB_XG_DaoKouQingKuang"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_XG_GongTieBingXing" name="txtJB_XG_GongTieBingXing"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_XG_FangHuZhaLan" name="txtJB_XG_FangHuZhaLan"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_XG_GongTieLiJiao" name="txtJB_XG_GongTieLiJiao"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_XG_SuDuQuDuan" name="txtJB_XG_SuDuQuDuan"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_XG_QuXianBanJin" name="txtJB_XG_QuXianBanJin"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtJB_XG_PoDu" name="txtJB_XG_PoDu"/>
    </td>
</tr>
<tr>
    <td class="tdprintabtop" vAlign="center" rowSpan="4" width="5%"
        align="middle">
        伤亡<br/>人员<br/>情况
    </td>
    <td class="tdprintabtop" height="25" vAlign="center" width="6%"
        align="middle">
        姓名
    </td>
    <td class="tdprintabtop" vAlign="center" colSpan="3" align="middle">单位</td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">
        <NOBR>性别</NOBR>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">年龄</td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">民族</td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">工种</td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">伤害程度</td>
    <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">人员属性</td>
    <td class="tdprintabtop" vAlign="center" rowSpan="2" colSpan="2"
        align="middle">
        死亡人数
    </td>
    <td class="tdprintabtop" vAlign="center" rowSpan="2" colSpan="2"
        align="middle">
        重伤人数
    </td>
    <td class="tdprintabtop" vAlign="center" rowSpan="2" colSpan="2"
        align="middle">
        轻伤人数
    </td>
</tr>

<tr>
    <td class="tdprintableleft" height="25" vAlign="center" width="6%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtSW_SW_Name" name="txtSW_SW_Name"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="3" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtSW_SW_Unit" name="txtSW_SW_Unit"/>
    </td>
    <td class="tdprintableleft" vAlign="center" width="4%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtSW_SW_Sex" name="txtSW_SW_Sex"/>
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtSW_SW_Age" name="txtSW_SW_Age"/>
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtSW_SW_MinZu" name="txtSW_SW_MinZu"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtSW_SW_GongZhong" name="txtSW_SW_GongZhong"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtSW_SW_ShangHaiChengDu" name="txtSW_SW_ShangHaiChengDu"/>
    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtSW_SW_RenYuanShuXing" name="txtSW_SW_RenYuanShuXing"/>
    </td>
</tr>
<tr>
    <td class="tdprintableleft" height="25" vAlign="center" width="6%"
        align="middle">


    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="3"
        align="middle">

    </td>
    <td class="tdprintableleft" vAlign="center" width="4%"
        align="middle">


    </td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">


    </td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">


    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">


    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">


    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">


    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">路内</td>
    <td class="tdprintableleft" vAlign="center" width="5%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_SiW_LuNei" name="txtHG_SiW_LuNei"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">路内</td>
    <td class="tdprintableleft" vAlign="center" width="5%"align="middle">
        <input class="easyui-textbox inputTxt" data-options="" id="txtHG_ZS_LuNei" name="txtHG_ZS_LuNei"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="4%"
        align="middle">
        <NOBR>路内</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" style="FONT-SIZE: 9pt; height: 18px;" id="txtHG_QS_LuNei" name="txtHG_QS_LuNei"/>
    </td>
</tr>
<tr>
    <td class="tdprintableleft" height="25" vAlign="center" width="6%"
        align="middle">


    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="3"
        align="middle">


    </td>
    <td class="tdprintableleft" vAlign="center" width="4%"
        align="middle">


    </td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">


    </td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">


    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">


    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">


    </td>
    <td class="tdprintableleft" vAlign="center" colSpan="2"
        align="middle">


    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">路外</td>
    <td class="tdprintableleft" vAlign="center" width="5%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" style="FONT-SIZE: 9pt; height: 18px;" id="txtHG_SiW_LuWai" name="txtHG_SiW_LuWai"/>
    </td>
    <td class="tdprintabtop" vAlign="center" width="5%" align="middle">路外</td>
    <td class="tdprintableleft" vAlign="center" width="5%"
        align="middle">
        <input class="easyui-textbox inputTxt" data-options="" style="FONT-SIZE: 9pt; height: 18px;" id="txtHG_QS_LuWai" name="txtHG_QS_LuWai"/>

    </td>
    <td class="tdprintabtop" vAlign="center" width="4%" align="middle">
        <NOBR>路外</NOBR>
    </td>
    <td class="tdprintableleft" vAlign="center" width="5%" align="middle">
        <input class="easyui-textbox inputTxt" data-options="" style="FONT-SIZE: 9pt; height: 18px;" id="txtHG_ZS_LuWai" name="txtHG_ZS_LuWai"/>
    </td>
</tr>
</table>
</div>
<!-- 责任 -->
<div title="责任认定" data-options="iconCls:'icon-reload',closable:false">
    <table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="100%">
        <tr>
            <td class="tdprintabtop" height="150" width="4%"
                align="middle">
                事故<br/>概况
            </td>
            <td class="tdprintableleft" vAlign="top" colSpan="20" align="left">
                <input class="easyui-textbox inputTxt"  data-options="multiline:true" id="txtHG_HG_ShiGuGaiKuang" name="txtHG_HG_ShiGuGaiKuang"/>
            </td>
        </tr>
        <tr>
            <td class="tdprintabtop" rowSpan="4" width="4%"
                align="middle">
                责<br/>任<br/>认<br/>定
            </td>
            <td class="tdprintabtop" height="25" vAlign="center" colSpan="5"
                align="middle">
                责任单位
            </td>
            <td class="tdprintabtop" vAlign="center" colSpan="3"
                align="middle">
                责任单位属性
            </td>
            <td class="tdprintabtop" vAlign="center" colSpan="4" align="middle">责任部门</td>
            <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">责任程度</td>
            <td class="tdprintabtop" vAlign="center" colSpan="2" align="middle">原因类别</td>
            <td class="tdprintabtop" vAlign="center" rowSpan="2" colSpan="2"
                align="middle">
                事故类别
            </td>
            <td class="tdprintableleft" vAlign="center" rowSpan="2" colSpan="2" align="middle">
                <input class="easyui-textbox inputTxt" data-options="" id="txtZR_ShiGuLeiBie" name="txtZR_ShiGuLeiBie"/>
            </td>
        </tr>
        <tr>
            <td class="tdprintableleft" height="25" vAlign="center" colSpan="5"
                align="middle">
                <input class="easyui-textbox inputTxt" data-options="" id="txtZRDW_DanWeiShungXing" name="txtZRDW_DanWeiShungXing"/>
            </td>
            <td class="tdprintableleft" vAlign="center" colSpan="3"
                align="middle">
                <input class="easyui-textbox inputTxt" data-options="" id="txtZRDW_BuMen" name="txtZRDW_BuMen"/>

            </td>
            <td class="tdprintableleft" vAlign="center" colSpan="4" align="middle">
                <input class="easyui-textbox inputTxt" data-options="" id="txtZRDW_ChengDu" name="txtZRDW_ChengDu"/>
            </td>
            <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
                <input class="easyui-textbox inputTxt" data-options="" id="txtZRDW_DanWei" name="txtZRDW_DanWei"/>

            </td>
            <td class="tdprintableleft" vAlign="center" rowSpan="3" colSpan="2" align="middle">
                <input class="easyui-textbox inputTxt" data-options="" id="txtZR_YuanYinLeiBie" name="txtZR_YuanYinLeiBie"/>
            </td>
        </tr>
        <tr>
            <td class="tdprintableleft" height="25" vAlign="center" colSpan="5" align="middle">
            </td>
            <td class="tdprintableleft" vAlign="center" colSpan="3" align="middle">
            </td>
            <td class="tdprintableleft" vAlign="center" colSpan="4" align="middle">
            </td>
            <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
            </td>
            <td class="tdprintabtop" vAlign="center" rowSpan="2" colSpan="2" align="middle">
                事故等级
            </td>
            <td class="tdprintableleft" vAlign="center" rowSpan="2" colSpan="2" align="middle">
                <input class="easyui-textbox inputTxt" data-options="" id="txtZR_S" name="txtZR_ShiGuDengJi"/>
            </td>
        </tr>
        <tr>
            <td class="tdprintableleft" height="25" vAlign="center" colSpan="5" align="middle">
            </td>
            <td class="tdprintableleft" vAlign="center" colSpan="3" align="middle">
            </td>
            <td class="tdprintableleft" vAlign="center" colSpan="4" align="middle">
            </td>
            <td class="tdprintableleft" vAlign="center" colSpan="2" align="middle">
            </td>
        </tr>
    </table>
</div>
<!-- 报告 -->
<div title="调查报告" data-options="iconCls:'icon-reload',closable:false">
    <table border="1" cellSpacing="0" borderColor="#000000" cellPadding="1" width="99%">
        <tbody>
        <tr class="VwCtr">
            <td width="10%" align="middle">
                <font id="bgfjFont" color="red">事故调查报告</font>
            </td>
            <td id="bgfjtd" width="30%" class="tdprintableleft">
                <input class="easyui-textbox inputTxt" data-options="" id="txtZR_ShiGuDiaoChaBaoGao" name="txtZR_ShiGuDiaoChaBaoGao"/>

            </td>
            <td width="15%" align="middle">
                现场调查有关资料<FONT id="xcdcfjFont" color="red"> </FONT>
            </td>
            <td id="xcdcfjtd" width="30%" class="tdprintableleft">
                <input type="text" id="txtZR_XianChangDiaoChaZiLiao" name="txtZR_XianChangDiaoChaZiLiao"/>
            </td>
        </tr>
        <tr>
            <td width="10%" align="middle">
                损失计算材料<FONT id="ssjsfjFont" color="red"></FONT>
            </td>
            <td id="ssjsfjtd" width="30%" class="tdprintableleft">
                <input class="easyui-textbox inputTxt" data-options="" id="txtZR_SunShiDiaoChaZiLiao" name="txtZR_SunShiDiaoChaZiLiao"/>
            </td>
            <td width="15%" align="middle">
                事故认定书<FONT id="sgrdsfjFont" color="red"></FONT>
            </td>
            <td id="sgrdsfjtd" width="30%" class="tdprintableleft">
                <input class="easyui-textbox inputTxt" data-options="" id="txtZR_ShiGuRenDingShu" name="txtZR_ShiGuRenDingShu"/>

            </td>
        </tr>
        <tr style="HEIGHT: 20px">
            <td width="10%" align="middle">安监报二</td>
            <td id="ajb2fjtd" width="30%" class="tdprintableleft">
                <input class="easyui-textbox inputTxt" id="txtZR_AnJianBaoEr" name="txtZR_AnJianBaoEr"/>
            </td>
            <td width="10%" align="middle">其它</td>
            <td id="qtfjtd" width="30%" class="tdprintableleft">
                <input class="easyui-textbox inputTxt" id="txtZR_QiTa" name="txtZR_QiTa"/>
            </td>
        </tr>
        <tr style="HEIGHT: 20px">
            <td width="10%" align="middle">特派办调查报告</td>
            <td id="td3" width="30%" class="tdprintableleft">
                <input class="easyui-textbox inputTxt"  id="txtZR_TePaiBanDiaoChaBaoGao" name="txtZR_TePaiBanDiaoChaBaoGao"/>
            </td>
            <td width="10%" align="middle">深度调查报告</td>
            <td id="td4" width="30%" class="tdprintableleft">
                <input class="easyui-textbox inputTxt"  id="txtZR_SheDuDiaoChaBaoGao" name="txtZR_SheDuDiaoChaBaoGao"/>
            </td>
        </tr>
        <tr>
            <td colSpan="4" align="middle" class="tdprintableleft"> </td>
        </tr>
        </tbody>
    </table>

</div>
</div>
</body>
</html>