using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ItemDiscrepancyModel
/// </summary>
public class ItemDiscrepancyModel
{
    private string discrepancyId;
    private string itemCode;
    private string description;
    private int quantity;
    private string reason;
    private string status;

    public ItemDiscrepancyModel()
    {

    }
    public string DiscrepancyId
    {
        get { return discrepancyId; }
        set { discrepancyId = value; }
    }
    public string ItemCode
    {
        get { return itemCode; }
        set { itemCode = value; }
    }
    public string Description
    {
        get { return description; }
        set { description = value; }
    }
    public int Quantity
    {
        get { return quantity; }
        set { quantity = value; }
    }
    public string Reason
    {
        get { return reason; }
        set { reason = value; }
    }
    public string Status
    {
        get { return status; }
        set { status = value; }
    }
}