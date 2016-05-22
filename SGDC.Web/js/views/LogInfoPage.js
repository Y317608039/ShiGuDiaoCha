$(
    function () {

        $('#search_logtype').combobox({
            panelHeight: 80,
            valueField: 'label',
            textField: 'value',
            data: [
                { label: '　', value: '　' },
                { label: '登录', value: '登录' },
                { label: '退出', value: '退出' },
                { label: '新增', value: '新增' },
                { label: '修改', value: '修改' },
                { label: '删除', value: '删除' }
            ]
        });

        $('#gv_logInfoManage').datagrid({
            url: 'views/LogInfoPage.aspx',
            fit: true,
            allowCellWrap: true,
            nowrap: false,
            fitColumns: true,
            rownumbers: true,
            border: false,
            pagination: true,
            striped: true,
            singleSelect: true,
            pageSize: 10,
            pageList: [10, 20, 30, 50],
            pageNumber: 1,
            idField: 'SL_Id',
            queryParams: { method: 'QryList' },
            dataType: 'json',
            columns: [[
            {
                field: 'SL_UserName',
                title: '操作人员姓名',
                width: 80
            }, {
                field: 'SL_Type',
                title: '日志类型',
                width: 80
            }, {
                field: 'SL_Desc',
                title: '日志内容',
                width: 600,
                formatter: function (value, row, index) {
                    if (value) {
                        var temptext = DelHtmlTags(decodeURIComponent(value));
                        //if (temptext.length > 1000) return temptext.substr(0, 1000) + '...'; else
                        return temptext;
                    } else { return value; }
                }
            }, {
                field: 'SL_CreateTime',
                title: '日志创建时间',
                width: 110,
                formatter: function (value, row, index) {
                    if (value) {
                        return DateFormat(value);//.substr(0, 10)
                    } else {
                        return value;
                    }
                }
            }
            ]],
            toolbar: "#loginfomanage_tool"
        });

        loginfomanage_tool = {
            resetquery: function () {
                $('#search_logtype').combobox("setText", "　");
                $("#search_logbegintime").datebox('setValue', ''),
                $('#search_logendtime').datebox('setValue', ''),
                $("#search_logdesc").val("");
            },
            search: function () {
                $('#gv_logInfoManage').datagrid('unselectAll');
                $('#gv_logInfoManage').datagrid('load', {
                    method: 'QryList',
                    search_logtype: $('#search_logtype').combobox("getText"),
                    search_logbegintime: $('#search_logbegintime').datebox('getValue'),
                    search_logendtime: $('#search_logendtime').datebox('getValue'),
                    search_logdesc: $("#search_logdesc").val()
                });
            }
        };
    }
);