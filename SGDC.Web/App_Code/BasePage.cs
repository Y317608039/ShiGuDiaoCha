using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using SGDC.Bll;
using SGDC.Model;

/// <summary>
/// BasePage 的摘要说明
/// </summary>
public class BasePage : Page
{
    private string SessionKey = "SessionKeys_UserInfo";

    #region 登录用户
    private userinfo user = null;
    protected override void OnPreInit(EventArgs e)
    {

        if (Session[SessionKey] == null) Session[SessionKey] = (new userinfo_Bll()).Get(1);
        //Response.Redirect(Request.ApplicationPath.TrimEnd('/') + "/Login.aspx", true);

        base.OnPreInit(e);
    }

    //保存登陆用户信息
    public userinfo SysUser
    {
        get { return user ?? (user = (userinfo)Session[SessionKey]); }
        set
        {
            user = value;
            Session[SessionKey] = user;
        }
    }
    #endregion

    #region 系统日志

    public enum SysLogType
    {
        新增 = 0,
        修改 = 1,
        删除 = 2
    }

    /// <summary> 日志类型 </summary>
    public string LogType { get; set; }
    /// <summary> 日志内容 </summary>
    public string LogDesc { get; set; }
    /// <summary> 添加系统日志 </summary> 
    protected void WriteSystemLog()
    {
        if (SysUser != null)
        {
            systemloginfo_Bll SLBll = new systemloginfo_Bll();
            SLBll.Add(new systemloginfo()
            {
                SL_UserID = SysUser.User_ID,
                SL_UserName = SysUser.User_Name,
                SL_Type = LogType,
                SL_Desc = LogDesc,
                SL_CreateTime = DateTime.Now
            });
        }
    }
    /// <summary> 比较两个对象属性的不同之处 </summary>
    /// <typeparam name="T">任意对象类型</typeparam>
    /// <param name="oldEntity">旧对象</param>
    /// <param name="newEntity">新对象</param>
    /// <param name="blnUpdate">是否是修改</param>
    /// <returns>返回差异属性字符串</returns>
    public string CompareEntityProperties<T>(T oldEntity, T newEntity, bool blnUpdate)
    {
        string tStr = string.Empty;
        if (newEntity == null)
        {
            return tStr;
        }
        PropertyInfo[] newProperties = newEntity.GetType().GetProperties(BindingFlags.Instance | BindingFlags.Public);

        if (newProperties.Length <= 0)
        {
            return tStr;
        }
        if (oldEntity == null)
        {
            foreach (PropertyInfo item in newProperties)
            {
                string name = item.Name;
                object value = item.GetValue(newEntity, null);
                if (item.PropertyType.IsValueType || item.PropertyType.Name.StartsWith("String"))
                {
                    if (Convert.ToString(value) == "") value = "''";
                    tStr += string.Format("{0}:{1}, ", name, value);
                }
                else
                {
                    CompareEntityProperties(null, value, blnUpdate);
                }
            }
        }
        else
        {
            PropertyInfo[] oldProperties = oldEntity.GetType().GetProperties(BindingFlags.Instance | BindingFlags.Public);
            string strID = string.Empty;
            for (int i = 0; i < newProperties.Length; i++)
            {
                PropertyInfo newItem = newProperties[i];
                PropertyInfo oldItem = oldProperties[i];
                string newName = newItem.Name; object newValue = newItem.GetValue(newEntity, null);
                string oldName = oldItem.Name; object oldValue = oldItem.GetValue(oldEntity, null);
                if (newItem.PropertyType.IsValueType || newItem.PropertyType.Name.StartsWith("String"))
                {
                    if (!oldValue.Equals(newValue))
                    {
                        if (Convert.ToString(oldValue) == "") oldValue = "''";
                        if (Convert.ToString(newValue) == "") newValue = "''";
                        tStr += string.Format("{0}:{1} -> {2}, ", newName, oldValue, newValue);
                    }
                }
                else
                {
                    CompareEntityProperties(null, newValue, blnUpdate);
                }
                if (i == 0)
                {
                    strID = string.Format("{0}:{1}, ", oldName, oldValue);
                }
            }
            if (blnUpdate) tStr = strID + tStr;
        }

        return tStr.Trim().TrimEnd(',');
    }

    #endregion

    #region 数据字典
    /// <summary> 自定义数据字典类 </summary>
    public class DataDictionary
    {
        /// <summary> 类型 </summary>
        public string DicType { get; set; }
        /// <summary> 项目值 </summary>
        public string DicValue { get; set; }
        /// <summary> 项目描述 </summary>
        public string DicDesc { get; set; }
        /// <summary> 项目排序值 </summary>
        public string DicSort { get; set; }
    }


    private List<DataDictionary> allDataDictionary = null;
    public List<DataDictionary> AllDataDictionary
    {
        get { return allDataDictionary ?? (allDataDictionary = (List<DataDictionary>)Session["AllDataDictionary"]); }
        set
        {
            allDataDictionary = value;
            Session["AllDataDictionary"] = allDataDictionary;
        }

    }

    public void SetAllDataDictionary()
    {
        List<DataDictionary> listDd = (new datadictionaryinfo_Bll()).GetAll().Select(dd => new DataDictionary
        {
            DicType = dd.DD_Type,
            DicDesc = dd.DD_Desc,
            DicValue = dd.DD_Value,
            DicSort = dd.DD_Ext3
        }).ToList();
        Session["AllDataDictionary"] = null;
        Session["AllDataDictionary"] = listDd;
    }

    /// <summary> 根据类型获取相应数据字典数据 </summary>
    /// <param name="strType">类型</param>
    /// <param name="AddEnpty">是否添加空项</param>
    /// <returns>返回相应类型的集合</returns>
    public List<DataDictionary> GetDictionaryByType(string strType, bool AddEnpty)
    {
        List<DataDictionary> listTemp = AllDataDictionary.Where(d => d.DicType == strType).ToList();
        if (AddEnpty) listTemp.Insert(0, new DataDictionary { DicValue = "　" });
        return listTemp;
    }

    #endregion
}