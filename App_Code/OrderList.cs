using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OrderList
/// </summary>
public class OrderList
{
    public string orderId { get; set; }
    public string itemId { get; set; }
    public string category { get; set; }
    public string description { get; set; }
    public int quantity { get; set; }
    public string justification { get; set; }
    public string status { get; set; }
    public DateTime orderDate { get; set; }
    public string comment { get; set; }

    public OrderList()
    {

    }

    public OrderList(string orderId, string itemId, string description, int quantity, string justification, string status)
    {
        this.orderId = orderId;
        this.itemId = itemId;
        this.description = description;
        this.quantity = quantity;
        this.justification = justification;
        this.status = status;
    }

    public OrderList(string orderId, string itemId, string category, string description, int quantity, string justification, string status, DateTime orderDate, string comment)
    {
        this.orderId = orderId;
        this.itemId = itemId;
        this.category = category;
        this.description = description;
        this.quantity = quantity;
        this.justification = justification;
        this.status = status;
        this.orderDate = orderDate;
        this.comment = comment; 
    }

    public OrderList(string orderId, string itemId, string category, string description, int quantity, string justification)
    {
        this.orderId = orderId;
        this.itemId = itemId;
        this.category = category;
        this.description = description;
        this.quantity = quantity;
        this.justification = justification;
    }

}