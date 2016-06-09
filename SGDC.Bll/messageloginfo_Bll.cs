using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SGDC.Dao.Svc;
using SGDC.Model;
using SGDC.Utility;

namespace SGDC.Bll
{
    public class messageloginfo_Bll
    {
        #region Clone
        public messageloginfo Clone(messageloginfo obj)
        {
            return (messageloginfo)obj.Clone();
        }
        #endregion

        #region Save
        public messageloginfo Save(messageloginfo obj)
        {
            if (obj.ML_ID <= 0) return Add(obj);
            try { Modify(obj); return obj; }
            catch (Exception) { return null; }
        }
        #endregion

        #region Add
        /// <summary> 新增对象，完成后返回新增的对象 </summary>
        /// <param name="item">要新增的对象</param>
        /// <returns>新增的对象</returns>
        public messageloginfo Add(messageloginfo item)
        {
            return new messageloginfo_Dao().Add(item);
        }

        /// <summary> 新增对象，完成后返回保存的记录条数 </summary>
        /// <param name="item">要新增的对象</param>
        /// <returns>保存的记录条数</returns>
        public int Add2(messageloginfo item)
        {
            return new messageloginfo_Dao().Add2(item);
        }

        /// <summary> 批量新增，完成后返回保存的记录条数 </summary>
        /// <param name="items">要新增的对象List</param>
        /// <returns>保存的记录条数</returns>
        public int BatchAdd(List<messageloginfo> items)
        {
            return new messageloginfo_Dao().BatchAdd(items);
        }
        #endregion

        #region Remove & Modify
        /// <summary> 删除对象 </summary>
        /// <param name="keyValues">对象的主键值</param>
        public void Remove(params object[] keyValues)
        {
            new messageloginfo_Dao().Remove(keyValues);
        }

        /// <summary> 删除对象 </summary>
        /// <param name="item">要删除的对象</param>
        public void Remove(messageloginfo item)
        {
            new messageloginfo_Dao().Remove(item);
        }

        /// <summary> 更新对象 </summary>
        /// <param name="item">要更新的对象</param>
        public void Modify(messageloginfo item)
        {
            new messageloginfo_Dao().Modify(item);
        }
        #endregion

        #region Get
        /// <summary> 获取对象 </summary>
        /// <param name="keyValues">主键值</param>
        /// <returns></returns>
        public messageloginfo Get(params object[] keyValues)
        {
            return new messageloginfo_Dao().Get(keyValues);
        }

        /// <summary> 获取所有数据 </summary>
        /// <returns>对象List</returns>
        public List<messageloginfo> GetAll()
        {
            return new messageloginfo_Dao().GetAll();
        }

        /// <summary> 获取所有数据 </summary>
        /// <param name="orderByField">排序字段</param>
        /// <param name="ascending">是否升序，true为升序，false为降序</param>
        /// <returns>对象List</returns>
        public List<messageloginfo> GetAll(string orderByField, bool ascending)
        {
            return new messageloginfo_Dao().GetByFilter(null, orderByField, ascending);
        }

        /// <summary> 获取所有数据 </summary>
        /// <param name="orderByFields">排序字段(可多个)</param>
        /// <returns>对象List</returns>
        public List<messageloginfo> GetAll(List<SortField> orderByFields)
        {
            return new messageloginfo_Dao().GetByFilter(null, orderByFields);
        }


        /// <summary> 获取符合过滤条件的记录 </summary>
        /// <param name="filters">过滤条件List，多个条件之间为And关系</param>
        /// <returns>对象List</returns>
        public List<messageloginfo> GetByFilter(List<Filter> filters)
        {
            return new messageloginfo_Dao().GetByFilter(filters);
        }

        /// <summary> 获取符合过滤条件的记录 </summary>
        /// <param name="filters">过滤条件List，多个条件之间为And关系</param>
        /// <param name="orderByField">排序字段</param>
        /// <param name="ascending">是否升序，true为升序，false为降序</param>
        /// <returns>对象List</returns>
        public List<messageloginfo> GetByFilter(List<Filter> filters, string orderByField, bool ascending)
        {
            return new messageloginfo_Dao().GetByFilter(filters, orderByField, ascending);
        }

        /// <summary> 获取符合过滤条件的记录 </summary>
        /// <param name="filters">过滤条件List，多个条件之间为And关系</param>
        /// <param name="orderByFields">排序字段(可多个)</param>
        /// <returns>对象List</returns>
        public List<messageloginfo> GetByFilter(List<Filter> filters, List<SortField> orderByFields)
        {
            return new messageloginfo_Dao().GetByFilter(filters, orderByFields);
        }

        /// <summary> 获取分页数据 </summary>
        /// <param name="pageIndex">页码（从0开始）</param>
        /// <param name="pageSize">每页记录数</param>
        /// <param name="filters">过滤条件List，多个条件之间为And关系</param>
        /// <param name="orderByField">排序字段</param>
        /// <param name="ascending">是否升序，true为升序，false为降序</param>
        /// <returns>ReturnData对象，其中Data为数据List，TotalCount为总记录数</returns>
        public ReturnData<messageloginfo> GetPaged(int pageIndex, int pageSize, List<Filter> filters, string orderByField, bool ascending)
        {
            return new messageloginfo_Dao().GetPaged(pageIndex, pageSize, filters, orderByField, ascending);
        }

        /// <summary> 获取分页数据 </summary>
        /// <param name="pageIndex">页码（从0开始）</param>
        /// <param name="pageSize">每页记录数</param>
        /// <param name="filters">过滤条件List，多个条件之间为And关系</param>
        /// <param name="orderByFields">排序字段(可多个)</param>
        /// <returns>ReturnData对象，其中Data为数据List，TotalCount为总记录数</returns>
        public ReturnData<messageloginfo> GetPaged(int pageIndex, int pageSize, List<Filter> filters, List<SortField> orderByFields)
        {
            return new messageloginfo_Dao().GetPaged(pageIndex, pageSize, filters, orderByFields);
        }
        #endregion
    }
}
