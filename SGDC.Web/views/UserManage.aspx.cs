using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGDC.Bll;
using SGDC.Model;
using SGDC.Utility;

public partial class views_UserManage : BasePage
{
    /// 全局连接对象
    /// </summary>
    userinfo_Bll UserBll;
    protected void Page_Load(object sender, EventArgs e)
    {
        UserBll = new userinfo_Bll();
        if (Request["method"] != null)
        {
            string method = Request["method"];
            switch (method)
            {
                case "SaveItem":
                    SaveUserItem();
                    break;
                case "DelItem":
                    DeleteUserItem();
                    break;
                case "QryList":
                    GetUserListInfo();
                    break;
                case "ResetPwd":
                    ResetPwd();
                    break;
            }
        }
    }

    private void ResetPwd()
    {
        string userid = Request["userid"]; userid = userid.Trim();

        userinfo item = null; 
        if (userid.Length > 0)
            item = UserBll.Get(Convert.ToInt32(userid));
        if (item != null)
        {
            item.User_Pwd = Encrypt_MD5.Encrypt("123456");

            LogType = SysLogType.修改.ToString();
        }

        item = UserBll.Save(item);

        LogDesc = string.Format("用户管理 {0}", string.Format("重置用户 {0} 密码.", item.User_ID));
        WriteSystemLog();

        DataContractJsonSerializer json = new DataContractJsonSerializer(item.GetType());
        json.WriteObject(Response.OutputStream, item);
        Response.End();
    }

    private void DeleteUserItem()
    {
        string userid = Request["userid"];
        if (userid.Length > 0)
        {
            userinfo obj = UserBll.Get(Convert.ToInt32(userid));//用于记录删除日志

            UserBll.Remove(Convert.ToInt32(userid));

            LogType = SysLogType.删除.ToString();
            LogDesc = string.Format("系统参数 {0}", CompareEntityProperties(null, obj, false));
            WriteSystemLog();

            DataContractJsonSerializer json = new DataContractJsonSerializer("Removed".GetType());
            json.WriteObject(Response.OutputStream, "Removed");
            Response.End();

        }
    }

    private void SaveUserItem()
    {
        string userid = Request["userid"]; userid = userid.Trim();
        string username = Request["username"]; username = username.Trim();
        string userno = Request["userno"]; userno = userno.Trim();
        string userphone = Request["userphone"]; userphone = userphone.Trim();
        string userunit = Request["userunit"]; userunit = userunit.Trim();
        string userdepartment = Request["userdepartment"]; userdepartment = userdepartment.Trim();
        string usergrade = Request["usergrade"]; usergrade = usergrade.Trim();
        string userjsbj = Request["userjsbj"]; userjsbj = userjsbj.Trim();

        userinfo item = null;
        userinfo oldItem = null;
        DateTime dtNow = DateTime.Now;
        if (userid.Length > 0)
            item = UserBll.Get(Convert.ToInt32(userid));
        if (item != null)
        {
            oldItem = UserBll.Clone(item);

            #region 修改
            item.User_No = userno;
            item.User_Name = username;
            item.User_Phone = userphone;
            item.User_Uint = userunit;
            item.User_Department = userdepartment;
            item.User_Role = usergrade;
            item.User_Ext1 = userjsbj;
            #endregion

            LogType = SysLogType.修改.ToString();
        }
        else
        {
            #region 新增
            item = new userinfo
            {
                User_No = userno,
                User_Name = username,
                User_Phone = userphone,
                User_Uint = userunit,
                User_Department = userdepartment,
                User_Role = usergrade,
                User_Pwd = Encrypt_MD5.Encrypt("123456"),
                User_RoleID = 1,
                User_Status = "",
                User_Ext1 = userjsbj,
                User_CreateTime = dtNow
            };
            #endregion

            LogType = SysLogType.新增.ToString();
        }
        item = UserBll.Save(item);

        LogDesc = string.Format("用户管理 {0}", CompareEntityProperties(oldItem, item, true));
        WriteSystemLog();

        DataContractJsonSerializer json = new DataContractJsonSerializer(item.GetType());
        json.WriteObject(Response.OutputStream, item);
        Response.End();
    }

    private void GetUserListInfo()
    {
        int page = Convert.ToInt32(Request["page"]) - 1;
        int rows = Convert.ToInt32(Request["rows"]);

        string username = Request["username"] ?? "";
        string userunit = Request["userunit"] ?? "　";
        string userdpm = Request["userdpm"] ?? "　";
        string usergrade = Request["usergrade"] ?? "　";
        username = username.Trim();
        userunit = userunit.Trim();
        userdpm = userdpm.Trim();
        usergrade = usergrade.Trim();

        List<Filter> filters = new List<Filter>();
        if (username.Length > 0) filters.Add(new Filter { Name = "User_Name", Op = FilterOp.Contains, Value = username });
        if (userunit.Length > 0) filters.Add(new Filter { Name = "User_Uint", Op = FilterOp.Equals, Value = userunit });
        if (userdpm.Length > 0) filters.Add(new Filter { Name = "User_Department", Op = FilterOp.Equals, Value = userdpm });
        if (usergrade.Length > 0) filters.Add(new Filter { Name = "User_Role", Op = FilterOp.Equals, Value = usergrade });

        ReturnData<userinfo> rd_datadic = UserBll.GetPaged(page, rows, filters, "", true);

        DataContractJsonSerializer json = new DataContractJsonSerializer(rd_datadic.GetType());
        json.WriteObject(Response.OutputStream, rd_datadic);
        Response.End();
    }
}