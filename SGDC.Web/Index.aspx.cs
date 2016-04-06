using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGDC.Bll;
using SGDC.Model;
using SGDC.Utility;

public partial class Index : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //List<userinfo> listU = (new userinfo_Bll()).GetByFilter(new List<Filter> { new Filter { Name = "User_RoleID", Op = FilterOp.IN, Value = (new List<int> { 1, 2 }).ToArray() } });
    }

    public void logout()
    {

    }
}