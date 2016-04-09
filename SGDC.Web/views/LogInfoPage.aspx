<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogInfoPage.aspx.cs" Inherits="views_LogInfoPage" %>

<!DOCTYPE html>

<table id="gv_logInfoManage" allowCellWrap="true"></table>

<%--//日志工具栏--%>
<div id="loginfomanage_tool" style="padding: 0px;">
   <%-- <div style="margin: 5px;">
        <a href="#" class="easyui-linkbutton" iconcls="icon-add-new" plain="true" onclick="cltmanage_tool.add();">添加</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-edit-new" plain="true" onclick="cltmanage_tool.edit();">修改</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-delete-new" plain="true" onclick="cltmanage_tool.remove();">删除</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-reload" plain="true" onclick="cltmanage_tool.reload();">刷新</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-redo" plain="true" id="redo" onclick="cltmanage_tool.redo();">取消选择</a>
    </div>--%>
    <div style="padding: 0 0 0 10px; color: #333; border-top: solid 1px #ccc">
        类型：<input id="search_logtype" name="search_logtype" class="easyui-combobox" style="width: 130px;">&nbsp;&nbsp; 
        时间区间：<input id="search_logbegintime" name="search_logbegintime" class="easyui-datebox" style="width: 130px;"> --
        <input id="search_logendtime" name="search_logendtime" class="easyui-datebox" style="width: 130px;">&nbsp;&nbsp;  
        关键字：<input id="search_logdesc" name="search_logdesc" class="textbox" style="width: 130px;">&nbsp;&nbsp;
        <a href="#" class="easyui-linkbutton" iconcls="icon-search" onclick="loginfomanage_tool.search();">查询</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-undo" onclick="loginfomanage_tool.resetquery();">重置</a>
    </div>
</div>
<script src="js/views/LogInfoPage.js"></script>
