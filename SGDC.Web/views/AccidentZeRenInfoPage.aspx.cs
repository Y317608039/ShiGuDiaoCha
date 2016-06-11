using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGDC.Bll;
using SGDC.Model;
using SGDC.Utility;

public partial class views_AccidentZeRenInfoPage : BasePage
{
    /// <summary>
    /// 全局连接对象
    /// </summary>
    v_shigu_Bll VSgBll;
    shiguhouguoinfo_Bll SgHgBll;
    shiguzereninfo_Bll SgZrBll;

    protected void Page_Load(object sender, EventArgs e)
    {
        VSgBll = new v_shigu_Bll();
        SgHgBll = new shiguhouguoinfo_Bll();
        SgZrBll = new shiguzereninfo_Bll();

        if (Request["method"] != null)
        {
            string method = Request["method"];
            switch (method)
            {
                case "SaveItem":
                    SaveSuZrItem();
                    break;
                case "DelItem":
                    DeleteSuZrItem();
                    break;
                case "QryList":
                    GetSgZrListInfo();
                    break;
                case "SaveFile":
                    UpLoadFiles();
                    break;
                case "SaveUploadFileInfo":
                    SaveUploadFileInfo();
                    break;
                case "DelDocFileInfo":
                    DelDocFileInfo();
                    break;
            }
        }
    }

    private void DelDocFileInfo()
    {
        string sgzereninfoid = Request["sgzereninfoid"];
        string doctype = Request["doctype"];

        if (sgzereninfoid.Length > 0)
        {
            shiguzereninfo objSgZR = new shiguzereninfo_Bll().Get(Convert.ToInt32(sgzereninfoid));
            if (objSgZR != null)
            {
                string strFileName = string.Empty;
                switch (doctype)
                {
                    case "事故调查报告": strFileName = objSgZR.ZR_ShiGuDiaoChaBaoGao; objSgZR.ZR_ShiGuDiaoChaBaoGao = string.Empty; break;
                    case "现场调查有关资料": strFileName = objSgZR.ZR_XianChangDianChaZiLiao; objSgZR.ZR_XianChangDianChaZiLiao = string.Empty; break;
                    case "损失计算材料": strFileName = objSgZR.ZR_SunShiJiSuanZiLiao; objSgZR.ZR_SunShiJiSuanZiLiao = string.Empty; break;
                    case "事故认定书": strFileName = objSgZR.ZR_ShiGuRenDingShu; objSgZR.ZR_ShiGuRenDingShu = string.Empty; break;
                    case "安监报二": strFileName = objSgZR.ZR_AnJianBaoEr; objSgZR.ZR_AnJianBaoEr = string.Empty; break;
                    case "特派办调查报告": strFileName = objSgZR.ZR_TePaiBanDiaoChaBaoGao; objSgZR.ZR_TePaiBanDiaoChaBaoGao = string.Empty; break;
                    case "深度调查报告": strFileName = objSgZR.ZR_SheDuDiaoChaBaoGao; objSgZR.ZR_SheDuDiaoChaBaoGao = string.Empty; break;
                    case "其它": strFileName = objSgZR.ZR_QiTa; objSgZR.ZR_QiTa = string.Empty; break;
                }

                objSgZR = new shiguzereninfo_Bll().Save(objSgZR);

                string path = string.Format("~/docfile/{0}/{1}", objSgZR.JB_ID, strFileName);
                File.Delete(Server.MapPath(path));

                DataContractJsonSerializer json = new DataContractJsonSerializer(objSgZR.GetType());
                json.WriteObject(Response.OutputStream, objSgZR);
                Response.End();
            }
        }
    }

    private void SaveUploadFileInfo()
    {
        string sgbaseinfoid = Request["sgbaseinfoid"];
        string sgzereninfoid = Request["sgzereninfoid"];
        string doctype = Request["doctype"];
        string filename = Request["filename"];
        shiguzereninfo objSgZR;
        if (sgzereninfoid.Length == 0)
        {
            objSgZR = new shiguzereninfo
            {
                JB_ID = Convert.ToInt32(sgbaseinfoid),
                ZR_ZeRenDanWei = string.Empty,
                ZR_ZeRenDanWeiShuXing = string.Empty,
                ZR_ZeRenBuMen = string.Empty,
                ZR_ZeRenChengDu = string.Empty,
                ZR_YuanYinLeiBie = string.Empty,
                ZR_ShiGuLeiBie = string.Empty,
                ZR_ShiGuDengJi = string.Empty,
                ZR_ZhiBanJianCha = string.Empty,
                ZR_BaoGaoCiShu = string.Empty,
                ZR_ShiGuDiaoChaBaoGao = string.Empty,
                ZR_XianChangDianChaZiLiao = string.Empty,
                ZR_SunShiJiSuanZiLiao = string.Empty,
                ZR_ShiGuRenDingShu = string.Empty,
                ZR_AnJianBaoEr = string.Empty,
                ZR_QiTa = string.Empty,
                ZR_TePaiBanDiaoChaBaoGao = string.Empty,
                ZR_SheDuDiaoChaBaoGao = string.Empty
            };
        }
        else
        {
            objSgZR = new shiguzereninfo_Bll().Get(Convert.ToInt32(sgzereninfoid));
            if (objSgZR != null)
            {
                switch (doctype)
                {
                    case "事故调查报告": objSgZR.ZR_ShiGuDiaoChaBaoGao = filename; break;
                    case "现场调查有关资料": objSgZR.ZR_XianChangDianChaZiLiao = filename; break;
                    case "损失计算材料": objSgZR.ZR_SunShiJiSuanZiLiao = filename; break;
                    case "事故认定书": objSgZR.ZR_ShiGuRenDingShu = filename; break;
                    case "安监报二": objSgZR.ZR_AnJianBaoEr = filename; break;
                    case "特派办调查报告": objSgZR.ZR_TePaiBanDiaoChaBaoGao = filename; break;
                    case "深度调查报告": objSgZR.ZR_SheDuDiaoChaBaoGao = filename; break;
                    case "其它": objSgZR.ZR_QiTa = filename; break;
                }
            }
        }
        objSgZR = new shiguzereninfo_Bll().Save(objSgZR);
        DataContractJsonSerializer json = new DataContractJsonSerializer(objSgZR.GetType());
        json.WriteObject(Response.OutputStream, objSgZR);
        Response.End();
    }

    private void UpLoadFiles()
    {
        HttpPostedFile file = Request.Files["fileZR_DocFile"];
        string sgbaseinfoid = Request.Params["sgbaseinfoid"];
        if (file != null && file.ContentLength > 0)
        {
            //获取上传文件的名称  
            string s = file.FileName;
            //截取获得上传文件的名称(ie上传会把绝对路径也连带上，这里只得到文件的名称)  
            int intIndex = s.LastIndexOf('.');
            string fileName = s.Substring(0, intIndex);
            string fileType = s.Substring(intIndex);
            string strFileName = string.Format("{0}_{1}{2}", fileName, DateTime.Now.ToString("yyyyMMddhhmmssms"), fileType);
            string strDir = "~/docfile/" + sgbaseinfoid;
            strDir = Server.MapPath(strDir);
            if (!Directory.Exists(strDir)) Directory.CreateDirectory(strDir);
            string path = strDir + "/" + strFileName;
            //保存文件  
            file.SaveAs(path);
            //HttpRuntime.AppDomainAppVirtualPath主要是获取应用程序虚拟路径名称，因为响应给页面时不会自动添加而导致无法显示图片
            //Response.Write(path.Substring(1));//path.Substring(1)用来去除第一个~字符
            Response.Write(strFileName);
            Response.End();

        }
        //return strReturn;
    }

    private void GetSgZrListInfo()
    {
        int page = Convert.ToInt32(Request["page"]) - 1;
        int rows = Convert.ToInt32(Request["rows"]);

        string search_txtZr_JB_DD_Ju = Request["search_txtZr_JB_DD_Ju"] ?? "";
        string search_txtZr_JB_DD_Xian = Request["search_txtZr_JB_DD_Xian"] ?? "";
        string search_txtZr_JB_LC_CheCi = Request["search_txtZr_JB_LC_CheCi"] ?? "";
        search_txtZr_JB_DD_Ju = search_txtZr_JB_DD_Ju.Trim();
        search_txtZr_JB_DD_Xian = search_txtZr_JB_DD_Xian.Trim();
        search_txtZr_JB_LC_CheCi = search_txtZr_JB_LC_CheCi.Trim();

        List<Filter> filters = new List<Filter>();
        if (search_txtZr_JB_DD_Ju.Length > 0) filters.Add(new Filter { Name = "JB_DD_Ju", Op = FilterOp.Contains, Value = search_txtZr_JB_DD_Ju });
        if (search_txtZr_JB_DD_Xian.Length > 0) filters.Add(new Filter { Name = "JB_DD_Xian", Op = FilterOp.Contains, Value = search_txtZr_JB_DD_Xian });
        if (search_txtZr_JB_LC_CheCi.Length > 0) filters.Add(new Filter { Name = "JB_LC_CheCi", Op = FilterOp.Contains, Value = search_txtZr_JB_LC_CheCi });

        ReturnData<v_shigu> rd_datadic = VSgBll.GetPaged(page, rows, filters, "", true);

        DataContractJsonSerializer json = new DataContractJsonSerializer(rd_datadic.GetType());
        json.WriteObject(Response.OutputStream, rd_datadic);
        Response.End();
    }

    private void DeleteSuZrItem()
    {
        string sgbaseinfoid = Request["sgbaseinfoid"];
        if (sgbaseinfoid.Length > 0)
        {
            v_shigu obj = VSgBll.GetByFilter(new List<Filter> { new Filter { Name = "JB_ID", Op = FilterOp.Equals, Value = Convert.ToInt32(sgbaseinfoid) } }).First();//用于记录删除日志

            SgHgBll.Remove(obj.HG_ID);
            if (obj.ZR_ID > 0)
            {
                if (obj.ZR_ShiGuDiaoChaBaoGao.Length > 0) { string path = string.Format("~/docfile/{0}/{1}", obj.JB_ID, obj.ZR_ShiGuDiaoChaBaoGao); File.Delete(Server.MapPath(path)); }
                if (obj.ZR_XianChangDianChaZiLiao.Length > 0) { string path = string.Format("~/docfile/{0}/{1}", obj.JB_ID, obj.ZR_XianChangDianChaZiLiao); File.Delete(Server.MapPath(path)); }
                if (obj.ZR_SunShiJiSuanZiLiao.Length > 0) { string path = string.Format("~/docfile/{0}/{1}", obj.JB_ID, obj.ZR_SunShiJiSuanZiLiao); File.Delete(Server.MapPath(path)); }
                if (obj.ZR_ShiGuRenDingShu.Length > 0) { string path = string.Format("~/docfile/{0}/{1}", obj.JB_ID, obj.ZR_ShiGuRenDingShu); File.Delete(Server.MapPath(path)); }
                if (obj.ZR_AnJianBaoEr.Length > 0) { string path = string.Format("~/docfile/{0}/{1}", obj.JB_ID, obj.ZR_AnJianBaoEr); File.Delete(Server.MapPath(path)); }
                if (obj.ZR_QiTa.Length > 0) { string path = string.Format("~/docfile/{0}/{1}", obj.JB_ID, obj.ZR_QiTa); File.Delete(Server.MapPath(path)); }
                if (obj.ZR_TePaiBanDiaoChaBaoGao.Length > 0) { string path = string.Format("~/docfile/{0}/{1}", obj.JB_ID, obj.ZR_TePaiBanDiaoChaBaoGao); File.Delete(Server.MapPath(path)); }
                if (obj.ZR_SheDuDiaoChaBaoGao.Length > 0) { string path = string.Format("~/docfile/{0}/{1}", obj.JB_ID, obj.ZR_SheDuDiaoChaBaoGao); File.Delete(Server.MapPath(path)); }
                string strDir = string.Format("~/docfile/{0}", obj.JB_ID);
                strDir = Server.MapPath(strDir);
                //if (Directory.GetFiles(strDir).Length == 0) 
                Directory.Delete(strDir, true);
                SgZrBll.Remove(obj.ZR_ID);
            }

            LogType = BasePage.SysLogType.删除.ToString();
            LogDesc = string.Format("事故后果及责任信息 {0}", CompareEntityProperties(null, obj, false));
            WriteSystemLog();

            DataContractJsonSerializer json = new DataContractJsonSerializer("Removed".GetType());
            json.WriteObject(Response.OutputStream, "Removed");
            Response.End();

        }
    }

    private void SaveSuZrItem()
    {
        #region 控件取值
        string sgbaseinfoid = Request["sgbaseinfoid"];
        string sghouguoinfoid = Request["sghouguoinfoid"];
        string sgzereninfoid = Request["sgzereninfoid"];

        #region 后果信息
        string txtHG_ZD_ShangXing = Request["txtHG_ZD_ShangXing"];
        string txtHG_ZD_XiaXing = Request["txtHG_ZD_XiaXing"];
        string txtHG_DW_ShangXing = Request["txtHG_DW_ShangXing"];
        string txtHG_DW_XiaXing = Request["txtHG_DW_XiaXing"];
        string txtHG_TG_DongCheZu = Request["txtHG_TG_DongCheZu"];
        string txtHG_TG_JiChe = Request["txtHG_TG_JiChe"];
        string txtHG_TG_KeChe = Request["txtHG_TG_KeChe"];
        string txtHG_TG_HuoChe = Request["txtHG_TG_HuoChe"];
        string txtHG_SS_DongCheZu = Request["txtHG_SS_DongCheZu"];
        string txtHG_SS_JiChe = Request["txtHG_SS_JiChe"];
        string txtHG_SS_CheLiang = Request["txtHG_SS_CheLiang"];
        string txtHG_SS_QiTa = Request["txtHG_SS_QiTa"];
        string txtHG_ZhiJieSunShi = Request["txtHG_ZhiJieSunShi"];
        string txtHG_XZ_JiDongChe = Request["txtHG_XZ_JiDongChe"];
        string txtHG_XZ_FeiJiDongChe = Request["txtHG_XZ_FeiJiDongChe"];
        string txtHG_XZ_XingRen = Request["txtHG_XZ_XingRen"];
        string txtHG_XZ_DaoKouQingKuang = Request["txtHG_XZ_DaoKouQingKuang"];
        string txtHG_XZ_GongTieBingXing = Request["txtHG_XZ_GongTieBingXing"];
        string txtHG_XZ_FangHuZhaLan = Request["txtHG_XZ_FangHuZhaLan"];
        string txtHG_XZ_GongTieLiJiao = Request["txtHG_XZ_GongTieLiJiao"];
        string txtHG_XZ_SuDuQuDuan = Request["txtHG_XZ_SuDuQuDuan"];
        string txtHG_XZ_QuXianBanJing = Request["txtHG_XZ_QuXianBanJing"];
        string txtHG_XZ_PoDu = Request["txtHG_XZ_PoDu"];
        string txtHG_SW_XingMing = Request["txtHG_SW_XingMing"];
        string txtHG_SW_DanWei = Request["txtHG_SW_DanWei"];
        string txtHG_SW_XingBie = Request["txtHG_SW_XingBie"];
        string txtHG_SW_NianLing = Request["txtHG_SW_NianLing"];
        string txtHG_SW_MinZu = Request["txtHG_SW_MinZu"];
        string txtHG_SW_GongZhong = Request["txtHG_SW_GongZhong"];
        string txtHG_SW_ShangHaiChengDu = Request["txtHG_SW_ShangHaiChengDu"];
        string txtHG_SW_RenYuanShuXing = Request["txtHG_SW_RenYuanShuXing"];
        string txtHG_SiW_LuNei = Request["txtHG_SiW_LuNei"];
        string txtHG_SiW_LuWai = Request["txtHG_SiW_LuWai"];
        string txtHG_ZS_LuNei = Request["txtHG_ZS_LuNei"];
        string txtHG_ZS_LuWai = Request["txtHG_ZS_LuWai"];
        string txtHG_QS_LuNei = Request["txtHG_QS_LuNei"];
        string txtHG_QS_LuWai = Request["txtHG_QS_LuWai"];
        string txtHG_ShiGuGaiKuang = Request["txtHG_ShiGuGaiKuang"];


        #endregion

        #region 责任信息
        string txtZR_ZeRenDanWei = Request["txtZR_ZeRenDanWei"];
        string txtZR_ZeRenDanWeiShuXing = Request["txtZR_ZeRenDanWeiShuXing"];
        string txtZR_ZeRenBuMen = Request["txtZR_ZeRenBuMen"];
        string txtZR_ZeRenChengDu = Request["txtZR_ZeRenChengDu"];
        string txtZR_YuanYinLeiBie = Request["txtZR_YuanYinLeiBie"];
        string txtZR_ShiGuLeiBie = Request["txtZR_ShiGuLeiBie"];
        string txtZR_ShiGuDengJi = Request["txtZR_ShiGuDengJi"];
        string txtZR_ZhiBanJianCha = Request["txtZR_ZhiBanJianCha"];
        string dtbZR_TianBaoShiJian = Request["dtbZR_TianBaoShiJian"];
        string txtZR_BaoGaoCiShu = Request["txtZR_BaoGaoCiShu"];
        string txtZR_ShiGuDiaoChaBaoGao = Request["txtZR_ShiGuDiaoChaBaoGao"];
        string txtZR_XianChangDianChaZiLiao = Request["txtZR_XianChangDianChaZiLiao"];
        string txtZR_SunShiJiSuanZiLiao = Request["txtZR_SunShiJiSuanZiLiao"];
        string txtZR_ShiGuRenDingShu = Request["txtZR_ShiGuRenDingShu"];
        string txtZR_AnJianBaoEr = Request["txtZR_AnJianBaoEr"];
        string txtZR_QiTa = Request["txtZR_QiTa"];
        string txtZR_TePaiBanDiaoChaBaoGao = Request["txtZR_TePaiBanDiaoChaBaoGao"];
        string txtZR_SheDuDiaoChaBaoGao = Request["txtZR_SheDuDiaoChaBaoGao"];
        #endregion

        #endregion

        #region 事故后果
        shiguhouguoinfo sgHgItem = null;
        shiguhouguoinfo oldSgHgItem = null;
        DateTime dtNow = DateTime.Now;
        if (sghouguoinfoid.Length > 0 && sghouguoinfoid != "0")
            sgHgItem = SgHgBll.Get(Convert.ToInt32(sghouguoinfoid));
        if (sgHgItem != null)
        {
            oldSgHgItem = SgHgBll.Clone(sgHgItem);

            #region 事故后果修改
            sgHgItem.HG_ZD_ShangXing = txtHG_ZD_ShangXing;
            sgHgItem.HG_ZD_XiaXing = txtHG_ZD_XiaXing;
            sgHgItem.HG_DW_ShangXing = txtHG_DW_ShangXing;
            sgHgItem.HG_DW_XiaXing = txtHG_DW_XiaXing;
            sgHgItem.HG_TG_DongCheZu = txtHG_TG_DongCheZu;
            sgHgItem.HG_TG_JiChe = txtHG_TG_JiChe;
            sgHgItem.HG_TG_KeChe = txtHG_TG_KeChe;
            sgHgItem.HG_TG_HuoChe = txtHG_TG_HuoChe;
            sgHgItem.HG_SS_DongCheZu = txtHG_SS_DongCheZu;
            sgHgItem.HG_SS_JiChe = txtHG_SS_JiChe;
            sgHgItem.HG_SS_CheLiang = txtHG_SS_CheLiang;
            sgHgItem.HG_SS_QiTa = txtHG_SS_QiTa;
            sgHgItem.HG_ZhiJieSunShi = txtHG_ZhiJieSunShi;
            sgHgItem.HG_XZ_JiDongChe = txtHG_XZ_JiDongChe;
            sgHgItem.HG_XZ_FeiJiDongChe = txtHG_XZ_FeiJiDongChe;
            sgHgItem.HG_XZ_XingRen = txtHG_XZ_XingRen;
            sgHgItem.HG_XZ_DaoKouQingKuang = txtHG_XZ_DaoKouQingKuang;
            sgHgItem.HG_XZ_GongTieBingXing = txtHG_XZ_GongTieBingXing;
            sgHgItem.HG_XZ_FangHuZhaLan = txtHG_XZ_FangHuZhaLan;
            sgHgItem.HG_XZ_GongTieLiJiao = txtHG_XZ_GongTieLiJiao;
            sgHgItem.HG_XZ_SuDuQuDuan = txtHG_XZ_SuDuQuDuan;
            sgHgItem.HG_XZ_QuXianBanJing = txtHG_XZ_QuXianBanJing;
            sgHgItem.HG_XZ_PoDu = txtHG_XZ_PoDu;
            sgHgItem.HG_SW_XingMing = txtHG_SW_XingMing;
            sgHgItem.HG_SW_DanWei = txtHG_SW_DanWei;
            sgHgItem.HG_SW_XingBie = txtHG_SW_XingBie;
            sgHgItem.HG_SW_NianLing = txtHG_SW_NianLing;
            sgHgItem.HG_SW_MinZu = txtHG_SW_MinZu;
            sgHgItem.HG_SW_GongZhong = txtHG_SW_GongZhong;
            sgHgItem.HG_SW_ShangHaiChengDu = txtHG_SW_ShangHaiChengDu;
            sgHgItem.HG_SW_RenYuanShuXing = txtHG_SW_RenYuanShuXing;
            sgHgItem.HG_SiW_LuNei = txtHG_SiW_LuNei;
            sgHgItem.HG_SiW_LuWai = txtHG_SiW_LuWai;
            sgHgItem.HG_ZS_LuNei = txtHG_ZS_LuNei;
            sgHgItem.HG_ZS_LuWai = txtHG_ZS_LuWai;
            sgHgItem.HG_QS_LuNei = txtHG_QS_LuNei;
            sgHgItem.HG_QS_LuWai = txtHG_QS_LuWai;
            sgHgItem.HG_ShiGuGaiKuang = txtHG_ShiGuGaiKuang;
            #endregion

            LogType = SysLogType.修改.ToString();
        }
        else
        {
            #region 事故后果新增
            sgHgItem = new shiguhouguoinfo
            {
                JB_ID = Convert.ToInt32(sgbaseinfoid),
                HG_ZD_ShangXing = txtHG_ZD_ShangXing,
                HG_ZD_XiaXing = txtHG_ZD_XiaXing,
                HG_DW_ShangXing = txtHG_DW_ShangXing,
                HG_DW_XiaXing = txtHG_DW_XiaXing,
                HG_TG_DongCheZu = txtHG_TG_DongCheZu,
                HG_TG_JiChe = txtHG_TG_JiChe,
                HG_TG_KeChe = txtHG_TG_KeChe,
                HG_TG_HuoChe = txtHG_TG_HuoChe,
                HG_SS_DongCheZu = txtHG_SS_DongCheZu,
                HG_SS_JiChe = txtHG_SS_JiChe,
                HG_SS_CheLiang = txtHG_SS_CheLiang,
                HG_SS_QiTa = txtHG_SS_QiTa,
                HG_ZhiJieSunShi = txtHG_ZhiJieSunShi,
                HG_XZ_JiDongChe = txtHG_XZ_JiDongChe,
                HG_XZ_FeiJiDongChe = txtHG_XZ_FeiJiDongChe,
                HG_XZ_XingRen = txtHG_XZ_XingRen,
                HG_XZ_DaoKouQingKuang = txtHG_XZ_DaoKouQingKuang,
                HG_XZ_GongTieBingXing = txtHG_XZ_GongTieBingXing,
                HG_XZ_FangHuZhaLan = txtHG_XZ_FangHuZhaLan,
                HG_XZ_GongTieLiJiao = txtHG_XZ_GongTieLiJiao,
                HG_XZ_SuDuQuDuan = txtHG_XZ_SuDuQuDuan,
                HG_XZ_QuXianBanJing = txtHG_XZ_QuXianBanJing,
                HG_XZ_PoDu = txtHG_XZ_PoDu,
                HG_SW_XingMing = txtHG_SW_XingMing,
                HG_SW_DanWei = txtHG_SW_DanWei,
                HG_SW_XingBie = txtHG_SW_XingBie,
                HG_SW_NianLing = txtHG_SW_NianLing,
                HG_SW_MinZu = txtHG_SW_MinZu,
                HG_SW_GongZhong = txtHG_SW_GongZhong,
                HG_SW_ShangHaiChengDu = txtHG_SW_ShangHaiChengDu,
                HG_SW_RenYuanShuXing = txtHG_SW_RenYuanShuXing,
                HG_SiW_LuNei = txtHG_SiW_LuNei,
                HG_SiW_LuWai = txtHG_SiW_LuWai,
                HG_ZS_LuNei = txtHG_ZS_LuNei,
                HG_ZS_LuWai = txtHG_ZS_LuWai,
                HG_QS_LuNei = txtHG_QS_LuNei,
                HG_QS_LuWai = txtHG_QS_LuWai,
                HG_ShiGuGaiKuang = txtHG_ShiGuGaiKuang,
            };
            #endregion

            LogType = SysLogType.新增.ToString();
        }
        sgHgItem = SgHgBll.Save(sgHgItem);

        LogDesc = string.Format("事故后果信息 {0}", CompareEntityProperties(oldSgHgItem, sgHgItem, true));
        WriteSystemLog();
        #endregion

        #region 事故责任
        shiguzereninfo sgZrItem = null;
        shiguzereninfo oldSgZrItem = null;
        if (sgzereninfoid.Length > 0 && sgzereninfoid != "0")
            sgZrItem = SgZrBll.Get(Convert.ToInt32(sgzereninfoid));
        if (sgZrItem != null)
        {
            oldSgZrItem = SgZrBll.Clone(sgZrItem);

            #region 事故责任修改
            sgZrItem.ZR_ZeRenDanWei = txtZR_ZeRenDanWei;
            sgZrItem.ZR_ZeRenDanWeiShuXing = txtZR_ZeRenDanWeiShuXing;
            sgZrItem.ZR_ZeRenBuMen = txtZR_ZeRenBuMen;
            sgZrItem.ZR_ZeRenChengDu = txtZR_ZeRenChengDu;
            sgZrItem.ZR_YuanYinLeiBie = txtZR_YuanYinLeiBie;
            sgZrItem.ZR_ShiGuLeiBie = txtZR_ShiGuLeiBie;
            sgZrItem.ZR_ShiGuDengJi = txtZR_ShiGuDengJi;
            sgZrItem.ZR_ZhiBanJianCha = txtZR_ZhiBanJianCha;
            sgZrItem.ZR_TianBaoShiJian = dtbZR_TianBaoShiJian.Length > 0 ? Convert.ToDateTime(dtbZR_TianBaoShiJian) : dtNow;
            sgZrItem.ZR_BaoGaoCiShu = txtZR_BaoGaoCiShu;
            //sgZrItem.ZR_ShiGuDiaoChaBaoGao = txtZR_ShiGuDiaoChaBaoGao;
            //sgZrItem.ZR_XianChangDianChaZiLiao = txtZR_XianChangDianChaZiLiao;
            //sgZrItem.ZR_SunShiJiSuanZiLiao = txtZR_SunShiJiSuanZiLiao;
            //sgZrItem.ZR_ShiGuRenDingShu = txtZR_ShiGuRenDingShu;
            //sgZrItem.ZR_AnJianBaoEr = txtZR_AnJianBaoEr;
            //sgZrItem.ZR_QiTa = txtZR_QiTa;
            //sgZrItem.ZR_TePaiBanDiaoChaBaoGao = txtZR_TePaiBanDiaoChaBaoGao;
            //sgZrItem.ZR_SheDuDiaoChaBaoGao = txtZR_SheDuDiaoChaBaoGao;
            #endregion

            LogType = SysLogType.修改.ToString();
        }
        else
        {
            #region 事故责任新增
            sgZrItem = new shiguzereninfo
            {
                JB_ID = Convert.ToInt32(sgbaseinfoid),
                ZR_ZeRenDanWei = txtZR_ZeRenDanWei,
                ZR_ZeRenDanWeiShuXing = txtZR_ZeRenDanWeiShuXing,
                ZR_ZeRenBuMen = txtZR_ZeRenBuMen,
                ZR_ZeRenChengDu = txtZR_ZeRenChengDu,
                ZR_YuanYinLeiBie = txtZR_YuanYinLeiBie,
                ZR_ShiGuLeiBie = txtZR_ShiGuLeiBie,
                ZR_ShiGuDengJi = txtZR_ShiGuDengJi,
                ZR_ZhiBanJianCha = txtZR_ZhiBanJianCha,
                ZR_TianBaoShiJian = dtbZR_TianBaoShiJian.Length > 0 ? Convert.ToDateTime(dtbZR_TianBaoShiJian) : dtNow,
                ZR_BaoGaoCiShu = txtZR_BaoGaoCiShu,
                ZR_ShiGuDiaoChaBaoGao = string.Empty,
                ZR_XianChangDianChaZiLiao = string.Empty,
                ZR_SunShiJiSuanZiLiao = string.Empty,
                ZR_ShiGuRenDingShu = string.Empty,
                ZR_AnJianBaoEr = string.Empty,
                ZR_QiTa = string.Empty,
                ZR_TePaiBanDiaoChaBaoGao = string.Empty,
                ZR_SheDuDiaoChaBaoGao = string.Empty,
            };
            #endregion

            LogType = SysLogType.新增.ToString();
        }
        sgZrItem = SgZrBll.Save(sgZrItem);

        LogDesc = string.Format("事故责任信息 {0}", CompareEntityProperties(oldSgZrItem, sgZrItem, true));
        WriteSystemLog();
        #endregion

        v_shigu returnShiGu = VSgBll.GetByFilter(new List<Filter> { new Filter { Name = "JB_ID", Op = FilterOp.Equals, Value = Convert.ToInt32(sgbaseinfoid) } }).First();

        DataContractJsonSerializer json = new DataContractJsonSerializer(returnShiGu.GetType());
        json.WriteObject(Response.OutputStream, returnShiGu);
        Response.End();
    }
}