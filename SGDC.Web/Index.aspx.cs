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

public partial class Index : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["method"] != null)
        {
            string method = Request["method"];
            switch (method)
            {
                case "GetDropDownSourceByType":
                    GetDropDownSourceByType();
                    break;
            }
        }

        if (!IsPostBack)
            SetAllDataDictionary();
    }

    private void GetDropDownSourceByType()
    {
        string ddtype = Request["ddtype"];

        List<DataDictionary> listDocType = AllDataDictionary.Where(d => d.DicType == ddtype).ToList();

        listDocType.Insert(0, new DataDictionary { DicValue = "　" });
        DataContractJsonSerializer json = new DataContractJsonSerializer(listDocType.GetType());
        json.WriteObject(Response.OutputStream, listDocType);
        Response.End();
    }



    public void logout()
    {

    }
}