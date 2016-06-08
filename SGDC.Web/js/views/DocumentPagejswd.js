$(
    function () {
        $('#docheadjswd').validatebox();

        $('#gv_sgdocumentjswd').datagrid({
            url: 'views/DocumentPagejswd.aspx',
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
            toolbar: "#sgdocument_tooljswd"
        });

        $('#sgdocumentr_editjswd').dialog({
            width: 900,
            title: '编辑文档',
            modal: true,
            closed: true,
            iconCls: 'icon-user-add',
            buttons: [{
                text: '保存',
                iconCls: 'icon-add-new',
                handler: function () {
                    if ($('#sgdocumentr_editjswd').form('validate')) {
                        $.messager.progress({ text: '正在保存中...' });
                        editorjswd.sync();
                        console.log($('#docdescjswd').val());
                        console.log(encodeURIComponent($('#docdescjswd').val()));
                        $.post(
                            'views/DocumentPagejswd.aspx',
                            {
                                method: 'SaveItem',
                                docid: $('#docidjswd').val(),
                                dochead: $('#docheadjswd').val(),
                                docsubhead: $('#docsubheadjswd').val(),
                                docdesc: encodeURIComponent($('#docdescjswd').val())
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
                                    $('#sgdocumentr_editjswd').dialog('close').form('reset');
                                    $('#gv_sgdocumentjswd').datagrid('reload');
                                    $('#gv_sgdocumentjswd').datagrid('unselectAll');
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
                    $('#sgdocumentr_editjswd').dialog('close').form('reset');
                }
            }],
            onClose: function () {
                $('#sgdocumentr_editjswd').form('reset');
                editorjswd.html('');
            }
        });

        sgdocument_tooljswd = {
            add: function () {
                $('#sgdocumentr_editjswd').dialog({ title: "添加文档" }).dialog('open');
                $('#docheadjswd').focus();
            },
            edit: function () {
                var rows = $('#gv_sgdocumentjswd').datagrid('getSelections');
                if (rows.length > 0) {
                    console.log(rows[0]);
                    $('#sgdocumentr_editjswd').form('load', {
                        docidjswd: rows[0].D_ID,
                        docheadjswd: rows[0].D_Head,
                        docsubheadjswd: rows[0].D_Subhead
                    }).dialog({ title: "修改文档" }).dialog('open');
                    editorjswd.html(decodeURIComponent(rows[0].D_Content));
                } else if (rows.length === 0) {
                    $.messager.alert('警告操作！', '请选择要修改的记录！', 'warning');
                }
            },
            reload: function () {
                $('#gv_sgdocumentjswd').datagrid('reload');
            },
            redo: function () {
                $('#gv_sgdocumentjswd').datagrid('unselectAll');
            },
            remove: function () {
                var rows = $('#gv_sgdocumentjswd').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('确定操作', '您确定要删除所选的记录吗？', function (flag) {
                        if (flag) {
                            $.messager.progress({ text: '正在删除中...' });
                            console.log(rows[0]);
                            $.post(
                                'views/DocumentPagejswd.aspx',
                                {
                                    method: 'DelItem',
                                    docidjswd: rows[0].D_ID
                                },
                                function (data) {
                                    if (data) {
                                        $.messager.progress('close');
                                        $('#gv_sgdocumentjswd').datagrid('load');
                                        $('#gv_sgdocumentjswd').datagrid('unselectAll');
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
                $('#search_doctypejswd').combobox("setText", "　");
                $('#search_docheadjswd').val("");
            },
            search: function () {
                $('#gv_sgdocumentjswd').datagrid('unselectAll');
                $('#gv_sgdocumentjswd').datagrid('load', {
                    method: 'QryList',
                    dochead: $('#search_docheadjswd').val(),
                    docdesc: $('#search_docdescjswd').val()
                });
            }
        };
        var editorjswd = KindEditor.create('#docdescjswd', {
            resizeType: 1,
            allowPreviewEmoticons: false,
            allowImageUpload: false,
            items: ['fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist']
        });

    }
);
