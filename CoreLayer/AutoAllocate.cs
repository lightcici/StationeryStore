using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UnitTestForCoreLogic.CoreLayer
{

    class AutoAllocate
    {
        private Team5ADProjectEntities ctx;
        /// <summary>
        /// Get all Items in OutstandingRequest
        /// </summary>
        /// <returns></returns>
        public List<Item> RequestedItem()
        {
            ctx = new Team5ADProjectEntities();
            var qry =  (from x in ctx.OutstandingRequests
                    group x by x.ItemID into g
                    select new {OustandingQty = g.Select( i=>i.OutstandingQty), Item = g.Select( i=>i.Item) });
            List<Item> result = new List<Item>();
            foreach (var item in qry)
            {
                result.Add((Item)item.Item);
            }
            return result;
        }
        /// <summary>
        /// Allocate One Item, return Min{OutstandingQty, item.InStock
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        //private int AllocateByItem(string itemID)
        //{
        //    ctx = new Team5ADProjectEntities();
        //    try
        //    {
        //        int instock = ctx.Items.Where(x => x.ItemID.Equals(itemID)).FirstOrDefault().InStock;
        //        int outstandingQty = ctx.OutstandingRequests.Where(x => x.ItemID.Equals(itemID)).FirstOrDefault().OutstandingQty;
        //        return Math.Min(instock, outstandingQty);
        //    } catch (Exception e)
        //    {
        //        return -1;
        //    }
        //}


        /// <summary>
        /// Allocate All Items
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, int> AllocateAllItem()
        {
            ctx = new Team5ADProjectEntities();
            Dictionary<string, int> result = new Dictionary<string, int>();

            var qry = (from x in ctx.OutstandingRequests
                       group x by x.ItemID into g
                       select new { OustandingQty = g.Sum(i => i.OutstandingQty), Item = g.Select(i => i.Item) });
            foreach (var i in qry)
            {
                int instock = i.Item.FirstOrDefault().InStock;
                int outstandingQty = i.OustandingQty;
                string itemID = i.Item.FirstOrDefault().ItemID;
                if (!result.ContainsKey(itemID))
                    result.Add(itemID, Math.Min(instock, outstandingQty));
                else
                    result[itemID] += outstandingQty;
            }
            return result;
        }

        /// <summary>
        /// Allocate Given Item(by ID) and Qty for all Departments
        /// </summary>
        /// <param name="itemID"></param>
        /// <param name="Qty"></param>
        /// <returns></returns>
        //private Dictionary<string, int> AllocateByDepartment(string itemID, int Qty)
        //{
        //    ctx = new Team5ADProjectEntities();
        //    Dictionary<string, int> result = new Dictionary<string, int>();

        //    List<TransactionLog> transcationLogs = (from x in ctx.TransactionLogs
        //                                            where ((x.ItemID == itemID))
        //                                            select x).ToList();
        //    int num = Qty;
        //    foreach (TransactionLog log in transcationLogs)
        //    {
        //        if (num == 0) break;
        //        int requestQty = log.RequestQty ?? 0;
        //        int receiveQty = log.ReceiveQty ?? 0;
        //        int putQty = requestQty - receiveQty;
        //        putQty = Math.Min(putQty, num);
        //        string departmentID = log.DepartmentID;
        //        if (result.ContainsKey(departmentID))
        //            result[departmentID] += putQty;
        //        else
        //            result.Add(departmentID, putQty);
        //        num -= putQty;
        //    }
        //    return result;
        //}

        /// <summary>
        /// Allocate All Department with given All Items and Qty (result of AllocateAllItem or from screen)
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, Dictionary<string, int>> AllocateAllDepartment(Dictionary<string, int> retrievedNum)
        {
            ctx = new Team5ADProjectEntities();
            Dictionary<string, Dictionary<string, int>> result = new Dictionary<string, Dictionary<string, int>>();

            // backup the given List
            Dictionary<string, int> qty = new Dictionary<string, int>();
            foreach (string key in retrievedNum.Keys)
                qty.Add(key, retrievedNum[key]);

            // get all Transaction Logs
            List<TransactionLog> transactionLogs = ctx.TransactionLogs.ToList();
            foreach (TransactionLog log in transactionLogs)
            {
                string departmentID = log.DepartmentID;
                string itemID = log.ItemID;
                if (!result.ContainsKey(departmentID))
                    result.Add(departmentID, new Dictionary<string, int>());
                if (!result[departmentID].ContainsKey(itemID))
                    result[departmentID].Add(itemID, 0);
                int requestQty = log.RequestQty ?? 0;
                int receiveQty = log.ReceiveQty ?? 0;
                int putQty = requestQty - receiveQty;
                putQty = Math.Min(putQty, qty[itemID]);
                result[departmentID][itemID] += putQty;
                qty[itemID] -= putQty;
            }

            return result;
        }


    }
}
