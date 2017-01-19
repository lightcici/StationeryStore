using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SupplierDetail1
/// </summary>
public class SupplierDetail1
{
    static Team5ADProjectEntities model = new Team5ADProjectEntities();
    public SupplierDetail1()
    {

    }

   

    public static void UpdateSupplierDetail(string SupplierCode, decimal price, int priority)
    {
        
        List<SupplyDetail> supplydetaillist = new List<SupplyDetail>();

        supplydetaillist = model.SupplyDetails.Where(sup => sup.SupplierID == SupplierCode).ToList<SupplyDetail>();
        foreach (SupplyDetail suptdetail in supplydetaillist)
        {
            suptdetail.Price = price;
            suptdetail.Priority = priority;
        }
        model.SaveChanges();
    }

    public static void DeleteSupplierDetail(string SupplierCode, string ItemID)
    {
        
        List<SupplyDetail> supplierdetaillist = new List<SupplyDetail>();
        supplierdetaillist = model.SupplyDetails.Where(sup => sup.SupplierID == SupplierCode && sup.ItemID == ItemID).ToList<SupplyDetail>();

        foreach (SupplyDetail suptdetail in supplierdetaillist)
        {
            if (suptdetail.SupplierID == SupplierCode && suptdetail.ItemID == ItemID)
            {
                model.SupplyDetails.Remove(suptdetail);
            }
        }
        model.SaveChanges();
    }


}