using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Item1
/// </summary>
public class Item1
{
    public Item1()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    static Team5ADProjectEntities model = new Team5ADProjectEntities();
    //method
    public static List<Item> GetItem()
    {
        
        List<Item> itemlist = new List<Item>();
        ////foreach(Supplier sup in model.Supplier)
        ////{

        ////    supplierlist.Add(sup);
        ////}

        itemlist = model.Items.ToList<Item>();

        return itemlist;


    }

    public static List<Item> GetCategory()
    {
       
        List<Item> itemlist = new List<Item>();
        ////foreach(Supplier sup in model.Supplier)
        ////{

        ////    supplierlist.Add(sup);
        ////}

        itemlist = model.Items.GroupBy(x => new { x.Category }).Select(x => x.FirstOrDefault()).ToList<Item>();

        return itemlist;


    }



    public static void UpdateItem(string ItemCode, string description, string category,
        string reorderLevel, string reorderQty, string uom)
    {
       
        List<Item> itemlist = new List<Item>();

        itemlist = model.Items.Where(item => item.ItemID == ItemCode).ToList<Item>();
        foreach (Item item in itemlist)
        {
            item.Description = description;
            item.Category = category;
            item.ReorderLevel = Convert.ToInt32(reorderLevel);
            item.ReorderQty = Convert.ToInt32(reorderQty);
            item.UOM = uom;

        }
        model.SaveChanges();
    }

    public static void DeleteItem(string itemCode)
    {
        
        List<Item> itemlist = new List<Item>();
        itemlist = model.Items.Where(item => item.ItemID == itemCode).ToList<Item>();

        foreach (Item item in itemlist)
        {
            if (item.ItemID == itemCode)
            {
                model.Items.Remove(item);
            }
        }
        model.SaveChanges();
    }

    //Method name: CreateSupplier
    //CreateSupplier(SupplierCode, SupplierName, ContactName, PhoneNo, FaxNo, Address, GSTNo); 
    //input arguments are SupplierCode, SupplierName, ContactName, PhoneNo, FaxNo, Address, GSTNo
    //return type: void

    public static void CreateItem(string ItemCode, string description,
        string Category, string ReorderLevel, string ReorderQty, string UOM, string binNo)
    {
        
        //List<Supplier> currentList = GetSupplier();
        //foreach(Supplier sup in currentList)
        //{
        //    if (sup.SupplierID==SupplierCode)
        //    {

        //        break; 
        //    }



        Item toAddItem = new Item();

        toAddItem.ItemID = ItemCode;
        toAddItem.Description = description;
        toAddItem.Category = Category;
        toAddItem.ReorderLevel = Convert.ToInt32(ReorderLevel);

        toAddItem.ReorderQty = Convert.ToInt32(ReorderQty);
        toAddItem.UOM = UOM;
        toAddItem.BinNumber = binNo;

        model.Items.Add(toAddItem);
        try
        {
            model.SaveChanges();
        }

        catch (DbEntityValidationException ex)
        {
            string errorMessages = string.Join("; ", ex.EntityValidationErrors.SelectMany(x => x.ValidationErrors).Select(x => x.ErrorMessage));
            throw new DbEntityValidationException(errorMessages);
        }



    }

}