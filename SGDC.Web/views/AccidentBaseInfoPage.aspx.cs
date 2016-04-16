using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGDC.Bll;
using SGDC.Model;
using SGDC.Utility;

public partial class views_AccidentBaseInfoPage : BasePage
{
    /// <summary>
    /// 全局连接对象
    /// </summary>
    shigujibeninfo_Bll SgJbBll;
    protected void Page_Load(object sender, EventArgs e)
    {
        SgJbBll = new shigujibeninfo_Bll();
        if (Request["method"] != null)
        {
            string method = Request["method"];
            switch (method)
            {
                case "SaveItem":
                    SaveSuJbItem();
                    break;
                case "DelItem":
                    DeleteSuJbItem();
                    break;
                case "QryList":
                    GetSgJbListInfo();
                    break;
            }
        }
    }

    private void GetSgJbListInfo()
    {
        int page = Convert.ToInt32(Request["page"]) - 1;
        int rows = Convert.ToInt32(Request["rows"]);

        string search_txtJB_DD_Ju = Request["search_txtJB_DD_Ju"] ?? "";
        string search_txtJB_DD_Xian = Request["search_txtJB_DD_Xian"] ?? "";
        string search_txtJB_LC_CheCi = Request["search_txtJB_LC_CheCi"] ?? "";
        search_txtJB_DD_Ju = search_txtJB_DD_Ju.Trim();
        search_txtJB_DD_Xian = search_txtJB_DD_Xian.Trim();
        search_txtJB_LC_CheCi = search_txtJB_LC_CheCi.Trim();

        List<Filter> filters = new List<Filter>();
        if (search_txtJB_DD_Ju.Length > 0) filters.Add(new Filter { Name = "JB_DD_Ju", Op = FilterOp.Contains, Value = search_txtJB_DD_Ju });
        if (search_txtJB_DD_Xian.Length > 0) filters.Add(new Filter { Name = "JB_DD_Xian", Op = FilterOp.Contains, Value = search_txtJB_DD_Xian });
        if (search_txtJB_LC_CheCi.Length > 0) filters.Add(new Filter { Name = "JB_LC_CheCi", Op = FilterOp.Contains, Value = search_txtJB_LC_CheCi });

        ReturnData<shigujibeninfo> rd_datadic = SgJbBll.GetPaged(page, rows, filters, "", true);

        DataContractJsonSerializer json = new DataContractJsonSerializer(rd_datadic.GetType());
        json.WriteObject(Response.OutputStream, rd_datadic);
        Response.End();
    }

    private void DeleteSuJbItem()
    {
        string sgbaseinfoid = Request["sgbaseinfoid"];
        if (sgbaseinfoid.Length > 0)
        {
            shigujibeninfo obj = SgJbBll.Get(Convert.ToInt32(sgbaseinfoid));//用于记录删除日志

            SgJbBll.Remove(Convert.ToInt32(sgbaseinfoid));

            LogType = SysLogType.删除.ToString();
            LogDesc = string.Format("事故基本信息 {0}", CompareEntityProperties(null, obj, false));
            WriteSystemLog(); 

            DataContractJsonSerializer json = new DataContractJsonSerializer("Removed".GetType());
            json.WriteObject(Response.OutputStream, "Removed");
            Response.End();

        }
    }

    private void SaveSuJbItem()
    {
        #region 控件取值
        string sgbaseinfoid = Request["sgbaseinfoid"];
        string txtJB_DD_Ju = Request["txtJB_DD_Ju"];
        string txtJB_DD_Xian = Request["txtJB_DD_Xian"];
        string txtJB_DD_XianBie = Request["txtJB_DD_XianBie"];
        string txtJB_DD_QiDian = Request["txtJB_DD_QiDian"];
        string txtJB_DD_ZhongDian = Request["txtJB_DD_ZhongDian"];
        string txtJB_DD_XingBie = Request["txtJB_DD_XingBie"];
        string txtJB_DD_GongLi = Request["txtJB_DD_GongLi"];
        string txtJB_DD_MiShu = Request["txtJB_DD_MiShu"];
        string txtJB_DD_Sheng = Request["txtJB_DD_Sheng"];
        string txtJB_DD_Shi = Request["txtJB_DD_Shi"];
        string txtJB_DD_Qu = Request["txtJB_DD_Qu"];
        string txtJB_DD_DanWei = Request["txtJB_DD_DanWei"];
        string txtJB_DD_ChangSuo = Request["txtJB_DD_ChangSuo"];
        string txtJB_LC_CheCi = Request["txtJB_LC_CheCi"];
        string txtJB_LC_CheHao = Request["txtJB_LC_CheHao"];
        string txtJB_LC_QiDian = Request["txtJB_LC_QiDian"];
        string txtJB_LC_ZhongDian = Request["txtJB_LC_ZhongDian"];
        string txtJB_LC_PeiShu = Request["txtJB_LC_PeiShu"];
        string txtJB_LC_DanDang = Request["txtJB_LC_DanDang"];
        string txtJB_LC_LvKe = Request["txtJB_LC_LvKe"];
        string txtJB_JC_XingHao = Request["txtJB_JC_XingHao"];
        string txtJB_JC_BianHao = Request["txtJB_JC_BianHao"];
        string txtJB_JC_PeiShu = Request["txtJB_JC_PeiShu"];
        string txtJB_JC_DanDang = Request["txtJB_JC_DanDang"];
        string txtJB_JC_SuDu = Request["txtJB_JC_SuDu"];
        string txtJB_JC_GongDian = Request["txtJB_JC_GongDian"];
        string txtJB_JC_XinHao = Request["txtJB_JC_XinHao"];
        string txtJB_BZ_DunWei = Request["txtJB_BZ_DunWei"];
        string txtJB_BZ_ShuLiang = Request["txtJB_BZ_ShuLiang"];
        string txtJB_BZ_JiChang = Request["txtJB_BZ_JiChang"];
        string txtJB_BZ_ZhongChe = Request["txtJB_BZ_ZhongChe"];
        string txtJB_BZ_KongChe = Request["txtJB_BZ_KongChe"];
        string txtJB_BZ_LieWei = Request["txtJB_BZ_LieWei"];
        string txtJB_BZ_WeiXianPin = Request["txtJB_BZ_WeiXianPin"];
        string txtJB_BZ_ChaoXianChe = Request["txtJB_BZ_ChaoXianChe"];
        string txtJB_GXR_SiJi = Request["txtJB_GXR_SiJi"];
        string txtJB_GXR_FuSiJi = Request["txtJB_GXR_FuSiJi"];
        string txtJB_GXR_YunZhuanCheZhang = Request["txtJB_GXR_YunZhuanCheZhang"];
        string txtJB_GXR_LieCheZhang = Request["txtJB_GXR_LieCheZhang"];
        string txtJB_GXR_ZhiBanYuan = Request["txtJB_GXR_ZhiBanYuan"];
        string txtJB_TianQi = Request["txtJB_TianQi"];
        string txtJB_ShiGuXingZhi = Request["txtJB_ShiGuXingZhi"];
        string dtbJB_FS_ShangXing = Request["dtbJB_FS_ShangXing"];
        string dtbJB_FS_XiaXing = Request["dtbJB_FS_XiaXing"];
        string dtbJB_FJ_ShangXing = Request["dtbJB_FJ_ShangXing"];
        string dtbJB_FJ_XiaXing = Request["dtbJB_FJ_XiaXing"];
        string dtbJB_KT_ShangXing = Request["dtbJB_KT_ShangXing"];
        string dtbJB_KT_XiaXing = Request["dtbJB_KT_XiaXing"];
        #endregion

        shigujibeninfo item = null;
        shigujibeninfo oldItem = null;
        DateTime dtNow = DateTime.Now;
        if (sgbaseinfoid.Length > 0)
            item = SgJbBll.Get(Convert.ToInt32(sgbaseinfoid));
        if (item != null)
        {
            oldItem = SgJbBll.Clone(item);

            #region 修改
            item.JB_DD_Ju = txtJB_DD_Ju;
            item.JB_DD_Xian = txtJB_DD_Xian;
            item.JB_DD_XianBie = txtJB_DD_XianBie;
            item.JB_DD_QiDian = txtJB_DD_QiDian;
            item.JB_DD_ZhongDian = txtJB_DD_ZhongDian;
            item.JB_DD_XingBie = txtJB_DD_XingBie;
            item.JB_DD_GongLi = txtJB_DD_GongLi;
            item.JB_DD_MiShu = txtJB_DD_MiShu;
            item.JB_DD_Sheng = txtJB_DD_Sheng;
            item.JB_DD_Shi = txtJB_DD_Shi;
            item.JB_DD_Qu = txtJB_DD_Qu;
            item.JB_DD_DanWei = txtJB_DD_DanWei;
            item.JB_DD_ChangSuo = txtJB_DD_ChangSuo;
            item.JB_LC_CheCi = txtJB_LC_CheCi;
            item.JB_LC_CheHao = txtJB_LC_CheHao;
            item.JB_LC_QiDian = txtJB_LC_QiDian;
            item.JB_LC_ZhongDian = txtJB_LC_ZhongDian;
            item.JB_LC_PeiShu = txtJB_LC_PeiShu;
            item.JB_LC_DanDang = txtJB_LC_DanDang;
            item.JB_LC_LvKe = txtJB_LC_LvKe;
            item.JB_JC_XingHao = txtJB_JC_XingHao;
            item.JB_JC_BianHao = txtJB_JC_BianHao;
            item.JB_JC_PeiShu = txtJB_JC_PeiShu;
            item.JB_JC_DanDang = txtJB_JC_DanDang;
            item.JB_JC_SuDu = txtJB_JC_SuDu;
            item.JB_JC_GongDian = txtJB_JC_GongDian;
            item.JB_JC_XinHao = txtJB_JC_XinHao;
            item.JB_BZ_DunWei = txtJB_BZ_DunWei;
            item.JB_BZ_ShuLiang = txtJB_BZ_ShuLiang;
            item.JB_BZ_JiChang = txtJB_BZ_JiChang;
            item.JB_BZ_ZhongChe = txtJB_BZ_ZhongChe;
            item.JB_BZ_KongChe = txtJB_BZ_KongChe;
            item.JB_BZ_LieWei = txtJB_BZ_LieWei;
            item.JB_BZ_WeiXianPin = txtJB_BZ_WeiXianPin;
            item.JB_BZ_ChaoXianChe = txtJB_BZ_ChaoXianChe;
            item.JB_GXR_SiJi = txtJB_GXR_SiJi;
            item.JB_GXR_FuSiJi = txtJB_GXR_FuSiJi;
            item.JB_GXR_YunZhuanCheZhang = txtJB_GXR_YunZhuanCheZhang;
            item.JB_GXR_LieCheZhang = txtJB_GXR_LieCheZhang;
            item.JB_GXR_ZhiBanYuan = txtJB_GXR_ZhiBanYuan;
            item.JB_TianQi = txtJB_TianQi;
            item.JB_ShiGuXingZhi = txtJB_ShiGuXingZhi;
            item.JB_FS_ShangXing = dtbJB_FS_ShangXing.Length > 0 ? Convert.ToDateTime(dtbJB_FS_ShangXing) : (DateTime?)null;
            item.JB_FS_XiaXing = dtbJB_FS_XiaXing.Length > 0 ? Convert.ToDateTime(dtbJB_FS_XiaXing) : (DateTime?)null;
            item.JB_FJ_ShangXing = dtbJB_FJ_ShangXing.Length > 0 ? Convert.ToDateTime(dtbJB_FJ_ShangXing) : (DateTime?)null;
            item.JB_FJ_XiaXing = dtbJB_FJ_XiaXing.Length > 0 ? Convert.ToDateTime(dtbJB_FJ_XiaXing) : (DateTime?)null;
            item.JB_KT_ShangXing = dtbJB_KT_ShangXing.Length > 0 ? Convert.ToDateTime(dtbJB_KT_ShangXing) : (DateTime?)null;
            item.JB_KT_XiaXing = dtbJB_KT_XiaXing.Length > 0 ? Convert.ToDateTime(dtbJB_KT_XiaXing) : (DateTime?)null;
            item.JB_UpdateTime = dtNow;

            #endregion

            LogType = SysLogType.修改.ToString();
        }
        else
        {
            #region 新增
            item = new shigujibeninfo
            {
                JB_DD_Ju = txtJB_DD_Ju,
                JB_DD_Xian = txtJB_DD_Xian,
                JB_DD_XianBie = txtJB_DD_XianBie,
                JB_DD_QiDian = txtJB_DD_QiDian,
                JB_DD_ZhongDian = txtJB_DD_ZhongDian,
                JB_DD_XingBie = txtJB_DD_XingBie,
                JB_DD_GongLi = txtJB_DD_GongLi,
                JB_DD_MiShu = txtJB_DD_MiShu,
                JB_DD_Sheng = txtJB_DD_Sheng,
                JB_DD_Shi = txtJB_DD_Shi,
                JB_DD_Qu = txtJB_DD_Qu,
                JB_DD_DanWei = txtJB_DD_DanWei,
                JB_DD_ChangSuo = txtJB_DD_ChangSuo,
                JB_LC_CheCi = txtJB_LC_CheCi,
                JB_LC_CheHao = txtJB_LC_CheHao,
                JB_LC_QiDian = txtJB_LC_QiDian,
                JB_LC_ZhongDian = txtJB_LC_ZhongDian,
                JB_LC_PeiShu = txtJB_LC_PeiShu,
                JB_LC_DanDang = txtJB_LC_DanDang,
                JB_LC_LvKe = txtJB_LC_LvKe,
                JB_JC_XingHao = txtJB_JC_XingHao,
                JB_JC_BianHao = txtJB_JC_BianHao,
                JB_JC_PeiShu = txtJB_JC_PeiShu,
                JB_JC_DanDang = txtJB_JC_DanDang,
                JB_JC_SuDu = txtJB_JC_SuDu,
                JB_JC_GongDian = txtJB_JC_GongDian,
                JB_JC_XinHao = txtJB_JC_XinHao,
                JB_BZ_DunWei = txtJB_BZ_DunWei,
                JB_BZ_ShuLiang = txtJB_BZ_ShuLiang,
                JB_BZ_JiChang = txtJB_BZ_JiChang,
                JB_BZ_ZhongChe = txtJB_BZ_ZhongChe,
                JB_BZ_KongChe = txtJB_BZ_KongChe,
                JB_BZ_LieWei = txtJB_BZ_LieWei,
                JB_BZ_WeiXianPin = txtJB_BZ_WeiXianPin,
                JB_BZ_ChaoXianChe = txtJB_BZ_ChaoXianChe,
                JB_GXR_SiJi = txtJB_GXR_SiJi,
                JB_GXR_FuSiJi = txtJB_GXR_FuSiJi,
                JB_GXR_YunZhuanCheZhang = txtJB_GXR_YunZhuanCheZhang,
                JB_GXR_LieCheZhang = txtJB_GXR_LieCheZhang,
                JB_GXR_ZhiBanYuan = txtJB_GXR_ZhiBanYuan,
                JB_TianQi = txtJB_TianQi,
                JB_ShiGuXingZhi = txtJB_ShiGuXingZhi,
                JB_FS_ShangXing = dtbJB_FS_ShangXing.Length > 0 ? Convert.ToDateTime(dtbJB_FS_ShangXing) : (DateTime?)null,
                JB_FS_XiaXing = dtbJB_FS_XiaXing.Length > 0 ? Convert.ToDateTime(dtbJB_FS_XiaXing) : (DateTime?)null,
                JB_FJ_ShangXing = dtbJB_FJ_ShangXing.Length > 0 ? Convert.ToDateTime(dtbJB_FJ_ShangXing) : (DateTime?)null,
                JB_FJ_XiaXing = dtbJB_FJ_XiaXing.Length > 0 ? Convert.ToDateTime(dtbJB_FJ_XiaXing) : (DateTime?)null,
                JB_KT_ShangXing = dtbJB_KT_ShangXing.Length > 0 ? Convert.ToDateTime(dtbJB_KT_ShangXing) : (DateTime?)null,
                JB_KT_XiaXing = dtbJB_KT_XiaXing.Length > 0 ? Convert.ToDateTime(dtbJB_KT_XiaXing) : (DateTime?)null,
                JB_CreatTime = dtNow,
                JB_UpdateTime = dtNow,
                //JB_ZB_X = null,
                //JB_ZB_Y = null,
                //JB_ZB_Z = null,
                //JB_Ext1 = null,
                //JB_Ext2 = null,
                //JB_Ext3 = null,				

            };
            #endregion

            LogType = SysLogType.新增.ToString();
        }
        item = SgJbBll.Save(item);

        LogDesc = string.Format("事故基本信息 {0}", CompareEntityProperties(oldItem, item, true));
        WriteSystemLog();

        DataContractJsonSerializer json = new DataContractJsonSerializer(item.GetType());
        json.WriteObject(Response.OutputStream, item);
        Response.End();
    }
}