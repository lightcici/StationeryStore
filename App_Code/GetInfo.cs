using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for getInfo
/// </summary>
/// 

public class GetInfo
    {
        Team5ADProjectEntities ctx = new Team5ADProjectEntities();
        public GetInfo()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public Staff getLoginUserInfo()
        {
            Staff s = ctx.Staff.Where(x => x.UserID == "99562").First();


            return s;
        }

        public Delegation getDlgtInfo()
        {
            Delegation lastdlgt = new Delegation(); 
            string a = getLoginUserInfo().UserID;  //headID
            int b = ctx.Delegation.Count(x=>x.DepartmentHeadID==a);//if there are info about delegation

            if(b!=0)
            {
             List<Delegation> d = new List<Delegation>();
             d = ctx.Delegation.Where(x => x.DepartmentHeadID == a ).ToList(); //get dept delegation list
            string c = d.Max(x => x.DelegationID).ToString();//the max delegationID in list
            lastdlgt = ctx.Delegation.Where(x=>x.DelegationID==c).First();
            }
           return lastdlgt;
        }
       

       public List<Staff> getDptSfInfo()
       {
        string a = getLoginUserInfo().DepartmentID;
        List<Staff> st1 = new List<Staff>();
        st1 = ctx.Staff.Where(x => x.DepartmentID == a).ToList();
        return st1;

    }

    public Staff someInfo(string z)
    {
        Delegation d = getDlgtInfo();
        Staff s1 = new Staff();

        if (z == "stf")
        {
            if (d.DelegationID != null)
            {
                string ch = d.CoveringHeadID;
                s1 = ctx.Staff.Where(x => x.UserID == ch).First(); //选择出已经有的临时head的信息
            }

        }
        //  else if (z == "oldrep")
        //  {
        //      s1 = getDptSfInfo().Where(x => x.Role == "DeptRep").First();
        //  }
        //else if (z == "manager")
        //{
        //    s1 = getDptSfInfo().Where(x => x.Role == "Manager").First();
        //}
        //else if (z=="supvs")
        //{
        //    s1 = getDptSfInfo().Where(x => x.Role == "Supervisor").First();
        //}
        return s1;
    }


}

