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
                case "ChangePwd":
                    ChangePwd();
                    break;
            }
        }

        if (!IsPostBack)
            SetAllDataDictionary();
    }

    private void ChangePwd()
    {
        string oldPwd = Request["oldPwd"]; string newPwd = Request["newPwd"]; string newPwd1 = Request["newPwd1"];
        userinfo objU = (userinfo)SysUser.Clone();
        if (Encrypt_MD5.Encrypt(oldPwd) == SysUser.User_Pwd)
        {
            objU.User_Pwd = Encrypt_MD5.Encrypt(newPwd);
            (new userinfo_Bll()).Modify(objU);
            SysUser = objU;
        }
        else
        {
            objU.User_No = "";
        }

        DataContractJsonSerializer json = new DataContractJsonSerializer(objU.GetType());
        json.WriteObject(Response.OutputStream, objU);
        Response.End();
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

}