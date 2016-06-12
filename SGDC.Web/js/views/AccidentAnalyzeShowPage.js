$(
    function () {
        var sgjbid = $('#tabs').tabs('getSelected').attr('sgjbid');

        //#region 获取事故视图信息
        $.post(
            'views/AccidentAnalyzeShowPage.aspx',
            {
                method: 'GetSgInfo',
                sgjbid: sgjbid
            },
            function (data, response, status) {
                data = $.parseJSON(data);
                if (data) {
                    console.log(data);

                    var txtFx_HG_SW_XingMing = (data.HG_SW_XingMing && data.HG_SW_XingMing.length > 1) ? data.HG_SW_XingMing.split(',') : ['', '', ''];
                    var txtFx_HG_SW_DanWei = (data.HG_SW_DanWei && data.HG_SW_DanWei.length > 1) ? data.HG_SW_DanWei.split(',') : ['', '', ''];
                    var txtFx_HG_SW_XingBie = (data.HG_SW_XingBie && data.HG_SW_XingBie.length > 1) ? data.HG_SW_XingBie.split(',') : ['', '', ''];
                    var txtFx_HG_SW_NianLing = (data.HG_SW_NianLing && data.HG_SW_NianLing.length > 1) ? data.HG_SW_NianLing.split(',') : ['', '', ''];
                    var txtFx_HG_SW_MinZu = (data.HG_SW_MinZu && data.HG_SW_MinZu.length > 1) ? data.HG_SW_MinZu.split(',') : ['', '', ''];
                    var txtFx_HG_SW_GongZhong = (data.HG_SW_GongZhong && data.HG_SW_GongZhong.length > 1) ? data.HG_SW_GongZhong.split(',') : ['', '', ''];
                    var txtFx_HG_SW_ShangHaiChengDu = (data.HG_SW_ShangHaiChengDu && data.HG_SW_ShangHaiChengDu.length > 1) ? data.HG_SW_ShangHaiChengDu.split(',') : ['', '', ''];
                    var txtFx_HG_SW_RenYuanShuXing = (data.HG_SW_RenYuanShuXing && data.HG_SW_RenYuanShuXing.length > 1) ? data.HG_SW_RenYuanShuXing.split(',') : ['', '', ''];

                    //#region 基本信息
                    $('#txtFx_JB_DD_Ju').text(data.JB_DD_Ju);
                    $('#txtFx_JB_DD_Xian').text(data.JB_DD_Xian);
                    $('#txtFx_JB_DD_XianBie').text(data.JB_DD_XianBie);
                    $('#txtFx_JB_DD_QiDian').text(data.JB_DD_QiDian);
                    $('#txtFx_JB_DD_ZhongDian').text(data.JB_DD_ZhongDian);
                    $('#txtFx_JB_DD_XingBie').text(data.JB_DD_XingBie);
                    $('#txtFx_JB_DD_GongLi').text(data.JB_DD_GongLi);
                    $('#txtFx_JB_DD_MiShu').text(data.JB_DD_MiShu);
                    $('#txtFx_JB_DD_Sheng').text(data.JB_DD_Sheng);
                    $('#txtFx_JB_DD_Shi').text(data.JB_DD_Shi);
                    $('#txtFx_JB_DD_Qu').text(data.JB_DD_Qu);
                    $('#txtFx_JB_DD_DanWei').text(data.JB_DD_DanWei);
                    $('#txtFx_JB_DD_ChangSuo').text(data.JB_DD_ChangSuo);
                    $('#txtFx_JB_LC_CheCi').text(data.JB_LC_CheCi);
                    $('#txtFx_JB_LC_CheHao').text(data.JB_LC_CheHao);
                    $('#txtFx_JB_LC_QiDian').text(data.JB_LC_QiDian);
                    $('#txtFx_JB_LC_ZhongDian').text(data.JB_LC_ZhongDian);
                    $('#txtFx_JB_LC_PeiShu').text(data.JB_LC_PeiShu);
                    $('#txtFx_JB_LC_DanDang').text(data.JB_LC_DanDang);
                    $('#txtFx_JB_LC_LvKe').text(data.JB_LC_LvKe);
                    $('#txtFx_JB_JC_XingHao').text(data.JB_JC_XingHao);
                    $('#txtFx_JB_JC_BianHao').text(data.JB_JC_BianHao);
                    $('#txtFx_JB_JC_PeiShu').text(data.JB_JC_PeiShu);
                    $('#txtFx_JB_JC_DanDang').text(data.JB_JC_DanDang);
                    $('#txtFx_JB_JC_SuDu').text(data.JB_JC_SuDu);
                    $('#txtFx_JB_JC_GongDian').text(data.JB_JC_GongDian);
                    $('#txtFx_JB_JC_XinHao').text(data.JB_JC_XinHao);
                    $('#txtFx_JB_BZ_DunWei').text(data.JB_BZ_DunWei);
                    $('#txtFx_JB_BZ_ShuLiang').text(data.JB_BZ_ShuLiang);
                    $('#txtFx_JB_BZ_JiChang').text(data.JB_BZ_JiChang);
                    $('#txtFx_JB_BZ_ZhongChe').text(data.JB_BZ_ZhongChe);
                    $('#txtFx_JB_BZ_KongChe').text(data.JB_BZ_KongChe);
                    $('#txtFx_JB_BZ_LieWei').text(data.JB_BZ_LieWei);
                    $('#txtFx_JB_BZ_WeiXianPin').text(data.JB_BZ_WeiXianPin);
                    $('#txtFx_JB_BZ_ChaoXianChe').text(data.JB_BZ_ChaoXianChe);
                    $('#txtFx_JB_GXR_SiJi').text(data.JB_GXR_SiJi);
                    $('#txtFx_JB_GXR_FuSiJi').text(data.JB_GXR_FuSiJi);
                    $('#txtFx_JB_GXR_YunZhuanCheZhang').text(data.JB_GXR_YunZhuanCheZhang);
                    $('#txtFx_JB_GXR_LieCheZhang').text(data.JB_GXR_LieCheZhang);
                    $('#txtFx_JB_GXR_ZhiBanYuan').text(data.JB_GXR_ZhiBanYuan);
                    $('#txtFx_JB_TianQi').text(data.JB_TianQi);
                    $('#txtFx_JB_ShiGuXingZhi').text(data.JB_ShiGuXingZhi);
                    $('#txtFx_JB_FS_ShangXing').text(DateFormat(data.JB_FS_ShangXing));
                    $('#txtFx_JB_FS_XiaXing').text(DateFormat(data.JB_FS_XiaXing));
                    $('#txtFx_JB_FJ_ShangXing').text(DateFormat(data.JB_FJ_ShangXing));
                    $('#txtFx_JB_FJ_XiaXing').text(DateFormat(data.JB_FJ_XiaXing));
                    $('#txtFx_JB_KT_ShangXing').text(DateFormat(data.JB_KT_ShangXing));
                    $('#txtFx_JB_KT_XiaXing').text(DateFormat(data.JB_KT_XiaXing));
                    //#endregion

                    //#region 后果信息
                    $('#txtFx_HG_ZD_ShangXing').text(data.HG_ZD_ShangXing);
                    $('#txtFx_HG_ZD_XiaXing').text(data.HG_ZD_XiaXing);
                    $('#txtFx_HG_DW_ShangXing').text(data.HG_DW_ShangXing);
                    $('#txtFx_HG_DW_XiaXing').text(data.HG_DW_XiaXing);
                    $('#txtFx_HG_TG_DongCheZu').text(data.HG_TG_DongCheZu);
                    $('#txtFx_HG_TG_JiChe').text(data.HG_TG_JiChe);
                    $('#txtFx_HG_TG_KeChe').text(data.HG_TG_KeChe);
                    $('#txtFx_HG_TG_HuoChe').text(data.HG_TG_HuoChe);
                    $('#txtFx_HG_SS_DongCheZu').text(data.HG_SS_DongCheZu);
                    $('#txtFx_HG_SS_JiChe').text(data.HG_SS_JiChe);
                    $('#txtFx_HG_SS_CheLiang').text(data.HG_SS_CheLiang);
                    $('#txtFx_HG_SS_QiTa').text(data.HG_SS_QiTa);
                    $('#txtFx_HG_ZhiJieSunShi').text(data.HG_ZhiJieSunShi);
                    $('#txtFx_HG_XZ_JiDongChe').text(data.HG_XZ_JiDongChe);
                    $('#txtFx_HG_XZ_FeiJiDongChe').text(data.HG_XZ_FeiJiDongChe);
                    $('#txtFx_HG_XZ_XingRen').text(data.HG_XZ_XingRen);
                    $('#txtFx_HG_XZ_DaoKouQingKuang').text(data.HG_XZ_DaoKouQingKuang);
                    $('#txtFx_HG_XZ_GongTieBingXing').text(data.HG_XZ_GongTieBingXing);
                    $('#txtFx_HG_XZ_FangHuZhaLan').text(data.HG_XZ_FangHuZhaLan);
                    $('#txtFx_HG_XZ_GongTieLiJiao').text(data.HG_XZ_GongTieLiJiao);
                    $('#txtFx_HG_XZ_SuDuQuDuan').text(data.HG_XZ_SuDuQuDuan);
                    $('#txtFx_HG_XZ_QuXianBanJing').text(data.HG_XZ_QuXianBanJing);
                    $('#txtFx_HG_XZ_PoDu').text(data.HG_XZ_PoDu);
                    //#region 伤亡人员情况
                    $('#txtFx_HG_SW_XingMing').text(txtFx_HG_SW_XingMing[0]);
                    $('#txtFx_HG_SW_DanWei').text(txtFx_HG_SW_DanWei[0]);
                    $('#txtFx_HG_SW_XingBie').text(txtFx_HG_SW_XingBie[0]);
                    $('#txtFx_HG_SW_NianLing').text(txtFx_HG_SW_NianLing[0]);
                    $('#txtFx_HG_SW_MinZu').text(txtFx_HG_SW_MinZu[0]);
                    $('#txtFx_HG_SW_GongZhong').text(txtFx_HG_SW_GongZhong[0]);
                    $('#txtFx_HG_SW_ShangHaiChengDu').text(txtFx_HG_SW_ShangHaiChengDu[0]);
                    $('#txtFx_HG_SW_RenYuanShuXing').text(txtFx_HG_SW_RenYuanShuXing[0]);

                    $('#txtFx_HG_SW_XingMing1').text(txtFx_HG_SW_XingMing[1]);
                    $('#txtFx_HG_SW_DanWei1').text(txtFx_HG_SW_DanWei[1]);
                    $('#txtFx_HG_SW_XingBie1').text(txtFx_HG_SW_XingBie[1]);
                    $('#txtFx_HG_SW_NianLing1').text(txtFx_HG_SW_NianLing[1]);
                    $('#txtFx_HG_SW_MinZu1').text(txtFx_HG_SW_MinZu[1]);
                    $('#txtFx_HG_SW_GongZhong1').text(txtFx_HG_SW_GongZhong[1]);
                    $('#txtFx_HG_SW_ShangHaiChengDu1').text(txtFx_HG_SW_ShangHaiChengDu[1]);
                    $('#txtFx_HG_SW_RenYuanShuXing1').text(txtFx_HG_SW_RenYuanShuXing[1]);

                    $('#txtFx_HG_SW_XingMing2').text(txtFx_HG_SW_XingMing[2]);
                    $('#txtFx_HG_SW_DanWei2').text(txtFx_HG_SW_DanWei[2]);
                    $('#txtFx_HG_SW_XingBie2').text(txtFx_HG_SW_XingBie[2]);
                    $('#txtFx_HG_SW_NianLing2').text(txtFx_HG_SW_NianLing[2]);
                    $('#txtFx_HG_SW_MinZu2').text(txtFx_HG_SW_MinZu[2]);
                    $('#txtFx_HG_SW_GongZhong2').text(txtFx_HG_SW_GongZhong[2]);
                    $('#txtFx_HG_SW_ShangHaiChengDu2').text(txtFx_HG_SW_ShangHaiChengDu[2]);
                    $('#txtFx_HG_SW_RenYuanShuXing2').text(txtFx_HG_SW_RenYuanShuXing[2]);
                    //#endregion
                    $('#txtFx_HG_SiW_LuNei').text(data.HG_SiW_LuNei);
                    $('#txtFx_HG_SiW_LuWai').text(data.HG_SiW_LuWai);
                    $('#txtFx_HG_ZS_LuNei').text(data.HG_ZS_LuNei);
                    $('#txtFx_HG_ZS_LuWai').text(data.HG_ZS_LuWai);
                    $('#txtFx_HG_QS_LuNei').text(data.HG_QS_LuNei);
                    $('#txtFx_HG_QS_LuWai').text(data.HG_QS_LuWai);
                    $('#txtFx_HG_ShiGuGaiKuang').text(data.HG_ShiGuGaiKuang);
                    //#endregion

                    //#region 责任信息
                    $('#txtFx_ZR_ZeRenDanWei').text(data.ZR_ZeRenDanWei);
                    $('#txtFx_ZR_ZeRenDanWeiShuXing').text(data.ZR_ZeRenDanWeiShuXing);
                    $('#txtFx_ZR_ZeRenBuMen').text(data.ZR_ZeRenBuMen);
                    $('#txtFx_ZR_ZeRenChengDu').text(data.ZR_ZeRenChengDu);
                    $('#txtFx_ZR_YuanYinLeiBie').text(data.ZR_YuanYinLeiBie);
                    $('#txtFx_ZR_ShiGuLeiBie').text(data.ZR_ShiGuLeiBie);
                    $('#txtFx_ZR_ShiGuDengJi').text(data.ZR_ShiGuDengJi);
                    $('#txtFx_ZR_ZhiBanJianCha').text(data.ZR_ZhiBanJianCha);
                    $('#txtFx_ZR_TianBaoShiJian').text(DateFormat(data.ZR_TianBaoShiJian));
                    $('#txtFx_ZR_BaoGaoCiShu').text(data.ZR_BaoGaoCiShu);
                    $('#txtFx_ZR_ShiGuDiaoChaBaoGao').text(data.ZR_ShiGuDiaoChaBaoGao);
                    $('#txtFx_ZR_XianChangDianChaZiLiao').text(data.ZR_XianChangDianChaZiLiao);
                    $('#txtFx_ZR_SunShiJiSuanZiLiao').text(data.ZR_SunShiJiSuanZiLiao);
                    $('#txtFx_ZR_ShiGuRenDingShu').text(data.ZR_ShiGuRenDingShu);
                    $('#txtFx_ZR_AnJianBaoEr').text(data.ZR_AnJianBaoEr);
                    $('#txtFx_ZR_QiTa').text(data.ZR_QiTa);
                    $('#txtFx_ZR_TePaiBanDiaoChaBaoGao').text(data.ZR_TePaiBanDiaoChaBaoGao);
                    $('#txtFx_ZR_SheDuDiaoChaBaoGao').text(data.ZR_SheDuDiaoChaBaoGao);

                    //#endregion
                } else {
                    $.messager.alert('获取信息失败！', '未知错误导致失败，请重试！', 'warning');
                }
            }
        );
        //#endregion 
    }
);