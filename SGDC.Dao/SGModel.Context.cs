﻿

//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------


using SGDC.Model;

namespace SGDC.Dao
{

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;


public partial class SGDCEntities : DbContext
{
    public SGDCEntities()
        : base("name=SGDCEntities")
    {

    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }


    public DbSet<datadictionaryinfo> datadictionaryinfo { get; set; }

    public DbSet<shiguhouguoinfo> shiguhouguoinfo { get; set; }

    public DbSet<shiguhouguoshangwanginfo> shiguhouguoshangwanginfo { get; set; }

    public DbSet<shiguzerendanweiinfo> shiguzerendanweiinfo { get; set; }

    public DbSet<userinfo> userinfo { get; set; }

    public DbSet<shiguzereninfo> shiguzereninfo { get; set; }

    public DbSet<shigujibeninfo> shigujibeninfo { get; set; }

    public DbSet<v_shigu> v_shigu { get; set; }

    public DbSet<documentinfo> documentinfo { get; set; }

    public DbSet<systemloginfo> systemloginfo { get; set; }

}

}

