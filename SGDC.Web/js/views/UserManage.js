$(
    function () {


        $('#gv_UserManage').datagrid({
            url: 'views/UserManage.ashx',
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
            idField: 'UserID',
            queryParams: { mode: 'Qry' },
            dataType: 'json',
            columns: [[
            {
                field: 'UserNo',
                title: '编号',
                width: 30
                //checkbox: true,
            }, {
                field: 'UserName',
                title: '用户名',
                width: 100
            }, {
                field: 'UserUint',
                title: '单位',
                width: 100
            }, {
                field: 'UserDepartment',
                title: '部门',
                width: 100
            }, {
                field: 'UserRole',
                title: '职别',
                width: 100
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
                        $.ajax({
                            url: 'views/UserManage.ashx',
                            type: 'post',
                            data: {
                                mode: 'Edit',
                                userid: $('input[name="userid"]').val(),
                                userno: $('input[name="userno"]').val(),
                                username: $('input[name="username"]').val(),
                                userunit: $('#userunit').combobox("getText"),
                                userdepartment: $('#userdepartment').combobox("getText"),
                                usergrade: $('#usergrade').combobox("getText"),
                                usereatprice: $('#usereatprice').combobox("getText"),
                            },
                            beforeSend: function () {
                                $.messager.progress({
                                    text: '正在保存中...'
                                });
                            },
                            success: function (data, response, status) {
                                data = $.parseJSON(data);
                                $.messager.progress('close');
                                //console.log(data);
                                if (data) {
                                    $.messager.show({
                                        title: '提示',
                                        msg: '保存成功'
                                    });
                                    $('#manager_edit').dialog('close').form('reset');
                                    $('#gv_UserManage').datagrid('reload');
                                    $('#gv_UserManage').datagrid('unselectAll');
                                } else {
                                    $.messager.alert('保存失败！', '未知错误导致失败，请重试！', 'warning');
                                }
                            }
                        });
                    }
                },
            }, {
                text: '取消',
                iconCls: 'icon-redo',
                handler: function () {
                    $('#manager_edit').dialog('close').form('reset');
                }
            }],
            onClose: function () {
                $('#manager_edit').form('reset');
            },
        });

        manage_tool = {
            add: function () {
                $('#manager_edit').dialog({ title: "添加用户" });
                $('#manager_edit').dialog('open');

                $('input[name="username"]').focus();
            },
            edit: function () {
                var rows = $('#gv_UserManage').datagrid('getSelections');
                if (rows.length > 1) {
                    $.messager.alert('警告操作！', '编辑记录只能选定一条数据！', 'warning');
                } else if (rows.length == 1) {
                    $.ajax({
                        url: 'views/UserManage.ashx',
                        type: 'post',
                        data: {
                            mode: 'Get',
                            userid: rows[0].UserID,
                        },
                        beforeSend: function () {
                            $.messager.progress({
                                text: '正在获取中...'
                            });
                        },
                        success: function (data, response, status) {
                            $.messager.progress('close');

                            if (data) {
                                var obj = $.parseJSON(data);

                                $('#manager_edit').form('load', {
                                    userid: obj.UserID,
                                    username: obj.UserName,
                                    userno:obj.UserNo,
                                    //userunit: obj.UserUint,
                                    //userdepartment: obj.UserDepartment
                                }).dialog('open');

                                $('#userunit').combobox("select", obj.UserUint);
                                $('#userdepartment').combobox("setText", obj.UserDepartment);
                                $('#usergrade').combobox("setText", obj.UserRole);
                                $("#usereatprice").combobox("select", obj.UserEatPrice);

                            } else {
                                $.messager.alert('获取失败！', '未知错误导致失败，请重试！', 'warning');
                            }
                        }
                    });
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
                            var ids = [];
                            for (var i = 0; i < rows.length; i++) {
                                ids.push(rows[i].UserID);
                            }
                            console.log(ids.join(','));
                            $.ajax({
                                type: 'POST',
                                url: 'views/UserManage.ashx',
                                data: {
                                    mode: 'Del',
                                    userids: ids.join(',')
                                },
                                beforeSend: function () {
                                    $('#gv_UserManage').datagrid('loading');
                                },
                                success: function (data) {
                                    if (data) {
                                        $('#gv_UserManage').datagrid('loaded');
                                        $('#gv_UserManage').datagrid('load');
                                        $('#gv_UserManage').datagrid('unselectAll');
                                        $.messager.show({
                                            title: '提示',
                                            msg: data + '个用户被删除！'
                                        });
                                    }
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
                            $.ajax({
                                type: 'POST',
                                url: 'views/UserManage.ashx',
                                data: {
                                    mode: 'ResetPwd',
                                    userid: rows[0].UserID
                                },
                                beforeSend: function () {
                                    $('#gv_UserManage').datagrid('loading');
                                },
                                success: function (data) {
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
                                },
                            });
                        }
                    });
                } else if (rows.length == 0) {
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
                    mode: 'Qry',
                    username: $('#search_username').val(),
                    userunit: $('#search_userunit').combobox("getText"),
                    userdpm: $("#search_userdepartment").combobox("getText"),
                    usergrade: $("#search_usergrade").combobox("getText")
                });
            }
        };

        //#region 编辑窗口下拉
        var ddlUnit = $('#userunit');
        var ddlDepartment = $("#userdepartment");
        var ddlGrade = $("#usergrade");
        var ddlEatPrice = $("#usereatprice");

        ddlUnit.combobox();
        fillDropDown(ddlUnit, "单位", false);
        ddlDepartment.combobox();
        ddlGrade.combobox();
        ddlEatPrice.combobox();

        ddlUnit.combobox({
            onSelect: function (n) { 
                fillDropDown(ddlDepartment, n.DataDictionaryValue + "部门", false);
                fillDropDown(ddlGrade, n.DataDictionaryValue + "职别", false); 
            }
        });
        
        //#endregion

        //#region 查询下拉
        var ddlSearchUnit = $('#search_userunit');
        var ddlSearchDepartment = $("#search_userdepartment");
        var ddlSearchGrade = $("#search_usergrade");

        ddlSearchUnit.combobox();
        fillDropDown(ddlSearchUnit, "单位", true);
        ddlSearchDepartment.combobox();
        ddlSearchGrade.combobox();
        ddlSearchUnit.combobox({
            onSelect: function (n) {
                fillDropDown(ddlSearchDepartment, n.DataDictionaryValue + "部门", true);
                fillDropDown(ddlSearchGrade, n.DataDictionaryValue + "职别", true); 
            }
        }); 
        //#endregion
    }
);