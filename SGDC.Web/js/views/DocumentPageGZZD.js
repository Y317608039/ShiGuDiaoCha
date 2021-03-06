﻿$(
    function () {
        $('#docheadgzzd').validatebox();

        $('#gv_sgdocumentgzzd').datagrid({
            url: 'views/DocumentPageGZZD.aspx',
            fit: true,
            fitColumns: true,
            rownumbers: true,
            border: false,
            pagination: true,
            striped: true,
            singleSelect: true,
            pageSize: 10,
            pageList: [10, 20, 30, 50],
            pageNumber: 1,
            idField: 'D_ID',
            queryParams: { method: 'QryList' },
            dataType: 'json',
            columns: [[
            { field: 'D_Head', title: '文档标题', width: 30 },
            { field: 'D_Subhead', title: '文档副标', width: 30 },
            { field: 'D_Content', title: '文档描述', width: 100, formatter: function (value, row, index) { if (value) { var temptext = DelHtmlTags(decodeURIComponent(value)); if (temptext.length > 30) return temptext.substr(0, 30) + '...'; else return temptext; } else { return value; } } },
            { field: 'D_CreateTime', title: '创建时间', width: 40, formatter: function (value, row, index) { if (value) { return DateFormat(value); } else { return value; } } },
            { field: 'D_UpdateTime', title: '最后修改时间', width: 40, formatter: function (value, row, index) { if (value) { return DateFormat(value); } else { return value; } } }
            ]],
            toolbar: "#sgdocument_toolgzzd"
        });

        $('#sgdocumentr_editgzzd').dialog({
            width: 900,
            title: '编辑文档',
            modal: true,
            closed: true,
            iconCls: 'icon-user-add',
            buttons: [{
                text: '保存',
                iconCls: 'icon-add-new',
                handler: function () {
                    if ($('#sgdocumentr_editgzzd').form('validate')) {
                        $.messager.progress({ text: '正在保存中...' });
                        editorgzzd.sync();
                        console.log($('#docdescgzzd').val());
                        console.log(encodeURIComponent($('#docdescgzzd').val()));
                        $.post(
                            'views/DocumentPageGZZD.aspx',
                            {
                                method: 'SaveItem',
                                docid: $('#docidgzzd').val(),
                                dochead: $('#docheadgzzd').val(),
                                docsubhead: $('#docsubheadgzzd').val(),
                                docdesc: encodeURIComponent($('#docdescgzzd').val())
                            },
                            function (data, response, status) {
                                data = $.parseJSON(data);
                                $.messager.progress('close');
                                //console.log(data);
                                if (data) {
                                    $.messager.show({
                                        title: '提示',
                                        msg: '保存成功'
                                    });
                                    $('#sgdocumentr_editgzzd').dialog('close').form('reset');
                                    $('#gv_sgdocumentgzzd').datagrid('reload');
                                    $('#gv_sgdocumentgzzd').datagrid('unselectAll');
                                } else {
                                    $.messager.alert('保存失败！', '未知错误导致失败，请重试！', 'warning');
                                }
                            }
                        );
                    }
                }
            }, {
                text: '取消',
                iconCls: 'icon-redo',
                handler: function () {
                    $('#sgdocumentr_editgzzd').dialog('close').form('reset');
                }
            }],
            onClose: function () {
                $('#sgdocumentr_editgzzd').form('reset');
                editorgzzd.html('');
            }
        });

        sgdocument_toolgzzd = {
            add: function () {
                $('#sgdocumentr_editgzzd').dialog({ title: "添加文档" }).dialog('open');
                $('#docheadgzzd').focus();
            },
            edit: function () {
                var rows = $('#gv_sgdocumentgzzd').datagrid('getSelections');
                if (rows.length > 0) {
                    console.log(rows[0]);
                    $('#sgdocumentr_editgzzd').form('load', {
                        docidgzzd: rows[0].D_ID,
                        docheadgzzd: rows[0].D_Head,
                        docsubheadgzzd: rows[0].D_Subhead
                    }).dialog({ title: "修改文档" }).dialog('open');
                    editorgzzd.html(decodeURIComponent(rows[0].D_Content));
                } else if (rows.length === 0) {
                    $.messager.alert('警告操作！', '请选择要修改的记录！', 'warning');
                }
            },
            reload: function () {
                $('#gv_sgdocumentgzzd').datagrid('reload');
            },
            redo: function () {
                $('#gv_sgdocumentgzzd').datagrid('unselectAll');
            },
            remove: function () {
                var rows = $('#gv_sgdocumentgzzd').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('确定操作', '您确定要删除所选的记录吗？', function (flag) {
                        if (flag) {
                            $.messager.progress({ text: '正在删除中...' });
                            console.log(rows[0]);
                            $.post(
                                'views/DocumentPageGZZD.aspx',
                                {
                                    method: 'DelItem',
                                    docidgzzd: rows[0].D_ID
                                },
                                function (data) {
                                    if (data) {
                                        $.messager.progress('close');
                                        $('#gv_sgdocumentgzzd').datagrid('load');
                                        $('#gv_sgdocumentgzzd').datagrid('unselectAll');
                                        $.messager.show({
                                            title: '提示',
                                            msg: '1 条记录被删除！'
                                        });
                                    }
                                });
                        }
                    });
                } else {
                    $.messager.alert('提示', '请选择要删除的记录！', 'info');
                }
            },
            resetquery: function () {
                $('#search_doctypegzzd').combobox("setText", "　");
                $('#search_docheadgzzd').val("");
            },
            search: function () {
                $('#gv_sgdocumentgzzd').datagrid('unselectAll');
                $('#gv_sgdocumentgzzd').datagrid('load', {
                    method: 'QryList',
                    dochead: $('#search_docheadgzzd').val(),
                    docdesc: $('#search_docdescgzzd').val()
                });
            }
        };
        var editorgzzd = KindEditor.create('#docdescgzzd', {
            resizeType: 1,
            allowPreviewEmoticons: false,
            allowImageUpload: false,
            items: ['fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist']
        });

    }
);
