<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccidentAnalyzeManagePage.aspx.cs" Inherits="views_AccidentAnalyzeManagePage" %>

<!DOCTYPE html>

<table id="gv_sgfenxiinfo"></table>

<div id="sgfenxiinfo_tool" style="padding: 0px;">
    <div style="padding: 0 0 0 10px; color: #333; border-bottom: solid 1px #ccc">
        局属：<input class="textbox" id="search_txtFx_JB_DD_Ju" name="search_txtFx_JB_DD_Ju" style="width: 110px;">&nbsp;&nbsp;
        线属：<input type="text" class="textbox" id="search_txtFx_JB_DD_Xian" name="search_txtFx_JB_DD_Xian" style="width: 110px;">&nbsp;&nbsp;  
        车次：<input type="text" class="textbox" id="search_txtFx_JB_LC_CheCi" name="search_txtFx_JB_LC_CheCi" style="width: 110px;">&nbsp;&nbsp;
          
        <a href="#" class="easyui-linkbutton" iconcls="icon-search" onclick="sgfenxiinfo_tool.search();">查询</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-undo" onclick="sgfenxiinfo_tool.resetquery();">重置</a>
    </div>
    <div style="margin: 0px;">
        <a href="#" class="easyui-linkbutton" iconcls="icon-gr-doc" plain="true" onclick="sgfenxiinfo_tool.showdetail();">查看具体事故信息</a> 
        <a href="#" class="easyui-linkbutton" iconcls="icon-reload" plain="true" onclick="sgfenxiinfo_tool.reload();">刷新</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-redo" plain="true" id="redo" onclick="sgfenxiinfo_tool.redo();">取消选择</a>
    </div>
</div>

<script type="text/javascript" src="js/views/AccidentAnalyzeManagePage.js"></script>
