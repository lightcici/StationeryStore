using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Department1
/// </summary>
public class Department1
{
    public Department1()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    static Team5ADProjectEntities model = new Team5ADProjectEntities();

    //method
    public static List<Department> GetDepartment()
    {
        
        List<Department> departmentlist = new List<Department>();
        ////foreach(Supplier sup in model.Supplier)
        ////{

        ////    supplierlist.Add(sup);
        ////}

        departmentlist = model.Departments.ToList<Department>();

        return departmentlist;


    }
    public static List<Department> GetCollectionPoint()
    {
        
        List<Department> departmentlist = new List<Department>();
        ////foreach(Supplier sup in model.Supplier)
        ////{

        ////    supplierlist.Add(sup);
        ////}

        departmentlist = model.Departments.GroupBy(x => new { x.Collection_Point }).Select(x => x.FirstOrDefault()).ToList<Department>();

        return departmentlist;


    }




    public static void UpdateDepartment(string DepartmentCode, string departmentname, string contact,
        string telephone, string headname, string collectionPoint, string repName)
    {
        

        List<Department> departmentlist = new List<Department>();
        departmentlist = model.Departments.Where(department => department.DepartmentID == DepartmentCode).ToList<Department>();
        foreach (Department dept in departmentlist)
        {
            dept.DepartmentName = departmentname;
            dept.ContactName = contact;
            dept.Telephone = telephone;
            dept.HeadName = headname;
            dept.Collection_Point = collectionPoint;
            dept.RepresentativeName = repName;

        }
        model.SaveChanges();
    }

    public static void DeleteDepartment(string departmentCode)
    {
        
        List<Department> departmentlist = new List<Department>();
        departmentlist = model.Departments.Where(department => department.DepartmentID == departmentCode).ToList<Department>();

        foreach (Department dept in departmentlist)
        {
            if (dept.DepartmentID == departmentCode)
            {
                model.Departments.Remove(dept);
            }
        }
        model.SaveChanges();
    }

    //Method name: CreateSupplier
    //CreateSupplier(SupplierCode, SupplierName, ContactName, PhoneNo, FaxNo, Address, GSTNo); 
    //input arguments are SupplierCode, SupplierName, ContactName, PhoneNo, FaxNo, Address, GSTNo
    //return type: void

    public static void CreateDepartment(string DepartmentCode, string departmentname, string contact,
        string telephone, string headname, string collectionPoint, string repName)
    {
        
        //List<Supplier> currentList = GetSupplier();
        //foreach(Supplier sup in currentList)
        //{
        //    if (sup.SupplierID==SupplierCode)
        //    {

        //        break; 
        //    }


        Department toAddDepartment = new Department();


        toAddDepartment.DepartmentID = DepartmentCode;
        toAddDepartment.DepartmentName = departmentname;
        toAddDepartment.ContactName = contact;
        toAddDepartment.Telephone = telephone;

        toAddDepartment.HeadName = headname;
        toAddDepartment.Collection_Point = collectionPoint;
        toAddDepartment.RepresentativeName = repName;

        model.Departments.Add(toAddDepartment);
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