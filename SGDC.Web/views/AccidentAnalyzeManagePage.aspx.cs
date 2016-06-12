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

public partial class views_AccidentAnalyzeManagePage : BasePage
{
    /// <summary>
    /// 全局连接对象
    /// </summary>
    v_shigu_Bll VSgBll;
    shiguhouguoinfo_Bll SgHgBll;
    shiguzereninfo_Bll SgFxBll;

    protected void Page_Load(object sender, EventArgs e)
    {
        VSgBll = new v_shigu_Bll();
        SgHgBll = new shiguhouguoinfo_Bll();
        SgFxBll = new shiguzereninfo_Bll();

        if (Request["method"] != null)
        {
            string method = Request["method"];
            switch (method)
            { 
                case "QryList":
                    GetSgFxListInfo();
                    break;
                 
            }
        }
    }

    private void GetSgFxListInfo()
    {
        int page = Convert.ToInt32(Request["page"]) - 1;
        int rows = Convert.ToInt32(Request["rows"]);

        string search_txtFx_JB_DD_Ju = Request["search_txtFx_JB_DD_Ju"] ?? "";
        string search_txtFx_JB_DD_Xian = Request["search_txtFx_JB_DD_Xian"] ?? "";
        string search_txtFx_JB_LC_CheCi = Request["search_txtFx_JB_LC_CheCi"] ?? "";
        search_txtFx_JB_DD_Ju = search_txtFx_JB_DD_Ju.Trim();
        search_txtFx_JB_DD_Xian = search_txtFx_JB_DD_Xian.Trim();
        search_txtFx_JB_LC_CheCi = search_txtFx_JB_LC_CheCi.Trim();

        List<Filter> filters = new List<Filter>();
        if (search_txtFx_JB_DD_Ju.Length > 0) filters.Add(new Filter { Name = "JB_DD_Ju", Op = FilterOp.Contains, Value = search_txtFx_JB_DD_Ju });
        if (search_txtFx_JB_DD_Xian.Length > 0) filters.Add(new Filter { Name = "JB_DD_Xian", Op = FilterOp.Contains, Value = search_txtFx_JB_DD_Xian });
        if (search_txtFx_JB_LC_CheCi.Length > 0) filters.Add(new Filter { Name = "JB_LC_CheCi", Op = FilterOp.Contains, Value = search_txtFx_JB_LC_CheCi });

        ReturnData<v_shigu> rd_datadic = VSgBll.GetPaged(page, rows, filters, "", true);

        DataContractJsonSerializer json = new DataContractJsonSerializer(rd_datadic.GetType());
        json.WriteObject(Response.OutputStream, rd_datadic);
        Response.End();
    }
}