<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MessageConfig.aspx.cs" Inherits="views_MessageConfig" %>

<!DOCTYPE html>
<style type="text/css">
    td {
        /*padding: 10px;*/
    }

    .right {
        text-align: right;
    }
</style>


<%--//短信配置--%>
<div class="easyui-panel" data-options="fit:true,border:false,">
    <table>
        <tr>
            <td class="right">用户名：</td>
            <td>
                <input id="message_uid" name="message_uid" class="easyui-textbox" style="width: 300px;"/></td>
        </tr>
        <tr>
            <td class="right">密码：</td>
            <td>
                <input id="message_pwd" name="message_pwd" class="easyui-textbox" style="width: 300px;"/></td>
        </tr>
        <tr>
            <td class="right">链接：</td>
            <td>
                <input id="message_url" name="message_url" class="easyui-textbox" style="width: 300px;"/></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: right"><a href="#" class="easyui-linkbutton" iconcls="icon-save" onclick="messageconfig_tool.save();">保存</a></td>
        </tr>
    </table>
</div>

<script type="text/javascript" src="js/views/MessageConfig.js"></script>
