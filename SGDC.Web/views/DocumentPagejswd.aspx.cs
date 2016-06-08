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

public partial class DocumentPagejswd : BasePage
{
    /// <summary>
    /// 全局连接对象
    /// </summary>
    documentinfo_Bll DocBll;
    protected void Page_Load(object sender, EventArgs e)
    {
        DocBll = new documentinfo_Bll();
        if (Request["method"] != null)
        {
            string method = Request["method"];
            switch (method)
            {
                case "SaveItem":
                    SaveDocItem();
                    break;
                case "DelItem":
                    DeletedocItem();
                    break;
                case "QryList":
                    GetdocListInfo();
                    break;
                //case "GetDocType":
                //    GetDocType();
                //    break;
            }
        }
    }

    private void GetdocListInfo()
    {
        int page = Convert.ToInt32(Request["page"]) - 1;
        int rows = Convert.ToInt32(Request["rows"]);

        string doctype = "技术文档";//Request["doctype"] ?? "　";
        string dochead = Request["dochead"] ?? "";
        string docdesc = Request["docdesc"] ?? "";
        dochead = dochead.Trim();
        doctype = doctype.Trim();
        docdesc = docdesc.Trim();

        List<Filter> filters = new List<Filter>();
        if (doctype.Length > 0) filters.Add(new Filter { Name = "D_Type", Op = FilterOp.Equals, Value = doctype });
        if (dochead.Length > 0) filters.Add(new Filter { Name = "D_Head", Op = FilterOp.Contains, Value = dochead });
        if (docdesc.Length > 0) filters.Add(new Filter { Name = "D_Content", Op = FilterOp.Contains, Value = docdesc });

        ReturnData<documentinfo> rd_datadic = DocBll.GetPaged(page, rows, filters, "", true);

        DataContractJsonSerializer json = new DataContractJsonSerializer(rd_datadic.GetType());
        json.WriteObject(Response.OutputStream, rd_datadic);
        Response.End();
    }

    private void DeletedocItem()
    {
        string docid = Request["docidjswd"];
        if (docid.Length > 0)
        {
            documentinfo obj = DocBll.Get(Convert.ToInt32(docid));//用于记录删除日志

            DocBll.Remove(Convert.ToInt32(docid));

            LogType = SysLogType.删除.ToString();
            LogDesc = string.Format("文档 {0}", CompareEntityProperties(null, obj, false));
            WriteSystemLog();

            SetAllDataDictionary();

            DataContractJsonSerializer json = new DataContractJsonSerializer("Removed".GetType());
            json.WriteObject(Response.OutputStream, "Removed");
            Response.End();

        }
    }

    private void SaveDocItem()
    {
        string docid = Request["docid"];
        string doctype = "技术文档";//Request["doctype"];
        string dochead = Request["dochead"];
        string docsubhead = Request["docsubhead"];
        string docdesc = Request["docdesc"]; 

        documentinfo item = null;
        documentinfo oldItem = null;
        DateTime dtNow = DateTime.Now;
        if (docid.Length > 0)
            item = DocBll.Get(Convert.ToInt32(docid));
        if (item != null)
        {
            oldItem = DocBll.Clone(item);

            #region 修改
            item.D_Type = doctype;
            item.D_Head = dochead;
            item.D_Subhead = docsubhead;
            item.D_Content = docdesc; 
            item.D_UpdateTime = dtNow;
            #endregion

            LogType = SysLogType.修改.ToString();
        }
        else
        {
            #region 新增
            item = new documentinfo
            {
                D_Type = doctype,
                D_Head = dochead,
                D_Subhead = docsubhead,
                D_Content = docdesc, 
                D_CreateTime = dtNow,
                D_UpdateTime = dtNow
            };
            #endregion

            LogType = SysLogType.新增.ToString();
        }
        item = DocBll.Save(item);

        LogDesc = string.Format("文档 {0}", CompareEntityProperties(oldItem, item, true));
        WriteSystemLog();

        DataContractJsonSerializer json = new DataContractJsonSerializer(item.GetType());
        json.WriteObject(Response.OutputStream, item);
        Response.End();
    } 
}