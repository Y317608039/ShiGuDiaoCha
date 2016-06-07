<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DocumentPage.aspx.cs" Inherits="views_DocumentPage" %>

<!DOCTYPE html>

<div style="display: none;" id="formartdescval"></div>

<table id="gv_sgdocument"></table>

<%--//文档模块的工具栏--%>
<div id="sgdocument_tool" style="padding: 0px;">
    <div style="padding: 0 0 0 10px; color: #333; border-bottom: solid 1px #ccc">
        <%--文档类型：<input id="search_doctype" name="search_doctype" class="easyui-combobox" style="width: 130px;">&nbsp;&nbsp;--%>
        文档标题：<input type="text" class="textbox" id="search_dochead" name="search_dochead" style="width: 110px;">&nbsp;&nbsp;  
        关&nbsp;键&nbsp;字：<input type="text" class="textbox" id="search_docdesc" name="search_docdesc" style="width: 110px;">&nbsp;&nbsp; 
        <a href="#" class="easyui-linkbutton" iconcls="icon-search" onclick="sgdocument_tool.search();">查询</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-undo" onclick="sgdocument_tool.resetquery();">重置</a>
    </div>
    <div style="margin: 0px;">
        <a href="#" class="easyui-linkbutton" iconcls="icon-add-new" plain="true" onclick="sgdocument_tool.add();">添加</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-edit-new" plain="true" onclick="sgdocument_tool.edit();">修改</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-delete-new" plain="true" onclick="sgdocument_tool.remove();">删除</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-reload" plain="true" onclick="sgdocument_tool.reload();">刷新</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-redo" plain="true" id="redo" onclick="sgdocument_tool.redo();">取消选择</a>
    </div>
</div>

<form id="sgdocumentr_edit" style="margin: 0; padding: 5px 0 0 25px; color: #333;" class="showform">
    <input type="text" id="docid" name="docid" class="textbox" style="width: 200px; display: none;">
    <table>
        <tr>
            <%--<td>文档类型：</td>
            <td>
                <input id="doctype" name="doctype" class="easyui-combobox" style="width: 200px;" required="true" missingmessage="请选择文档类型"></td>--%>
          
            <td style="padding-left: 10px;">文档标题：</td>
            <td>
                <input type="text" id="dochead" name="dochead" class="easyui-validatebox textbox" style="width: 194px;" required="true" missingmessage="请输入文档标题"></td>
            <%-- </tr>
        <tr>--%>
            <td style="padding-left: 10px;">文档副标：</td>
            <td>
                <input type="text" id="docsubhead" name="docsubhead" class="easyui-validatebox textbox" style="width: 194px;"></td>
        </tr>
        <tr>
            <td>文档内容：</td>
            <td colspan="3">
                <textarea id="docdesc" name="docdesc" style="width: 756px; height: 400px;"></textarea>
                <%--<input type="text" id="docdesc" name="docdesc" class="easyui-validatebox textbox" style="width: 200px; height: 60px;">--%>

            </td>
        </tr>
        <%--<tr>
            <td>信息扩展1：</td>
            <td>
                <input type="text" id="docext1" name="docext1" class="textbox" style="width: 194px;"></td>
        </tr>
        <tr>
            <td>信息扩展2：</td>
            <td>
                <input type="text" id="docext2" name="docext2" class="textbox" style="width: 194px;"></td>
        </tr>
        <tr>
            <td>信息扩展3：</td>
            <td>
                <input type="text" id="docext3" name="docext3" class="textbox" style="width: 194px;"></td>
        </tr>--%>
    </table>
</form>
<script src="kindeditor/kindeditor-all-min.js"></script>
<script src="kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript" src="js/views/DocumentPage.js"></script>


