$(
    function () {
        $('#docheaddbda').validatebox();

        $('#gv_sgdocumentdbda').datagrid({
            url: 'views/DocumentPagedbda.aspx',
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
            toolbar: "#sgdocument_tooldbda"
        });

        $('#sgdocumentr_editdbda').dialog({
            width: 900,
            title: '编辑文档',
            modal: true,
            closed: true,
            iconCls: 'icon-user-add',
            buttons: [{
                text: '保存',
                iconCls: 'icon-add-new',
                handler: function () {
                    if ($('#sgdocumentr_editdbda').form('validate')) {
                        $.messager.progress({ text: '正在保存中...' });
                        editordbda.sync();
                        console.log($('#docdescdbda').val());
                        console.log(encodeURIComponent($('#docdescdbda').val()));
                        $.post(
                            'views/DocumentPagedbda.aspx',
                            {
                                method: 'SaveItem',
                                docid: $('#dociddbda').val(),
                                dochead: $('#docheaddbda').val(),
                                docsubhead: $('#docsubheaddbda').val(),
                                docdesc: encodeURIComponent($('#docdescdbda').val())
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
                                    $('#sgdocumentr_editdbda').dialog('close').form('reset');
                                    $('#gv_sgdocumentdbda').datagrid('reload');
                                    $('#gv_sgdocumentdbda').datagrid('unselectAll');
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
                    $('#sgdocumentr_editdbda').dialog('close').form('reset');
                }
            }],
            onClose: function () {
                $('#sgdocumentr_editdbda').form('reset');
                editordbda.html('');
            }
        });

        sgdocument_tooldbda = {
            add: function () {
                $('#sgdocumentr_editdbda').dialog({ title: "添加文档" }).dialog('open');
                $('#docheaddbda').focus();
            },
            edit: function () {
                var rows = $('#gv_sgdocumentdbda').datagrid('getSelections');
                if (rows.length > 0) {
                    console.log(rows[0]);
                    $('#sgdocumentr_editdbda').form('load', {
                        dociddbda: rows[0].D_ID,
                        docheaddbda: rows[0].D_Head,
                        docsubheaddbda: rows[0].D_Subhead
                    }).dialog({ title: "修改文档" }).dialog('open');
                    editordbda.html(decodeURIComponent(rows[0].D_Content));
                } else if (rows.length === 0) {
                    $.messager.alert('警告操作！', '请选择要修改的记录！', 'warning');
                }
            },
            reload: function () {
                $('#gv_sgdocumentdbda').datagrid('reload');
            },
            redo: function () {
                $('#gv_sgdocumentdbda').datagrid('unselectAll');
            },
            remove: function () {
                var rows = $('#gv_sgdocumentdbda').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('确定操作', '您确定要删除所选的记录吗？', function (flag) {
                        if (flag) {
                            $.messager.progress({ text: '正在删除中...' });
                            console.log(rows[0]);
                            $.post(
                                'views/DocumentPagedbda.aspx',
                                {
                                    method: 'DelItem',
                                    dociddbda: rows[0].D_ID
                                },
                                function (data) {
                                    if (data) {
                                        $.messager.progress('close');
                                        $('#gv_sgdocumentdbda').datagrid('load');
                                        $('#gv_sgdocumentdbda').datagrid('unselectAll');
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
                $('#search_doctypedbda').combobox("setText", "　");
                $('#search_docheaddbda').val("");
            },
            search: function () {
                $('#gv_sgdocumentdbda').datagrid('unselectAll');
                $('#gv_sgdocumentdbda').datagrid('load', {
                    method: 'QryList',
                    dochead: $('#search_docheaddbda').val(),
                    docdesc: $('#search_docdescdbda').val()
                });
            }
        };
        var editordbda = KindEditor.create('#docdescdbda', {
            resizeType: 1,
            allowPreviewEmoticons: false,
            allowImageUpload: false,
            items: ['fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist', 'insertunorderedlist']
        });

    }
);
