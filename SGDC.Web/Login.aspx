<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="views_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>铁路事故调查管理系统</title>
    <link type="text/css" href="easyui/themes/metro/easyui.css" rel="stylesheet" />
    <link type="text/css" href="easyui/themes/icon.css" rel="stylesheet" />
    <link type="text/css" href="styles/Login.css" rel="stylesheet" />
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        .tdLeft {
            text-align: right;
            width: 70px;
            color: white;
        }

        .tdright {
            text-align: right;
            padding-right: 20px;
        }

        #myform td {
            font-size: 14px;
        }
    </style>
</head>
<body style="" class="loginbody1">
    <div style="margin: 180px auto 0px auto; border: solid 1px transparent; width: 800px; height: 420px; background: url('styles/dl_center.png'); background-size: 100% 100%;">
        <form id="myform">
            <table style="/*line-height: 30px; border: solid 1px #999; border-radius: 10px; */ width: 700px; margin: -50px auto 0px auto;">
                <tr>
                    <td colspan="3">
                        <div style="height: 50px; width: 375px; margin: auto; font-weight: bold; font-size: 28px;opacity: 0.8">铁 路 事 故 调 查 管 理 系 统</div><%--background: url('styles/dl_logo.png'); background-size: 100% 100%;--%>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div style="height: 120px; width: 375px;"></div>
                    </td>
                </tr>
                <tr>
                    <td class="tdLeft" style="width: 420px; height: 40px;">用户名:</td>
                    <td class="tdright" colspan="2">
                        <input type="text" name="username" class="easyui-validatebox textbox" required="true" missingmessage="请输入姓名!" value="admin" style="width: 200px;" /></td>
                </tr>
                <tr>
                    <td class="tdLeft" style="height: 40px;">密&nbsp;&nbsp;&nbsp;码:</td>
                    <td class="tdright" colspan="2">
                        <input type="password" name="password" class="easyui-validatebox textbox" required="true" missingmessage="请输入密码!" value="123456" style="width: 200px;" /></td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 40px;">
                        <label id="lblErrorMessage" style="color: red; padding-right: 10px; float: right;"></label>
                    </td>
                    <td style="width: 120px; text-align: right; padding: 0 20px 10px 0;"><a id="btnLogin" class="easyui-linkbutton" style="width: 90px;">登&nbsp;陆</a></td>
                </tr>
            </table>

        </form>
    </div>
    <script type="text/javascript" src="js/Login.js"></script>
</body>
</html>

