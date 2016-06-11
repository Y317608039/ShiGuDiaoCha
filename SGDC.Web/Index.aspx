<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>铁路事故调查管理系统</title>
    <link type="text/css" href="easyui/themes/default/easyui.css" rel="stylesheet" />
    <link type="text/css" href="easyui/themes/icon.css" rel="stylesheet" />
    <link type="text/css" href="styles/index.css" rel="stylesheet" />
    <link href="kindeditor/themes/default/default.css" rel="stylesheet" />
</head>
<body class="easyui-layout">

    <div data-options="region:'north',border:false" style="overflow: hidden; height: 63px;" class="panel-body panel-body-noheader panel-body-noborder layout-body">
        <div style="width: 100%; height: 63px; position: relative; background-image: url(Images/top_bg1.jpg)">
            <div style="float: left; width: 493px; height: 63px;">
                <img style="width: 493px; height: 63px;" src="Images/top_bg.png" />
            </div>
            <%--<div style="margin: 8px 15px 15px -360px; font-size: 28px; float: left;" class="daoying">铁 路 事 故 调 查 管 理 系 统</div>--%>
            <div style="float: right; height: 50px;">
                <div style="text-align: center; float: left; padding-top: 35px; padding-left: 10px;">
                    <a class="easyui-linkbutton" id="btnmodifypwd" data-options="iconCls:'icon-edit'" onclick="ChangePwd()">修改密码</a>
                </div>
                <div style="text-align: center; float: right; padding-top: 35px; padding-left: 10px;">
                    <a class="easyui-linkbutton" id="btnexit" data-options="iconCls:'icon-redo'" onclick="Logout()">退出</a>
                </div>
            </div>
        </div>
    </div>
    <div data-options="region:'west',split:true" title="功能导航" style="width: 200px;">
        <div id="expandMenu" class="easyui-accordion" data-options="fit:true,border:false">
            <div title="事故处理" style="padding: 5px;">
                <ul>
                    <li>
                        <div class="">
                            <a ref="Menu0001" href="#" rel="views/AccidentBaseInfoPage.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">事故地点定位与报警</span></a>
                        </div>
                    </li>
                    <li>
                        <div class="">
                            <a ref="Menu0002" href="#" rel="views/AccidentZeRenInfoPage.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">事故调查处理</span></a>
                        </div>
                    </li>
                    <li>
                        <div class="">
                            <a ref="Menu0003" href="#" rel="views/.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">事故调查分析管理</span></a>
                        </div>
                    </li>
                </ul>
            </div>
            
            <div title="文档管理" style="padding: 5px;">
                <ul>
                    <li>
                        <div class="">
                            <a ref="Menu1002" href="#" rel="views/DocumentPageGZZD.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">规章制度</span></a>
                        </div>
                    </li>
                    <li>
                        <div class="">
                            <a ref="Menu0002" href="#" rel="views/DocumentPagedbda.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">电报档案</span></a>
                        </div>
                    </li>
                    <li>
                        <div class="">
                            <a ref="Menu1002" href="#" rel="views/DocumentPagejswd.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">技术文档</span></a>
                        </div>
                    </li>
                    <li>
                        <div class="">
                            <a ref="Menu0002" href="#" rel="views/DocumentPage.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">事故案例</span></a>
                        </div>
                    </li>
                </ul>
            </div>
            
            <div title="短信管理" style="padding: 5px;">
                <ul>
                    <li>
                        <div class="">
                            <a ref="Menu1002" href="#" rel="views/MessageConfig.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">短信配置</span></a>
                        </div>
                    </li>
                    <li>
                        <div class="">
                            <a ref="Menu0002" href="#" rel="views/.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">短信日志</span></a>
                        </div>
                    </li> 
                </ul>
            </div>

            <%--<div title="基础信息管理" style="padding: 5px;">
                <ul>
                    <li>
                        <div class="">
                            <a ref="Menu1002" href="#" rel="views/UserManage.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">人员信息</span></a>
                        </div>
                    </li>
                    <li>
                        <div class="">
                            <a ref="Menu0002" href="#" rel="views/DocumentPage.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">文档信息</span></a>
                        </div>
                    </li>
                </ul>
            </div>--%>
            <div title="专题图处理和编辑" style="padding: 5px;">
                <ul>
                    <li>
                        <div class="">
                            <a ref="Menu1002" href="#" rel="views/AccidentSpecialPage.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">历史事故记录</span></a>
                        </div>
                    </li> 
                </ul>
            </div>

            <div title="系统配置" style="padding: 5px;">
                <ul>
                    <li>
                        <div class="">
                            <a ref="Menu1001" href="#" rel="views/SystemParmsManage.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">系统参数配置</span></a>
                        </div>
                    </li>
                     <li>
                        <div class="">
                            <a ref="Menu1002" href="#" rel="views/UserManage.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">人员和权限管理</span></a>
                        </div>
                    </li> 
                    <li>
                        <div class="">
                            <a ref="Menu1002" href="#" rel="views/LogInfoPage.aspx"><span class="icon icon-default">&nbsp;</span><span class="nav">系统日志</span></a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div data-options="region:'south',border:false" style="height: 20px; background-color: #5c87b2; overflow: hidden; color: #000444; text-align: center; line-height: normal;">
        <div style="padding: 2px; background-color: #4080b0">
            <span style="color: white;">&nbsp;&nbsp; © All Right <a href="" style="color: white;" target="_blank">有限公司</a> 2015-2015</span> &nbsp;&nbsp; 
            <span style="color: white;" class="STYLE7" id="ServerDateTime1">建议IE8.0+及分辨率在1024*768及以上使用</span>
        </div>
    </div>
    <div data-options="region:'center',border:false" style="background: #eee; overflow: hidden; border: 1px solid #95B8E7;">
        <form id="changePwd" style="margin: 0; padding: 5px 0 0 25px; color: #333;">
            <p>旧 &nbsp;密 码：<input id="oldPwd" name="oldPwd" class="easyui-textbox" data-options="type:'password',required:true,validType:'minLength[3]'" style="width: 160px;"></p>
            <p>新 &nbsp;密 码：<input id="newPwd" name="newPwd" class="easyui-textbox" data-options="type:'password',required:true,validType:'minLength[3]'" style="width: 160px;"></p>
            <p>确认密码：<input id="newPwd1" name="newPwd1" class="easyui-textbox" data-options="type:'password',required:true,validType:'minLength[3]'" style="width: 160px;"></p>
            <p><label id="showvalidinfo" /></p>
        </form>
        <div id="tabs">
            <div title="首页" style="padding: 0; display: block; overflow: hidden;" href="views/homepage.aspx">
            </div>
        </div>
    </div>

    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Ttudj3z5XkdxXZGlRasVplqGAkLduSx7"></script>
    <script type="text/javascript" src="js/views/DistanceTool_min.js"></script>
    <script type="text/javascript" src="js/views/AreaRestriction_min.js"></script>

    <%-- <script type="text/javascript" src="http://api.map.baidu.com/library/DistanceTool/1.2/src/DistanceTool_min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>--%>

    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="easyui/jquery.form.js"></script>
    <script type="text/javascript" src="js/helpfun.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <%--<script src="supermap/libs/SuperMap.Include.js"></script>--%>
</body>
</html>
