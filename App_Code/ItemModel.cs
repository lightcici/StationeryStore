using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ItemModel
/// </summary>
public class ItemModel
{
    private string itemID;
    private string category;
    private string description;
    private int reorderLevel;
    private int inStock;
    private string UOM;
    public ItemModel()
    {
       
    }
    public string ItemID
    {
        get { return itemID; }
        set { itemID = value; }
    }
    public string Category
    {
        get { return category; }
        set { category = value; }
    }
    public string Description
    {
        get { return description; }
        set { description = value; }
    }
    public int ReorderLevel
    {
        get { return reorderLevel; }
        set { reorderLevel = value; }
    }
    public int InStock
    {
        get { return inStock; }
        set { inStock = value; }
    }
    public string GUOM
    {
        get { return UOM; }
        set { UOM = value; }
    }
}