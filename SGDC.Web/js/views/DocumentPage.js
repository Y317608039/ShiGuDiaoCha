$(
    function () {
        $('#dochead').validatebox();
        $('#docdesc').textbox({ multiline: true });

        //$('#doctype').combobox({
        //    panelHeight: 80,
        //    valueField: 'DicValue',
        //    textField: 'DicValue'
        //});

        //$('#search_doctype').combobox({
        //    panelHeight: 80,
        //    valueField: 'DicValue',
        //    textField: 'DicValue'
        //});

        fillDropDown($('#doctype'), '文档类别');
        fillDropDown($('#search_doctype'), '文档类别');
        //#region 获取下拉集合
        //$.post(
        //'views/DocumentPage.aspx',
        //{
        //    method: 'GetDocType'
        //},
        //function (data, response, status) {
        //    data = $.parseJSON(data);
        //    console.log(data);
        //    if (data) {
        //        $('#doctype').combobox("loadData", data);
        //        $('#doctype').combobox("setText", "");
        //        $('#search_doctype').combobox("loadData", data);
        //        $('#search_doctype').combobox("setText", "");
        //    }
        //}
        //);

        //#endregion

        $('#gv_sgdocument').datagrid({
            url: 'views/DocumentPage.aspx',
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
            {
                field: 'D_Type',
                title: '文档类型',
                width: 20
            },
            {
                field: 'D_Head',
                title: '文档标题',
                width: 30
            },
            {
                field: 'D_Subhead',
                title: '文档副标',
                width: 30
            },
            {
                field: 'D_Content',
                title: '文档描述',
                width: 100,
                formatter: function (value, row, index) { if (value && value.length > 30) { return value.substr(0, 30) + '...'; } else { return value; } }
            },
            {
                field: 'D_CreateTime',
                title: '创建时间',
                width: 40,
                formatter: function (value, row, index) { if (value) { return DateFormat(value); } else { return value; } }
            },
            {
                field: 'D_UpdateTime',
                title: '最后修改时间',
                width: 40,
                formatter: function (value, row, index) { if (value) { return DateFormat(value); } else { return value; } }
            }
            ]],
            toolbar: "#sgdocument_tool"
        });

        $('#sgdocumentr_edit').dialog({
            width: 350,
            title: '编辑文档',
            modal: true,
            closed: true,
            iconCls: 'icon-user-add',
            buttons: [{
                text: '保存',
                iconCls: 'icon-add-new',
                handler: function () {
                    if ($('#sgdocumentr_edit').form('validate')) {
                        $.messager.progress({ text: '正在保存中...' });
                        $.post(
                            'views/DocumentPage.aspx',
                            {
                                method: 'SaveItem',
                                docid: $('#docid').val(),
                                doctype: $('#doctype').combobox("getText"),
                                dochead: $('#dochead').val(),
                                docsubhead: $('#docsubhead').val(),
                                docdesc: $('#docdesc').val(),
                                docext1: $('#docext1').val(),
                                docext2: $('#docext2').val(),
                                docext3: $('#docext3').val()
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
                                    $('#sgdocumentr_edit').dialog('close').form('reset');
                                    $('#gv_sgdocument').datagrid('reload');
                                    $('#gv_sgdocument').datagrid('unselectAll');
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
                    $('#sgdocumentr_edit').dialog('close').form('reset');
                }
            }],
            onClose: function () {
                $('#sgdocumentr_edit').form('reset');
            }
        });

        sgdocument_tool = {
            add: function () {
                $('#sgdocumentr_edit').dialog({ title: "添加文档" });
                $('#sgdocumentr_edit').dialog('open');

                $('#doctype').focus();
            },
            edit: function () {
                var rows = $('#gv_sgdocument').datagrid('getSelections');
                //if (rows.length > 1) {
                //    $.messager.alert('警告操作！', '编辑记录只能选定一条数据！', 'warning');
                //} else
                if (rows.length > 0) {
                    console.log(rows[0]);
                    $('#sgdocumentr_edit').form('load', {
                        docid: rows[0].D_ID,
                        doctype: rows[0].D_Type,
                        dochead: rows[0].D_Head,
                        docsubhead: rows[0].D_Subhead,
                        docdesc: rows[0].D_Content,
                        docext1: rows[0].D_Ext1,
                        docext2: rows[0].D_Ext2,
                        docext3: rows[0].D_Ext3
                    }).dialog({ title: "修改文档" }).dialog('open');
                } else if (rows.length === 0) {
                    $.messager.alert('警告操作！', '请选择要修改的记录！', 'warning');
                }
            },
            reload: function () {
                $('#gv_sgdocument').datagrid('reload');
            },
            redo: function () {
                $('#gv_sgdocument').datagrid('unselectAll');
            },
            remove: function () {
                var rows = $('#gv_sgdocument').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('确定操作', '您确定要删除所选的记录吗？', function (flag) {
                        if (flag) {
                            $.messager.progress({ text: '正在删除中...' });
                            console.log(rows[0]);
                            $.post(
                                'views/DocumentPage.aspx',
                                {
                                    method: 'DelItem',
                                    docid: rows[0].D_ID
                                },
                                function (data) {
                                    if (data) {
                                        $.messager.progress('close');
                                        $('#gv_sgdocument').datagrid('load');
                                        $('#gv_sgdocument').datagrid('unselectAll');
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
                $('#search_doctype').combobox("setText", "　");
                $('#search_dochead').val("");
            },
            search: function () {
                $('#gv_sgdocument').datagrid('unselectAll');
                $('#gv_sgdocument').datagrid('load', {
                    method: 'QryList',
                    doctype: $('#search_doctype').combobox("getText"),
                    dochead: $('#search_dochead').val(),
                    docdesc: $('#search_docdesc').val()
                });
            }
        };
    }
);