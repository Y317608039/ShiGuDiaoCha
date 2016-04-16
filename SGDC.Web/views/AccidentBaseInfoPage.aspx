<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccidentBaseInfoPage.aspx.cs" Inherits="views_AccidentBaseInfoPage" %>

<!DOCTYPE html>
<style type="text/css">
    #sgbaseinfo_edit input {
        width: 40px;
        /*margin: 0 3px 0 3px;*/
    }

    #sgbaseinfo_edit td[colspan="2"] input {
        width: 92px;
    }

    #sgbaseinfo_edit td[colspan="3"] input {
        width: 146px;
    }

    #sgbaseinfo_edit table {
        border-collapse: collapse;
        border: none;
        /*width: auto;*/
        margin: auto;
        font-size: 10px;
    }

        #sgbaseinfo_edit table td {
            border: solid 1px #666;
            height: 28px;
            /*min-width: 30px;*/
            text-align: left;
            word-break: break-all;
            word-wrap: break-word;
            padding: 1px 3px 1px 3px;
        }
</style>

<table id="gv_sgbaseinfo"></table>

<div id="sgbaseinfo_tool" style="padding: 0px;">
    <div style="padding: 0 0 0 10px; color: #333; border-bottom: solid 1px #ccc">
        局属：<input class="textbox" id="search_txtJB_DD_Ju" name="search_txtJB_DD_Ju" style="width: 110px;">&nbsp;&nbsp;
        线属：<input type="text" class="textbox" id="search_txtJB_DD_Xian" name="search_txtJB_DD_Xian" style="width: 110px;">&nbsp;&nbsp;  
        车次：<input type="text" class="textbox" id="search_txtJB_LC_CheCi" name="search_txtJB_LC_CheCi" style="width: 110px;">&nbsp;&nbsp; 
        <a href="#" class="easyui-linkbutton" iconcls="icon-search" onclick="sgbaseinfo_tool.search();">查询</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-undo" onclick="sgbaseinfo_tool.resetquery();">重置</a>
    </div>
    <div style="margin: 0px;">
        <a href="#" class="easyui-linkbutton" iconcls="icon-add-new" plain="true" onclick="sgbaseinfo_tool.add();">添加</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-edit-new" plain="true" onclick="sgbaseinfo_tool.edit();">修改</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-delete-new" plain="true" onclick="sgbaseinfo_tool.remove();">删除</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-reload" plain="true" onclick="sgbaseinfo_tool.reload();">刷新</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-redo" plain="true" id="redo" onclick="sgbaseinfo_tool.redo();">取消选择</a>
    </div>
</div>

<form id="sgbaseinfo_edit" style="margin: 0; padding: 5px; color: #333;">
    <input type="text" id="sgbaseinfoid" name="sgbaseinfoid" class="textbox" style="width: 200px; display: none;">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td rowspan="10">基<br />
                本<br />
                情<br />
                况</td>
            <td rowspan="2">地点</td>
            <td colspan="2">
                <input type="text" id="txtJB_DD_Ju" name="txtJB_DD_Ju" /></td>
            <td>局</td>
            <td>
                <input type="text" id="txtJB_DD_Xian" name="txtJB_DD_Xian" /></td>
            <td>线</td>
            <td>线别</td>
            <td>
                <input type="text" id="txtJB_DD_XianBie" name="txtJB_DD_XianBie" /></td>
            <td>
                <input type="text" id="txtJB_DD_QiDian" name="txtJB_DD_QiDian" /></td>
            <td colspan="2">站至</td>
            <td>
                <input type="text" id="txtJB_DD_ZhongDian" name="txtJB_DD_ZhongDian" /></td>
            <td>站</td>
            <td>上下行</td>
            <td>
                <input type="text" id="txtJB_DD_XingBie" name="txtJB_DD_XingBie" /></td>
            <td>
                <input type="text" id="txtJB_DD_GongLi" name="txtJB_DD_GongLi" /></td>
            <td>公里股道</td>
            <td>
                <input type="text" id="txtJB_DD_MiShu" name="txtJB_DD_MiShu" /></td>
            <td colspan="2">米</td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="text" id="txtJB_DD_Sheng" name="txtJB_DD_Sheng" /></td>
            <td>省</td>
            <td>
                <input type="text" id="txtJB_DD_Shi" name="txtJB_DD_Shi" /></td>
            <td colspan="2">市</td>
            <td colspan="2">
                <input type="text" id="txtJB_DD_Qu" name="txtJB_DD_Qu" /></td>
            <td colspan="4">区</td>
            <td>单位</td>
            <td colspan="2">
                <input type="text" id="txtJB_DD_DanWei" name="txtJB_DD_DanWei" />
            </td>
            <td>场所</td>
            <td colspan="3">
                <input type="text" id="txtJB_DD_ChangSuo" name="txtJB_DD_ChangSuo" /></td>
        </tr>
        <tr>
            <td>列车</td>
            <td colspan="2">
                <input type="text" id="txtJB_LC_CheCi" name="txtJB_LC_CheCi" /></td>
            <td>次</td>
            <td>
                <input type="text" id="txtJB_LC_CheHao" name="txtJB_LC_CheHao" /></td>
            <td colspan="2">车</td>
            <td colspan="2">
                <input type="text" id="txtJB_LC_QiDian" name="txtJB_LC_QiDian" /></td>
            <td colspan="2">站至</td>
            <td>
                <input type="text" id="txtJB_LC_ZhongDian" name="txtJB_LC_ZhongDian" /></td>
            <td>站</td>
            <td>配属</td>
            <td colspan="2">
                <input type="text" id="txtJB_LC_PeiShu" name="txtJB_LC_PeiShu" /></td>
            <td>担当</td>
            <td>
                <input type="text" id="txtJB_LC_DanDang" name="txtJB_LC_DanDang" /></td>
            <td>旅客</td>
            <td>
                <input type="text" id="txtJB_LC_LvKe" name="txtJB_LC_LvKe" /></td>

        </tr>
        <tr>
            <td>机车</td>
            <td colspan="2">
                <input type="text" id="txtJB_JC_XingHao" name="txtJB_JC_XingHao" /></td>
            <td>型</td>
            <td>
                <input type="text" id="txtJB_JC_BianHao" name="txtJB_JC_BianHao" /></td>
            <td>号</td>
            <td>配属</td>
            <td colspan="2">
                <input type="text" id="txtJB_JC_PeiShu" name="txtJB_JC_PeiShu" /></td>
            <td colspan="2">担当</td>
            <td>
                <input type="text" id="txtJB_JC_DanDang" name="txtJB_JC_DanDang" /></td>
            <td colspan="2">速度</td>
            <td colspan="2">
                <input type="text" id="txtJB_JC_SuDu" name="txtJB_JC_SuDu" /></td>
            <td>供电</td>
            <td>
                <input type="text" id="txtJB_JC_GongDian" name="txtJB_JC_GongDian" /></td>
            <td>信号</td>
            <td>
                <input type="text" id="txtJB_JC_XinHao" name="txtJB_JC_XinHao" /></td>

        </tr>
        <tr>
            <td>编组
            </td>
            <td colspan="2">
                <input type="text" id="txtJB_BZ_DunWei" name="txtJB_BZ_DunWei" /></td>
            <td>吨</td>
            <td>
                <input type="text" id="txtJB_BZ_ShuLiang" name="txtJB_BZ_ShuLiang" /></td>
            <td>辆</td>
            <td>计长</td>
            <td colspan="2">
                <input type="text" id="txtJB_BZ_JiChang" name="txtJB_BZ_JiChang" /></td>
            <td colspan="2">重车</td>
            <td>
                <input type="text" id="txtJB_BZ_ZhongChe" name="txtJB_BZ_ZhongChe" /></td>
            <td colspan="2">空车<input type="text" id="txtJB_BZ_KongChe" name="txtJB_BZ_KongChe" style="margin-left: 5px; width: 63px;" /></td>
            <td colspan="2">列尾<input type="text" id="txtJB_BZ_LieWei" name="txtJB_BZ_LieWei" style="margin-left: 5px; width: 63px;" /></td>
            <td>危险品</td>
            <td>
                <input type="text" id="txtJB_BZ_WeiXianPin" name="txtJB_BZ_WeiXianPin" /></td>
            <td>超限车</td>
            <td>
                <input type="text" id="txtJB_BZ_ChaoXianChe" name="txtJB_BZ_ChaoXianChe" /></td>

        </tr>
        <tr>
            <td>关系人</td>
            <td>司机</td>
            <td>
                <input type="text" id="txtJB_GXR_SiJi" name="txtJB_GXR_SiJi" /></td>
            <td>副司机</td>
            <td>
                <input type="text" id="txtJB_GXR_FuSiJi" name="txtJB_GXR_FuSiJi" /></td>
            <td colspan="2">运转车长</td>
            <td colspan="2">
                <input type="text" id="txtJB_GXR_YunZhuanCheZhang" name="txtJB_GXR_YunZhuanCheZhang" /></td>
            <td colspan="2">列车长</td>
            <td>
                <input type="text" id="txtJB_GXR_LieCheZhang" name="txtJB_GXR_LieCheZhang" /></td>
            <td colspan="2">值班员</td>
            <td colspan="2">
                <input type="text" id="txtJB_GXR_ZhiBanYuan" name="txtJB_GXR_ZhiBanYuan" /></td>
            <td>天气情况</td>
            <td>
                <input type="text" id="txtJB_TianQi" name="txtJB_TianQi" />
            </td>
            <td>事故性质</td>
            <td>
                <input type="text" id="txtJB_ShiGuXingZhi" name="txtJB_ShiGuXingZhi" /></td>
        </tr>
        <tr>
            <td rowspan="2">发生时间</td>
            <td>上行(单)</td>
            <td colspan="3">
                <input type="text" id="dtbJB_FS_ShangXing" name="dtbJB_FS_ShangXing" class="easyui-datetimebox sgbasetime" /></td>

            <td>复旧时间</td>
            <td>上行(单)</td>
            <td colspan="5">
                <input type="text" id="dtbJB_FJ_ShangXing" name="dtbJB_FJ_ShangXing" class="easyui-datetimebox sgbasetime" /></td>

            <td>开通时间</td>
            <td>上行(单)</td>
            <td colspan="6">
                <input type="text" id="dtbJB_KT_ShangXing" name="dtbJB_KT_ShangXing" class="easyui-datetimebox sgbasetime" /></td>
        </tr>
        <tr>
            <td>下行</td>
            <td colspan="3">
                <input type="text" id="dtbJB_FS_XiaXing" name="dtbJB_FS_XiaXing" class="easyui-datetimebox sgbasetime" /></td>
            <td colspan="2">下行</td>
            <td colspan="5">
                <input type="text" id="dtbJB_FJ_XiaXing" name="dtbJB_FJ_XiaXing" class="easyui-datetimebox sgbasetime" /></td>
            <td colspan="2">下行</td>
            <td colspan="6">
                <input type="text" id="dtbJB_KT_XiaXing" name="dtbJB_KT_XiaXing" class="easyui-datetimebox sgbasetime" /></td>
        </tr>
    </table>
</form>

<script type="text/javascript" src="js/views/AccidentBaseInfoPage.js"></script>
