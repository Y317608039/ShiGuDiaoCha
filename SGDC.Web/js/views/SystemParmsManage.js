$(
    function () {
        $('#datadicname').validatebox();

        $('#datadictype').combobox({
            panelHeight: 80,
            valueField: 'DicValue',
            textField: 'DicValue'
        });

        $('#search_datadictype').combobox({
            panelHeight: 80,
            valueField: 'DicValue',
            textField: 'DicValue'
        });

        //#region 获取下拉集合
        $.post(
        'views/SystemParmsManage.aspx',
        {
            method: 'GetAllDicType'
        },
        function (data, response, status) {
            data = $.parseJSON(data);
            console.log(data);
            if (data) {
                $('#datadictype').combobox("loadData", data);
                $('#datadictype').combobox("setText", "");
                $('#search_datadictype').combobox("loadData", data);
                $('#search_datadictype').combobox("setText", "");
            }
        }
        );

        //#endregion

        $('#gv_datadicManage').datagrid({
            url: 'views/SystemParmsManage.aspx',
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
            idField: 'DD_ID',
            queryParams: { method: 'QryList' },
            dataType: 'json',
            columns: [[
            {
                field: 'DD_Type',
                title: '项目类型',
                width: 100
            },
            {
                field: 'DD_Value',
                title: '项目名称',
                width: 30
            },
            {
                field: 'DD_Desc',
                title: '项目描述',
                width: 100
            }
            ]],
            toolbar: "#datadicmanage_tool"
        });

        $('#datadicmanager_edit').dialog({
            width: 350,
            title: '编辑项目',
            modal: true,
            closed: true,
            iconCls: 'icon-user-add',
            buttons: [{
                text: '保存',
                iconCls: 'icon-add-new',
                handler: function () {
                    if ($('#datadicmanager_edit').form('validate')) {
                        $.messager.progress({ text: '正在保存中...' });
                        $.post(
                            'views/SystemParmsManage.aspx',
                            {
                                method: 'SaveItem',
                                datadicid: $('#datadicid').val(),
                                datadictype: $('#datadictype').combobox("getText"),
                                datadicname: $('#datadicname').val(),
                                datadicdesc: $('#datadicdesc').val(),
                                datadicext1: $('#datadicext1').val(),
                                datadicext2: $('#datadicext2').val(),
                                datadicext3: $('#datadicext3').val()
                            },
                            function (data, response, status) {
                                data = $.parseJSON(data);
                                $.messager.progress('close');
                                //console.log(data);
                                if (data) {
                                    $.messager.show({
                                        title: '提示',
                                        msg: '保存成功',
                                    });
                                    $('#datadicmanager_edit').dialog('close').form('reset');
                                    $('#gv_datadicManage').datagrid('reload');
                                    $('#gv_datadicManage').datagrid('unselectAll');
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
                    $('#datadicmanager_edit').dialog('close').form('reset');
                }
            }],
            onClose: function () {
                $('#datadicmanager_edit').form('reset');
            }
        });

        datadicmanage_tool = {
            add: function () {
                $('#datadicmanager_edit').dialog({ title: "添加项目" });
                $('#datadicmanager_edit').dialog('open');

                $('#datadictype').focus();
            },
            edit: function () {
                var rows = $('#gv_datadicManage').datagrid('getSelections');
                //if (rows.length > 1) {
                //    $.messager.alert('警告操作！', '编辑记录只能选定一条数据！', 'warning');
                //} else
                if (rows.length > 0) {
                    console.log(rows[0]);
                    $('#datadicmanager_edit').form('load', {
                        datadicid: rows[0].DD_ID,
                        datadictype: rows[0].DD_Type,
                        datadicname: rows[0].DD_Value,
                        datadicdesc: rows[0].DD_Desc,
                        datadicext1: rows[0].DD_Ext1,
                        datadicext2: rows[0].DD_Ext2,
                        datadicext3: rows[0].DD_Ext3
                    }).dialog({ title: "修改文档" }).dialog('open');
                } else if (rows.length === 0) {
                    $.messager.alert('警告操作！', '请选择要修改的记录！', 'warning');
                }
            },
            reload: function () {
                $('#gv_datadicManage').datagrid('reload');
            },
            redo: function () {
                $('#gv_datadicManage').datagrid('unselectAll');
            },
            remove: function () {
                var rows = $('#gv_datadicManage').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('确定操作', '您确定要删除所选的记录吗？', function (flag) {
                        if (flag) {
                            $.messager.progress({ text: '正在删除中...' });
                            console.log(rows[0]);
                            $.post(
                                'views/SystemParmsManage.aspx',
                                {
                                    method: 'DelItem',
                                    datadicid: rows[0].DD_ID
                                },
                                function (data) {
                                    if (data) {
                                        $.messager.progress('close');
                                        $('#gv_datadicManage').datagrid('load');
                                        $('#gv_datadicManage').datagrid('unselectAll');
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
                $('#search_datadictype').combobox("setText", "　");
                $('#search_datadicname').val("");
            },
            search: function () {
                $('#gv_datadicManage').datagrid('unselectAll');
                $('#gv_datadicManage').datagrid('load', {
                    method: 'QryList',
                    datadictype: $('#search_datadictype').combobox("getText"),
                    datadicname: $('#search_datadicname').val()
                });
            }
        };
    }
);