using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication23
{
    public class supplier1
    {
        


        //method
        public static List<Supplier> GetSupplier()
        {
            Team5ADProjectEntities1 model = new Team5ADProjectEntities1();
            List<Supplier> supplierlist = new List<Supplier>();
            ////foreach(Supplier sup in model.Supplier)
            ////{

            ////    supplierlist.Add(sup);
            ////}

            supplierlist = model.Supplier.ToList<Supplier>();

            return supplierlist;
            

        }

        public static void UpdateSupplier(string SupplierCode, string SupplierName, string GSTRegistrationNo, string ContactName, string Phone, string Fax, string Address)
        {
            Team5ADProjectEntities1 model = new Team5ADProjectEntities1();
            List<Supplier> supplierlist = new List<Supplier>();
         
            supplierlist = model.Supplier.Where(sup => sup.SupplierID == SupplierCode).ToList<Supplier>();
            foreach (Supplier supt in supplierlist)
            {
                supt.SupplierName = SupplierName;
            }
            model.SaveChanges();
        }

        public static void DeleteSupplier(string SupplierCode)
        {
            Team5ADProjectEntities1 model = new Team5ADProjectEntities1();
            List<Supplier> supplierlist = GetSupplier();
            foreach (Supplier supt in supplierlist)
            {
                if (supt.SupplierID==SupplierCode)
                {
                    supplierlist.Remove(supt);
                }
            }
            model.SaveChanges();
        }

      

    }
}