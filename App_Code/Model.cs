﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Department
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Department()
    {
        this.Staffs = new HashSet<Staff>();
    }

    public string DepartmentID { get; set; }
    public string Collection_Point { get; set; }
    public string DepartmentName { get; set; }
    public string ContactName { get; set; }
    public string Telephone { get; set; }
    public string HeadName { get; set; }
    public string RepresentativeName { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Staff> Staffs { get; set; }
}

public partial class Discrepancy
{
    public string DiscrepancyID { get; set; }
    public string ItemID { get; set; }
    public int Quantity { get; set; }
    public string Reason { get; set; }
    public string Status { get; set; }

    public virtual Item Item { get; set; }
}

public partial class Item
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Item()
    {
        this.Discrepancies = new HashSet<Discrepancy>();
        this.Orders = new HashSet<Order>();
        this.RequestDetails = new HashSet<RequestDetail>();
        this.SupplyDetails = new HashSet<SupplyDetail>();
    }

    public string ItemID { get; set; }
    public string Description { get; set; }
    public string Category { get; set; }
    public int InStock { get; set; }
    public string BinNumber { get; set; }
    public string UOM { get; set; }
    public int ReorderLevel { get; set; }
    public int ReorderQuantity { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Discrepancy> Discrepancies { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Order> Orders { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<RequestDetail> RequestDetails { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<SupplyDetail> SupplyDetails { get; set; }
}

public partial class Order
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Order()
    {
        this.OrderDetails = new HashSet<OrderDetail>();
    }

    public string OrderID { get; set; }
    public string ItemID { get; set; }
    public int TotalQuantity { get; set; }
    public string Justification { get; set; }
    public string Status { get; set; }
    public System.DateTime OrderDate { get; set; }
    public string UserID { get; set; }

    public virtual Item Item { get; set; }
    public virtual Staff Staff { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<OrderDetail> OrderDetails { get; set; }
}

public partial class OrderDetail
{
    public string OrderID { get; set; }
    public string PurchaseOrderID { get; set; }
    public string SupplierID { get; set; }
    public int OrderQuantity { get; set; }
    public int ReceivedQuantity { get; set; }

    public virtual Order Order { get; set; }
    public virtual Supplier Supplier { get; set; }
}

public partial class Request
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Request()
    {
        this.RequestDetails = new HashSet<RequestDetail>();
    }

    public string RequestID { get; set; }
    public System.DateTime RequestDate { get; set; }
    public string Status { get; set; }
    public string UserID { get; set; }
    public string RequestLog { get; set; }

    public virtual Staff Staff { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<RequestDetail> RequestDetails { get; set; }
}

public partial class RequestDetail
{
    public string RequestID { get; set; }
    public string ItemID { get; set; }
    public int RequestQuantity { get; set; }
    public int RetrievedQuantity { get; set; }
    public int ReceivedQuantity { get; set; }

    public virtual Item Item { get; set; }
    public virtual Request Request { get; set; }
}

public partial class Staff
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Staff()
    {
        this.Orders = new HashSet<Order>();
        this.Requests = new HashSet<Request>();
    }

    public string UserID { get; set; }
    public string DepartmentID { get; set; }
    public string Name { get; set; }

    public virtual Department Department { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Order> Orders { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Request> Requests { get; set; }
}

public partial class Supplier
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Supplier()
    {
        this.OrderDetails = new HashSet<OrderDetail>();
        this.SupplyDetails = new HashSet<SupplyDetail>();
    }

    public string SupplierID { get; set; }
    public string Phone { get; set; }
    public string Emain { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<SupplyDetail> SupplyDetails { get; set; }
}

public partial class SupplyDetail
{
    public string SupplierID { get; set; }
    public string ItemID { get; set; }
    public decimal Price { get; set; }
    public int Priority { get; set; }

    public virtual Item Item { get; set; }
    public virtual Supplier Supplier { get; set; }
}

public partial class sysdiagram
{
    public string name { get; set; }
    public int principal_id { get; set; }
    public int diagram_id { get; set; }
    public Nullable<int> version { get; set; }
    public byte[] definition { get; set; }
}