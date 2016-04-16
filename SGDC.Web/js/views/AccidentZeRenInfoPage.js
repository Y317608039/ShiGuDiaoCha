$(
    function () { 
        $('#txtHG_ShiGuGaiKuang').textbox({ multiline: true, width: 980 });
        //$('input').textbox();
        $('#sgzerentab').tabs({ border: false });
        //$('#sgzenrenjibeninfo input').textbox({ readonly: true });

        $('#dtbZR_TianBaoShiJian').datetimebox({ showSeconds: false, width: 137 });

        $('#gv_sgzereninfo').datagrid({
            url: 'views/AccidentZeRenInfoPage.aspx',
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
                field: 'JB_DD_XianBie',
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
            toolbar: "#sgzereninfo_tool"
        });

        $('#sgzereninfo_edit').dialog({
            width: 1150,
            title: '编辑事故责任信息',
            modal: true,
            closed: true,
            iconCls: 'icon-user-add',
            buttons: [{
                text: '保存',
                iconCls: 'icon-add-new',
                handler: function () {
                    if ($('#sgzereninfo_edit').form('validate')) {
                        $.messager.progress({ text: '正在保存中...' });
                        $.post(
                            'views/AccidentZeRenInfoPage.aspx',
                            {
                                method: 'SaveItem',
                                sgbaseinfoid: $('#sgbaseinfoid').val(),
                                sghouguoinfoid: $('#sghouguoinfoid').val(),
                                sgzereninfoid: $('#sgzereninfoid').val(),

                                //#region 后果信息
                                txtHG_ZD_ShangXing: $('#txtHG_ZD_ShangXing').val(),
                                txtHG_ZD_XiaXing: $('#txtHG_ZD_XiaXing').val(),
                                txtHG_DW_ShangXing: $('#txtHG_DW_ShangXing').val(),
                                txtHG_DW_XiaXing: $('#txtHG_DW_XiaXing').val(),
                                txtHG_TG_DongCheZu: $('#txtHG_TG_DongCheZu').val(),
                                txtHG_TG_JiChe: $('#txtHG_TG_JiChe').val(),
                                txtHG_TG_KeChe: $('#txtHG_TG_KeChe').val(),
                                txtHG_TG_HuoChe: $('#txtHG_TG_HuoChe').val(),
                                txtHG_SS_DongCheZu: $('#txtHG_SS_DongCheZu').val(),
                                txtHG_SS_JiChe: $('#txtHG_SS_JiChe').val(),
                                txtHG_SS_CheLiang: $('#txtHG_SS_CheLiang').val(),
                                txtHG_SS_QiTa: $('#txtHG_SS_QiTa').val(),
                                txtHG_ZhiJieSunShi: $('#txtHG_ZhiJieSunShi').val(),
                                txtHG_XZ_JiDongChe: $('#txtHG_XZ_JiDongChe').val(),
                                txtHG_XZ_FeiJiDongChe: $('#txtHG_XZ_FeiJiDongChe').val(),
                                txtHG_XZ_XingRen: $('#txtHG_XZ_XingRen').val(),
                                txtHG_XZ_DaoKouQingKuang: $('#txtHG_XZ_DaoKouQingKuang').val(),
                                txtHG_XZ_GongTieBingXing: $('#txtHG_XZ_GongTieBingXing').val(),
                                txtHG_XZ_FangHuZhaLan: $('#txtHG_XZ_FangHuZhaLan').val(),
                                txtHG_XZ_GongTieLiJiao: $('#txtHG_XZ_GongTieLiJiao').val(),
                                txtHG_XZ_SuDuQuDuan: $('#txtHG_XZ_SuDuQuDuan').val(),
                                txtHG_XZ_QuXianBanJing: $('#txtHG_XZ_QuXianBanJing').val(),
                                txtHG_XZ_PoDu: $('#txtHG_XZ_PoDu').val(),
                                txtHG_SW_XingMing: $('#txtHG_SW_XingMing').val(),
                                txtHG_SW_DanWei: $('#txtHG_SW_DanWei').val(),
                                txtHG_SW_XingBie: $('#txtHG_SW_XingBie').val(),
                                txtHG_SW_NianLing: $('#txtHG_SW_NianLing').val(),
                                txtHG_SW_MinZu: $('#txtHG_SW_MinZu').val(),
                                txtHG_SW_GongZhong: $('#txtHG_SW_GongZhong').val(),
                                txtHG_SW_ShangHaiChengDu: $('#txtHG_SW_ShangHaiChengDu').val(),
                                txtHG_SW_RenYuanShuXing: $('#txtHG_SW_RenYuanShuXing').val(),
                                txtHG_SiW_LuNei: $('#txtHG_SiW_LuNei').val(),
                                txtHG_SiW_LuWai: $('#txtHG_SiW_LuWai').val(),
                                txtHG_ZS_LuNei: $('#txtHG_ZS_LuNei').val(),
                                txtHG_ZS_LuWai: $('#txtHG_ZS_LuWai').val(),
                                txtHG_QS_LuNei: $('#txtHG_QS_LuNei').val(),
                                txtHG_QS_LuWai: $('#txtHG_QS_LuWai').val(),
                                txtHG_ShiGuGaiKuang: $('#txtHG_ShiGuGaiKuang').val(),
                                //#endregion

                                //#region 责任信息
                                txtZR_ZeRenDanWei: $('#txtZR_ZeRenDanWei').val(),
                                txtZR_ZeRenDanWeiShuXing: $('#txtZR_ZeRenDanWeiShuXing').val(),
                                txtZR_ZeRenBuMen: $('#txtZR_ZeRenBuMen').val(),
                                txtZR_ZeRenChengDu: $('#txtZR_ZeRenChengDu').val(),
                                txtZR_YuanYinLeiBie: $('#txtZR_YuanYinLeiBie').val(),
                                txtZR_ShiGuLeiBie: $('#txtZR_ShiGuLeiBie').val(),
                                txtZR_ShiGuDengJi: $('#txtZR_ShiGuDengJi').val(),
                                txtZR_ZhiBanJianCha: $('#txtZR_ZhiBanJianCha').val(),
                                dtbZR_TianBaoShiJian: $('#dtbZR_TianBaoShiJian').datetimebox("getText"),
                                txtZR_BaoGaoCiShu: $('#txtZR_BaoGaoCiShu').val(),
                                txtZR_ShiGuDiaoChaBaoGao: $('#txtZR_ShiGuDiaoChaBaoGao').val(),
                                txtZR_XianChangDianChaZiLiao: $('#txtZR_XianChangDianChaZiLiao').val(),
                                txtZR_SunShiJiSuanZiLiao: $('#txtZR_SunShiJiSuanZiLiao').val(),
                                txtZR_ShiGuRenDingShu: $('#txtZR_ShiGuRenDingShu').val(),
                                txtZR_AnJianBaoEr: $('#txtZR_AnJianBaoEr').val(),
                                txtZR_QiTa: $('#txtZR_QiTa').val(),
                                txtZR_TePaiBanDiaoChaBaoGao: $('#txtZR_TePaiBanDiaoChaBaoGao').val(),
                                txtZR_SheDuDiaoChaBaoGao: $('#txtZR_SheDuDiaoChaBaoGao').val(),
                                //#endregion 
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
                                    $('#sgzereninfo_edit').dialog('close').form('reset');
                                    $('#gv_sgzereninfo').datagrid('reload');
                                    $('#gv_sgzereninfo').datagrid('unselectAll');
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
                    $('#sgzereninfo_edit').dialog('close').form('reset');
                }
            }],
            onClose: function () {
                $('#sgzereninfo_edit').form('reset');
            }
        });

        sgzereninfo_tool = {
            add: function () {
                $('#sgzereninfo_edit').dialog({ title: "添加事故基本信息" });
                $('#sgzereninfo_edit').dialog('open');

                $('#txtZr_JB_DD_Ju').focus();
            },
            edit: function () {
                var rows = $('#gv_sgzereninfo').datagrid('getSelections');
                if (rows.length > 0) {
                    console.log(rows[0]);
                    $('#sgzereninfo_edit').form('load', {
                        sgbaseinfoid: rows[0].JB_ID,
                        sghouguoinfoid: rows[0].HG_ID,
                        sgzereninfoid: rows[0].ZR_ID,
                        //#region 基本信息
                        txtQ_JB_DD_Ju: rows[0].JB_DD_Ju,
                        txtQ_JB_DD_Xian: rows[0].JB_DD_Xian,
                        txtQ_JB_DD_XianBie: rows[0].JB_DD_XianBie,
                        txtQ_JB_DD_QiDian: rows[0].JB_DD_QiDian,
                        txtQ_JB_DD_ZhongDian: rows[0].JB_DD_ZhongDian,
                        txtQ_JB_DD_XingBie: rows[0].JB_DD_XingBie,
                        txtQ_JB_DD_GongLi: rows[0].JB_DD_GongLi,
                        txtQ_JB_DD_MiShu: rows[0].JB_DD_MiShu,
                        txtQ_JB_DD_Sheng: rows[0].JB_DD_Sheng,
                        txtQ_JB_DD_Shi: rows[0].JB_DD_Shi,
                        txtQ_JB_DD_Qu: rows[0].JB_DD_Qu,
                        txtQ_JB_DD_DanWei: rows[0].JB_DD_DanWei,
                        txtQ_JB_DD_ChangSuo: rows[0].JB_DD_ChangSuo,
                        txtQ_JB_LC_CheCi: rows[0].JB_LC_CheCi,
                        txtQ_JB_LC_CheHao: rows[0].JB_LC_CheHao,
                        txtQ_JB_LC_QiDian: rows[0].JB_LC_QiDian,
                        txtQ_JB_LC_ZhongDian: rows[0].JB_LC_ZhongDian,
                        txtQ_JB_LC_PeiShu: rows[0].JB_LC_PeiShu,
                        txtQ_JB_LC_DanDang: rows[0].JB_LC_DanDang,
                        txtQ_JB_LC_LvKe: rows[0].JB_LC_LvKe,
                        txtQ_JB_JC_XingHao: rows[0].JB_JC_XingHao,
                        txtQ_JB_JC_BianHao: rows[0].JB_JC_BianHao,
                        txtQ_JB_JC_PeiShu: rows[0].JB_JC_PeiShu,
                        txtQ_JB_JC_DanDang: rows[0].JB_JC_DanDang,
                        txtQ_JB_JC_SuDu: rows[0].JB_JC_SuDu,
                        txtQ_JB_JC_GongDian: rows[0].JB_JC_GongDian,
                        txtQ_JB_JC_XinHao: rows[0].JB_JC_XinHao,
                        txtQ_JB_BZ_DunWei: rows[0].JB_BZ_DunWei,
                        txtQ_JB_BZ_ShuLiang: rows[0].JB_BZ_ShuLiang,
                        txtQ_JB_BZ_JiChang: rows[0].JB_BZ_JiChang,
                        txtQ_JB_BZ_ZhongChe: rows[0].JB_BZ_ZhongChe,
                        txtQ_JB_BZ_KongChe: rows[0].JB_BZ_KongChe,
                        txtQ_JB_BZ_LieWei: rows[0].JB_BZ_LieWei,
                        txtQ_JB_BZ_WeiXianPin: rows[0].JB_BZ_WeiXianPin,
                        txtQ_JB_BZ_ChaoXianChe: rows[0].JB_BZ_ChaoXianChe,
                        txtQ_JB_GXR_SiJi: rows[0].JB_GXR_SiJi,
                        txtQ_JB_GXR_FuSiJi: rows[0].JB_GXR_FuSiJi,
                        txtQ_JB_GXR_YunZhuanCheZhang: rows[0].JB_GXR_YunZhuanCheZhang,
                        txtQ_JB_GXR_LieCheZhang: rows[0].JB_GXR_LieCheZhang,
                        txtQ_JB_GXR_ZhiBanYuan: rows[0].JB_GXR_ZhiBanYuan,
                        txtQ_JB_TianQi: rows[0].JB_TianQi,
                        txtQ_JB_ShiGuXingZhi: rows[0].JB_ShiGuXingZhi,
                        txtQ_JB_FS_ShangXing: DateFormat(rows[0].JB_FS_ShangXing),
                        txtQ_JB_FS_XiaXing: DateFormat(rows[0].JB_FS_XiaXing),
                        txtQ_JB_FJ_ShangXing: DateFormat(rows[0].JB_FJ_ShangXing),
                        txtQ_JB_FJ_XiaXing: DateFormat(rows[0].JB_FJ_XiaXing),
                        txtQ_JB_KT_ShangXing: DateFormat(rows[0].JB_KT_ShangXing),
                        txtQ_JB_KT_XiaXing: DateFormat(rows[0].JB_KT_XiaXing),
                        //#endregion

                        //#region 后果信息
                        txtHG_ZD_ShangXing: rows[0].HG_ZD_ShangXing,
                        txtHG_ZD_XiaXing: rows[0].HG_ZD_XiaXing,
                        txtHG_DW_ShangXing: rows[0].HG_DW_ShangXing,
                        txtHG_DW_XiaXing: rows[0].HG_DW_XiaXing,
                        txtHG_TG_DongCheZu: rows[0].HG_TG_DongCheZu,
                        txtHG_TG_JiChe: rows[0].HG_TG_JiChe,
                        txtHG_TG_KeChe: rows[0].HG_TG_KeChe,
                        txtHG_TG_HuoChe: rows[0].HG_TG_HuoChe,
                        txtHG_SS_DongCheZu: rows[0].HG_SS_DongCheZu,
                        txtHG_SS_JiChe: rows[0].HG_SS_JiChe,
                        txtHG_SS_CheLiang: rows[0].HG_SS_CheLiang,
                        txtHG_SS_QiTa: rows[0].HG_SS_QiTa,
                        txtHG_ZhiJieSunShi: rows[0].HG_ZhiJieSunShi,
                        txtHG_XZ_JiDongChe: rows[0].HG_XZ_JiDongChe,
                        txtHG_XZ_FeiJiDongChe: rows[0].HG_XZ_FeiJiDongChe,
                        txtHG_XZ_XingRen: rows[0].HG_XZ_XingRen,
                        txtHG_XZ_DaoKouQingKuang: rows[0].HG_XZ_DaoKouQingKuang,
                        txtHG_XZ_GongTieBingXing: rows[0].HG_XZ_GongTieBingXing,
                        txtHG_XZ_FangHuZhaLan: rows[0].HG_XZ_FangHuZhaLan,
                        txtHG_XZ_GongTieLiJiao: rows[0].HG_XZ_GongTieLiJiao,
                        txtHG_XZ_SuDuQuDuan: rows[0].HG_XZ_SuDuQuDuan,
                        txtHG_XZ_QuXianBanJing: rows[0].HG_XZ_QuXianBanJing,
                        txtHG_XZ_PoDu: rows[0].HG_XZ_PoDu,
                        txtHG_SW_XingMing: rows[0].HG_SW_XingMing,
                        txtHG_SW_DanWei: rows[0].HG_SW_DanWei,
                        txtHG_SW_XingBie: rows[0].HG_SW_XingBie,
                        txtHG_SW_NianLing: rows[0].HG_SW_NianLing,
                        txtHG_SW_MinZu: rows[0].HG_SW_MinZu,
                        txtHG_SW_GongZhong: rows[0].HG_SW_GongZhong,
                        txtHG_SW_ShangHaiChengDu: rows[0].HG_SW_ShangHaiChengDu,
                        txtHG_SW_RenYuanShuXing: rows[0].HG_SW_RenYuanShuXing,
                        txtHG_SiW_LuNei: rows[0].HG_SiW_LuNei,
                        txtHG_SiW_LuWai: rows[0].HG_SiW_LuWai,
                        txtHG_ZS_LuNei: rows[0].HG_ZS_LuNei,
                        txtHG_ZS_LuWai: rows[0].HG_ZS_LuWai,
                        txtHG_QS_LuNei: rows[0].HG_QS_LuNei,
                        txtHG_QS_LuWai: rows[0].HG_QS_LuWai,
                        txtHG_ShiGuGaiKuang: rows[0].HG_ShiGuGaiKuang,
                        //#endregion

                        //#region 责任信息
                        txtZR_ZeRenDanWei: rows[0].ZR_ZeRenDanWei,
                        txtZR_ZeRenDanWeiShuXing: rows[0].ZR_ZeRenDanWeiShuXing,
                        txtZR_ZeRenBuMen: rows[0].ZR_ZeRenBuMen,
                        txtZR_ZeRenChengDu: rows[0].ZR_ZeRenChengDu,
                        txtZR_YuanYinLeiBie: rows[0].ZR_YuanYinLeiBie,
                        txtZR_ShiGuLeiBie: rows[0].ZR_ShiGuLeiBie,
                        txtZR_ShiGuDengJi: rows[0].ZR_ShiGuDengJi,
                        txtZR_ZhiBanJianCha: rows[0].ZR_ZhiBanJianCha,
                        dtbZR_TianBaoShiJian: DateFormat(rows[0].ZR_TianBaoShiJian),
                        txtZR_BaoGaoCiShu: rows[0].ZR_BaoGaoCiShu,
                        txtZR_ShiGuDiaoChaBaoGao: rows[0].ZR_ShiGuDiaoChaBaoGao,
                        txtZR_XianChangDianChaZiLiao: rows[0].ZR_XianChangDianChaZiLiao,
                        txtZR_SunShiJiSuanZiLiao: rows[0].ZR_SunShiJiSuanZiLiao,
                        txtZR_ShiGuRenDingShu: rows[0].ZR_ShiGuRenDingShu,
                        txtZR_AnJianBaoEr: rows[0].ZR_AnJianBaoEr,
                        txtZR_QiTa: rows[0].ZR_QiTa,
                        txtZR_TePaiBanDiaoChaBaoGao: rows[0].ZR_TePaiBanDiaoChaBaoGao,
                        txtZR_SheDuDiaoChaBaoGao: rows[0].ZR_SheDuDiaoChaBaoGao,

                        //#endregion
                    }).dialog({ title: "修改事故责任信息" }).dialog('open');
                } else if (rows.length === 0) {
                    $.messager.alert('警告操作！', '请选择要修改的记录！', 'warning');
                }
            },
            reload: function () {
                $('#gv_sgzereninfo').datagrid('reload');
            },
            redo: function () {
                $('#gv_sgzereninfo').datagrid('unselectAll');
            },
            remove: function () {
                var rows = $('#gv_sgzereninfo').datagrid('getSelections');
                if (rows.length > 0) {
                    $.messager.confirm('确定操作', '您确定要删除所选的记录吗？', function (flag) {
                        if (flag) {
                            $.messager.progress({ text: '正在删除中...' });
                            //console.log(rows[0]);
                            $.post(
                                'views/AccidentZeRenInfoPage.aspx',
                                {
                                    method: 'DelItem',
                                    sgzereninfoid: rows[0].JB_ID
                                },
                                function (data) {
                                    if (data) {
                                        $.messager.progress('close');
                                        $('#gv_sgzereninfo').datagrid('load');
                                        $('#gv_sgzereninfo').datagrid('unselectAll');
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
                $('#search_txtZr_JB_DD_Ju').val("");
                $('#search_txtZr_JB_DD_Xian').val("");
                $('#search_txtZr_JB_LC_CheCi').val("");
            },
            search: function () {
                $('#gv_sgzereninfo').datagrid('unselectAll');
                $('#gv_sgzereninfo').datagrid('load', {
                    method: 'QryList',
                    search_txtZr_JB_DD_Ju: $('#search_txtZr_JB_DD_Ju').val(),
                    search_txtZr_JB_DD_Xian: $('#search_txtZr_JB_DD_Xian').val(),
                    search_txtZr_JB_LC_CheCi: $('#search_txtZr_JB_LC_CheCi').val()
                });
            }
        };

    }
);