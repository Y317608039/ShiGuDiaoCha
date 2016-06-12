<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccidentAnalyzeShowPage.aspx.cs" Inherits="views_AccidentAnalyzeShowPage" %>

<!DOCTYPE html>

<style type="text/css">
    #showsg {
        padding: 5px 0;
        margin: 0;
        width: 100%;
    }

        #showsg table {
            border-collapse: collapse;
            border: none;
            width: 99%;
            margin: auto;
            font-size: 11px;
        }

            #showsg table td {
                border: solid 1px #666;
                text-align: left;
                -moz-word-break: break-all;
                -o-word-break: break-all;
                word-break: break-all;
                word-wrap: break-word;
                padding: 6px 3px;
                vertical-align: top;
                min-width: 60px; 
            }

            #showsg table tr td:nth-child(1), #showsg table tr td:nth-child(2) {
                vertical-align: middle;
            }
</style>

<div id="showsg">
    <center><div style="font-size: 16px; font-weight: bold; padding: 3px;">铁路交通事故基本情况表</div></center>

    <table id="sgfenxijibeninfo">
        <tr>
            <td rowspan="10">基<br />
                本<br />
                情<br />
                况</td>
            <td rowspan="2">地点</td>
            <td colspan="2">
                <lable id="txtFx_JB_DD_Ju" name="txtFx_JB_DD_Ju" />
            </td>
            <td>局</td>
            <td>
                <lable id="txtFx_JB_DD_Xian" name="txtFx_JB_DD_Xian" />
            </td>
            <td>线</td>
            <td>线别</td>
            <td>
                <lable id="txtFx_JB_DD_XianBie" name="txtFx_JB_DD_XianBie" />
            </td>
            <td>
                <lable id="txtFx_JB_DD_QiDian" name="txtFx_JB_DD_QiDian" />
            </td>
            <td colspan="2">站至</td>
            <td>
                <lable id="txtFx_JB_DD_ZhongDian" name="txtFx_JB_DD_ZhongDian" />
            </td>
            <td>站</td>
            <td>上下行</td>
            <td>
                <lable id="txtFx_JB_DD_XingBie" name="txtFx_JB_DD_XingBie" />
            </td>
            <td>
                <lable id="txtFx_JB_DD_GongLi" name="txtFx_JB_DD_GongLi" />
            </td>
            <td>公里股道</td>
            <td>
                <lable id="txtFx_JB_DD_MiShu" name="txtFx_JB_DD_MiShu" />
            </td>
            <td colspan="2">米</td>
        </tr>
        <tr>
            <td colspan="2">
                <lable id="txtFx_JB_DD_Sheng" name="txtFx_JB_DD_Sheng" />
            </td>
            <td>省</td>
            <td>
                <lable id="txtFx_JB_DD_Shi" name="txtFx_JB_DD_Shi" />
            </td>
            <td colspan="2">市</td>
            <td colspan="2">
                <lable id="txtFx_JB_DD_Qu" name="txtFx_JB_DD_Qu" />
            </td>
            <td colspan="4">区</td>
            <td>单位</td>
            <td colspan="2">
                <lable id="txtFx_JB_DD_DanWei" name="txtFx_JB_DD_DanWei" />
            </td>
            <td>场所</td>
            <td colspan="3">
                <lable id="txtFx_JB_DD_ChangSuo" name="txtFx_JB_DD_ChangSuo" />
            </td>
        </tr>
        <tr>
            <td>列车</td>
            <td colspan="2">
                <lable id="txtFx_JB_LC_CheCi" name="txtFx_JB_LC_CheCi" />
            </td>
            <td>次</td>
            <td>
                <lable id="txtFx_JB_LC_CheHao" name="txtFx_JB_LC_CheHao" />
            </td>
            <td colspan="2">车</td>
            <td colspan="2">
                <lable id="txtFx_JB_LC_QiDian" name="txtFx_JB_LC_QiDian" />
            </td>
            <td colspan="2">站至</td>
            <td>
                <lable id="txtFx_JB_LC_ZhongDian" name="txtFx_JB_LC_ZhongDian" />
            </td>
            <td>站</td>
            <td>配属</td>
            <td colspan="2">
                <lable id="txtFx_JB_LC_PeiShu" name="txtFx_JB_LC_PeiShu" />
            </td>
            <td>担当</td>
            <td>
                <lable id="txtFx_JB_LC_DanDang" name="txtFx_JB_LC_DanDang" />
            </td>
            <td>旅客</td>
            <td>
                <lable id="txtFx_JB_LC_LvKe" name="txtFx_JB_LC_LvKe" />
            </td>

        </tr>
        <tr>
            <td>机车</td>
            <td colspan="2">
                <lable id="txtFx_JB_JC_XingHao" name="txtFx_JB_JC_XingHao" />
            </td>
            <td>型</td>
            <td>
                <lable id="txtFx_JB_JC_BianHao" name="txtFx_JB_JC_BianHao" />
            </td>
            <td>号</td>
            <td>配属</td>
            <td colspan="2">
                <lable id="txtFx_JB_JC_PeiShu" name="txtFx_JB_JC_PeiShu" />
            </td>
            <td colspan="2">担当</td>
            <td>
                <lable id="txtFx_JB_JC_DanDang" name="txtFx_JB_JC_DanDang" />
            </td>
            <td colspan="2">速度</td>
            <td colspan="2">
                <lable id="txtFx_JB_JC_SuDu" name="txtFx_JB_JC_SuDu" />
            </td>
            <td>供电</td>
            <td>
                <lable id="txtFx_JB_JC_GongDian" name="txtFx_JB_JC_GongDian" />
            </td>
            <td>信号</td>
            <td>
                <lable id="txtFx_JB_JC_XinHao" name="txtFx_JB_JC_XinHao" />
            </td>

        </tr>
        <tr>
            <td>编组
            </td>
            <td colspan="2">
                <lable id="txtFx_JB_BZ_DunWei" name="txtFx_JB_BZ_DunWei" />
            </td>
            <td>吨</td>
            <td>
                <lable id="txtFx_JB_BZ_ShuLiang" name="txtFx_JB_BZ_ShuLiang" />
            </td>
            <td>辆</td>
            <td>计长</td>
            <td colspan="2">
                <lable id="txtFx_JB_BZ_JiChang" name="txtFx_JB_BZ_JiChang" />
            </td>
            <td colspan="2">重车</td>
            <td>
                <lable id="txtFx_JB_BZ_ZhongChe" name="txtFx_JB_BZ_ZhongChe" />
            </td>
            <td colspan="2">空车<lable id="txtFx_JB_BZ_KongChe" name="txtFx_JB_BZ_KongChe" style="margin-left: 5px; width: 63px;" /></td>
            <td colspan="2">列尾<lable id="txtFx_JB_BZ_LieWei" name="txtFx_JB_BZ_LieWei" style="margin-left: 5px; width: 63px;" /></td>
            <td>危险品</td>
            <td>
                <lable id="txtFx_JB_BZ_WeiXianPin" name="txtFx_JB_BZ_WeiXianPin" />
            </td>
            <td>超限车</td>
            <td>
                <lable id="txtFx_JB_BZ_ChaoXianChe" name="txtFx_JB_BZ_ChaoXianChe" />
            </td>

        </tr>
        <tr>
            <td>关系人</td>
            <td>司机</td>
            <td>
                <lable id="txtFx_JB_GXR_SiJi" name="txtFx_JB_GXR_SiJi" />
            </td>
            <td>副司机</td>
            <td>
                <lable id="txtFx_JB_GXR_FuSiJi" name="txtFx_JB_GXR_FuSiJi" />
            </td>
            <td colspan="2">运转车长</td>
            <td colspan="2">
                <lable id="txtFx_JB_GXR_YunZhuanCheZhang" name="txtFx_JB_GXR_YunZhuanCheZhang" />
            </td>
            <td colspan="2">列车长</td>
            <td>
                <lable id="txtFx_JB_GXR_LieCheZhang" name="txtFx_JB_GXR_LieCheZhang" />
            </td>
            <td colspan="2">值班员</td>
            <td colspan="2">
                <lable id="txtFx_JB_GXR_ZhiBanYuan" name="txtFx_JB_GXR_ZhiBanYuan" />
            </td>
            <td>天气情况</td>
            <td>
                <lable id="txtFx_JB_TianQi" name="txtFx_JB_TianQi" />
            </td>
            <td>事故性质</td>
            <td>
                <lable id="txtFx_JB_ShiGuXingZhi" name="txtFx_JB_ShiGuXingZhi" />
            </td>
        </tr>
        <tr>
            <td rowspan="2">发生时间</td>
            <td>上行(单)</td>
            <td colspan="3">
                <lable id="txtFx_JB_FS_ShangXing" name="txtFx_JB_FS_ShangXing" />
            </td>

            <td>复旧时间</td>
            <td>上行(单)</td>
            <td colspan="5">
                <lable id="txtFx_JB_FJ_ShangXing" name="txtFx_JB_FJ_ShangXing" />
            </td>
            <td>开通时间</td>
            <td>上行(单)</td>
            <td colspan="6">
                <lable id="txtFx_JB_KT_ShangXing" name="txtFx_JB_KT_ShangXing" />
            </td>
        </tr>
        <tr>
            <td>下行</td>
            <td colspan="3">
                <lable id="txtFx_JB_FS_XiaXing" name="txtFx_JB_FS_XiaXing" />
            </td>
            <td colspan="2">下行</td>
            <td colspan="5">
                <lable id="txtFx_JB_FJ_XiaXing" name="txtFx_JB_FJ_XiaXing" />
            </td>
            <td colspan="2">下行</td>
            <td colspan="6">
                <lable id="txtFx_JB_KT_XiaXing" name="txtFx_JB_KT_XiaXing" />
            </td>
        </tr>
    </table>
    </br></br>
    <table id="sgfenxihouguoinfo">
        <tr>
            <td rowspan="10">事<br />
                故<br />
                后<br />
                果</td>
            <td>中断时间</td>
            <td>上行(单)</td>
            <td>
                <lable id="txtFx_HG_ZD_ShangXing" name="txtFx_HG_ZD_ShangXing" />
            </td>
            <td>下行</td>
            <td>
                <lable id="txtFx_HG_ZD_XiaXing" name="txtFx_HG_ZD_XiaXing" />
            </td>
            <td colspan="2">耽误列车时间</td>
            <td>上行</td>
            <td>
                <lable id="txtFx_HG_DW_ShangXing" name="txtFx_HG_DW_ShangXing" />
            </td>
            <td>下行</td>
            <td colspan="2">
                <lable id="txtFx_HG_DW_XiaXing" name="txtFx_HG_DW_XiaXing" />
            </td>
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
                <lable id="txtFx_HG_TG_DongCheZu" name="txtFx_HG_TG_DongCheZu" />
            </td>
            <td>
                <lable id="txtFx_HG_TG_JiChe" name="txtFx_HG_TG_JiChe" />
            </td>
            <td>
                <lable id="txtFx_HG_TG_KeChe" name="txtFx_HG_TG_KeChe" />
            </td>
            <td>
                <lable id="txtFx_HG_TG_HuoChe" name="txtFx_HG_TG_HuoChe" />
            </td>
            <td>
                <lable id="txtFx_HG_SS_DongCheZu" name="txtFx_HG_SS_DongCheZu" />
            </td>
            <td>
                <lable id="txtFx_HG_SS_JiChe" name="txtFx_HG_SS_JiChe" />
            </td>
            <td>
                <lable id="txtFx_HG_SS_CheLiang" name="txtFx_HG_SS_CheLiang" />
            </td>
            <td>
                <lable id="txtFx_HG_SS_QiTa" name="txtFx_HG_SS_QiTa" />
            </td>
            <td>
                <lable id="txtFx_HG_ZhiJieSunShi" name="txtFx_HG_ZhiJieSunShi" />
            </td>
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
                <lable id="txtFx_HG_XZ_JiDongChe" name="txtFx_HG_XZ_JiDongChe" />
            </td>
            <td>
                <lable id="txtFx_HG_XZ_FeiJiDongChe" name="txtFx_HG_XZ_FeiJiDongChe" />
            </td>
            <td>
                <lable id="txtFx_HG_XZ_XingRen" name="txtFx_HG_XZ_XingRen" />
            </td>
            <td>
                <lable id="txtFx_HG_XZ_DaoKouQingKuang" name="txtFx_HG_XZ_DaoKouQingKuang" />
            </td>
            <td>
                <lable id="txtFx_HG_XZ_GongTieBingXing" name="txtFx_HG_XZ_GongTieBingXing" />
            </td>
            <td>
                <lable id="txtFx_HG_XZ_FangHuZhaLan" name="txtFx_HG_XZ_FangHuZhaLan" />
            </td>
            <td>
                <lable id="txtFx_HG_XZ_GongTieLiJiao" name="txtFx_HG_XZ_GongTieLiJiao" />
            </td>
            <td colspan="2">
                <lable id="txtFx_HG_XZ_SuDuQuDuan" name="txtFx_HG_XZ_SuDuQuDuan" />
            </td>
            <td>
                <lable id="txtFx_HG_XZ_QuXianBanJing" name="txtFx_HG_XZ_QuXianBanJing" />
            </td>
            <td>
                <lable id="txtFx_HG_XZ_PoDu" name="txtFx_HG_XZ_PoDu" />
            </td>
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
                <lable id="txtFx_HG_SW_XingMing" name="txtFx_HG_SW_XingMing" class="txtFx_HG_SW_XingMing" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_DanWei" name="txtFx_HG_SW_DanWei" class="txtFx_HG_SW_DanWei" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_XingBie" name="txtFx_HG_SW_XingBie" class="txtFx_HG_SW_XingBie" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_NianLing" name="txtFx_HG_SW_NianLing" class="txtFx_HG_SW_NianLing" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_MinZu" name="txtFx_HG_SW_MinZu" class="txtFx_HG_SW_MinZu" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_GongZhong" name="txtFx_HG_SW_GongZhong" class="txtFx_HG_SW_GongZhong" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_ShangHaiChengDu" name="txtFx_HG_SW_ShangHaiChengDu" class="txtFx_HG_SW_ShangHaiChengDu" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_RenYuanShuXing" name="txtFx_HG_SW_RenYuanShuXing" class="txtFx_HG_SW_RenYuanShuXing" />
            </td>
            <td>死亡人数</td>
            <td>
                <lable id="txtFx_HG_SiW_LuNei" name="txtFx_HG_SiW_LuNei" />
            </td>
            <td>
                <lable id="txtFx_HG_SiW_LuWai" name="txtFx_HG_SiW_LuWai" />
            </td>
        </tr>
        <tr>
            <td>
                <lable id="txtFx_HG_SW_XingMing1" name="txtFx_HG_SW_XingMing1" class="txtFx_HG_SW_XingMing" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_DanWei1" name="txtFx_HG_SW_DanWei1" class="txtFx_HG_SW_DanWei" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_XingBie1" name="txtFx_HG_SW_XingBie1" class="txtFx_HG_SW_XingBie" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_NianLing1" name="txtFx_HG_SW_NianLing1" class="txtFx_HG_SW_NianLing" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_MinZu1" name="txtFx_HG_SW_MinZu1" class="txtFx_HG_SW_MinZu" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_GongZhong1" name="txtFx_HG_SW_GongZhong1" class="txtFx_HG_SW_GongZhong" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_ShangHaiChengDu1" name="txtFx_HG_SW_ShangHaiChengDu1" class="txtFx_HG_SW_ShangHaiChengDu" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_RenYuanShuXing1" name="txtFx_HG_SW_RenYuanShuXing1" class="txtFx_HG_SW_RenYuanShuXing" />
            </td>
            <td>重伤人数</td>
            <td>
                <lable id="txtFx_HG_ZS_LuNei" name="txtFx_HG_ZS_LuNei" />
            </td>
            <td>
                <lable id="txtFx_HG_ZS_LuWai" name="txtFx_HG_ZS_LuWai" />
            </td>
        </tr>
        <tr>
            <td>
                <lable id="txtFx_HG_SW_XingMing2" name="txtFx_HG_SW_XingMing2" class="txtFx_HG_SW_XingMing" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_DanWei2" name="txtFx_HG_SW_DanWei2" class="txtFx_HG_SW_DanWei" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_XingBie2" name="txtFx_HG_SW_XingBie2" class="txtFx_HG_SW_XingBie" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_NianLing2" name="txtFx_HG_SW_NianLing2" class="txtFx_HG_SW_NianLing" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_MinZu2" name="txtFx_HG_SW_MinZu2" class="txtFx_HG_SW_MinZu" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_GongZhong2" name="txtFx_HG_SW_GongZhong2" class="txtFx_HG_SW_GongZhong" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_ShangHaiChengDu2" name="txtFx_HG_SW_ShangHaiChengDu2" class="txtFx_HG_SW_ShangHaiChengDu" />
            </td>
            <td>
                <lable id="txtFx_HG_SW_RenYuanShuXing2" name="txtFx_HG_SW_RenYuanShuXing2" class="txtFx_HG_SW_RenYuanShuXing" />
            </td>
            <td>轻伤人数</td>
            <td>
                <lable id="txtFx_HG_QS_LuWai" name="txtFx_HG_QS_LuWai" />
            </td>
            <td>
                <lable id="txtFx_HG_QS_LuNei" name="txtFx_HG_QS_LuNei" />
            </td>
        </tr>
    </table>
    </br></br>
     <table id="sgfenxizereninfo">
         <tr>
             <td>事故概况</td>
             <td colspan="7">
                 <lable id="“txtFx_HG_ShiGuGaiKuang" name="“txtFx_HG_ShiGuGaiKuang" />
             </td>
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
                 <lable id="“txtFx_ZR_ShiGuLeiBie" name="“txtFx_ZR_ShiGuLeiBie" />
             </td>
         </tr>
         <tr>
             <td style="height: 14px;">
                 <lable id="“txtFx_ZR_ZeRenDanWei" name="“txtFx_ZR_ZeRenDanWei" />
             </td>
             <td>
                 <lable id="“txtFx_ZR_ZeRenDanWeiShuXing" name="“txtFx_ZR_ZeRenDanWeiShuXing" />
             </td>
             <td>
                 <lable id="“txtFx_ZR_ZeRenBuMen" name="“txtFx_ZR_ZeRenBuMen" />
             </td>
             <td>
                 <lable id="“txtFx_ZR_ZeRenChengDu" name="“txtFx_ZR_ZeRenChengDu" />
             </td>
             <td rowspan="3">
                 <lable id="“txtFx_ZR_YuanYinLeiBie" name="“txtFx_ZR_YuanYinLeiBie" />
             </td>
         </tr>
         <tr>
             <td>&nbsp;</td>
             <td></td>
             <td></td>
             <td></td>
             <td rowspan="2">事故等级</td>
             <td rowspan="2">
                 <lable id="“txtFx_ZR_ShiGuDengJi" name="“txtFx_ZR_ShiGuDengJi" />
             </td>
         </tr>
         <tr>
             <td>&nbsp;</td>
             <td></td>
             <td></td>
             <td></td>
         </tr>
         <tr>
             <td>值班监察</td>
             <td>
                 <lable id="“txtFx_ZR_ZhiBanJianCha" name="“txtFx_ZR_ZhiBanJianCha" />
             </td>
             <td>填报时间</td>
             <td colspan="2">
                 <lable id="txtFx_ZR_TianBaoShiJian" name="txtFx_ZR_TianBaoShiJian" />
             </td>
             <td>第</td>
             <td>
                 <lable id="“txtFx_ZR_BaoGaoCiShu" name="“txtFx_ZR_BaoGaoCiShu" />
             </td>
             <td>次报告</td>
         </tr>
         <tr>
             <td colspan="8" style="border: 0;">&nbsp;</td>
         </tr>
         <tr>
             <td>事故调查报告</td>
             <td>
                 <lable id="“txtFx_ZR_ShiGuDiaoChaBaoGao" name="“txtFx_ZR_ShiGuDiaoChaBaoGao" />
             </td>
             <td>现场调查有关资料</td>
             <td>
                 <lable id="“txtFx_ZR_XianChangDianChaZiLiao" name="“txtFx_ZR_XianChangDianChaZiLiao" />
             </td>
             <td>损失计算材料</td>
             <td>
                 <lable id="“txtFx_ZR_SunShiJiSuanZiLiao" name="“txtFx_ZR_SunShiJiSuanZiLiao" />
             </td>
             <td>事故认定书</td>
             <td>
                 <lable id="“txtFx_ZR_ShiGuRenDingShu" name="“txtFx_ZR_ShiGuRenDingShu" />
             </td>
         </tr>
         <tr>
             <td>安监报二</td>
             <td>
                 <lable id="“txtFx_ZR_AnJianBaoEr" name="“txtFx_ZR_AnJianBaoEr" />
             </td>
             <td>其它</td>
             <td>
                 <lable id="“txtFx_ZR_QiTa" name="“txtFx_ZR_QiTa" />
             </td>
             <td>特派办调查报告</td>
             <td>
                 <lable id="“txtFx_ZR_TePaiBanDiaoChaBaoGao" name="“txtFx_ZR_TePaiBanDiaoChaBaoGao" />
             </td>
             <td>深度调查报告</td>
             <td>
                 <lable id="“txtFx_ZR_SheDuDiaoChaBaoGao" name="“txtFx_ZR_SheDuDiaoChaBaoGao" />
             </td>
         </tr>
     </table>
</div>


<script src="js/views/AccidentAnalyzeShowPage.js"></script>
