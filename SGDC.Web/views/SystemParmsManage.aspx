<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SystemParmsManage.aspx.cs" Inherits="views_SystemParmsManage" %>

<!DOCTYPE html>
<table id="gv_datadicManage"></table>

<%--//文档模块的工具栏--%>
<div id="datadicmanage_tool" style="padding: 0px;">
    <div style="padding: 0 0 0 10px; color: #333; border-bottom: solid 1px #ccc">
        项目类型：<input id="search_datadictype" name="search_datadictype" class="easyui-combobox" style="width: 130px;">&nbsp;&nbsp;
        项目名称：<input type="text" class="textbox" id="search_datadicname" name="search_datadicname" style="width: 110px;">&nbsp;&nbsp;  
        <a href="#" class="easyui-linkbutton" iconcls="icon-search" onclick="datadicmanage_tool.search();">查询</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-undo" onclick="datadicmanage_tool.resetquery();">重置</a>
    </div>
    <div style="margin: 0px;">
        <a href="#" class="easyui-linkbutton" iconcls="icon-add-new" plain="true" onclick="datadicmanage_tool.add();">添加</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-edit-new" plain="true" onclick="datadicmanage_tool.edit();">修改</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-delete-new" plain="true" onclick="datadicmanage_tool.remove();">删除</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-reload" plain="true" onclick="datadicmanage_tool.reload();">刷新</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-redo" plain="true" id="redo" onclick="datadicmanage_tool.redo();">取消选择</a>
    </div>
</div>

<form id="datadicmanager_edit" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
    <input type="text" id="datadicid" name="datadicid" class="textbox" style="width: 200px; display: none;">
    <table>
        <tr>
            <td>项目类型：</td>
            <td>
                <input id="datadictype" name="datadictype" class="easyui-combobox" style="width: 200px;" required="true" missingmessage="请选择项目类型"></td>
        </tr>
        <tr>
            <td>项目名称：</td>
            <td>
                <input type="text" id="datadicname" name="datadicname" class="easyui-validatebox textbox" style="width: 194px;" required="true" missingmessage="请输入项目名称"></td>
        </tr>
        <tr>
            <td>项目描述：</td>
            <td>
                <input type="text" id="datadicdesc" name="datadicdesc" class="easyui-validatebox textbox" style="width: 194px;"></td>
        </tr>
        <tr>
            <td>信息扩展1：</td>
            <td>
                <input type="text" id="datadicext1" name="datadicext1" class="textbox" style="width: 194px;"></td>
        </tr>
        <tr>
            <td>信息扩展2：</td>
            <td>
                <input type="text" id="datadicext2" name="datadicext2" class="textbox" style="width: 194px;"></td>
        </tr>
        <tr>
            <td>信息扩展3：</td>
            <td>
                <input type="text" id="datadicext3" name="datadicext3" class="textbox" style="width: 194px;"></td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="js/views/SystemParmsManage.js"></script>
