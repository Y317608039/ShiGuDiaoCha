using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGDC.Bll;
using SGDC.Model;
using SGDC.Utility;

public partial class ValidUser : System.Web.UI.Page
{
    private string SessionKey = "SessionKeys_UserInfo";
    protected void Page_Load(object sender, EventArgs e)
    {
        string strErrorMsg = "";
        string strUserName = (Request["username"] ?? "").Trim();
        string strPwd = (Request["password"] ?? "").Trim();

        List<userinfo> listUser = GetUserList(strUserName, strPwd, ref strErrorMsg);
        if (strErrorMsg.Length == 0)
        {
            userinfo objUser = listUser[0];
            systemloginfo_Bll Bsv = new systemloginfo_Bll();
            Bsv.Save(new systemloginfo()
            {
                SL_UserID = objUser.User_ID,
                SL_UserName = objUser.User_Name,
                SL_Type = "登录",
                SL_Desc = string.Format("{0} 登录了系统.", objUser.User_Name),
                SL_CreateTime = DateTime.Now
            });
            Session[SessionKey] = objUser;

            Response.Write("location.href='Index.aspx'");
        }
        else
        {
            Response.Write(strErrorMsg);
        }
        Response.End();
    }

    public List<userinfo> GetUserList(string strUserName, string strPwd, ref string strErrMsg)
    {
        userinfo_Bll Bms = new userinfo_Bll();
        List<userinfo> listw = Bms.GetByFilter(new List<Filter> { new Filter { Name = "User_No", Op = FilterOp.Equals, Value = strUserName }, new Filter { Name = "User_RoleID", Op = FilterOp.Equals, Value = 0 } }).ToList();

        if (listw == null || (listw != null && listw.Count == 0))
        {
            strErrMsg = "1";
            return null;
        }
        List<userinfo> listw1 = listw.Where(w => w.User_No == strUserName && w.User_Pwd == Encrypt_MD5.Encrypt(strPwd)).ToList();
        if (listw1 == null || (listw1 != null && listw1.Count == 0))
        {
            strErrMsg = "2";
            return null;
        }
        strErrMsg = "";
        return listw1;
    }
}