using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks; 
using System.Data.Entity.Validation;
using SGDC.Utility;

namespace SGDC.Dao.Svc
{
    /// <summary> 数据访问基类，实现了对象的新增、修改、删除、查询、分页查询、批量新增等操作 </summary>
    /// <typeparam name="TEntity"></typeparam>
    public class UtilityEntityDal<TEntity> where TEntity : class
    {
        #region Add
        /// <summary> 新增对象，完成后返回新增的对象 </summary>
        /// <param name="item">要新增的对象</param>
        /// <returns>新增的对象</returns>
        public virtual TEntity Add(TEntity item)
        {
            if (item != (TEntity)null)
            {
                using (var rowsContext = new SGDCEntities())
                {
                    rowsContext.Set<TEntity>().Add(item);

                    rowsContext.SaveChanges();
                }
            }

            return item;
        }

        /// <summary> 新增对象，完成后返回保存的记录条数 </summary>
        /// <param name="item">要新增的对象</param>
        /// <returns>保存的记录条数</returns>
        public virtual int Add2(TEntity item)
        {
            if (item != (TEntity)null)
            {
                using (var rowsContext = new SGDCEntities())
                {
                    rowsContext.Set<TEntity>().Add(item);

                    return rowsContext.SaveChanges();
                }
            }

            return 0;
        }

        /// <summary> 批量新增，完成后返回保存的记录条数 </summary>
        /// <param name="items">要新增的对象List</param>
        /// <returns>保存的记录条数</returns>
        public virtual int BatchAdd(List<TEntity> items)
        {
            using (var rowsContext = new SGDCEntities())
            {
                foreach (var item in items)
                {
                    rowsContext.Set<TEntity>().Add(item);
                }

                return rowsContext.SaveChanges();
            }
        }
        #endregion

        #region Remove & Modify
        /// <summary> 删除对象 </summary>
        /// <param name="keyValues">对象的主键值</param>
        public virtual void Remove(params object[] keyValues)
        {
            using (var rowsContext = new SGDCEntities())
            {
                var entity = rowsContext.Set<TEntity>().Find(keyValues);

                if (entity != null)
                {
                    rowsContext.Set<TEntity>().Remove(entity);

                    rowsContext.SaveChanges();
                }
            }
        }

        /// <summary> 删除对象 </summary>
        /// <param name="item">要删除的对象</param>
        public virtual void Remove(TEntity item)
        {
            if (item != null)
            {
                using (var rowsContext = new SGDCEntities())
                {
                    rowsContext.Entry<TEntity>(item).State = System.Data.EntityState.Deleted;

                    rowsContext.SaveChanges();
                }
            }
        }

        /// <summary> 更新对象 </summary>
        /// <param name="item">要更新的对象</param>
        public virtual void Modify(TEntity item)
        {
            if (item != (TEntity)null)
            {
                using (var rowsContext = new SGDCEntities())
                {
                    rowsContext.Entry<TEntity>(item).State = System.Data.EntityState.Modified;

                   // rowsContext.SaveChanges();
                    try
                    {
                        rowsContext.SaveChanges();
                    }
                    catch (DbEntityValidationException ex)
                    {
                        foreach (var entityValidationErrors in ex.EntityValidationErrors)
                        {
                            foreach (var validationError in entityValidationErrors.ValidationErrors)
                            {
                                String Response = "Property: " + validationError.PropertyName + " Error: " + validationError.ErrorMessage;
                                string s = "";
                            }
                        }
                    }
                }
            }
        }
        #endregion

        #region Get
        /// <summary> 获取对象 </summary>
        /// <param name="keyValues">主键值</param>
        /// <returns></returns>
        public virtual TEntity Get(params object[] keyValues)
        {
            using (var rowsContext = new SGDCEntities())
            {
                return rowsContext.Set<TEntity>().Find(keyValues);
            }
        }

        /// <summary> 获取所有数据 </summary>
        /// <returns>对象List</returns>
        public virtual List<TEntity> GetAll()
        {
            using (var rowsContext = new SGDCEntities())
            {
                return rowsContext.Set<TEntity>().ToList();
            }
        }

        /// <summary> 获取所有数据 </summary>
        /// <param name="orderByField">排序字段</param>
        /// <param name="ascending">是否升序，true为升序，false为降序</param>
        /// <returns>对象List</returns>
        public virtual List<TEntity> GetAll(string orderByField, bool ascending)
        {
            return GetByFilter(null, orderByField, ascending);
        }

        /// <summary> 获取所有数据 </summary>
        /// <param name="orderByFields">排序字段(可多个)</param>
        /// <returns>对象List</returns>
        public virtual List<TEntity> GetAll(List<SortField> orderByFields)
        {
            return GetByFilter(null, orderByFields);
        }

        /// <summary> 获取符合过滤条件的记录 </summary>
        /// <param name="filters">过滤条件List</param>
        /// <returns>对象List</returns>
        //public virtual List<TEntity> GetByFilter(List<string> filters)
        //{
        //    using (var rowsContext = new SGDCEntities())
        //    {
        //        var type = typeof(TEntity);
        //        string strSql = string.Format(" select * from {0} where 1=1", type.Name);
        //        strSql = filters.Aggregate(strSql, (current, t) => current + (" " + t));

        //        return rowsContext.rowsbase.SqlQuery<TEntity>(strSql, "").ToList<TEntity>();
        //    }
        //}

        /// <summary> 获取符合过滤条件的记录 </summary>
        /// <param name="filters">过滤条件List，多个条件之间为And关系</param>
        /// <returns>对象List</returns>
        public virtual List<TEntity> GetByFilter(List<Filter> filters)
        {
            using (var rowsContext = new SGDCEntities())
            {
                var query = rowsContext.Set<TEntity>().AsQueryable();

                var whereClauseExp = ConvertToWhereClauseExpression(filters);
                if (whereClauseExp != null)
                {
                    query = query.Where(whereClauseExp);
                }

                return query.ToList();
            }
        }

        /// <summary> 获取符合过滤条件的记录 </summary>
        /// <param name="filters">过滤条件List，多个条件之间为And关系</param>
        /// <param name="orderByField">排序字段</param>
        /// <param name="ascending">是否升序，true为升序，false为降序</param>
        /// <returns>对象List</returns>
        public virtual List<TEntity> GetByFilter(List<Filter> filters, string orderByField, bool ascending)
        {
            using (var rowsContext = new SGDCEntities())
            {
                var query = rowsContext.Set<TEntity>().AsQueryable();

                if (string.IsNullOrWhiteSpace(orderByField))
                {
                    orderByField = GetPrimaryKey(rowsContext);
                }

                query = AppendWhereClauseAndOrderByField(query, filters, orderByField, ascending);

                return query.ToList();
            }
        }

        /// <summary> 获取符合过滤条件的记录 </summary>
        /// <param name="filters">过滤条件List，多个条件之间为And关系</param>
        /// <param name="orderByFields">排序字段(可多个)</param>
        /// <returns>对象List</returns>
        public virtual List<TEntity> GetByFilter(List<Filter> filters, List<SortField> orderByFields)
        {
            using (var rowsContext = new SGDCEntities())
            {
                var query = rowsContext.Set<TEntity>().AsQueryable();

                var whereClauseExp = ConvertToWhereClauseExpression(filters);
                if (whereClauseExp != null)
                {
                    query = query.Where(whereClauseExp);
                }

                if (orderByFields != null)
                {
                    query = AppendOrderByFields(query, orderByFields);
                }

                return query.ToList();
            }
        }

        public virtual List<TEntity> GetPaged<KProperty>(int pageIndex, int pageCount, System.Linq.Expressions.Expression<Func<TEntity, KProperty>> orderByExpression, bool ascending)
        {
            using (var rowsContext = new SGDCEntities())
            {
                var set = rowsContext.Set<TEntity>();

                if (ascending)
                {
                    return set.OrderBy(orderByExpression)
                                .Skip(pageCount * pageIndex)
                                .Take(pageCount).ToList();
                }
                else
                {
                    return set.OrderByDescending(orderByExpression)
                                .Skip(pageCount * pageIndex)
                                .Take(pageCount).ToList();
                }
            }
        }

        public virtual List<TEntity> GetPaged(int pageIndex, int pageSize, Expression<Func<TEntity, bool>> condition, string orderByField, bool ascending)
        {
            using (var rowsContext = new SGDCEntities())
            {
                var type = typeof(TEntity);
                var property = type.GetProperty(orderByField);
                var parameter = Expression.Parameter(type, "p");
                var propertyAccess = Expression.MakeMemberAccess(parameter, property);
                var orderByExp = Expression.Lambda(propertyAccess, parameter);
                var query = rowsContext.Set<TEntity>().Where(condition);
                string methodName = ascending ? "OrderBy" : "OrderByDescending";
                MethodCallExpression resultExp = Expression.Call(typeof(Queryable), methodName, new Type[] { type, property.PropertyType }, query.Expression, Expression.Quote(orderByExp));
                query = query.Provider.CreateQuery<TEntity>(resultExp);

                return query.Skip(pageSize * pageIndex).Take(pageSize).ToList();
            }
        }

        /// <summary> 获取分页数据 </summary>
        /// <param name="pageIndex">页码（从0开始）</param>
        /// <param name="pageSize">每页记录数</param>
        /// <param name="filters">过滤条件List，多个条件之间为And关系</param>
        /// <param name="orderByField">排序字段</param>
        /// <param name="ascending">是否升序，true为升序，false为降序</param>
        /// <returns>ReturnData对象，其中rows为数据List，total为总记录数</returns>
        public virtual ReturnData<TEntity> GetPaged(int pageIndex, int pageSize, List<Filter> filters, string orderByField, bool ascending)
        {
            using (var rowsContext = new SGDCEntities())
            {
                var query = rowsContext.Set<TEntity>().AsQueryable();

                if (string.IsNullOrWhiteSpace(orderByField))
                {
                    orderByField = GetPrimaryKey(rowsContext);
                }

                query = AppendWhereClauseAndOrderByField(query, filters, orderByField, ascending);

                var ReturnData = new ReturnData<TEntity>();
                ReturnData.total = query.Count();
                ReturnData.rows = query.Skip(pageSize * pageIndex).Take(pageSize).ToList();

                return ReturnData;
            }
        }

        /// <summary> 获取分页数据 </summary>
        /// <param name="pageIndex">页码（从0开始）</param>
        /// <param name="pageSize">每页记录数</param>
        /// <param name="filters">过滤条件List，多个条件之间为And关系</param>
        /// <param name="orderByFields">排序字段(可多个)</param>
        /// <returns>ReturnData对象，其中rows为数据List，total为总记录数</returns>
        public virtual ReturnData<TEntity> GetPaged(int pageIndex, int pageSize, List<Filter> filters, List<SortField> orderByFields)
        {
            using (var rowsContext = new SGDCEntities())
            {
                var query = rowsContext.Set<TEntity>().AsQueryable();

                var whereClauseExp = ConvertToWhereClauseExpression(filters);
                if (whereClauseExp != null)
                {
                    query = query.Where(whereClauseExp);
                }

                if (orderByFields == null || orderByFields.Count == 0)
                {
                    var orderByField = GetPrimaryKey(rowsContext);
                    orderByFields = new List<SortField> { new SortField(orderByField, true) };
                }

                query = AppendOrderByFields(query, orderByFields);

                var ReturnData = new ReturnData<TEntity>();
                ReturnData.total = query.Count();
                ReturnData.rows = query.Skip(pageSize * pageIndex).Take(pageSize).ToList();

                return ReturnData;
            }
        }
        #endregion

        #region ExecuteSql
        /// <summary> 执行指定Sql语句
        /// 例如：repository.ExecuteSqlCommand("delete from InpInfo where InpID={0}", "Inp001")
        /// </summary>
        /// <param name="sql">Sql语句</param>
        /// <param name="parameters">要传递给命令的参数数组</param>
        /// <returns>受影响的行数</returns>
        public virtual int ExecuteSqlCommand(string sql, params object[] parameters)
        {
            using (var rowsContext = new SGDCEntities())
            {
                return rowsContext.Database.ExecuteSqlCommand(sql, parameters);
            }
        }

        /// <summary> 执行Sql查询语句
        /// 例如：repository.ExecuteSqlQuery("select * from InpInfo where InpID={0}", "Inp001")
        /// </summary>
        /// <param name="sql">Sql查询语句</param>
        /// <param name="parameters">要传递给命令的参数数组</param>
        /// <returns>对象List</returns>
        public virtual List<TEntity> ExecuteSqlQuery(string sql, params object[] parameters)
        {
            using (var rowsContext = new SGDCEntities())
            {
                return rowsContext.Database.SqlQuery<TEntity>(sql, parameters).ToList<TEntity>();
            }
        }

        /// <summary> 执行Sql查询语句
        /// 例如：repository.ExecuteSqlQuery&lt;InpInfo&gt;("select * from InpInfo where InpID={0}", "Inp001")
        /// </summary>
        /// <typeparam name="TElement">类型参数</typeparam>
        /// <param name="sql">Sql查询语句</param>
        /// <param name="parameters">要传递给命令的参数数组</param>
        /// <returns>类型为TElement的对象List</returns>
        public virtual List<TElement> ExecuteSqlQuery<TElement>(string sql, params object[] parameters)
        {
            using (var rowsContext = new SGDCEntities())
            {
                return rowsContext.Database.SqlQuery<TElement>(sql, parameters).ToList();
            }
        }
        #endregion

        #region Helper Method
        public IQueryable<TEntity> AppendWhereClauseAndOrderByField(IQueryable<TEntity> query, List<Filter> filters, string orderByField, bool ascending)
        {
            var whereClauseExp = ConvertToWhereClauseExpression(filters);
            if (whereClauseExp != null)
            {
                query = query.Where(whereClauseExp);
            }

            var type = typeof(TEntity);
            var parameter = Expression.Parameter(type, "p");
            PropertyInfo property;
            var propertyAccess = GetPropertyAccessExpression(type, orderByField, parameter, out property);

            var orderByExp = Expression.Lambda(propertyAccess, parameter);

            string methodName = ascending ? "OrderBy" : "OrderByDescending";
            MethodCallExpression resultExp = Expression.Call(typeof(Queryable), methodName, new Type[] { type, property.PropertyType }, query.Expression, Expression.Quote(orderByExp));

            query = query.Provider.CreateQuery<TEntity>(resultExp);

            return query;
        }

        public Expression<Func<TEntity, bool>> ConvertToWhereClauseExpression(List<Filter> filters)
        {
            if (filters == null)
            {
                return null;
            }

            var type = typeof(TEntity);
            var parameter = Expression.Parameter(type, "p");

            List<Expression> expList = new List<Expression>();

            foreach (var filter in filters)
            {
                PropertyInfo property;
                var propertyAccess = GetPropertyAccessExpression(type, filter.Name, parameter, out property);

                //property为Nullable的处理
                if (IsNullableType(property.PropertyType))
                {
                    propertyAccess = Expression.Property(propertyAccess, "Value");
                }

                Expression valueExp = Expression.Constant(filter.Value);

                Expression exp = null;
                MethodInfo method = null;
                switch (filter.Op)
                {
                    case FilterOp.Equals:
                        exp = Expression.Equal(propertyAccess, valueExp);
                        break;
                    case FilterOp.NotEqual:
                        exp = Expression.NotEqual(propertyAccess, valueExp);
                        break;
                    case FilterOp.GreaterThan:
                        exp = Expression.GreaterThan(propertyAccess, valueExp);
                        break;
                    case FilterOp.GreaterThanOrEqual:
                        exp = Expression.GreaterThanOrEqual(propertyAccess, valueExp);
                        break;
                    case FilterOp.LessThan:
                        exp = Expression.LessThan(propertyAccess, valueExp);
                        break;
                    case FilterOp.LessThanOrEqual:
                        exp = Expression.LessThanOrEqual(propertyAccess, valueExp);
                        break;
                    case FilterOp.Contains:
                        method = typeof(string).GetMethod("Contains", new[] { typeof(string) });
                        exp = Expression.Call(propertyAccess, method, valueExp);
                        break;
                    case FilterOp.NotContains:
                        method = typeof(string).GetMethod("Contains", new[] { typeof(string) });
                        exp = Expression.Not(Expression.Call(propertyAccess, method, valueExp));
                        break;
                    case FilterOp.StartsWith:
                        method = typeof(string).GetMethod("StartsWith", new[] { typeof(string) });
                        exp = Expression.Call(propertyAccess, method, valueExp);
                        break;
                    case FilterOp.EndsWith:
                        method = typeof(string).GetMethod("EndsWith", new[] { typeof(string) });
                        exp = Expression.Call(propertyAccess, method, valueExp);
                        break;
                    case FilterOp.IN:
                        exp = Expression.Call(typeof(Enumerable), "Contains", new[] { typeof(object) }, valueExp, propertyAccess);
                        break;
                }

                expList.Add(exp);
            }

            if (expList.Count == 0)
            {
                return null;
            }
            else if (expList.Count == 1)
            {
                var whereExp = Expression.Lambda(expList.First(), parameter);

                return (Expression<Func<TEntity, bool>>)whereExp;
            }
            else
            {
                var exp = Expression.AndAlso(expList[0], expList[1]);
                for (int i = 2; i < expList.Count; i++)
                {
                    exp = Expression.AndAlso(exp, expList[i]);
                }

                var whereExp = Expression.Lambda(exp, parameter);

                return (Expression<Func<TEntity, bool>>)whereExp;
            }
        }

        public IQueryable<TEntity> AppendOrderByFields(IQueryable<TEntity> query, List<SortField> orderByFields)
        {
            var type = typeof(TEntity);
            var parameter = Expression.Parameter(type, "p");
            int count = 0;
            foreach (var field in orderByFields)
            {
                PropertyInfo property;
                var propertyAccess = GetPropertyAccessExpression(type, field.FieldName, parameter, out property);
                var orderByExp = Expression.Lambda(propertyAccess, parameter);

                if (count++ < 1)
                {
                    string methodName = field.SortDirection ? "OrderBy" : "OrderByDescending";
                    MethodCallExpression resultExp = Expression.Call(typeof(Queryable), methodName, new Type[] { type, property.PropertyType },
                                                        query.Expression, Expression.Quote(orderByExp));
                    query = query.Provider.CreateQuery<TEntity>(resultExp);
                }
                else
                {
                    string methodName = field.SortDirection ? "ThenBy" : "ThenByDescending";
                    MethodCallExpression resultExp = Expression.Call(typeof(Queryable), methodName, new Type[] { type, property.PropertyType },
                                                        query.Expression, Expression.Quote(orderByExp));
                    query = query.Provider.CreateQuery<TEntity>(resultExp);
                }
            }
            return query;
        }

        protected MemberExpression GetPropertyAccessExpression(Type type, string propertyName, ParameterExpression parameter, out PropertyInfo property)
        {
            MemberExpression propertyAccess = null;
            property = null;

            if (propertyName.IndexOf('.') > -1)
            {
                var names = propertyName.Split('.');
                property = GetProperty(type, names[0]);
                propertyAccess = Expression.Property(parameter, property);

                property = GetProperty(property.PropertyType, names[1]);
                propertyAccess = Expression.Property(propertyAccess, names[1]);
            }
            else
            {
                property = GetProperty(type, propertyName);
                propertyAccess = Expression.Property(parameter, property);
            }

            return propertyAccess;
        }

        public virtual string GetPrimaryKey(SGDCEntities rowsContext)
        {
            var objectContext = ((System.Data.Entity.Infrastructure.IObjectContextAdapter)rowsContext).ObjectContext;
            var set = objectContext.CreateObjectSet<TEntity>();

            string keyName = set.EntitySet.ElementType.KeyMembers.Select(k => k.Name).FirstOrDefault();

            return keyName;
        }

        public PropertyInfo GetProperty(Type type, string name)
        {
            foreach (var property in type.GetProperties())
            {
                if (property.Name.Equals(name, StringComparison.CurrentCultureIgnoreCase))
                {
                    return property;
                }
            }

            throw new Exception(string.Format("Cannot find the property '{0}' in type '{1}'", name, type));
        }

        protected static bool IsNullableType(Type type)
        {
            return type.IsGenericType && type.GetGenericTypeDefinition().Equals(typeof(Nullable<>));
        }
        #endregion


    }
}
