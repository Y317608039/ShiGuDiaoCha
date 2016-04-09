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

public partial class views_SystemParmsManage : BasePage
{
    /// <summary>
    /// 全局连接对象
    /// </summary>
    datadictionaryinfo_Bll DdBll;
    protected void Page_Load(object sender, EventArgs e)
    {
        DdBll = new datadictionaryinfo_Bll();
        if (Request["method"] != null)
        {
            string method = Request["method"];
            switch (method)
            {
                case "SaveItem":
                    SavedatadicItem();
                    break;
                case "DelItem":
                    DeletedatadicItem();
                    break;
                case "QryList":
                    GetdatadicListInfo();
                    break;
                case "GetAllDicType":
                    GetAllDicType();
                    break;
            }
        }
    }

    private void GetAllDicType()
    {
        List<DataDictionary> listDd = AllDataDictionary;
        List<DataDictionary> listAllType = new List<DataDictionary>();
        foreach (DataDictionary dd in listDd)
        {
            DataDictionary dTemp = new DataDictionary() { DicValue = dd.DicType };
            var temp = listAllType.Where(d => d.DicValue == dd.DicType);
            if (!temp.Any()) listAllType.Add(dTemp);
        }
        listAllType.Insert(0, new DataDictionary() { DicValue = "　" });
        DataContractJsonSerializer json = new DataContractJsonSerializer(listAllType.GetType());
        json.WriteObject(Response.OutputStream, listAllType);
        Response.End();
    }

    private void DeletedatadicItem()
    {
        string datadicid = Request["datadicid"];
        if (datadicid.Length > 0)
        {
            datadictionaryinfo obj = DdBll.Get(Convert.ToInt32(datadicid));//用于记录删除日志

            DdBll.Remove(Convert.ToInt32(datadicid));

            LogType = SysLogType.删除.ToString();
            LogDesc = string.Format("系统参数 {0}", CompareEntityProperties(null, obj, false));
            WriteSystemLog();

            SetAllDataDictionary();

            DataContractJsonSerializer json = new DataContractJsonSerializer("Removed".GetType());
            json.WriteObject(Response.OutputStream, "Removed");
            Response.End();

        }
    }

    public void SavedatadicItem()
    {
        string datadicid = Request["datadicid"];
        string datadictype = Request["datadictype"];
        string datadicname = Request["datadicname"];
        string datadicdesc = Request["datadicdesc"];
        string datadicext1 = Request["datadicext1"];
        string datadicext2 = Request["datadicext2"];
        string datadicext3 = Request["datadicext3"];

        datadictionaryinfo item = null;
        datadictionaryinfo oldItem = null;
        if (datadicid.Length > 0)
            item = DdBll.Get(Convert.ToInt32(datadicid));
        if (item != null)
        {
            oldItem = DdBll.Clone(item);

            #region 修改
            item.DD_Type = datadictype;
            item.DD_Value = datadicname;
            item.DD_Desc = datadicdesc;
            item.DD_Ext1 = datadicext1;
            item.DD_Ext2 = datadicext2;
            item.DD_Ext3 = datadicext3;
            #endregion

            LogType = SysLogType.修改.ToString();
        }
        else
        {
            #region 新增
            item = new datadictionaryinfo
            {
                DD_Type = datadictype,
                DD_Value = datadicname,
                DD_Desc = datadicdesc,
                DD_Status = "",
                DD_Ext1 = datadicext1,
                DD_Ext2 = datadicext2,
                DD_Ext3 = datadicext3
            };
            #endregion

            LogType = SysLogType.新增.ToString();
        }
        item = DdBll.Save(item);

        LogDesc = string.Format("系统参数 {0}", CompareEntityProperties(oldItem, item, true));
        WriteSystemLog();

        SetAllDataDictionary();

        DataContractJsonSerializer json = new DataContractJsonSerializer(item.GetType());
        json.WriteObject(Response.OutputStream, item);
        Response.End();
    }

    public void GetdatadicListInfo()
    {
        int page = Convert.ToInt32(Request["page"]) - 1;
        int rows = Convert.ToInt32(Request["rows"]);

        string datadictype = Request["datadictype"] ?? "　";
        string datadicname = Request["datadicname"] ?? "";
        datadicname = datadicname.Trim();
        datadictype = datadictype.Trim();

        List<Filter> filters = new List<Filter>();
        if (datadictype.Length > 0) filters.Add(new Filter { Name = "DD_Type", Op = FilterOp.Contains, Value = datadictype });
        if (datadicname.Length > 0) filters.Add(new Filter { Name = "DD_Value", Op = FilterOp.Contains, Value = datadicname });

        ReturnData<datadictionaryinfo> rd_datadic = DdBll.GetPaged(page, rows, filters, "", true);

        DataContractJsonSerializer json = new DataContractJsonSerializer(rd_datadic.GetType());
        json.WriteObject(Response.OutputStream, rd_datadic);
        Response.End();
    }
}