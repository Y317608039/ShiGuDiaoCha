$(
    function () {
        $('#gv_sgfenxiinfo').datagrid({
            url: 'views/AccidentAnalyzeManagePage.aspx',
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
            idField: 'JB_ID',
            queryParams: { method: 'QryList' },
            dataType: 'json',
            columns: [[
            { field: 'JB_DD_Ju', title: '事故点局属', width: 20 },
            { field: 'JB_DD_Xian', title: '事故点线属', width: 30 },
            { field: 'JB_DD_QiDian', title: '事故点起始站', width: 30 },
            { field: 'JB_DD_ZhongDian', title: '事故点终点站', width: 30 },
            { field: 'JB_DD_XianBie', title: '上下行', width: 30 },
            { field: 'JB_DD_GongLi', title: '公里数', width: 30 },
            { field: 'JB_DD_MiShu', title: '米数', width: 30 },
            { field: 'JB_LC_CheCi', title: '车次', width: 30 },
            { field: 'JB_JC_XingHao', title: '机车型号', width: 30 },
            { field: 'JB_CreatTime', title: '创建时间', width: 40, formatter: function (value, row, index) { if (value) { return DateFormat(value); } else { return value; } } }
            ]],
            toolbar: "#sgfenxiinfo_tool"
        });

        sgfenxiinfo_tool = { 
            showdetail: function () {
                var rows = $('#gv_sgfenxiinfo').datagrid('getSelections');
                if (rows.length > 0) {
                    var selectrow = rows[0]; 

                    var txtHG_SW_XingMing = (selectrow.HG_SW_XingMing && selectrow.HG_SW_XingMing.length > 1) ? selectrow.HG_SW_XingMing.split(',') : ['', '', ''];
                    var txtHG_SW_DanWei = (selectrow.HG_SW_DanWei && selectrow.HG_SW_DanWei.length > 1) ? selectrow.HG_SW_DanWei.split(',') : ['', '', ''];
                    var txtHG_SW_XingBie = (selectrow.HG_SW_XingBie && selectrow.HG_SW_XingBie.length > 1) ? selectrow.HG_SW_XingBie.split(',') : ['', '', ''];
                    var txtHG_SW_NianLing = (selectrow.HG_SW_NianLing && selectrow.HG_SW_NianLing.length > 1) ? selectrow.HG_SW_NianLing.split(',') : ['', '', ''];
                    var txtHG_SW_MinZu = (selectrow.HG_SW_MinZu && selectrow.HG_SW_MinZu.length > 1) ? selectrow.HG_SW_MinZu.split(',') : ['', '', ''];
                    var txtHG_SW_GongZhong = (selectrow.HG_SW_GongZhong && selectrow.HG_SW_GongZhong.length > 1) ? selectrow.HG_SW_GongZhong.split(',') : ['', '', ''];
                    var txtHG_SW_ShangHaiChengDu = (selectrow.HG_SW_ShangHaiChengDu && selectrow.HG_SW_ShangHaiChengDu.length > 1) ? selectrow.HG_SW_ShangHaiChengDu.split(',') : ['', '', ''];
                    var txtHG_SW_RenYuanShuXing = (selectrow.HG_SW_RenYuanShuXing && selectrow.HG_SW_RenYuanShuXing.length > 1) ? selectrow.HG_SW_RenYuanShuXing.split(',') : ['', '', ''];

                     
                } else if (rows.length === 0) {
                    $.messager.alert('警告操作！', '请选择要修改的记录！', 'warning');
                }
            },
            reload: function () {
                $('#gv_sgfenxiinfo').datagrid('reload');
            },
            redo: function () {
                $('#gv_sgfenxiinfo').datagrid('unselectAll');
            }, 
            resetquery: function () {
                $('#search_txtFx_JB_DD_Ju').val("");
                $('#search_txtFx_JB_DD_Xian').val("");
                $('#search_txtFx_JB_LC_CheCi').val("");
            },
            search: function () {
                $('#gv_sgfenxiinfo').datagrid('unselectAll');
                $('#gv_sgfenxiinfo').datagrid('load', {
                    method: 'QryList',
                    search_txtFx_JB_DD_Ju: $('#search_txtFx_JB_DD_Ju').val(),
                    search_txtFx_JB_DD_Xian: $('#search_txtFx_JB_DD_Xian').val(),
                    search_txtFx_JB_LC_CheCi: $('#search_txtFx_JB_LC_CheCi').val()
                });
            } 
        };
    }
);