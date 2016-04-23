$(
    function () {

        $('#userphone').validatebox({ validType: 'phoneRex' });

        $('#gv_UserManage').datagrid({
            url: 'views/UserManage.aspx',
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
            idField: 'User_ID',
            queryParams: { method: 'QryList' },
            dataType: 'json',
            columns: [[
            {
                field: 'User_No',
                title: '编号',
                width: 60
                //checkbox: true,
            }, {
                field: 'User_Name',
                title: '用户名',
                width: 100
            }, {
                field: 'User_Phone',
                title: '联系方式',
                width: 100
            }, {
                field: 'User_Uint',
                title: '单位',
                width: 100
            }, {
                field: 'User_Department',
                title: '部门',
                width: 100
            }, {
                field: 'User_Role',
                title: '职别',
                width: 100
            }, {
                field: 'User_Ext1',
                title: '接收报警',
                width: 100,
                formatter: function (value, row, index) { if (value && value==='是') { return '是'; } else { return '否'; } }
            }
            ]],
            toolbar: "#manage_tool"
        });

        $('#manager_edit').dialog({
            width: 350,
            title: '编辑用户',
            modal: true,
            closed: true,
            iconCls: 'icon-user-add',
            buttons: [{
                text: '保存',
                iconCls: 'icon-add-new',
                handler: function () {
                    if ($('#manager_edit').form('validate')) {
                        $.messager.progress({ text: '正在保存中...' });
                        $.post(
                            'views/UserManage.aspx',
                            {
                                method: 'SaveItem',
                                userid: $('#userid').val(),
                                username: $('#username').val(),
                                userno: $('#userno').val(),
                                userphone: $('#userphone').val(),
                                userunit: $('#userunit').combobox("getText"),
                                userdepartment: $('#userdepartment').combobox("getText"),
                                usergrade: $('#usergrade').combobox("getText"),
                                userjsbj: $('#userjsbj').combobox("getText")
                            },
                            function (data, response, status) {
                                data = $.parseJSON(data);
                                $.messager.progress('close');
                                //console.log(data);
                                if (data) {
                                    $.messager.show({title: '提示',msg: '保存成功'});
                                    $('#manager_edit').dialog('close').form('reset');
                                    $('#gv_UserManage').datagrid('reload');
                                    $('#gv_UserManage').datagrid('unselectAll');
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
                    $('#manager_edit').dialog('close').form('reset');
                }
            }],
            onClose: function () {
                $('#manager_edit').form('reset');
            }
        });

        manage_tool = {
            add: function () {
                $('#manager_edit').dialog({ title: "添加用户" });
                $('#manager_edit').dialog('open');

                $('#username').focus();
            },
            edit: function () {
                var rows = $('#gv_UserManage').datagrid('getSelections');
                //if (rows.length > 1) {
                //    $.messager.alert('警告操作！', '编辑记录只能选定一条数据！', 'warning');
                //} else
                if (rows.length > 0) {
                    console.log(rows[0]);
                    $('#manager_edit').form('load', {
                        userid: rows[0].User_ID,
                        username: rows[0].User_Name,
                        userno: rows[0].User_No,
                        userphone: rows[0].User_Phone,
                        userunit: rows[0].User_Uint,
                        userdepartment: rows[0].User_Department,
                        usergrade: rows[0].User_Role,
                        userjsbj: rows[0].User_Ext1
                    }).dialog({ title: "修改人员" }).dialog('open');
                } else if (rows.length === 0) {
                    $.messager.alert('警告操作！', '编辑记录至少选定一条数据！', 'warning');
                }
            },
            reload: function () {
                $('#gv_UserManage').datagrid('reload');
            },
            redo: function () {
                $('#gv_UserManage').datagrid('unselectAll');
            },
            remove: function () {
                var rows = $('#gv_UserManage').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('确定操作', '您正在要删除所选的记录吗？', function (flag) {
                        if (flag) {
                            $.messager.progress({ text: '正在删除中...' });
                            $.post(
                               'views/UserManage.aspx',
                               {
                                   method: 'DelItem',
                                   userid: rows[0].User_ID
                               },
                               function (data) {
                                   if (data) {
                                       $.messager.progress('close');
                                       $('#gv_UserManage').datagrid('load');
                                       $('#gv_UserManage').datagrid('unselectAll');
                                       $.messager.show({ title: '提示', msg: '1 条记录被删除！' });
                                   }
                               });
                        }
                    });
                } else {
                    $.messager.alert('提示', '请选择要删除的记录！', 'info');
                }
            },
            reset: function () {
                var rows = $('#gv_UserManage').datagrid('getSelections');
                if (rows.length > 1) {
                    $.messager.alert('警告操作！', '一次只能选定一条记录！', 'warning');
                } else if (rows.length == 1) {
                    $.messager.confirm('确定操作', '您确定要重置该用户密码吗？', function (flag) {
                        if (flag) {
                            $.post(
                                 'views/UserManage.aspx',
                                {
                                    method: 'ResetPwd',
                                    userid: rows[0].UserID
                                },
                                 function (data) {
                                     if (data) {
                                         data = $.parseJSON(data);
                                         //console.log(data);
                                         $('#gv_UserManage').datagrid('loaded');
                                         $('#gv_UserManage').datagrid('load');
                                         $('#gv_UserManage').datagrid('unselectAll');
                                         $.messager.show({
                                             title: '提示',
                                             msg: data.UserName + ' 密码重置成功！'
                                         });
                                     }
                                 }
                           );
                        }
                    });
                } else if (rows.length === 0) {
                    $.messager.alert('警告操作！', '编辑记录至少选定一条数据！', 'warning');
                }

            },
            resetquery: function () {
                $('#search_username').val("");
                $('#search_userunit').combobox("setText", "　");
                $("#search_userdepartment").combobox("setText", "　");
                $("#search_usergrade").combobox("setText", "　");
            },
            search: function () {
                $('#gv_UserManage').datagrid('load', {
                    method: 'QryList',
                    username: $('#search_username').val(),
                    userunit: $('#search_userunit').combobox("getText"),
                    userdpm: $("#search_userdepartment").combobox("getText"),
                    usergrade: $("#search_usergrade").combobox("getText")
                });
            }
        };

        //#region 编辑窗口下拉
        var ddlUnit = $('#userunit');
        var ddlDepartment = $("#userdepartment"); ddlDepartment.combobox();
        var ddlGrade = $("#usergrade"); ddlGrade.combobox();

        fillDropDown(ddlUnit, "单位");

        ddlUnit.combobox({
            onSelect: function (n) {
                fillDropDown(ddlDepartment, n.DicValue + "部门");
                fillDropDown(ddlGrade, n.DicValue + "职别");
            }
        });

        $("#userjsbj").combobox({
            valueField: "value", textField: "label", panelHeight: 100, data: [{
                label: '　',
                value: '　'
            }, {
                label: '是',
                value: '是'
            }, {
                label: '否',
                value: '否'
            }]
        });
        //#endregion

        //#region 查询下拉
        var ddlSearchUnit = $('#search_userunit');
        var ddlSearchDepartment = $("#search_userdepartment");
        var ddlSearchGrade = $("#search_usergrade");

        fillDropDown(ddlSearchUnit, "单位");
        ddlSearchUnit.combobox({
            onSelect: function (n) { fillDropDown(ddlSearchDepartment, n.DicValue + "部门"); fillDropDown(ddlSearchGrade, n.DicValue + "职别"); }
        });
        //#endregion
    }
);