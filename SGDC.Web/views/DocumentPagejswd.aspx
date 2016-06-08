<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DocumentPagejswd.aspx.cs" Inherits="DocumentPagejswd" %>

<!DOCTYPE html>

<table id="gv_sgdocumentjswd"></table>

<%--//文档模块的工具栏--%>
<div id="sgdocument_tooljswd" style="padding: 0px;">
    <div style="padding: 0 0 0 10px; color: #333; border-bottom: solid 1px #ccc">
        文档标题：<input type="text" class="textbox" id="search_docheadjswd" name="search_docheadjswd" style="width: 110px;">&nbsp;&nbsp;  
        关&nbsp;键&nbsp;字：<input type="text" class="textbox" id="search_docdescjswd" name="search_docdescjswd" style="width: 110px;">&nbsp;&nbsp; 
       
        <a href="#" class="easyui-linkbutton" iconcls="icon-search" onclick="sgdocument_tooljswd.search();">查询</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-undo" onclick="sgdocument_tooljswd.resetquery();">重置</a>
    </div>
    <div style="margin: 0px;">
        <a href="#" class="easyui-linkbutton" iconcls="icon-add-new" plain="true" onclick="sgdocument_tooljswd.add();">添加</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-edit-new" plain="true" onclick="sgdocument_tooljswd.edit();">修改</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-delete-new" plain="true" onclick="sgdocument_tooljswd.remove();">删除</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-reload" plain="true" onclick="sgdocument_tooljswd.reload();">刷新</a>
        <a href="#" class="easyui-linkbutton" iconcls="icon-redo" plain="true" id="redo" onclick="sgdocument_tooljswd.redo();">取消选择</a>
    </div>
</div>

<form id="sgdocumentr_editjswd" style="margin: 0; padding: 5px 0 0 25px; color: #333;" class="showform">
    <input type="text" id="docidjswd" name="docidjswd" class="textbox" style="width: 200px; display: none;">
    <table>
        <tr>
            <td style="padding-left: 10px;">文档标题：</td>
            <td>
                <input type="text" id="docheadjswd" name="docheadjswd" class="easyui-validatebox textbox" style="width: 194px;" required="true" missingmessage="请输入文档标题"></td>

            <td style="padding-left: 10px;">文档副标：</td>
            <td>
                <input type="text" id="docsubheadjswd" name="docsubheadjswd" class="easyui-validatebox textbox" style="width: 194px;"></td>
        </tr>
        <tr>
            <td>文档内容：</td>
            <td colspan="3">
                <textarea id="docdescjswd" name="docdescjswd" style="width: 756px; height: 400px;"></textarea>


            </td>
        </tr>
    </table>
</form>
<script src="kindeditor/kindeditor-all-min.js"></script>
<script src="kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript" src="js/views/DocumentPagejswd.js"></script>


