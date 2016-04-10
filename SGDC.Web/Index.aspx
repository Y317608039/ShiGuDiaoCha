<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link type="text/css" href="easyui/themes/metro/easyui.css" rel="stylesheet" />
    <link type="text/css" href="easyui/themes/icon.css" rel="stylesheet" />
    <link type="text/css" href="styles/index.css" rel="stylesheet" />
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="overflow: hidden; height: 63px;" class="panel-body panel-body-noheader panel-body-noborder layout-body">
        <div style="width: 100%; height: 63px; position: relative; background-image: url(Images/top_bg1.jpg)">
            <div style="float: left; width: 493px; height: 63px;">
                <img style="width: 493px; height: 63px;" src="Images/top_bg.png" />
            </div>
            <div style="float: right; height: 50px;">
                <div style="text-align: center; float: left; padding-top: 10px; padding-left: 10px;">
                    <a class="easyui-linkbutton" id="btnmodifypwd" data-options="iconCls:'icon-edit'">修改密码</a>
                </div>
                <div style="text-align: center; float: right; padding-top: 10px; padding-left: 10px;">
                    <a class="easyui-linkbutton" id="btnexit" data-options="iconCls:'icon-redo'" onclick="exitclick()">退出</a>
                </div>
            </div>
        </div>
    </div>
    <div data-options="region:'west',split:true" title="功能导航" style="width: 200px;">
        <div id="expandMenu" class="easyui-accordion" data-options="fit:true,border:false">
            <div title="菜单一" style="padding: 5px;">
                <ul>
                    <li>
                        <div class="">
                            <a ref="Menu0001" href="#" rel="views/SystemParmsManage.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">项目一</span></a>
                        </div>
                    </li>
                    <li>
                        <div class="">
                            <a ref="Menu0002" href="#" rel="Views/DanWeiRenYuanXinXi/RenYuanJiBenXinXi.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">项目二</span></a>
                        </div>
                    </li>
                    <li>
                        <div class="">
                            <a ref="Menu0003" href="#" rel="Views/FillAccidentForm.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">填充表单</span></a>
                        </div>
                    </li>
                </ul>
            </div>
            <div title="基础信息管理" style="padding: 5px;">
                <ul>
                    <li>
                        <div class="">
                            <a ref="Menu1002" href="#" rel="Views/jbxx/xlxbxx.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">人员信息</span></a>
                        </div>
                    </li>
                    <li>
                        <div class="">
                            <a ref="Menu0002" href="#" rel="views/DocumentPage.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">文档信息</span></a>
                        </div>
                    </li>
                </ul>
            </div>

            <div title="系统管理" style="padding: 5px;">
                <ul> 
                    <li>
                        <div class="">
                            <a ref="Menu1001" href="#" rel="views/SystemParmsManage.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">系统参数</span></a>
                        </div>
                    </li>
                    <li>
                        <div class="">
                            <a ref="Menu1002" href="#" rel="views/LogInfoPage.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">日志信息</span></a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div data-options="region:'south',border:false" style="height: 20px; background-color: #5c87b2; overflow: hidden; color: #000444; text-align: center; line-height: normal;">
        <div style="padding: 2px; background-color: #4080b0">
            <span style="color: white;">&nbsp;&nbsp; © All Right <a href="" style="color: white;"
                target="_blank">有限公司</a> 2015-2015</span> &nbsp;&nbsp; <span style="color: white;"
                    class="STYLE7" id="ServerDateTime1">建议IE8.0+及分辨率在1024*768及以上使用</span>
        </div>
    </div>
    <div data-options="region:'center',border:false" style="background: #eee; overflow: hidden; border: 1px solid #95B8E7;">
        <div id="tabs">
            <div title="首页" style="padding: 0; display: block; overflow: hidden;" href="views/homepage.aspx">
            </div>
        </div>
    </div>
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <script type="text/javascript" src="easyui/jquery.form.js"></script>
    <script src="supermap/libs/SuperMap.Include.js"></script>
</body>
</html>
