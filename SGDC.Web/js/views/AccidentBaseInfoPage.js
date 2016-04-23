$(
    function () {
        $('.sgbasetime').datetimebox({ showSeconds: false, width: 137 });

        $('.requiredinput').css({ border: 'solid 1px orangered' }).validatebox({ required: true, missingMessage: '该项是必输项.' });

        $('#gv_sgbaseinfo').datagrid({
            url: 'views/AccidentBaseInfoPage.aspx',
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
            {
                field: 'JB_DD_Ju',
                title: '事故点局属',
                width: 20
            },
            {
                field: 'JB_DD_Xian',
                title: '事故点线属',
                width: 30
            },
            {
                field: 'JB_DD_QiDian',
                title: '事故点起始站',
                width: 30
            },
            {
                field: 'JB_DD_ZhongDian',
                title: '事故点终点站',
                width: 30,
                //formatter: function (value, row, index) { if (value && value.length > 30) { return value.substr(0, 30) + '...'; } else { return value; } }
            },
            {
                field: 'JB_DD_XingBie',
                title: '上下行',
                width: 30
            },
            {
                field: 'JB_DD_GongLi',
                title: '公里数',
                width: 30
            },
            {
                field: 'JB_DD_MiShu',
                title: '米数',
                width: 30
            },
            {
                field: 'JB_LC_CheCi',
                title: '车次',
                width: 30
            },
            {
                field: 'JB_JC_XingHao',
                title: '机车型号',
                width: 30
            },
            {
                field: 'JB_CreatTime',
                title: '创建时间',
                width: 40,
                formatter: function (value, row, index) { if (value) { return DateFormat(value); } else { return value; } }
            }

            ]],
            toolbar: "#sgbaseinfo_tool"
        });

        $('#sgbaseinfo_edit').dialog({
            width: 1250,
            title: '编辑事故基本信息',
            modal: true,
            closed: true,
            iconCls: 'icon-user-add',
            buttons: [{
                text: '保存',
                iconCls: 'icon-add-new',
                handler: function () {
                    if ($('#sgbaseinfo_edit').form('validate')) {
                        $.messager.progress({ text: '正在保存中...' });
                        $.post(
                            'views/AccidentBaseInfoPage.aspx',
                            {
                                method: 'SaveItem',
                                //#region 
                                sgbaseinfoid: $('#sgbaseinfoid').val(),
                                txtJB_DD_Ju: $('#txtJB_DD_Ju').val(),
                                txtJB_DD_Xian: $('#txtJB_DD_Xian').val(),
                                txtJB_DD_XianBie: $('#txtJB_DD_XianBie').val(),
                                txtJB_DD_QiDian: $('#txtJB_DD_QiDian').val(),
                                txtJB_DD_ZhongDian: $('#txtJB_DD_ZhongDian').val(),
                                txtJB_DD_XingBie: $('#txtJB_DD_XingBie').val(),
                                txtJB_DD_GongLi: $('#txtJB_DD_GongLi').val(),
                                txtJB_DD_MiShu: $('#txtJB_DD_MiShu').val(),
                                txtJB_DD_Sheng: $('#txtJB_DD_Sheng').val(),
                                txtJB_DD_Shi: $('#txtJB_DD_Shi').val(),
                                txtJB_DD_Qu: $('#txtJB_DD_Qu').val(),
                                txtJB_DD_DanWei: $('#txtJB_DD_DanWei').val(),
                                txtJB_DD_ChangSuo: $('#txtJB_DD_ChangSuo').val(),
                                txtJB_LC_CheCi: $('#txtJB_LC_CheCi').val(),
                                txtJB_LC_CheHao: $('#txtJB_LC_CheHao').val(),
                                txtJB_LC_QiDian: $('#txtJB_LC_QiDian').val(),
                                txtJB_LC_ZhongDian: $('#txtJB_LC_ZhongDian').val(),
                                txtJB_LC_PeiShu: $('#txtJB_LC_PeiShu').val(),
                                txtJB_LC_DanDang: $('#txtJB_LC_DanDang').val(),
                                txtJB_LC_LvKe: $('#txtJB_LC_LvKe').val(),
                                txtJB_JC_XingHao: $('#txtJB_JC_XingHao').val(),
                                txtJB_JC_BianHao: $('#txtJB_JC_BianHao').val(),
                                txtJB_JC_PeiShu: $('#txtJB_JC_PeiShu').val(),
                                txtJB_JC_DanDang: $('#txtJB_JC_DanDang').val(),
                                txtJB_JC_SuDu: $('#txtJB_JC_SuDu').val(),
                                txtJB_JC_GongDian: $('#txtJB_JC_GongDian').val(),
                                txtJB_JC_XinHao: $('#txtJB_JC_XinHao').val(),
                                txtJB_BZ_DunWei: $('#txtJB_BZ_DunWei').val(),
                                txtJB_BZ_ShuLiang: $('#txtJB_BZ_ShuLiang').val(),
                                txtJB_BZ_JiChang: $('#txtJB_BZ_JiChang').val(),
                                txtJB_BZ_ZhongChe: $('#txtJB_BZ_ZhongChe').val(),
                                txtJB_BZ_KongChe: $('#txtJB_BZ_KongChe').val(),
                                txtJB_BZ_LieWei: $('#txtJB_BZ_LieWei').val(),
                                txtJB_BZ_WeiXianPin: $('#txtJB_BZ_WeiXianPin').val(),
                                txtJB_BZ_ChaoXianChe: $('#txtJB_BZ_ChaoXianChe').val(),
                                txtJB_GXR_SiJi: $('#txtJB_GXR_SiJi').val(),
                                txtJB_GXR_FuSiJi: $('#txtJB_GXR_FuSiJi').val(),
                                txtJB_GXR_YunZhuanCheZhang: $('#txtJB_GXR_YunZhuanCheZhang').val(),
                                txtJB_GXR_LieCheZhang: $('#txtJB_GXR_LieCheZhang').val(),
                                txtJB_GXR_ZhiBanYuan: $('#txtJB_GXR_ZhiBanYuan').val(),
                                txtJB_TianQi: $('#txtJB_TianQi').val(),
                                txtJB_ShiGuXingZhi: $('#txtJB_ShiGuXingZhi').val(),
                                dtbJB_FS_ShangXing: $('#dtbJB_FS_ShangXing').datetimebox("getText"),
                                dtbJB_FS_XiaXing: $('#dtbJB_FS_XiaXing').datetimebox("getText"),
                                dtbJB_FJ_ShangXing: $('#dtbJB_FJ_ShangXing').datetimebox("getText"),
                                dtbJB_FJ_XiaXing: $('#dtbJB_FJ_XiaXing').datetimebox("getText"),
                                dtbJB_KT_ShangXing: $('#dtbJB_KT_ShangXing').datetimebox("getText"),
                                dtbJB_KT_XiaXing: $('#dtbJB_KT_XiaXing').datetimebox("getText"),
                                //endregion
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
                                    $('#sgbaseinfo_edit').dialog('close').form('reset');
                                    $('#gv_sgbaseinfo').datagrid('reload');
                                    $('#gv_sgbaseinfo').datagrid('unselectAll');
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
                    $('#sgbaseinfo_edit').dialog('close').form('reset');
                }
            }],
            onClose: function () {
                $('#sgbaseinfo_edit').form('reset');
            }
        });

        sgbaseinfo_tool = {
            add: function () {
                $('#sgbaseinfo_edit').dialog({ title: "添加事故基本信息" });
                $('#sgbaseinfo_edit').dialog('open');

                $('#txtJB_DD_Ju').focus();
            },
            edit: function () {
                var rows = $('#gv_sgbaseinfo').datagrid('getSelections');
                //if (rows.length > 1) {
                //    $.messager.alert('警告操作！', '编辑记录只能选定一条数据！', 'warning');
                //} else
                if (rows.length > 0) {
                    console.log(rows[0]);
                    $('#sgbaseinfo_edit').form('load', {
                        sgbaseinfoid: rows[0].JB_ID,
                        txtJB_DD_Ju: rows[0].JB_DD_Ju,
                        txtJB_DD_Xian: rows[0].JB_DD_Xian,
                        txtJB_DD_XianBie: rows[0].JB_DD_XianBie,
                        txtJB_DD_QiDian: rows[0].JB_DD_QiDian,
                        txtJB_DD_ZhongDian: rows[0].JB_DD_ZhongDian,
                        txtJB_DD_XingBie: rows[0].JB_DD_XingBie,
                        txtJB_DD_GongLi: rows[0].JB_DD_GongLi,
                        txtJB_DD_MiShu: rows[0].JB_DD_MiShu,
                        txtJB_DD_Sheng: rows[0].JB_DD_Sheng,
                        txtJB_DD_Shi: rows[0].JB_DD_Shi,
                        txtJB_DD_Qu: rows[0].JB_DD_Qu,
                        txtJB_DD_DanWei: rows[0].JB_DD_DanWei,
                        txtJB_DD_ChangSuo: rows[0].JB_DD_ChangSuo,
                        txtJB_LC_CheCi: rows[0].JB_LC_CheCi,
                        txtJB_LC_CheHao: rows[0].JB_LC_CheHao,
                        txtJB_LC_QiDian: rows[0].JB_LC_QiDian,
                        txtJB_LC_ZhongDian: rows[0].JB_LC_ZhongDian,
                        txtJB_LC_PeiShu: rows[0].JB_LC_PeiShu,
                        txtJB_LC_DanDang: rows[0].JB_LC_DanDang,
                        txtJB_LC_LvKe: rows[0].JB_LC_LvKe,
                        txtJB_JC_XingHao: rows[0].JB_JC_XingHao,
                        txtJB_JC_BianHao: rows[0].JB_JC_BianHao,
                        txtJB_JC_PeiShu: rows[0].JB_JC_PeiShu,
                        txtJB_JC_DanDang: rows[0].JB_JC_DanDang,
                        txtJB_JC_SuDu: rows[0].JB_JC_SuDu,
                        txtJB_JC_GongDian: rows[0].JB_JC_GongDian,
                        txtJB_JC_XinHao: rows[0].JB_JC_XinHao,
                        txtJB_BZ_DunWei: rows[0].JB_BZ_DunWei,
                        txtJB_BZ_ShuLiang: rows[0].JB_BZ_ShuLiang,
                        txtJB_BZ_JiChang: rows[0].JB_BZ_JiChang,
                        txtJB_BZ_ZhongChe: rows[0].JB_BZ_ZhongChe,
                        txtJB_BZ_KongChe: rows[0].JB_BZ_KongChe,
                        txtJB_BZ_LieWei: rows[0].JB_BZ_LieWei,
                        txtJB_BZ_WeiXianPin: rows[0].JB_BZ_WeiXianPin,
                        txtJB_BZ_ChaoXianChe: rows[0].JB_BZ_ChaoXianChe,
                        txtJB_GXR_SiJi: rows[0].JB_GXR_SiJi,
                        txtJB_GXR_FuSiJi: rows[0].JB_GXR_FuSiJi,
                        txtJB_GXR_YunZhuanCheZhang: rows[0].JB_GXR_YunZhuanCheZhang,
                        txtJB_GXR_LieCheZhang: rows[0].JB_GXR_LieCheZhang,
                        txtJB_GXR_ZhiBanYuan: rows[0].JB_GXR_ZhiBanYuan,
                        txtJB_TianQi: rows[0].JB_TianQi,
                        txtJB_ShiGuXingZhi: rows[0].JB_ShiGuXingZhi,
                        dtbJB_FS_ShangXing: DateFormat(rows[0].JB_FS_ShangXing),
                        dtbJB_FS_XiaXing: DateFormat(rows[0].JB_FS_XiaXing),
                        dtbJB_FJ_ShangXing: DateFormat(rows[0].JB_FJ_ShangXing),
                        dtbJB_FJ_XiaXing: DateFormat(rows[0].JB_FJ_XiaXing),
                        dtbJB_KT_ShangXing: DateFormat(rows[0].JB_KT_ShangXing),
                        dtbJB_KT_XiaXing: DateFormat(rows[0].JB_KT_XiaXing),
                    }).dialog({ title: "修改事故基本信息" }).dialog('open');
                } else if (rows.length === 0) {
                    $.messager.alert('警告操作！', '请选择要修改的记录！', 'warning');
                }
            },
            reload: function () {
                $('#gv_sgbaseinfo').datagrid('reload');
            },
            redo: function () {
                $('#gv_sgbaseinfo').datagrid('unselectAll');
            },
            remove: function () {
                var rows = $('#gv_sgbaseinfo').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('确定操作', '您确定要删除所选的记录吗？', function (flag) {
                        if (flag) {
                            $.messager.progress({ text: '正在删除中...' });
                            //console.log(rows[0]);
                            $.post(
                                'views/AccidentBaseInfoPage.aspx',
                                {
                                    method: 'DelItem',
                                    sgbaseinfoid: rows[0].JB_ID
                                },
                                function (data) {
                                    if (data) {
                                        $.messager.progress('close');
                                        $('#gv_sgbaseinfo').datagrid('load');
                                        $('#gv_sgbaseinfo').datagrid('unselectAll');
                                        $.messager.show({ title: '提示', msg: '1 条记录被删除！' });
                                    }
                                });
                        }
                    });
                } else {
                    $.messager.alert('提示', '请选择要删除的记录！', 'info');
                }
            },
            resetquery: function () {
                $('#search_txtJB_DD_Ju').val("");
                $('#search_txtJB_DD_Xian').val("");
                $('#search_txtJB_LC_CheCi').val("");
            },
            search: function () {
                $('#gv_sgbaseinfo').datagrid('unselectAll');
                $('#gv_sgbaseinfo').datagrid('load', {
                    method: 'QryList',
                    search_txtJB_DD_Ju: $('#search_txtJB_DD_Ju').val(),
                    search_txtJB_DD_Xian: $('#search_txtJB_DD_Xian').val(),
                    search_txtJB_LC_CheCi: $('#search_txtJB_LC_CheCi').val()
                });
            }
        };

    }
);