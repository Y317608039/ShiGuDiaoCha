<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccidentBaseInfoPage.aspx.cs" Inherits="views_AccidentBaseInfoPage" %>

<!DOCTYPE html>
<style type="text/css">
    #sgbaseinfo_edit input {
        width: 60px;
    }

    #sgbaseinfo_edit td[colspan="2"] input {
        width: 130px;
    }

    #sgbaseinfo_edit td[colspan="3"] input {
        width: 190px;
    }

    #sgbaseinfo_edit table {
        border-collapse: collapse;
        border: none;
        width: 99%;
        margin: auto;
        font-size: 11px;
    }

        #sgbaseinfo_edit table td {
            border: solid 1px #666;
            /*height: 30px;*/
            /*min-width: 30px;*/
            text-align: left;
            word-break: break-all;
            word-wrap: break-word;
            padding: 6px 3px;
            vertical-align: top;
        }

        #sgbaseinfo_edit table tr td:nth-child(1), #sgbaseinfo_edit table tr td:nth-child(2) {
            vertical-align: middle;
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
        <a href="#" class="easyui-linkbutton" iconcls="icon-edit-new" plain="true" id="editpoint" onclick="sgbaseinfo_tool.editpoint();">编辑事故点坐标</a>
    </div>
</div> 

<form id="sgbaseinfo_ditu" style="margin: 0; padding: 0px; color: #333;">
    <div style="position: fixed; margin: 10px 0 0 10px; z-index: 999;">
        <input type="text" id="sgbaseinfodianid" name="sgbaseinfodianid" style="display: none;" />
        <input type="text" id="sgbaseinfodianzb" name="sgbaseinfodianzb" style="display: none;" />
        <input type="text" id="txtsgbaseinfoeditpoint" name="txtsgbaseinfoeditpoint" class="mapquery" />
        <div style="position: fixed; margin: -45px 0 0 302px;">
            <div class="ditubutton" style="background: url('images/chaxun.png'); background-size: 100%;" title="查询" onclick="sgbaseinfoqueryPoint();"></div>
        </div>
    </div>
    <div id="sgbaseinfomap" style="width: 100%; height: 500px;"></div>
    <script type="text/javascript">
        //#region 添加事故坐标点
        /********************************************************************************************************************************************************/
        var sgdianmap = new BMap.Map("sgbaseinfomap", { mapType: BMAP_HYBRID_MAP });
        sgdianmap.centerAndZoom(new BMap.Point(108.952, 34.268), 12);
        sgdianmap.addControl(new BMap.MapTypeControl());   //添加地图类型控件
        sgdianmap.setCurrentCity("西安");          // 设置地图显示的城市 此项是必须设置的
        sgdianmap.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放  

        sgdianmap.addEventListener("click", function (e) {
            var pointx = e.point.lng;
            var pointy = e.point.lat;
            $.messager.confirm('确认', String.format('您确认将以下坐标点标记到事故点吗？X:{0}<br/>Y:{1}', pointx, pointy), function (r) {
                if (r) {
                    var sgbaseinfodianid = $('#sgbaseinfodianid').val();
                    if (sgbaseinfodianid.length > 0) {
                        $.messager.progress({ text: '正在标记坐标点...' });
                        $.post(
                            'views/AccidentBaseInfoPage.aspx',
                            {
                                method: 'SaveItemPoint',
                                sgbaseinfodianid: sgbaseinfodianid,
                                pointx: pointx,
                                pointy: pointy
                            },
                            function (data, response, status) {
                                data = $.parseJSON(data);
                                $.messager.progress('close');
                                //console.log(data);
                                if (data) {
                                    $.messager.show({ title: '提示', msg: '标记坐标点成功' });
                                    $('#sgbaseinfo_ditu').dialog('close').form('reset');
                                    $('#gv_sgbaseinfo').datagrid('reload');
                                    $('#gv_sgbaseinfo').datagrid('unselectAll');

                                    showAllPoint();//刷新显示标记点
                                } else {
                                    $.messager.alert('标记坐标点失败！', '未知错误导致失败，请重试！', 'warning');
                                }
                            }
                        );
                    }
                }
            });
        });

        function sgbaseinfoqueryPoint() {
            var querytext = $('#txtsgbaseinfoeditpoint').val();
            var localsg = new BMap.LocalSearch(sgdianmap, { renderOptions: { map: sgdianmap } });
            localsg.search(querytext);
        }
        /********************************************************************************************************************************************************/
        //#endregion
    </script>
</form>

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
                <input type="text" id="txtJB_DD_Ju" name="txtJB_DD_Ju" class="requiredinput" /></td>
            <td>局</td>
            <td>
                <input type="text" id="txtJB_DD_Xian" name="txtJB_DD_Xian" class="requiredinput" /></td>
            <td>线</td>
            <td>线别</td>
            <td>
                <input type="text" id="txtJB_DD_XianBie" name="txtJB_DD_XianBie" /></td>
            <td>
                <input type="text" id="txtJB_DD_QiDian" name="txtJB_DD_QiDian" class="requiredinput" /></td>
            <td colspan="2">站至</td>
            <td>
                <input type="text" id="txtJB_DD_ZhongDian" name="txtJB_DD_ZhongDian" class="requiredinput" /></td>
            <td>站</td>
            <td>上下行</td>
            <td>
                <input type="text" id="txtJB_DD_XingBie" name="txtJB_DD_XingBie" class="requiredinput" /></td>
            <td>
                <input type="text" id="txtJB_DD_GongLi" name="txtJB_DD_GongLi" class="requiredinput" /></td>
            <td>公里股道</td>
            <td>
                <input type="text" id="txtJB_DD_MiShu" name="txtJB_DD_MiShu" class="requiredinput" /></td>
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
                <input type="text" id="txtJB_LC_CheCi" name="txtJB_LC_CheCi" class="requiredinput" /></td>
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
                <input type="text" id="txtJB_JC_XingHao" name="txtJB_JC_XingHao" class="requiredinput" /></td>
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
