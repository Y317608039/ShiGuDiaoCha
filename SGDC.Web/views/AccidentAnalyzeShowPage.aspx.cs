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

public partial class views_AccidentAnalyzeShowPage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["method"] != null)
        {
            string method = Request["method"];
            switch (method)
            {
                case "GetSgInfo":
                    GetSgInfo();
                    break;
            }
        }
    }

    private void GetSgInfo()
    {
        string sgjbid = Request["sgjbid"];
        v_shigu objSg = new v_shigu_Bll().GetByFilter(new List<Filter> { new Filter { Name = "JB_ID", Op = FilterOp.Equals, Value = Convert.ToInt32(sgjbid) } }).First();

        DataContractJsonSerializer json = new DataContractJsonSerializer(objSg.GetType());
        json.WriteObject(Response.OutputStream, objSg);
        Response.End();
    }
}