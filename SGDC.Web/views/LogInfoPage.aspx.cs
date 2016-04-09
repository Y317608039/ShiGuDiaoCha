using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.Serialization.Json;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGDC.Bll;
using SGDC.Model;
using SGDC.Utility;

public partial class views_LogInfoPage : BasePage
{
    /// <summary> 全局连接对象 </summary>
    systemloginfo_Bll SLBll;

    protected void Page_Load(object sender, EventArgs e)
    {
        SLBll = new systemloginfo_Bll();
        if (Request["method"] != null)
        {
            string method = Request["method"];
            switch (method)
            {
                case "QryList":
                    GetLogListInfo();
                    break;
            }
        }
    }

    private void GetLogListInfo()
    {
        int page = Convert.ToInt32(Request["page"]) - 1;
        int rows = Convert.ToInt32(Request["rows"]);

        string search_logtype = Request["search_logtype"] ?? ""; search_logtype = search_logtype.Trim();
        string search_logbegintime = Request["search_logbegintime"] ?? ""; search_logbegintime = search_logbegintime.Trim();
        string search_logendtime = Request["search_logendtime"] ?? ""; search_logendtime = search_logendtime.Trim();
        string search_logdesc = Request["search_logdesc"] ?? "　"; search_logdesc = search_logdesc.Trim();

        DateTime dtBegin = DateTime.Now; DateTime dtEnd = DateTime.Now;

        if (search_logbegintime.Length > 0) dtBegin = Convert.ToDateTime(search_logbegintime);
        if (search_logendtime.Length > 0) dtEnd = Convert.ToDateTime(search_logendtime).AddDays(1).AddSeconds(-1);

        List<Filter> filters = new List<Filter>();
        if (search_logtype.Length > 0) filters.Add(new Filter { Name = "SL_Type", Op = FilterOp.Equals, Value = search_logtype });
        if (search_logbegintime.Length > 0) filters.Add(new Filter { Name = "SL_CreateTime", Op = FilterOp.GreaterThanOrEqual, Value = dtBegin });
        if (search_logendtime.Length > 0) filters.Add(new Filter { Name = "SL_CreateTime", Op = FilterOp.LessThanOrEqual, Value = dtEnd });
        if (search_logdesc.Length > 0) filters.Add(new Filter { Name = "SL_Desc", Op = FilterOp.Contains, Value = search_logdesc });

        ReturnData<systemloginfo> rd_log = SLBll.GetPaged(page, rows, filters, "SL_CreateTime", false);

        DataContractJsonSerializer json = new DataContractJsonSerializer(rd_log.GetType());
        json.WriteObject(Response.OutputStream, rd_log);
        Response.End();
    }

}