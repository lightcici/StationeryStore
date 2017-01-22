using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DiscrepancyModel
/// </summary>
public class DiscrepancyModel
{
 
    public string DiscrepancyID { get; set; }
    public string Description { get; set; }
    public string ItemID { get; set; }
    public int Quantity { get; set; }
    public string Reason { get; set; }
    public string Status { get; set; }
    public string Comment { get; set; }
    public string RequestLog { get; set; }

    public DiscrepancyModel()
    {

    }
}