﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class Team5ADProjectEntities : DbContext
{
    public Team5ADProjectEntities()
        : base("name=Team5ADProjectEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public virtual DbSet<Delegation> Delegations { get; set; }
    public virtual DbSet<Department> Departments { get; set; }
    public virtual DbSet<DisbursementLog> DisbursementLogs { get; set; }
    public virtual DbSet<Discrepancy> Discrepancies { get; set; }
    public virtual DbSet<Item> Items { get; set; }
    public virtual DbSet<Notification> Notifications { get; set; }
    public virtual DbSet<Order> Orders { get; set; }
    public virtual DbSet<OrderDetail> OrderDetails { get; set; }
    public virtual DbSet<OutstandingRequest> OutstandingRequests { get; set; }
    public virtual DbSet<Request> Requests { get; set; }
    public virtual DbSet<RequestDetail> RequestDetails { get; set; }
    public virtual DbSet<Staff> Staffs { get; set; }
    public virtual DbSet<Supplier> Suppliers { get; set; }
    public virtual DbSet<SupplyDetail> SupplyDetails { get; set; }
}
