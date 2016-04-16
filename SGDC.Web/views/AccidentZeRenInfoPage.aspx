<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccidentZeRenInfoPage.aspx.cs" Inherits="views_AccidentZeRenInfoPage" %>

<!DOCTYPE html>

<style type="text/css">
    #sgzereninfo_edit input {
        width: 40px;
        /*margin: 0 3px 0 3px;*/
    }

        #sgzereninfo_edit input[id^="txtQ_JB"] {
            border: 0px;
            /*margin: 0 3px 0 3px;*/
        }

    #sgzereninfo_edit td[colspan="2"] input {
        width: 92px;
    }

    #sgzereninfo_edit td[colspan="3"] input, #sgzereninfo_edit td[colspan="5"] input, #sgzereninfo_edit td[colspan="6"] input {
        width: 146px;
    }

    #sgzereninfo_edit table {
        border-collapse: collapse;
        border: none;
        width: 98%;
        margin: auto;
        font-size: 10px;
    }

        #sgzereninfo_edit table td {
            border: solid 1px #666;
            height: 28px;
            /*min-width: 30px;*/
            text-align: left;
            word-break: break-all;
            word-wrap: break-word;
            padding: 1px 3px 1px 3px;
        }

    #sghouguoinfo input {
        width: 67px;
    }

    #sgzereninfo input {
        width: 120px;
    }
</style>

<form id="sgzereninfo_edit" style="margin: 0; padding: 5px; color: #333;">
    <input type="text" id="sgbaseinfoid" name="sgbaseinfoid" class="textbox" style="width: 200px; display: none;">
    <input type="text" id="sgzereninfoid" name="sgzereninfoid" class="textbox" style="width: 200px; display: none;">

    <div id="tt" class="easyui-tabs" style="width: auto; height: 360px;">
        <div title="事故基本信息" style="padding: 20px;">
            <table>
                <tr>
                    <td rowspan="10">基<br />
                        本<br />
                        情<br />
                        况</td>
                    <td rowspan="2">地点</td>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_DD_Ju" name="txtQ_JB_DD_Ju" /></td>
                    <td>局</td>
                    <td>
                        <input type="text" id="txtQ_JB_DD_Xian" name="txtQ_JB_DD_Xian" /></td>
                    <td>线</td>
                    <td>线别</td>
                    <td>
                        <input type="text" id="txtQ_JB_DD_XianBie" name="txtQ_JB_DD_XianBie" /></td>
                    <td>
                        <input type="text" id="txtQ_JB_DD_QiDian" name="txtQ_JB_DD_QiDian" /></td>
                    <td colspan="2">站至</td>
                    <td>
                        <input type="text" id="txtQ_JB_DD_ZhongDian" name="txtQ_JB_DD_ZhongDian" /></td>
                    <td>站</td>
                    <td>上下行</td>
                    <td>
                        <input type="text" id="txtQ_JB_DD_XingBie" name="txtQ_JB_DD_XingBie" /></td>
                    <td>
                        <input type="text" id="txtQ_JB_DD_GongLi" name="txtQ_JB_DD_GongLi" /></td>
                    <td>公里股道</td>
                    <td>
                        <input type="text" id="txtQ_JB_DD_MiShu" name="txtQ_JB_DD_MiShu" /></td>
                    <td colspan="2">米</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_DD_Sheng" name="txtQ_JB_DD_Sheng" /></td>
                    <td>省</td>
                    <td>
                        <input type="text" id="txtQ_JB_DD_Shi" name="txtQ_JB_DD_Shi" /></td>
                    <td colspan="2">市</td>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_DD_Qu" name="txtQ_JB_DD_Qu" /></td>
                    <td colspan="4">区</td>
                    <td>单位</td>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_DD_DanWei" name="txtQ_JB_DD_DanWei" />
                    </td>
                    <td>场所</td>
                    <td colspan="3">
                        <input type="text" id="txtQ_JB_DD_ChangSuo" name="txtQ_JB_DD_ChangSuo" /></td>
                </tr>
                <tr>
                    <td>列车</td>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_LC_CheCi" name="txtQ_JB_LC_CheCi" /></td>
                    <td>次</td>
                    <td>
                        <input type="text" id="txtQ_JB_LC_CheHao" name="txtQ_JB_LC_CheHao" /></td>
                    <td colspan="2">车</td>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_LC_QiDian" name="txtQ_JB_LC_QiDian" /></td>
                    <td colspan="2">站至</td>
                    <td>
                        <input type="text" id="txtQ_JB_LC_ZhongDian" name="txtQ_JB_LC_ZhongDian" /></td>
                    <td>站</td>
                    <td>配属</td>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_LC_PeiShu" name="txtQ_JB_LC_PeiShu" /></td>
                    <td>担当</td>
                    <td>
                        <input type="text" id="txtQ_JB_LC_DanDang" name="txtQ_JB_LC_DanDang" /></td>
                    <td>旅客</td>
                    <td>
                        <input type="text" id="txtQ_JB_LC_LvKe" name="txtQ_JB_LC_LvKe" /></td>

                </tr>
                <tr>
                    <td>机车</td>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_JC_XingHao" name="txtQ_JB_JC_XingHao" /></td>
                    <td>型</td>
                    <td>
                        <input type="text" id="txtQ_JB_JC_BianHao" name="txtQ_JB_JC_BianHao" /></td>
                    <td>号</td>
                    <td>配属</td>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_JC_PeiShu" name="txtQ_JB_JC_PeiShu" /></td>
                    <td colspan="2">担当</td>
                    <td>
                        <input type="text" id="txtQ_JB_JC_DanDang" name="txtQ_JB_JC_DanDang" /></td>
                    <td colspan="2">速度</td>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_JC_SuDu" name="txtQ_JB_JC_SuDu" /></td>
                    <td>供电</td>
                    <td>
                        <input type="text" id="txtQ_JB_JC_GongDian" name="txtQ_JB_JC_GongDian" /></td>
                    <td>信号</td>
                    <td>
                        <input type="text" id="txtQ_JB_JC_XinHao" name="txtQ_JB_JC_XinHao" /></td>

                </tr>
                <tr>
                    <td>编组
                    </td>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_BZ_DunWei" name="txtQ_JB_BZ_DunWei" /></td>
                    <td>吨</td>
                    <td>
                        <input type="text" id="txtQ_JB_BZ_ShuLiang" name="txtQ_JB_BZ_ShuLiang" /></td>
                    <td>辆</td>
                    <td>计长</td>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_BZ_JiChang" name="txtQ_JB_BZ_JiChang" /></td>
                    <td colspan="2">重车</td>
                    <td>
                        <input type="text" id="txtQ_JB_BZ_ZhongChe" name="txtQ_JB_BZ_ZhongChe" /></td>
                    <td colspan="2">空车<input type="text" id="txtQ_JB_BZ_KongChe" name="txtQ_JB_BZ_KongChe" style="margin-left: 5px; width: 63px;" /></td>
                    <td colspan="2">列尾<input type="text" id="txtQ_JB_BZ_LieWei" name="txtQ_JB_BZ_LieWei" style="margin-left: 5px; width: 63px;" /></td>
                    <td>危险品</td>
                    <td>
                        <input type="text" id="txtQ_JB_BZ_WeiXianPin" name="txtQ_JB_BZ_WeiXianPin" /></td>
                    <td>超限车</td>
                    <td>
                        <input type="text" id="txtQ_JB_BZ_ChaoXianChe" name="txtQ_JB_BZ_ChaoXianChe" /></td>

                </tr>
                <tr>
                    <td>关系人</td>
                    <td>司机</td>
                    <td>
                        <input type="text" id="txtQ_JB_GXR_SiJi" name="txtQ_JB_GXR_SiJi" /></td>
                    <td>副司机</td>
                    <td>
                        <input type="text" id="txtQ_JB_GXR_FuSiJi" name="txtQ_JB_GXR_FuSiJi" /></td>
                    <td colspan="2">运转车长</td>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_GXR_YunZhuanCheZhang" name="txtQ_JB_GXR_YunZhuanCheZhang" /></td>
                    <td colspan="2">列车长</td>
                    <td>
                        <input type="text" id="txtQ_JB_GXR_LieCheZhang" name="txtQ_JB_GXR_LieCheZhang" /></td>
                    <td colspan="2">值班员</td>
                    <td colspan="2">
                        <input type="text" id="txtQ_JB_GXR_ZhiBanYuan" name="txtQ_JB_GXR_ZhiBanYuan" /></td>
                    <td>天气情况</td>
                    <td>
                        <input type="text" id="txtQ_JB_TianQi" name="txtQ_JB_TianQi" />
                    </td>
                    <td>事故性质</td>
                    <td>
                        <input type="text" id="txtQ_JB_ShiGuXingZhi" name="txtQ_JB_ShiGuXingZhi" /></td>
                </tr>
                <tr>
                    <td rowspan="2">发生时间</td>
                    <td>上行(单)</td>
                    <td colspan="3">
                        <input type="text" id="txtQ_JB_JB_FS_ShangXing" name="txtQ_JB_JB_FS_ShangXing" /></td>

                    <td>复旧时间</td>
                    <td>上行(单)</td>
                    <td colspan="5">
                        <input type="text" id="txtQ_JB_JB_FJ_ShangXing" name="txtQ_JB_JB_FJ_ShangXing" /></td>
                    <td>开通时间</td>
                    <td>上行(单)</td>
                    <td colspan="6">
                        <input type="text" id="txtQ_JB_JB_KT_ShangXing" name="txtQ_JB_JB_KT_ShangXing" /></td>
                </tr>
                <tr>
                    <td>下行</td>
                    <td colspan="3">
                        <input type="text" id="txtQ_JB_JB_FS_XiaXing" name="txtQ_JB_JB_FS_XiaXing" /></td>
                    <td colspan="2">下行</td>
                    <td colspan="5">
                        <input type="text" id="txtQ_JB_JB_FJ_XiaXing" name="txtQ_JB_JB_FJ_XiaXing" /></td>
                    <td colspan="2">下行</td>
                    <td colspan="6">
                        <input type="text" id="txtQ_JB_JB_KT_XiaXing" name="txtQ_JB_JB_KT_XiaXing" /></td>
                </tr>
            </table>
        </div>
        <div title="事故后果信息" style="padding: 20px;">
            <table id="sghouguoinfo">
                <tr>
                    <td rowspan="9">事故后果</td>
                    <td>中断时间</td>
                    <td>上行(单)</td>
                    <td>
                        <input type="text" id="txtHG_ZD_ShangXing" name="txtHG_ZD_ShangXing" /></td>
                    <td>下行</td>
                    <td>
                        <input type="text" id="txtHG_ZD_XiaXing" name="txtHG_ZD_XiaXing" /></td>
                    <td colspan="2">耽误列车时间</td>
                    <td>上行</td>
                    <td>
                        <input type="text" id="txtHG_DW_ShangXing" name="txtHG_DW_ShangXing" /></td>
                    <td>下行</td>
                    <td colspan="2">
                        <input type="text" id="txtHG_DW_XiaXing" name="txtHG_DW_XiaXing" /></td>
                </tr>
                <tr>
                    <td rowspan="2">脱轨情况</td>
                    <td>动车组</td>
                    <td>机车</td>
                    <td>客车</td>
                    <td>货车</td>
                    <td rowspan="2">设备损失</td>
                    <td>动车组</td>
                    <td>机车</td>
                    <td>车辆</td>
                    <td>其它</td>
                    <td colspan="2">直接损失</td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="txtHG_TG_DongCheZu" name="txtHG_TG_DongCheZu" /></td>
                    <td>
                        <input type="text" id="txtHG_TG_DongJiChe" name="txtHG_TG_DongJiChe" /></td>
                    <td>
                        <input type="text" id="txtHG_TG_DongKeChe" name="txtHG_TG_DongKeChe" /></td>
                    <td>
                        <input type="text" id="txtHG_TG_HuoChe" name="txtHG_TG_HuoChe" /></td>
                    <td>
                        <input type="text" id="txtHG_SS_DongCheZu" name="txtHG_SS_DongCheZu" /></td>
                    <td>
                        <input type="text" id="txtHG_SS_JiChe" name="txtHG_SS_JiChe" /></td>
                    <td>
                        <input type="text" id="txtHG_SS_CheLiang" name="txtHG_SS_CheLiang" /></td>
                    <td>
                        <input type="text" id="txtHG_SS_QiTa" name="txtHG_SS_QiTa" /></td>
                    <td>
                        <input type="text" id="txtHG_ZhiJieSunShi" name="txtHG_ZhiJieSunShi" /></td>
                    <td>万元</td>
                </tr>
                <tr>
                    <td rowspan="2">相撞情况</td>
                    <td>机动车</td>
                    <td>非机动车</td>
                    <td>行人</td>
                    <td>道口情况</td>
                    <td>公铁并行</td>
                    <td>防护栅栏</td>
                    <td>公铁立交</td>
                    <td colspan="2">速度区段</td>
                    <td>曲线半径</td>
                    <td>坡度</td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="txtJB_XG_JiDongChe" name="txtJB_XG_JiDongChe" /></td>
                    <td>
                        <input type="text" id="txtJB_XG_FeiJiDongChe" name="txtJB_XG_FeiJiDongChe" /></td>
                    <td>
                        <input type="text" id="txtJB_XG_XingRen" name="txtJB_XG_XingRen" /></td>
                    <td>
                        <input type="text" id="txtJB_XG_DaoKouQingKuang" name="txtJB_XG_DaoKouQingKuang" /></td>
                    <td>
                        <input type="text" id="txtJB_XG_GongTieBingXing" name="txtJB_XG_GongTieBingXing" /></td>
                    <td>
                        <input type="text" id="txtJB_XG_FangHuZhaLan" name="txtJB_XG_FangHuZhaLan" /></td>
                    <td>
                        <input type="text" id="txtJB_XG_GongTieLiJiao" name="txtJB_XG_GongTieLiJiao" /></td>
                    <td colspan="2">
                        <input type="text" id="txtJB_XG_SuDuQuDuan" name="txtJB_XG_SuDuQuDuan" /></td>
                    <td>
                        <input type="text" id="txtJB_XG_QuXianBanJin" name="txtJB_XG_QuXianBanJin" /></td>
                    <td>
                        <input type="text" id="txtJB_XG_PoDu" name="txtJB_XG_PoDu" /></td>
                </tr>
                <tr>
                    <td rowspan="4">伤亡人员情况</td>
                    <td>姓名</td>
                    <td>单位</td>
                    <td>性别</td>
                    <td>年龄</td>
                    <td>民族</td>
                    <td>工种</td>
                    <td>伤害程度</td>
                    <td>人员属性</td>
                    <td></td>
                    <td>路内</td>
                    <td>路外</td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="txtSW_SW_Name" name="txtSW_SW_Name" /></td>
                    <td>
                        <input type="text" id="txtSW_SW_Unit" name="txtSW_SW_Unit" /></td>
                    <td>
                        <input type="text" id="txtSW_SW_Sex" name="txtSW_SW_Sex" /></td>
                    <td>
                        <input type="text" id="txtSW_SW_Age" name="txtSW_SW_Age" /></td>
                    <td>
                        <input type="text" id="txtSW_SW_MinZu" name="txtSW_SW_MinZu" /></td>
                    <td>
                        <input type="text" id="txtSW_SW_GongZhong" name="txtSW_SW_GongZhong" /></td>
                    <td>
                        <input type="text" id="txtSW_SW_ShangHaiChengDu" name="txtSW_SW_ShangHaiChengDu" /></td>
                    <td>
                        <input type="text" id="txtSW_SW_RenYuanShuXing" name="txtSW_SW_RenYuanShuXing" /></td>
                    <td>死亡人数</td>
                    <td>
                        <input type="text" id="txtHG_SiW_LuNei" name="txtHG_SiW_LuNei" /></td>
                    <td>
                        <input type="text" id="txtHG_SiW_LuWai" name="txtHG_SiW_LuWai" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>重伤人数</td>
                    <td>
                        <input type="text" id="txtHG_ZS_LuNei" name="txtHG_ZS_LuNei" /></td>
                    <td>
                        <input type="text" id="txtHG_ZS_LuWai" name="txtHG_ZS_LuWai" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>轻伤人数</td>
                    <td>
                        <input type="text" id="txtHG_QS_LuWai" name="txtHG_QS_LuWai" /></td>
                    <td>
                        <input type="text" id="txtHG_QS_LuNei" name="txtHG_QS_LuNei" /></td>
                </tr>
            </table>
        </div>
        <div title="事故责任信息" style="padding: 20px;">
            <table id="sgzereninfo">
                <tr>
                    <td>事故概况</td>
                    <td colspan="7">
                        <input type="text" id="txtHG_HG_ShiGuGaiKuang" name="txtHG_HG_ShiGuGaiKuang" /></td>
                </tr>
                <tr>
                    <td rowspan="4">责任认定</td>
                    <td>责任单位</td>
                    <td>责任单位属性</td>
                    <td>责任部门</td>
                    <td>责任程度</td>
                    <td>原因类别</td>
                    <td rowspan="2">事故类别</td>
                    <td rowspan="2">
                        <input type="text" id="txtZR_ShiGuLeiBie" name="txtZR_ShiGuLeiBie" /></td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="txtZRDW_DanWeiShungXing" name="txtZRDW_DanWeiShungXing" /></td>
                    <td>
                        <input type="text" id="txtZRDW_BuMen" name="txtZRDW_BuMen" /></td>
                    <td>
                        <input type="text" id="txtZRDW_ChengDu" name="txtZRDW_ChengDu" /></td>
                    <td>
                        <input type="text" id="txtZRDW_DanWei" name="txtZRDW_DanWei" /></td>
                    <td rowspan="3">
                        <input type="text" id="txtZR_YuanYinLeiBie" name="txtZR_YuanYinLeiBie" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td rowspan="2">事故等级</td>
                    <td rowspan="2">
                        <input type="text" id="txtZR_ShiGuDengJi" name="txtZR_ShiGuDengJi" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>值班监察</td>
                    <td>
                        <input type="text" id="txtZR_ZhiBanJianCha" name="txtZR_ZhiBanJianCha" /></td>
                    <td>填报时间</td>
                    <td colspan="2">
                        <input type="text" id="txtZR_TianBaoShiJian_Y" name="txtZR_TianBaoShiJian" /></td>
                    <td>第</td>
                    <td>
                        <input type="text" id="txtZR_BaoGaoCiShu" name="txtZR_BaoGaoCiShu" /></td>
                    <td>次报告</td>
                </tr>
                <tr>
                    <td colspan="8" style="border: 0;">&nbsp;</td>
                </tr>
                <tr>
                    <td>事故调查报告</td>
                    <td>
                        <input type="text" id="txtZR_ShiGuDiaoChaBaoGao" name="txtZR_ShiGuDiaoChaBaoGao" /></td>
                    <td>现场调查有关资料</td>
                    <td>
                        <input type="text" id="txtZR_XianChangDiaoChaZiLiao" name="txtZR_XianChangDiaoChaZiLiao" /></td>
                    <td>损失计算材料</td>
                    <td>
                        <input type="text" id="txtZR_SunShiDiaoChaZiLiao" name="txtZR_SunShiDiaoChaZiLiao" /></td>
                    <td>事故认定书</td>
                    <td>
                        <input type="text" id="txtZR_ShiGuRenDingShu" name="txtZR_ShiGuRenDingShu" /></td>
                </tr>
                <tr>
                    <td>安监报二</td>
                    <td>
                        <input type="text" id="txtZR_AnJianBaoEr" name="txtZR_AnJianBaoEr" /></td>
                    <td>其它</td>
                    <td>
                        <input type="text" id="txtZR_QiTa" name="txtZR_QiTa" /></td>
                    <td>特派办调查报告</td>
                    <td>
                        <input type="text" id="txtZR_TePaiBanDiaoChaBaoGao" name="txtZR_TePaiBanDiaoChaBaoGao" /></td>
                    <td>深度调查报告</td>
                    <td>
                        <input type="text" id="txtZR_SheDuDiaoChaBaoGao" name="txtZR_SheDuDiaoChaBaoGao" /></td>
                </tr>
            </table>
        </div>

    </div>
</form>
