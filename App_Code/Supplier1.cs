using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Supplier1
/// </summary>
public class Supplier1
{
    static Team5ADProjectEntities model = new Team5ADProjectEntities();
    public Supplier1()
    {

    }

    //method
    public static List<Supplier> GetSupplier()
    {
       
        List<Supplier> supplierlist = new List<Supplier>();
        ////foreach(Supplier sup in model.Supplier)
        ////{

        ////    supplierlist.Add(sup);
        ////}

        supplierlist = model.Suppliers.ToList<Supplier>();

        return supplierlist;


    }

    public static void UpdateSupplier(string SupplierCode, string SupplierName, string GSTRegistrationNo, string ContactName, string Phone, string Fax, string Address)
    {
        
        List<Supplier> supplierlist = new List<Supplier>();

        supplierlist = model.Suppliers.Where(sup => sup.SupplierID == SupplierCode).ToList<Supplier>();
        foreach (Supplier supt in supplierlist)
        {
            supt.SupplierName = SupplierName;
            supt.GSTRegistrationNo = GSTRegistrationNo;
            supt.ContactName = ContactName;
            supt.Phone = Phone;
            supt.Address = Address;
            supt.FaxNo = Fax;

        }
        model.SaveChanges();
    }

    public static void DeleteSupplier(string SupplierCode)
    {
       
        List<Supplier> supplierlist = new List<Supplier>();
        supplierlist = model.Suppliers.Where(sup => sup.SupplierID == SupplierCode).ToList<Supplier>();

        foreach (Supplier supt in supplierlist)
        {
            if (supt.SupplierID == SupplierCode)
            {
                model.Suppliers.Remove(supt);
            }
        }
        model.SaveChanges();
    }

    //Method name: CreateSupplier
    //CreateSupplier(SupplierCode, SupplierName, ContactName, PhoneNo, FaxNo, Address, GSTNo); 
    //input arguments are SupplierCode, SupplierName, ContactName, PhoneNo, FaxNo, Address, GSTNo
    //return type: void

    public static void CreateSupplier(string SupplierCode, string SupplierName, string ContactName, string PhoneNo, string FaxNo, string Address, string GSTNo)
    {
       
        //List<Supplier> currentList = GetSupplier();
        //foreach(Supplier sup in currentList)
        //{
        //    if (sup.SupplierID==SupplierCode)
        //    {

        //        break; 
        //    }



        Supplier toAddSupplier = new Supplier();

        toAddSupplier.SupplierID = SupplierCode;
        toAddSupplier.SupplierName = SupplierName;
        toAddSupplier.GSTRegistrationNo = GSTNo;
        toAddSupplier.ContactName = ContactName;
        toAddSupplier.Phone = PhoneNo;
        toAddSupplier.FaxNo = FaxNo;
        toAddSupplier.Address = Address;
        model.Suppliers.Add(toAddSupplier);
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