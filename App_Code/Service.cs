using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{
    Work work = new Work();

    public bool Authenticate(WCFUser user)
    {
        return Work.Authenticate(user.Username, user.Password);
    }

    public List<ItemDiscrepancyModel> GetDiscrepancyList(string selected)
    {
        
        var list = work.getAllDiscrepancies(selected);
        return list;
    }

    public List<ItemModel> GetItemList()
    {
        return work.showAllItems();

    }

    public List<ItemModel> SerachItemList(string search)
    {
        return work.searchItems(search);
    }

    public decimal GetMaxPrice(string id)
    {
        return work.getMaxPrice(id);
    }

    public void saveDiscrepancy(Discrepancy dis)
    {
        //*******************************
        work.saveDiscrepancy(dis.DiscrepancyID, dis.Quantity, dis.Reason, dis.Status, dis.Item);
    }

    public string GetMaxDiscrepancyId()
    {
        return work.getMaxDiscrepancyId();
    }

    public DiscrepancyModel GetDiscrepancy(string id)
    {
        Discrepancy dis = work.getDiscrepancy(id);
        DiscrepancyModel dm = new DiscrepancyModel();
        dm.DiscrepancyID = dis.DiscrepancyID;
        dm.Description = Work.getItem(dis.ItemID).Description;
        dm.Quantity = dis.Quantity;
        dm.Reason = dis.Reason;
        dm.Status = dis.Status;
        return dm;
    }

    public void UpdateDiscrepancy(string id, string status)
    {
        work.updateDiscrepancy(id, status);
    }

    public List<RqHistory> ViewSubmission(string userId)
    {
        return Work.getRqHistory(userId);
    }

    public List<RqHistory> SearchSubmission(string userId,string status)
    {
        List<RqHistory> list = new List<RqHistory>();
        List<RqHistory> hlist = Work.getRqHistory(userId);
        if (status == "All")
        {
            list = hlist;
        }
        else
        {
            foreach (RqHistory rh in hlist)
            {
                if (rh.status == status)
                { list.Add(rh); }
            }
        }
        return list;
    }

    public List<RqDetail> ViewRequestDetail(string id)
    {
        return Work.getRqDetail(id);
    }

    public void ApproveRequest(string id, string comment, string status)
    {
        if (status == "Approve")
        {
            if (comment == null)
            {
                comment = "NA";
            }
            Work.ApproveRequest(id, comment);

        }

        if (status == "Reject")
        {
            if (comment == null)
            {
                comment = "NA";
            }
            Work.RejecteRequest(id, comment);

        }
    }

}
