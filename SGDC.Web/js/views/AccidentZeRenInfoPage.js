$(
    function () {
        $('#txtHG_ShiGuGaiKuang').textbox({ multiline: true, width: 1132 }); 
        $('#sgzerentab').tabs({ border: false }); 
        $('#dtbZR_TianBaoShiJian').datetimebox({ showSeconds: false, width: 137 });

        $('#cmbZR_DocType').combobox({
            panelHeight: 80,
            valueField: 'label',
            textField: 'value',
            data: [
                //{ label: '　', value: '　' },
                { label: '事故调查报告', value: '事故调查报告' },
                { label: '现场调查有关资料', value: '现场调查有关资料' },
                { label: '损失计算材料', value: '损失计算材料' },
                { label: '事故认定书', value: '事故认定书' },
                { label: '安监报二', value: '安监报二' },
                { label: '特派办调查报告', value: '特派办调查报告' },
                { label: '深度调查报告', value: '深度调查报告' },
                { label: '其它', value: '其它' }
            ]
        }).combobox('setValue', '事故调查报告');

        $('#fileZR_DocFile').filebox({ buttonText: '选择文档', width: 450 });
        $('#uploaddocfile').linkbutton({ iconCls: 'icon-system', onClick: function () { sgzereninfo_tool.uploadfile(); } });

        $('#txtZR_ShiGuDiaoChaBaoGao').textbox({ buttonIcon: 'icon-delete-new', onClickButton: function () { if ($(this).val().length > 0) sgzereninfo_tool.deletefile('事故调查报告'); } });
        $('#txtZR_XianChangDianChaZiLiao').textbox({ buttonIcon: 'icon-delete-new', onClickButton: function () { if ($(this).val().length > 0) sgzereninfo_tool.deletefile('现场调查有关资料'); } });
        $('#txtZR_SunShiJiSuanZiLiao').textbox({ buttonIcon: 'icon-delete-new', onClickButton: function () { if ($(this).val().length > 0) sgzereninfo_tool.deletefile('损失计算材料'); } });
        $('#txtZR_ShiGuRenDingShu').textbox({ buttonIcon: 'icon-delete-new', onClickButton: function () { if ($(this).val().length > 0) sgzereninfo_tool.deletefile('事故认定书'); } });
        $('#txtZR_AnJianBaoEr').textbox({ buttonIcon: 'icon-delete-new', onClickButton: function () { if ($(this).val().length > 0) sgzereninfo_tool.deletefile('安监报二'); } });
        $('#txtZR_TePaiBanDiaoChaBaoGao').textbox({ buttonIcon: 'icon-delete-new', onClickButton: function () { if ($(this).val().length > 0) sgzereninfo_tool.deletefile('特派办调查报告'); } });
        $('#txtZR_SheDuDiaoChaBaoGao').textbox({ buttonIcon: 'icon-delete-new', onClickButton: function () { if ($(this).val().length > 0) sgzereninfo_tool.deletefile('深度调查报告'); } });
        $('#txtZR_QiTa').textbox({ buttonIcon: 'icon-delete-new', onClickButton: function () { if ($(this).val().length > 0) sgzereninfo_tool.deletefile('其它'); } });

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
                width: 30
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
            width: 1250,
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

                        var txtHG_SW_XingMing = []; $('.txtHG_SW_XingMing').each(function (i) { txtHG_SW_XingMing[i] = $(this).val(); });
                        var txtHG_SW_DanWei = []; $('.txtHG_SW_DanWei').each(function (i) { txtHG_SW_DanWei[i] = $(this).val(); });
                        var txtHG_SW_XingBie = []; $('.txtHG_SW_XingBie').each(function (i) { txtHG_SW_XingBie[i] = $(this).val(); });
                        var txtHG_SW_NianLing = []; $('.txtHG_SW_NianLing').each(function (i) { txtHG_SW_NianLing[i] = $(this).val(); });
                        var txtHG_SW_MinZu = []; $('.txtHG_SW_MinZu').each(function (i) { txtHG_SW_MinZu[i] = $(this).val(); });
                        var txtHG_SW_GongZhong = []; $('.txtHG_SW_GongZhong').each(function (i) { txtHG_SW_GongZhong[i] = $(this).val(); });
                        var txtHG_SW_ShangHaiChengDu = []; $('.txtHG_SW_ShangHaiChengDu').each(function (i) { txtHG_SW_ShangHaiChengDu[i] = $(this).val(); });
                        var txtHG_SW_RenYuanShuXing = []; $('.txtHG_SW_RenYuanShuXing').each(function (i) { txtHG_SW_RenYuanShuXing[i] = $(this).val(); });

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
                                txtHG_SW_XingMing: txtHG_SW_XingMing.join(','),
                                txtHG_SW_DanWei: txtHG_SW_DanWei.join(','),
                                txtHG_SW_XingBie: txtHG_SW_XingBie.join(','),
                                txtHG_SW_NianLing: txtHG_SW_NianLing.join(','),
                                txtHG_SW_MinZu: txtHG_SW_MinZu.join(','),
                                txtHG_SW_GongZhong: txtHG_SW_GongZhong.join(','),
                                txtHG_SW_ShangHaiChengDu: txtHG_SW_ShangHaiChengDu.join(','),
                                txtHG_SW_RenYuanShuXing: txtHG_SW_RenYuanShuXing.join(','),
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
                                txtZR_SheDuDiaoChaBaoGao: $('#txtZR_SheDuDiaoChaBaoGao').val()
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
                                    $('#cmbZR_DocType').combobox('setValue', '事故调查报告');
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
                    $('#cmbZR_DocType').combobox('setValue', '事故调查报告');
                }
            }],
            onClose: function () {
                $('#sgzereninfo_edit').form('reset');
                $('#cmbZR_DocType').combobox('setValue', '事故调查报告');
                $('#gv_sgzereninfo').datagrid('reload');
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
                    var selectrow = rows[0];
                    //console.log(selectrow);

                    var txtHG_SW_XingMing = (selectrow.HG_SW_XingMing && selectrow.HG_SW_XingMing.length > 1) ? selectrow.HG_SW_XingMing.split(',') : ['', '', ''];
                    var txtHG_SW_DanWei = (selectrow.HG_SW_DanWei && selectrow.HG_SW_DanWei.length > 1) ? selectrow.HG_SW_DanWei.split(',') : ['', '', ''];
                    var txtHG_SW_XingBie = (selectrow.HG_SW_XingBie && selectrow.HG_SW_XingBie.length > 1) ? selectrow.HG_SW_XingBie.split(',') : ['', '', ''];
                    var txtHG_SW_NianLing = (selectrow.HG_SW_NianLing && selectrow.HG_SW_NianLing.length > 1) ? selectrow.HG_SW_NianLing.split(',') : ['', '', ''];
                    var txtHG_SW_MinZu = (selectrow.HG_SW_MinZu && selectrow.HG_SW_MinZu.length > 1) ? selectrow.HG_SW_MinZu.split(',') : ['', '', ''];
                    var txtHG_SW_GongZhong = (selectrow.HG_SW_GongZhong && selectrow.HG_SW_GongZhong.length > 1) ? selectrow.HG_SW_GongZhong.split(',') : ['', '', ''];
                    var txtHG_SW_ShangHaiChengDu = (selectrow.HG_SW_ShangHaiChengDu && selectrow.HG_SW_ShangHaiChengDu.length > 1) ? selectrow.HG_SW_ShangHaiChengDu.split(',') : ['', '', ''];
                    var txtHG_SW_RenYuanShuXing = (selectrow.HG_SW_RenYuanShuXing && selectrow.HG_SW_RenYuanShuXing.length > 1) ? selectrow.HG_SW_RenYuanShuXing.split(',') : ['', '', ''];

                    $('#sgzereninfo_edit').form('load', {
                        sgbaseinfoid: selectrow.JB_ID,
                        sghouguoinfoid: selectrow.HG_ID,
                        sgzereninfoid: selectrow.ZR_ID,
                        //#region 基本信息
                        txtQ_JB_DD_Ju: selectrow.JB_DD_Ju,
                        txtQ_JB_DD_Xian: selectrow.JB_DD_Xian,
                        txtQ_JB_DD_XianBie: selectrow.JB_DD_XianBie,
                        txtQ_JB_DD_QiDian: selectrow.JB_DD_QiDian,
                        txtQ_JB_DD_ZhongDian: selectrow.JB_DD_ZhongDian,
                        txtQ_JB_DD_XingBie: selectrow.JB_DD_XingBie,
                        txtQ_JB_DD_GongLi: selectrow.JB_DD_GongLi,
                        txtQ_JB_DD_MiShu: selectrow.JB_DD_MiShu,
                        txtQ_JB_DD_Sheng: selectrow.JB_DD_Sheng,
                        txtQ_JB_DD_Shi: selectrow.JB_DD_Shi,
                        txtQ_JB_DD_Qu: selectrow.JB_DD_Qu,
                        txtQ_JB_DD_DanWei: selectrow.JB_DD_DanWei,
                        txtQ_JB_DD_ChangSuo: selectrow.JB_DD_ChangSuo,
                        txtQ_JB_LC_CheCi: selectrow.JB_LC_CheCi,
                        txtQ_JB_LC_CheHao: selectrow.JB_LC_CheHao,
                        txtQ_JB_LC_QiDian: selectrow.JB_LC_QiDian,
                        txtQ_JB_LC_ZhongDian: selectrow.JB_LC_ZhongDian,
                        txtQ_JB_LC_PeiShu: selectrow.JB_LC_PeiShu,
                        txtQ_JB_LC_DanDang: selectrow.JB_LC_DanDang,
                        txtQ_JB_LC_LvKe: selectrow.JB_LC_LvKe,
                        txtQ_JB_JC_XingHao: selectrow.JB_JC_XingHao,
                        txtQ_JB_JC_BianHao: selectrow.JB_JC_BianHao,
                        txtQ_JB_JC_PeiShu: selectrow.JB_JC_PeiShu,
                        txtQ_JB_JC_DanDang: selectrow.JB_JC_DanDang,
                        txtQ_JB_JC_SuDu: selectrow.JB_JC_SuDu,
                        txtQ_JB_JC_GongDian: selectrow.JB_JC_GongDian,
                        txtQ_JB_JC_XinHao: selectrow.JB_JC_XinHao,
                        txtQ_JB_BZ_DunWei: selectrow.JB_BZ_DunWei,
                        txtQ_JB_BZ_ShuLiang: selectrow.JB_BZ_ShuLiang,
                        txtQ_JB_BZ_JiChang: selectrow.JB_BZ_JiChang,
                        txtQ_JB_BZ_ZhongChe: selectrow.JB_BZ_ZhongChe,
                        txtQ_JB_BZ_KongChe: selectrow.JB_BZ_KongChe,
                        txtQ_JB_BZ_LieWei: selectrow.JB_BZ_LieWei,
                        txtQ_JB_BZ_WeiXianPin: selectrow.JB_BZ_WeiXianPin,
                        txtQ_JB_BZ_ChaoXianChe: selectrow.JB_BZ_ChaoXianChe,
                        txtQ_JB_GXR_SiJi: selectrow.JB_GXR_SiJi,
                        txtQ_JB_GXR_FuSiJi: selectrow.JB_GXR_FuSiJi,
                        txtQ_JB_GXR_YunZhuanCheZhang: selectrow.JB_GXR_YunZhuanCheZhang,
                        txtQ_JB_GXR_LieCheZhang: selectrow.JB_GXR_LieCheZhang,
                        txtQ_JB_GXR_ZhiBanYuan: selectrow.JB_GXR_ZhiBanYuan,
                        txtQ_JB_TianQi: selectrow.JB_TianQi,
                        txtQ_JB_ShiGuXingZhi: selectrow.JB_ShiGuXingZhi,
                        txtQ_JB_FS_ShangXing: DateFormat(selectrow.JB_FS_ShangXing),
                        txtQ_JB_FS_XiaXing: DateFormat(selectrow.JB_FS_XiaXing),
                        txtQ_JB_FJ_ShangXing: DateFormat(selectrow.JB_FJ_ShangXing),
                        txtQ_JB_FJ_XiaXing: DateFormat(selectrow.JB_FJ_XiaXing),
                        txtQ_JB_KT_ShangXing: DateFormat(selectrow.JB_KT_ShangXing),
                        txtQ_JB_KT_XiaXing: DateFormat(selectrow.JB_KT_XiaXing),
                        //#endregion

                        //#region 后果信息
                        txtHG_ZD_ShangXing: selectrow.HG_ZD_ShangXing,
                        txtHG_ZD_XiaXing: selectrow.HG_ZD_XiaXing,
                        txtHG_DW_ShangXing: selectrow.HG_DW_ShangXing,
                        txtHG_DW_XiaXing: selectrow.HG_DW_XiaXing,
                        txtHG_TG_DongCheZu: selectrow.HG_TG_DongCheZu,
                        txtHG_TG_JiChe: selectrow.HG_TG_JiChe,
                        txtHG_TG_KeChe: selectrow.HG_TG_KeChe,
                        txtHG_TG_HuoChe: selectrow.HG_TG_HuoChe,
                        txtHG_SS_DongCheZu: selectrow.HG_SS_DongCheZu,
                        txtHG_SS_JiChe: selectrow.HG_SS_JiChe,
                        txtHG_SS_CheLiang: selectrow.HG_SS_CheLiang,
                        txtHG_SS_QiTa: selectrow.HG_SS_QiTa,
                        txtHG_ZhiJieSunShi: selectrow.HG_ZhiJieSunShi,
                        txtHG_XZ_JiDongChe: selectrow.HG_XZ_JiDongChe,
                        txtHG_XZ_FeiJiDongChe: selectrow.HG_XZ_FeiJiDongChe,
                        txtHG_XZ_XingRen: selectrow.HG_XZ_XingRen,
                        txtHG_XZ_DaoKouQingKuang: selectrow.HG_XZ_DaoKouQingKuang,
                        txtHG_XZ_GongTieBingXing: selectrow.HG_XZ_GongTieBingXing,
                        txtHG_XZ_FangHuZhaLan: selectrow.HG_XZ_FangHuZhaLan,
                        txtHG_XZ_GongTieLiJiao: selectrow.HG_XZ_GongTieLiJiao,
                        txtHG_XZ_SuDuQuDuan: selectrow.HG_XZ_SuDuQuDuan,
                        txtHG_XZ_QuXianBanJing: selectrow.HG_XZ_QuXianBanJing,
                        txtHG_XZ_PoDu: selectrow.HG_XZ_PoDu,
                        //#region 伤亡人员情况
                        txtHG_SW_XingMing: txtHG_SW_XingMing[0],
                        txtHG_SW_DanWei: txtHG_SW_DanWei[0],
                        txtHG_SW_XingBie: txtHG_SW_XingBie[0],
                        txtHG_SW_NianLing: txtHG_SW_NianLing[0],
                        txtHG_SW_MinZu: txtHG_SW_MinZu[0],
                        txtHG_SW_GongZhong: txtHG_SW_GongZhong[0],
                        txtHG_SW_ShangHaiChengDu: txtHG_SW_ShangHaiChengDu[0],
                        txtHG_SW_RenYuanShuXing: txtHG_SW_RenYuanShuXing[0],

                        txtHG_SW_XingMing1: txtHG_SW_XingMing[1],
                        txtHG_SW_DanWei1: txtHG_SW_DanWei[1],
                        txtHG_SW_XingBie1: txtHG_SW_XingBie[1],
                        txtHG_SW_NianLing1: txtHG_SW_NianLing[1],
                        txtHG_SW_MinZu1: txtHG_SW_MinZu[1],
                        txtHG_SW_GongZhong1: txtHG_SW_GongZhong[1],
                        txtHG_SW_ShangHaiChengDu1: txtHG_SW_ShangHaiChengDu[1],
                        txtHG_SW_RenYuanShuXing1: txtHG_SW_RenYuanShuXing[1],

                        txtHG_SW_XingMing2: txtHG_SW_XingMing[2],
                        txtHG_SW_DanWei2: txtHG_SW_DanWei[2],
                        txtHG_SW_XingBie2: txtHG_SW_XingBie[2],
                        txtHG_SW_NianLing2: txtHG_SW_NianLing[2],
                        txtHG_SW_MinZu2: txtHG_SW_MinZu[2],
                        txtHG_SW_GongZhong2: txtHG_SW_GongZhong[2],
                        txtHG_SW_ShangHaiChengDu2: txtHG_SW_ShangHaiChengDu[2],
                        txtHG_SW_RenYuanShuXing2: txtHG_SW_RenYuanShuXing[2],
                        //#endregion
                        txtHG_SiW_LuNei: selectrow.HG_SiW_LuNei,
                        txtHG_SiW_LuWai: selectrow.HG_SiW_LuWai,
                        txtHG_ZS_LuNei: selectrow.HG_ZS_LuNei,
                        txtHG_ZS_LuWai: selectrow.HG_ZS_LuWai,
                        txtHG_QS_LuNei: selectrow.HG_QS_LuNei,
                        txtHG_QS_LuWai: selectrow.HG_QS_LuWai,
                        txtHG_ShiGuGaiKuang: selectrow.HG_ShiGuGaiKuang,
                        //#endregion

                        //#region 责任信息
                        txtZR_ZeRenDanWei: selectrow.ZR_ZeRenDanWei,
                        txtZR_ZeRenDanWeiShuXing: selectrow.ZR_ZeRenDanWeiShuXing,
                        txtZR_ZeRenBuMen: selectrow.ZR_ZeRenBuMen,
                        txtZR_ZeRenChengDu: selectrow.ZR_ZeRenChengDu,
                        txtZR_YuanYinLeiBie: selectrow.ZR_YuanYinLeiBie,
                        txtZR_ShiGuLeiBie: selectrow.ZR_ShiGuLeiBie,
                        txtZR_ShiGuDengJi: selectrow.ZR_ShiGuDengJi,
                        txtZR_ZhiBanJianCha: selectrow.ZR_ZhiBanJianCha,
                        dtbZR_TianBaoShiJian: DateFormat(selectrow.ZR_TianBaoShiJian),
                        txtZR_BaoGaoCiShu: selectrow.ZR_BaoGaoCiShu,
                        txtZR_ShiGuDiaoChaBaoGao: selectrow.ZR_ShiGuDiaoChaBaoGao,
                        txtZR_XianChangDianChaZiLiao: selectrow.ZR_XianChangDianChaZiLiao,
                        txtZR_SunShiJiSuanZiLiao: selectrow.ZR_SunShiJiSuanZiLiao,
                        txtZR_ShiGuRenDingShu: selectrow.ZR_ShiGuRenDingShu,
                        txtZR_AnJianBaoEr: selectrow.ZR_AnJianBaoEr,
                        txtZR_QiTa: selectrow.ZR_QiTa,
                        txtZR_TePaiBanDiaoChaBaoGao: selectrow.ZR_TePaiBanDiaoChaBaoGao,
                        txtZR_SheDuDiaoChaBaoGao: selectrow.ZR_SheDuDiaoChaBaoGao

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
                                    sgbaseinfoid: rows[0].JB_ID
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
            },
            uploadfile: function () {
                var idFile = $("#fileZR_DocFile").filebox("getText");
                if (idFile != null && idFile.length > 0) {
                    $.messager.progress({ text: '正在上传中...' });
                    var doctype = $('#cmbZR_DocType').combobox('getText');

                    $('#sgzereninfo_edit').ajaxSubmit({
                        type: "POST",
                        url: 'views/AccidentZeRenInfoPage.aspx',
                        data: { method: "SaveFile", docfile: idFile },
                        success: function (data) {
                            $.messager.progress('close');
                            data = data.replace("<PRE>", "").replace("</PRE>", "");
                            $("#fileZR_DocFile").filebox({ value: '' });

                            //#region 保存上传文件信息
                            $.post(
                                'views/AccidentZeRenInfoPage.aspx',
                                {
                                    method: 'SaveUploadFileInfo',
                                    sgbaseinfoid: $('#sgbaseinfoid').val(),
                                    sgzereninfoid: $('#sgzereninfoid').val(),
                                    doctype: doctype,
                                    filename: data
                                },
                                function (data1, response, status) {
                                    data1 = $.parseJSON(data1);
                                    if (data1) {
                                        $.messager.show({ title: '提示', msg: '上传成功' });
                                        $('#sgzereninfoid').val(data1.ZR_ID);
                                        //#region 保存成功,显示文件信息
                                        console.log(data);
                                        switch (doctype) {
                                            case "事故调查报告": $('#txtZR_ShiGuDiaoChaBaoGao').textbox('setValue', data); break;
                                            case "现场调查有关资料": $('#txtZR_XianChangDianChaZiLiao').textbox('setValue', data); break;
                                            case "损失计算材料": $('#txtZR_SunShiJiSuanZiLiao').textbox('setValue', data); break;
                                            case "事故认定书": $('#txtZR_ShiGuRenDingShu').textbox('setValue', data); break;
                                            case "安监报二": $('#txtZR_AnJianBaoEr').textbox('setValue', data); break;
                                            case "特派办调查报告": $('#txtZR_TePaiBanDiaoChaBaoGao').textbox('setValue', data); break;
                                            case "深度调查报告": $('#txtZR_SheDuDiaoChaBaoGao').textbox('setValue', data); break;
                                            case "其它": $('#txtZR_QiTa').textbox('setValue', data); break;
                                        }
                                        //#endregion 
                                    } else {
                                        $.messager.alert('上传失败！', '未知错误导致失败，请重试！', 'warning');
                                    }
                                }
                            );
                            //#endregion 
                        }
                    });
                }
            },
            deletefile: function (doctype) {
                $.messager.confirm('确定操作', String.format('您确定要删除{0}吗？', doctype), function (flag) {
                    if (flag) {
                        $.messager.progress({ text: '正在删除中...' });
                        $.post(
                            'views/AccidentZeRenInfoPage.aspx',
                            {
                                method: 'DelDocFileInfo',
                                sgzereninfoid: $('#sgzereninfoid').val(),
                                doctype: doctype
                            },
                            function (data) {
                                if (data) {
                                    $.messager.progress('close');
                                    switch (doctype) {
                                        case "事故调查报告": $('#txtZR_ShiGuDiaoChaBaoGao').textbox('setValue', ''); break;
                                        case "现场调查有关资料": $('#txtZR_XianChangDianChaZiLiao').textbox('setValue', ''); break;
                                        case "损失计算材料": $('#txtZR_SunShiJiSuanZiLiao').textbox('setValue', ''); break;
                                        case "事故认定书": $('#txtZR_ShiGuRenDingShu').textbox('setValue', ''); break;
                                        case "安监报二": $('#txtZR_AnJianBaoEr').textbox('setValue', ''); break;
                                        case "特派办调查报告": $('#txtZR_TePaiBanDiaoChaBaoGao').textbox('setValue', ''); break;
                                        case "深度调查报告": $('#txtZR_SheDuDiaoChaBaoGao').textbox('setValue', ''); break;
                                        case "其它": $('#txtZR_QiTa').textbox('setValue', ''); break;
                                    }
                                    $.messager.show({ title: '提示', msg: String.format('{0} 删除成功！', doctype) });
                                }
                            });
                    }
                });
            }
        };

    }
);