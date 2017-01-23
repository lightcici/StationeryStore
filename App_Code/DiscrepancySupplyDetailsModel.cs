using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DiscrepancySupplyDetailsModel
/// </summary>
public class DiscrepancySupplyDetailsModel
{
    private string discrepancyId;
    private string requester;
    private string itemCode;
    private string description;
    private int quantity;
    private string reason;
    private Decimal price;

    public DiscrepancySupplyDetailsModel()
    {

    }
    public string DiscrepancyId
    {
        get { return discrepancyId; }
        set { discrepancyId = value; }
    }
    public string Requester
    {
        get { return requester; }
        set { requester = value; }
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
    public Decimal Price
    {
        get { return price; }
        set { price = value; }
    }
}