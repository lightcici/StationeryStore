//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;

///// <summary>
///// Summary description for getInfo
///// </summary>
///// 

//public class GetInfo
//    {
//        Team5ADProjectEntities ctx = new Team5ADProjectEntities();
//        public GetInfo()
//        {
//            //
//            // TODO: Add constructor logic here
//            //
//        }
//        public Staff getLoginUserInfo()
//        {
//            Staff s = ctx.Staffs.Where(x => x.UserID == "99562").First();


//            return s;
//        }


       

//       public List<Staff> getDptSfInfo()
//       {
//        string a = getLoginUserInfo().DepartmentID;
//        List<Staff> st1 = new List<Staff>();
//        st1 = ctx.Staffs.Where(x => x.DepartmentID == a).ToList();
//        return st1;

//    }

//    public Staff someInfo(string z)
//    {
//        Delegation d = getDlgtInfo();
//        Staff s1 = new Staff();

//        if (z == "stf")
//        {
//            if (d.DelegationID != null)
//            {
//                string ch = d.CoveringHeadID;
//                s1 = ctx.Staffs.Where(x => x.UserID == ch).First(); //选择出已经有的临时head的信息
//            }

//        }
//        //  else if (z == "oldrep")
//        //  {
//        //      s1 = getDptSfInfo().Where(x => x.Role == "DeptRep").First();
//        //  }
//        //else if (z == "manager")
//        //{
//        //    s1 = getDptSfInfo().Where(x => x.Role == "Manager").First();
//        //}
//        //else if (z=="supvs")
//        //{
//        //    s1 = getDptSfInfo().Where(x => x.Role == "Supervisor").First();
//        //}
//        return s1;
//    }


//}

