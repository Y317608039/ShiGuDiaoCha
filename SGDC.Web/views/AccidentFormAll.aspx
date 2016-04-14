<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccidentFormAll.aspx.cs" Inherits="views_AccidentForm" %>

<!DOCTYPE html>
<!-- 事故调查表格页面 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>事故调查表格页面</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%">
                <tbody>
                    <tr>
                        <td width="5%"></td>
                        <td width="90%">
                            <table width="99%">
                                <tbody>
                                    <tr valign="center">
                                        <td height="60" colspan="2" align="middle">
                                            <span style="font-size: 30pt" class="style2">铁路交通事故基本情况表</span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table class="tableprintable" border="1" cellspacing="0" bordercolor="#000000" width="100%">
                                <tbody>
                                    <tr>
                                        <td class="tdprintabtop" valign="center" rowspan="10" width="4%"
                                            align="middle">基<br />
                                            <br />
                                            本<br />
                                            <br />
                                            情<br />
                                            <br />
                                            况
                                        </td>
                                        <td class="tdprintabtop" rowspan="2" width="5%" align="middle">
                                            <nobr>地点</nobr>
                                        </td>
                                        <td class="tdprintableleft" height="25" valign="center" width="6%" align="left">
                                            <input type="text" style="font-size: 9pt" id="txtJB_DD_Ju" name="txtJB_DD_Ju" /></td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">局</td>
                                        <td class="tdprintableleft" valign="center" width="4%" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_DD_Xian" name="txtJB_DD_Xian" /></td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">线</td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">
                                            <nobr>线别</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%" align="justify">
                                            <input type="text" style="font-size: 9pt" id="txtJB_DD_XianBie" name="txtJB_DD_XianBie" /></td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_DD_QiDian" name="txtJB_DD_QiDian" /></td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>站至</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_DD_ZhongDian" name="txtJB_DD_ZhongDian" /></td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">站</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <nobr>上下行</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_DD_XingBie" name="txtJB_DD_XingBie" /></td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_DD_GongLi" name="txtJB_DD_GongLi" /></td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>公里股道</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="4%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_DD_MiShu" name="txtJB_DD_MiShu" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">米</td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintableleft" height="25" valign="center" width="6%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_DD_Sheng" name="txtJB_DD_Sheng" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">省</td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_DD_Shi" name="txtJB_DD_Shi" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">市</td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_DD_Qu" name="txtJB_DD_Qu" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">区</td>
                                        <td class="tdprintabtop" valign="center" width="4%"
                                            align="middle">
                                            <nobr>单位</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="3" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_DD_DanWei" name="txtJB_DD_DanWei" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>场所</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="6"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_DD_ChangSuo" name="txtJB_DD_ChangSuo" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>列车</nobr>
                                        </td>
                                        <td class="tdprintableleft" height="25" valign="center" width="6%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_LC_CheCi" name="txtJB_LC_CheCi" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">次</td>
                                        <td class="tdprintableleft" valign="center" width="4%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_LC_CheHao" name="txtJB_LC_CheHao" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">车</td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_LC_QiDian" name="txtJB_LC_QiDian" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>站至</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_LC_ZhongDian" name="txtJB_LC_ZhongDian" /></td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">站</td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_LC_PeiShu" name="txtJB_DD_PeiShu" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>配属</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_LC_DanDnag" name="txtJB_LC_DanDnag" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>担当</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_LC_LvKe" name="txtJB_LC_LvKe" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%"
                                            align="middle">
                                            <nobr>旅客</nobr>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>机车</nobr>
                                        </td>
                                        <td class="tdprintableleft" height="25" valign="center" width="6%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_JC_XingHao" name="txtJB_JC_XingHao" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">型</td>
                                        <td class="tdprintableleft" valign="center" width="4%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_JC_BianHao" name="txtJB_JC_BianHao" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">号</td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_JC_PeiShu" name="txtJB_JC_PeiShu" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>配属</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_JC_DanDang" name="txtJB_JC_DanDang" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>担当</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_JC_SuDu" name="txtJB_JC_SuDu" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>速度</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_JC_GongDian" name="txtJB_JC_GongDian" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>供电</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_JC_XinHao" name="txtJB_JC_XinHao" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%"
                                            align="middle">
                                            <nobr>信号</nobr>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintabtop" valign="center" width="4%"
                                            align="middle">
                                            <nobr>编组</nobr>
                                        </td>
                                        <td class="tdprintableleft" height="25" valign="center" width="6%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_BZ_DunWei" name="txtJB_BZ_DunWei" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">吨</td>
                                        <td class="tdprintableleft" valign="center" width="4%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_BZ_ShuLiang" name="txtJB_BZ_ShuLiang" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">辆</td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_BZ_JiChang" name="txtJB_BZ_JiChang" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>计长</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_BZ_ZhongChe" name="txtJB_BZ_ZhongChe" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%"
                                            align="middle">
                                            <nobr>重车</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_BZ_KongChe" name="txtJB_BZ_KongChe" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%"
                                            align="middle">
                                            <nobr>空车</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_BZ_LieWei" name="txtJB_BZ_LieWei" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>列尾</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_BZ_WeiXianPin" name="txtJB_BZ_WeiXianPin" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>危险品</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_BZ_ChaoXianChe" name="txtJB_BZ_ChaoXianChe" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%"
                                            align="middle">
                                            <nobr>超限车</nobr>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintabtop" valign="center" rowspan="2" width="5%"
                                            align="middle">关<br />
                                            系<br />
                                            人
                                        </td>
                                        <td class="tdprintabtop" height="25" valign="center" width="6%"
                                            align="middle">
                                            <nobr>司机</nobr>
                                        </td>
                                        <td class="tdprintabtop" valign="center" colspan="2"
                                            align="middle">
                                            <nobr>副司机</nobr>
                                        </td>
                                        <td class="tdprintabtop" valign="center" colspan="2"
                                            align="middle">
                                            <nobr>运转车长</nobr>
                                        </td>
                                        <td class="tdprintabtop" valign="center" colspan="2"
                                            align="middle">
                                            <nobr>列车长</nobr>
                                        </td>
                                        <td class="tdprintabtop" valign="center" colspan="2"
                                            align="middle">
                                            <nobr>值班员</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle"></td>
                                        <td class="tdprintabtop" valign="center" rowspan="2" width="5%"
                                            align="middle">
                                            <nobr>天气</nobr>
                                            <br />
                                            <nobr>情况</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" rowspan="2" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_TianQi" name="txtJB_TianQi" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" rowspan="2" width="5%"
                                            align="middle">
                                            <nobr>事故<br />性质</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" rowspan="2" width="5%" colspan="3"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_GXR_SiJi" name="txtJB_GXR_SiJi" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintableleft" height="25" valign="center" width="6%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_GXR_FuSiJi" name="txtJB_GXR_FuSiJi" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_GXR_YunZhuanCheZhang" name="txtJB_GXR_YunZhuanCheZhang" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_GXR_LieCheZhang" name="txtJB_GXR_LieCheZhang" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_GXR_ZhiBanYuan" name="txtJB_GXR_ZhiBanYuan" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_ShiGuXingZhi" name="txtJB_ShiGuXingZhi" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle"></td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintabtop" height="25" valign="center" width="5%"
                                            align="middle">
                                            <nobr>发生</nobr>
                                            <nobr>时间</nobr>
                                        </td>
                                        <td class="tdprintabtop" height="21" valign="center" width="6%"
                                            align="middle">
                                            <nobr>上行</nobr>
                                            (单)
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FS_ShangXing_M" name="txtJB_FS_ShangXing_M" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">月</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FS_ShangXing_D" name="txtJB_FS_ShangXing_D" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">日</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FS_ShangXing_H" name="txtJB_FS_ShangXing_H" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">时</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FS_ShangXing_MIN" name="txtJB_FS_ShangXing_MIN" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">分</td>
                                        <td class="tdprintabtop" valign="center" width="5%" colspan="2"
                                            align="middle">下行
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FS_XiaXing_M" name="txtJB_FS_XiaXing_M" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">月</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FS_XiaXing_D" name="txtJB_FS_XiaXing_D" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">日</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FS_XiaXing_H" name="txtJB_FS_XiaXing_H" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">时</td>
                                        <td class="tdprintableleft" valign="center" width="4%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FS_XiaXing_MIN" name="txtJB_FS_XiaXing_MIN" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">分</td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintabtop" height="25" valign="center" width="4%"
                                            align="middle">
                                            <nobr>复旧</nobr>
                                            <br />
                                            时间
                                        </td>
                                        <td class="tdprintabtop" height="21" valign="center" width="6%"
                                            align="middle">
                                            <nobr>上行</nobr>
                                            (单)
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FJ_ShangXing_M" name="txtJB_FJ_ShangXing_M" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">月</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FJ_ShangXing_D" name="txtJB_FJ_ShangXing_D" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">日</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FJ_ShangXing_H" name="txtJB_FJ_ShangXing_H" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">时</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FJ_ShangXing_MIN" name="txtJB_FJ_ShangXing_MIN" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">分</td>
                                        <td class="tdprintabtop" valign="center" width="5%" colspan="2"
                                            align="middle">
                                            <nobr>下行</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FJ_XiaXing_M" name="txtJB_FJ_XiaXing_M" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">月</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FJ_XiaXing_D" name="txtJB_FJ_XiaXing_D" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">日</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FJ_XiaXing_H" name="txtJB_FJ_XiaXing_H" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">时</td>
                                        <td class="tdprintableleft" valign="center" width="4%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_FJ_XiaXing_MIN" name="txtJB_FJ_XiaXing_MIN" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">分</td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintabtop" height="25" valign="center" width="5%"
                                            align="middle">
                                            <nobr>开通</nobr>
                                            <br />
                                            <nobr>时间</nobr>
                                        </td>
                                        <td class="tdprintabtop" height="21" valign="center" width="6%"
                                            align="middle">
                                            <nobr>上行</nobr>
                                            (单)
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_KT_ShangXing_M" name="txtJB_KT_ShangXing_M" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">月</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_KT_ShangXing_D" name="txtJB_KT_ShangXing_D" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">日</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_KT_ShangXing_H" name="txtJB_KT_ShangXing_H" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">时</td>
                                        <td class="tdprintableleft" valign="center" width="5%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_KT_ShangXing_MIN" name="txtJB_KT_ShangXing_MIN" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">分</td>
                                        <td class="tdprintabtop" valign="center" width="5%" colspan="2"
                                            align="middle">
                                            <nobr>下行</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_KT_XiaXing_M" name="txtJB_KT_XiaXing_M" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">月</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_KT_XiaXing_D" name="txtJB_KT_XiaXing_D" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">日</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_KT_XiaXing_H" name="txtJB_KT_XiaXing_H" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">时</td>
                                        <td class="tdprintableleft" valign="center" width="4%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_KT_XiaXing_MIN" name="txtJB_KT_XiaXing_MIN" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">分</td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintabtop" valign="center" rowspan="9" width="4%"
                                            align="middle">事<br />
                                            <br />
                                            故<br />
                                            <br />
                                            后<br />
                                            <br />
                                            果
                                        </td>
                                        <td class="tdprintabtop" height="25" valign="center" width="5%"
                                            align="middle">
                                            <nobr>中断</nobr>
                                            <br />
                                            <nobr>时间</nobr>
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="6%"
                                            align="middle">
                                            <nobr>上行</nobr>
                                            (单)
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="3"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_ZD_ShangXing" name="txtHG_ZD_ShangXing" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">
                                            <nobr>下行<NOBR></NOBR>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="4" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_ZD_XiaXing" name="txtHG_ZD_XiaXing" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" colspan="2"
                                            align="middle">
                                            <nobr>耽误列</nobr>
                                            <br />
                                            <nobr>车时间</nobr>
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>上行</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="3"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_DW_ShangXing" name="txtHG_DW_ShangXing" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>下行</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="3"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_DW_XiaXing" name="txtHG_DW_XiaXing" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintabtop" valign="center" rowspan="2" width="5%"
                                            align="middle">
                                            <nobr>脱轨</nobr>
                                            <br />
                                            <nobr>情况</nobr>
                                        </td>
                                        <td class="tdprintabtop" height="25" valign="center" width="6%"
                                            align="middle">
                                            <nobr>动车组</nobr>
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%"
                                            align="middle">
                                            <nobr>机车</nobr>
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%"
                                            align="middle">
                                            <nobr>客车</nobr>
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%"
                                            align="middle">
                                            <nobr>货车</nobr>
                                        </td>
                                        <td class="tdprintabtop" valign="center" rowspan="2" width="4%"
                                            align="middle">
                                            <nobr>设备</nobr>
                                            <br />
                                            <nobr>损失</nobr>
                                        </td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">动车组</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">机车</td>
                                        <td class="tdprintabtop" valign="center" colspan="4" align="middle">车辆</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">其它</td>
                                        <td class="tdprintabtop" valign="center" rowspan="2" width="5%"
                                            align="middle">直接<br />
                                            损失
                                        </td>
                                        <td class="tdprintableleft" valign="center" rowspan="2" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_ZhiJieSunShi" name="txtHG_ZhiJieSunShi" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" rowspan="2" width="5%"
                                            align="middle">万元
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintableleft" height="25" valign="center" width="6%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_TG_DongCheZu" name="txtHG_TG_DongCheZu" />

                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_TG_DongJiChe" name="txtHG_TG_DongJiChe" />

                                        </td>
                                        <td class="tdprintableleft" valign="center" width="4%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_TG_DongKeChe" name="txtHG_TG_DongKeChe" />

                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_TG_HuoChe" name="txtHG_TG_HuoChe" />

                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_SS_DongCheZu" name="txtHG_SS_DongCheZu" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_SS_JiChe" name="txtHG_SS_JiChe" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="4" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_SS_CheLiang" name="txtHG_SS_CheLiang" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_SS_QiTa" name="txtHG_SS_QiTa" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintabtop" valign="center" rowspan="2" width="5%" align="middle">相撞<br />
                                            情况
                                        </td>
                                        <td class="tdprintabtop" height="25" valign="center" width="6%" align="middle">机动车
                                        </td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">非机动车</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">行人    </td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">道口情况</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">公铁并行</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">防护栅栏</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">公铁立交</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">速度区段</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">曲线半径</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">坡度    </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintableleft" height="25" valign="center" width="6%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_XG_JiDongChe" name="txtJB_XG_JiDongChe" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_XG_FeiJiDongChe" name="txtJB_XG_FeiJiDongChe" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_XG_XingRen" name="txtJB_XG_XingRen" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_XG_DaoKouQingKuang" name="txtJB_XG_DaoKouQingKuang" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_XG_GongTieBingXing" name="txtJB_XG_GongTieBingXing" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_XG_FangHuZhaLan" name="txtJB_XG_FangHuZhaLan" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_XG_GongTieLiJiao" name="txtJB_XG_GongTieLiJiao" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_XG_SuDuQuDuan" name="txtJB_XG_SuDuQuDuan" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_XG_QuXianBanJin" name="txtJB_XG_QuXianBanJin" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtJB_XG_PoDu" name="txtJB_XG_PoDu" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintabtop" valign="center" rowspan="4" width="5%"
                                            align="middle">伤亡<br />
                                            人员<br />
                                            情况
                                        </td>
                                        <td class="tdprintabtop" height="25" valign="center" width="6%"
                                            align="middle">姓名
                                        </td>
                                        <td class="tdprintabtop" valign="center" colspan="3" align="middle">单位</td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">
                                            <nobr>性别</nobr>
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">年龄</td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">民族</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">工种</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">伤害程度</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">人员属性</td>
                                        <td class="tdprintabtop" valign="center" rowspan="2" colspan="2"
                                            align="middle">死亡人数
                                        </td>
                                        <td class="tdprintabtop" valign="center" rowspan="2" colspan="2"
                                            align="middle">重伤人数
                                        </td>
                                        <td class="tdprintabtop" valign="center" rowspan="2" colspan="2"
                                            align="middle">轻伤人数
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="tdprintableleft" height="25" valign="center" width="6%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtSW_SW_Name" name="txtSW_SW_Name" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="3" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtSW_SW_Unit" name="txtSW_SW_Unit" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="4%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtSW_SW_Sex" name="txtSW_SW_Sex" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtSW_SW_Age" name="txtSW_SW_Age" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtSW_SW_MinZu" name="txtSW_SW_MinZu" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtSW_SW_GongZhong" name="txtSW_SW_GongZhong" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtSW_SW_ShangHaiChengDu" name="txtSW_SW_ShangHaiChengDu" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtSW_SW_RenYuanShuXing" name="txtSW_SW_RenYuanShuXing" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintableleft" height="25" valign="center" width="6%"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="3"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" width="4%"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle"></td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">路内</td>
                                        <td class="tdprintableleft" valign="center" width="5%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_SiW_LuNei" name="txtHG_SiW_LuNei" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">路内</td>
                                        <td class="tdprintableleft" valign="center" width="5%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtHG_ZS_LuNei" name="txtHG_ZS_LuNei" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%"
                                            align="middle">
                                            <nobr>路内</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%" align="middle">
                                            <input type="text" style="font-size: 9pt; height: 18px;" id="txtHG_QS_LuNei" name="txtHG_QS_LuNei" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintableleft" height="25" valign="center" width="6%"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="3"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" width="4%"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle"></td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">路外</td>
                                        <td class="tdprintableleft" valign="center" width="5%" align="middle">
                                            <input type="text" style="font-size: 9pt; height: 18px;" id="txtHG_SiW_LuWai" name="txtHG_SiW_LuWai" />
                                        </td>
                                        <td class="tdprintabtop" valign="center" width="5%" align="middle">路外</td>
                                        <td class="tdprintableleft" valign="center" width="5%"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt; height: 18px;" id="txtHG_QS_LuWai" name="txtHG_QS_LuWai" />

                                        </td>
                                        <td class="tdprintabtop" valign="center" width="4%" align="middle">
                                            <nobr>路外</nobr>
                                        </td>
                                        <td class="tdprintableleft" valign="center" width="5%" align="middle">
                                            <input type="text" style="font-size: 9pt; height: 18px;" id="txtHG_ZS_LuWai" name="txtHG_ZS_LuWai" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintabtop" height="150" width="4%"
                                            align="middle">事故<br />
                                            概况
                                        </td>
                                        <td class="tdprintableleft" valign="top" colspan="20" align="left">
                                            <input type="text" style="font-size: 9pt" id="txtHG_HG_ShiGuGaiKuang" name="txtHG_HG_ShiGuGaiKuang" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintabtop" rowspan="4" width="4%"
                                            align="middle">责<br />
                                            任<br />
                                            认<br />
                                            定
                                        </td>
                                        <td class="tdprintabtop" height="25" valign="center" colspan="5"
                                            align="middle">责任单位
                                        </td>
                                        <td class="tdprintabtop" valign="center" colspan="3"
                                            align="middle">责任单位属性
                                        </td>
                                        <td class="tdprintabtop" valign="center" colspan="4" align="middle">责任部门</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">责任程度</td>
                                        <td class="tdprintabtop" valign="center" colspan="2" align="middle">原因类别</td>
                                        <td class="tdprintabtop" valign="center" rowspan="2" colspan="2"
                                            align="middle">事故类别
                                        </td>
                                        <td class="tdprintableleft" valign="center" rowspan="2" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtZR_ShiGuLeiBie" name="txtZR_ShiGuLeiBie" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintableleft" height="25" valign="center" colspan="5"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtZRDW_DanWeiShungXing" name="txtZRDW_DanWeiShungXing" />
                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="3"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtZRDW_BuMen" name="txtZRDW_BuMen" />

                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="4"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtZRDW_ChengDu" name="txtZRDW_ChengDu" />

                                        </td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtZRDW_DanWei" name="txtZRDW_DanWei" />

                                        </td>
                                        <td class="tdprintableleft" valign="center" rowspan="3" colspan="2"
                                            align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtZR_YuanYinLeiBie" name="txtZR_YuanYinLeiBie" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintableleft" height="25" valign="center" colspan="5"
                                            align="middle">&nbsp;</td>
                                        <td class="tdprintableleft" valign="center" colspan="3"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="4"
                                            align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="2"
                                            align="middle"></td>
                                        <td class="tdprintabtop" valign="center" rowspan="2" colspan="2"
                                            align="middle">事故等级
                                        </td>
                                        <td class="tdprintableleft" valign="center" rowspan="2" colspan="2" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtZR_S" name="txtZR_ShiGuDengJi" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="tdprintableleft" height="25" valign="center" colspan="5" align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="3" align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="4" align="middle"></td>
                                        <td class="tdprintableleft" valign="center" colspan="2" align="middle"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table border="0" width="100%">
                                <tbody>
                                    <tr>
                                        <td height="20" valign="center" width="10%" align="left">值班监察</td>
                                        <td width="20%" align="left">
                                            <input type="text" style="font-size: 9pt" id="txtZR_ZhiBanJianCha" name="txtZR_ZhiBanJianCha" />
                                        </td>
                                        <td width="10%">填报时间</td>
                                        <td width="8%" align="right">
                                            <input type="text" style="font-size: 9pt" id="txtZR_TianBaoShiJian_Y" name="txtZR_TianBaoShiJian_Y" />
                                        </td>
                                        <td width="2%">年</td>
                                        <td width="4%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtZR_TianBaoShiJian_M" name="txtZR_TianBaoShiJian_M" />
                                        </td>
                                        <td width="2%">月</td>
                                        <td width="4%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtZR_TianBaoShiJian_D" name="txtZR_TianBaoShiJian_D" />
                                        </td>
                                        <td width="2%">日</td>
                                        <td width="4%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtZR_TianBaoShiJian_H" name="txtZR_TianBaoShiJian_H" />
                                        </td>
                                        <td width="2%">时</td>
                                        <td width="4%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtZR_TianBaoShiJian_MIN" name="txtZR_TianBaoShiJian_MIN" />
                                        </td>
                                        <td width="4%" align="middle">分</td>
                                        <td width="2%" align="right">第</td>
                                        <td width="4%" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtZR_BaoGaoCiShu" name="txtZR_BaoGaoCiShu" />
                                        </td>
                                        <td width="10%" align="middle">次报告</td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                            <br />
                            <table border="1" cellspacing="0" bordercolor="#000000" cellpadding="1" width="99%">
                                <tbody>
                                    <tr class="VwCtr">
                                        <td width="10%" align="middle">
                                            <font id="bgfjFont" color="red">事故调查报告</font>
                                        </td>
                                        <td id="bgfjtd" width="30%">
                                            <input type="text" style="font-size: 9pt" id="txtZR_ShiGuDiaoChaBaoGao" name="txtZR_ShiGuDiaoChaBaoGao" />
                                            <a href="javascript:downLoadFj('1F1F3EBE73C7622EE0530A6A0267622E')">“8.2”陇海线较大铁路交通事故调查报告.pdf
                                            </a>
                                        </td>
                                        <td width="15%" align="middle">现场调查有关资料<font id="xcdcfjFont" color="red"> </font>
                                        </td>
                                        <td id="xcdcfjtd" width="30%">
                                            <input type="text" style="font-size: 9pt" id="txtZR_XianChangDiaoChaZiLiao" name="txtZR_XianChangDiaoChaZiLiao" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="10%" align="middle">损失计算材料<font id="ssjsfjFont" color="red"></font>
                                        </td>
                                        <td id="ssjsfjtd" width="30%">
                                            <input type="text" style="font-size: 9pt" id="txtZR_SunShiDiaoChaZiLiao" name="txtZR_SunShiDiaoChaZiLiao" /></td>
                                        <td width="15%" align="middle">事故认定书<font id="sgrdsfjFont" color="red"></font>
                                        </td>
                                        <td id="sgrdsfjtd" width="30%">
                                            <input type="text" style="font-size: 9pt" id="txtZR_ShiGuRenDingShu" name="txtZR_ShiGuRenDingShu" />
                                            <a href="javascript:downLoadFj('1F1F3EBE73C8622EE0530A6A0267622E')">“8.2”陇海线较大事故认定书.pdf
                                            </a>
                                        </td>
                                    </tr>
                                    <tr style="height: 20px">
                                        <td width="10%" align="middle">安监报二</td>
                                        <td id="ajb2fjtd" width="30%">
                                            <input type="text" style="font-size: 9pt" id="txtZR_AnJianBaoEr" name="txtZR_AnJianBaoEr" /></td>
                                        <td width="10%" align="middle">其它</td>
                                        <td id="qtfjtd" width="30%">
                                            <input type="text" style="font-size: 9pt" id="txtZR_QiTa" name="txtZR_QiTa" />
                                        </td>
                                    </tr>
                                    <tr style="height: 20px">
                                        <td width="10%" align="middle">特派办调查报告</td>
                                        <td id="td3" width="30%">
                                            <input type="text" style="font-size: 9pt" id="txtZR_TePaiBanDiaoChaBaoGao" name="txtZR_TePaiBanDiaoChaBaoGao" />
                                        </td>
                                        <td width="10%" align="middle">深度调查报告</td>
                                        <td id="td4" width="30%">
                                            <input type="text" style="font-size: 9pt" id="txtZR_SheDuDiaoChaBaoGao" name="txtZR_SheDuDiaoChaBaoGao" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" align="middle">
                                            <input type="text" style="font-size: 9pt" id="txtZR_last" name="txtZR_last" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div style="display: none">
                                <input style="font-size: 9pt" id="downLoadFjButton" type="submit" name="downLoadFjButton" />
                            </div>
                        </td>
                        <td width="5%"></td>
                    </tr>
                </tbody>
            </table>
        </div> 
    </form>
</body>
</html>
