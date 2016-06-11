<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccidentSpecialPage.aspx.cs" Inherits="views_AccidentSpecialPage" %>

<!DOCTYPE html>

<style type="text/css">
    #sgztinfo_edit > table {
        border-collapse: collapse;
        border: none;
        width: 99%;
        height: 400px;
        margin: auto;
    }

        #sgztinfo_edit > table td {
            /*border: solid 1px #666;*/
            padding: 3px;
            vertical-align: top;
        }
</style>

<table id="gv_sgztinfo"></table>

<div id="sgztinfo_tool" style="padding: 0px;">
    <div style="padding: 0 0 0 10px; color: #333; border-bottom: solid 1px #ccc">
        局属：<input class="textbox" id="search_txtSgZt_JB_DD_Ju" name="search_txtSgZt_JB_DD_Ju" style="width: 110px;">&nbsp;&nbsp;
        线属：<input type="text" class="textbox" id="search_txtSgZt_JB_DD_Xian" name="search_txtSgZt_JB_DD_Xian" style="width: 110px;">&nbsp;&nbsp;  
        车次：<input type="text" class="textbox" id="search_txtSgZt_JB_LC_CheCi" name="search_txtSgZt_JB_LC_CheCi" style="width: 110px;">&nbsp;&nbsp; 
       
        <a href="#" class="easyui-linkbutton" iconcls="icon-search" onclick="sgztinfo_tool.search();">查询</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-undo" onclick="sgztinfo_tool.resetquery();">重置</a>
    </div>
    <div style="margin: 0px;">
        <a href="#" class="easyui-linkbutton" iconcls="icon-reload" plain="true" onclick="sgztinfo_tool.reload();">刷新</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-redo" plain="true" id="redo" onclick="sgztinfo_tool.redo();">取消选择</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-system" plain="true" id="btnsgzt" onclick="sgztinfo_tool.showzt();">事故专题</a>
    </div>
</div>

<form id="sgztinfo_edit" style="margin: 0; padding: 0px; color: #333;">
    <input type="text" id="sgztbaseid" name="sgztbaseid" style="display: none;" />
    <table>
        <tr>
            <td style="height: 16px;">多媒体类型</td>
            <td>
                <input id="cmbZtType" name="cmbZtType" class="easyui-combobox"></td>
            <td>选择多媒体</td>
            <td>
                <input id="fileZtFile" name="fileZtFile" class="easyui-filebox"></td>
            <td><a href="#" class="easyui-linkbutton" id="uploadztfile">上传</a></td>
        </tr>
        <tr>
            <td style="height: 16px;">多媒体说明</td>
            <td colspan="4">
                <input id="txtZtDesc" name="txtZtDesc" class="easyui-textbox"></td>
        </tr>
        <tr>
            <td colspan="3" style="border: solid 1px #666; height: 16px;">图片列表
            </td>
            <td colspan="2" style="border: solid 1px #666;">视频列表
            </td>
        </tr>
        <tr>
            <td colspan="3" style="border: solid 1px #666;">
                <table style="width: 100%;" id="zttupian"></table>
            </td>
            <td colspan="2" style="border: solid 1px #666;">
                <table style="width: 100%;" id="ztshipin"></table>
            </td>
        </tr>
    </table>
    <div style="height: 5px;" />
</form>
<script type="text/javascript" src="js/views/AccidentSpecialPage.js"></script>
