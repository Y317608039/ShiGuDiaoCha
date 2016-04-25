using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGDC.Bll;
using SGDC.Model;

public partial class views_Login : System.Web.UI.Page
{
    private string SessionKey = "SessionKeys_UserInfo";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[SessionKey] != null)
        {
            userinfo objUser = (userinfo)Session[SessionKey];
            systemloginfo_Bll SLBLL = new systemloginfo_Bll();
            SLBLL.Save(new systemloginfo()
            {
                SL_UserID = objUser.User_ID,
                SL_UserName = objUser.User_Name,
                SL_Type = "退出",
                SL_Desc = string.Format("{0} 退出了系统.", objUser.User_Name),
                SL_CreateTime = DateTime.Now
            });
        }
        Session.Clear();
    }
}