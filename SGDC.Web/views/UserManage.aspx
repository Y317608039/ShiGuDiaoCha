<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManage.aspx.cs" Inherits="views_UserManage" %>

<!DOCTYPE html>

<table id="gv_UserManage"></table>

<%--//用户模块的工具栏--%>
<div id="manage_tool" style="padding: 0px;">
    <div style="margin: 5px;">
        <a href="#" class="easyui-linkbutton" iconcls="icon-add-new" plain="true" onclick="manage_tool.add();">添加</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-edit-new" plain="true" onclick="manage_tool.edit();">修改</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-delete-new" plain="true" onclick="manage_tool.remove();">删除</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-reload" plain="true" onclick="manage_tool.reload();">刷新</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-redo" plain="true" id="redo" onclick="manage_tool.redo();">取消选择</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-undo" plain="true" id="reset" onclick="manage_tool.reset();">重置密码</a>
    </div>
    <div style="padding: 0 0 0 10px; color: #333; border-top: solid 1px #ccc">
        查询用户：<input type="text" class="textbox" id="search_username" name="search_username" style="width: 110px;">&nbsp;&nbsp;
        单&nbsp;位：<input id="search_userunit" name="search_userunit" class="easyui-combobox" style="width: 130px;">&nbsp;&nbsp;
        部&nbsp;门：<input id="search_userdepartment" name="search_userdepartment" class="easyui-combobox" style="width: 130px;">&nbsp;&nbsp;
        职&nbsp;别：<input id="search_usergrade" name="search_usergrade" class="easyui-combobox" style="width: 130px;">&nbsp;&nbsp;
        <a href="#" class="easyui-linkbutton" iconcls="icon-search" onclick="manage_tool.search();">查询</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-undo" onclick="manage_tool.resetquery();">重置</a>
    </div>
</div>

<form id="manager_edit" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
    <input type="text" id="userid" name="userid" class="textbox" style="width: 200px; display: none;">
    <table>
        <tr>
            <td>用户名：</td>
            <td>
                <input type="text" id ="username" name="username" class="textbox" style="width: 193px;"></td>
        </tr>
        <tr>
            <td>用户编号：</td>
            <td>
                <input type="text" id ="userno" name="userno" class="textbox" style="width: 193px;"></td>
        </tr>
        <tr>
            <td>联系方式：</td>
            <td>
                <input type="text" id ="userphone" name="userphone" class="textbox" style="width: 193px;"></td>
        </tr>
        <tr>
            <td>单&nbsp;位：</td>
            <td>
                <input id="userunit" name="userunit" class="easyui-combobox" style="width: 200px;"></td>
        </tr>
        <tr>
            <td>部&nbsp;门：</td>
            <td>
                <input id="userdepartment" name="userdepartment" class="easyui-combobox" style="width: 200px;"></td>
        </tr>
        <tr>
            <td>职&nbsp;别：</td>
            <td>
                <input id="usergrade" name="usergrade" class="easyui-combobox" style="width: 200px;"></td>
        </tr> 
    </table>
</form>

<script type="text/javascript" src="js/views/UserManage.js"></script>
