using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DisbursementModel
/// </summary>

[Serializable]
public class DisbursementModel
{
    public int DisbursementID { get; set; }
    public string ItemID { get; set; }
    public string ItemDesp { get; set; }
    public int InStock { get; set; }
    public string binNum { get; set; }
    public string DepartmentID { get; set; }
    public string DepartmentName { get; set; }
    public System.DateTime DateTime { get; set; }
    public int NeededNumber { get; set; }
    public int RetrivedNumber { get; set; }
    public int GivenNumber { get; set; }


    public DisbursementModel()
    {

    }

    public DisbursementModel(string itemId,string itemdesp,int needed,int inStock,string binNum )
    {
        this.ItemID = itemId;
        this.ItemDesp = itemdesp;
        this.NeededNumber = needed;
        this.InStock = inStock;
        this.binNum = binNum;
    }

    public DisbursementModel(string deptID,string deptName, string itemID, string itemdesp, int needed)
    {
        this.DepartmentID = deptID;
        this.DepartmentName = deptName;
        this.ItemID = itemID;
        this.ItemDesp = itemdesp;
        this.NeededNumber = needed;
    }
}