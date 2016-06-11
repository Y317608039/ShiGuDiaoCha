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

public partial class views_AccidentSpecialPage : BasePage
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
                case "QryList":
                    GetSgJbListInfo();
                    break;
                case "SaveFile":
                    UpLoadFiles();
                    break;
                case "SaveUploadFileInfo":
                    SaveUploadFileInfo();
                    break;
                case "ShowUploadFileInfo":
                    ShowUploadFileInfo();
                    break;
            }
        }
    }

    private void ShowUploadFileInfo()
    {
        string sgztbaseid = Request["sgztbaseid"];
        if (sgztbaseid.Length > 0)
        {
            List<shiguzhuantiinfo> listZt = new shiguzhuantiinfo_Bll().GetByFilter(new List<Filter> { new Filter() { Name = "JB_ID", Op = FilterOp.Equals, Value = Convert.ToInt32(sgztbaseid) } });
            DataContractJsonSerializer json = new DataContractJsonSerializer(listZt.GetType());
            json.WriteObject(Response.OutputStream, listZt);
            Response.End();
        }
    }
    private void SaveUploadFileInfo()
    {
        string sgztbaseid = Request["sgztbaseid"];
        string zttype = Request["zttype"];
        string filename = Request["filename"];
        string filedesc = Request["filedesc"];

        if (sgztbaseid.Length > 0)
        {
            shiguzhuantiinfo objSgZt = new shiguzhuantiinfo
            {
                JB_ID = Convert.ToInt32(sgztbaseid),
                ZT_Type = zttype,
                ZT_FilePath = filename,
                ZT_Desc = filedesc,
                ZT_CreateUserID = SysUser.User_ID,
                ZT_CreateUser = SysUser.User_Name,
                ZT_CreateTime = DateTime.Now
            };
            objSgZt = new shiguzhuantiinfo_Bll().Add(objSgZt);

            DataContractJsonSerializer json = new DataContractJsonSerializer(objSgZt.GetType());
            json.WriteObject(Response.OutputStream, objSgZt);
            Response.End();
        }
    }

    private void UpLoadFiles()
    {
        HttpPostedFile file = Request.Files["fileZtFile"];
        string sgztbaseid = Request.Params["sgztbaseid"];
        if (file != null && file.ContentLength > 0)
        {
            //获取上传文件的名称  
            string s = file.FileName;
            //截取获得上传文件的名称(ie上传会把绝对路径也连带上，这里只得到文件的名称)  
            int intIndex = s.LastIndexOf('.');
            string fileName = s.Substring(0, intIndex);
            string fileType = s.Substring(intIndex);
            string strFileName = string.Format("{0}_{1}{2}", fileName, DateTime.Now.ToString("yyyyMMddhhmmssms"), fileType);
            string strDir = "~/dmtfile/" + sgztbaseid;
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

    private void GetSgJbListInfo()
    {
        int page = Convert.ToInt32(Request["page"]) - 1;
        int rows = Convert.ToInt32(Request["rows"]);

        string search_txtSgZt_JB_DD_Ju = Request["search_txtSgZt_JB_DD_Ju"] ?? "";
        string search_txtSgZt_JB_DD_Xian = Request["search_txtSgZt_JB_DD_Xian"] ?? "";
        string search_txtSgZt_JB_LC_CheCi = Request["search_txtSgZt_JB_LC_CheCi"] ?? "";
        search_txtSgZt_JB_DD_Ju = search_txtSgZt_JB_DD_Ju.Trim();
        search_txtSgZt_JB_DD_Xian = search_txtSgZt_JB_DD_Xian.Trim();
        search_txtSgZt_JB_LC_CheCi = search_txtSgZt_JB_LC_CheCi.Trim();

        List<Filter> filters = new List<Filter>();
        if (search_txtSgZt_JB_DD_Ju.Length > 0) filters.Add(new Filter { Name = "JB_DD_Ju", Op = FilterOp.Contains, Value = search_txtSgZt_JB_DD_Ju });
        if (search_txtSgZt_JB_DD_Xian.Length > 0) filters.Add(new Filter { Name = "JB_DD_Xian", Op = FilterOp.Contains, Value = search_txtSgZt_JB_DD_Xian });
        if (search_txtSgZt_JB_LC_CheCi.Length > 0) filters.Add(new Filter { Name = "JB_LC_CheCi", Op = FilterOp.Contains, Value = search_txtSgZt_JB_LC_CheCi });

        ReturnData<shigujibeninfo> rd_datadic = SgJbBll.GetPaged(page, rows, filters, "", true);

        DataContractJsonSerializer json = new DataContractJsonSerializer(rd_datadic.GetType());
        json.WriteObject(Response.OutputStream, rd_datadic);
        Response.End();
    }

}