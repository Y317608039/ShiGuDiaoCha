using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using SGDC.Utility;

public partial class views_MessageConfig : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["method"] != null)
        {
            string method = Request["method"];
            switch (method)
            {
                case "SaveInfo":
                    SaveInfo();
                    break;
                case "GetInfo":
                    GetInfo();
                    break;
            }
        }
    }


    private void GetInfo()
    {
        //读取程序集的配置文件
        //Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
        //获取appSettings节点
        //AppSettingsSection appSettings = (AppSettingsSection)config.GetSection("appSettings"); 

        var uid = ConfigurationManager.AppSettings["uid"];
        var pwd = ConfigurationManager.AppSettings["pwd"];
        var url = ConfigurationManager.AppSettings["url"];

        ReturnJosn obj = new ReturnJosn() { Uid = uid, Pwd = pwd, Url = url };

        DataContractJsonSerializer json = new DataContractJsonSerializer(obj.GetType());
        json.WriteObject(Response.OutputStream, obj);
        Response.End();
    }

    private void SaveInfo()
    {
        string uid = Convert.ToString(Request["uid"]);
        string pwd = Convert.ToString(Request["pwd"]);
        string url = Convert.ToString(Request["url"]);
        ChangeConfiguration(uid, pwd, url);
    }

    private void ChangeConfiguration(string uid, string pwd, string url)
    {

        //读取程序集的配置文件
        Configuration config = WebConfigurationManager.OpenWebConfiguration("~/web.config");
        //获取appSettings节点
        AppSettingsSection appSettings = (AppSettingsSection)config.GetSection("appSettings");

        //删除name，然后添加新值
        appSettings.Settings.Remove("uid");
        appSettings.Settings.Add("uid", uid);

        appSettings.Settings.Remove("pwd");
        appSettings.Settings.Add("pwd", pwd);

        appSettings.Settings.Remove("url");
        appSettings.Settings.Add("url", url);

        appSettings.Settings.Remove("pwd_md5");
        appSettings.Settings.Add("pwd_md5", Encrypt_MD5.MD5ForPHP(pwd + uid));

        //保存配置文件
        config.Save();
    }

    public class ReturnJosn
    {
        public string Uid { get; set; }
        public string Pwd { get; set; }
        public string Url { get; set; }
    }
}