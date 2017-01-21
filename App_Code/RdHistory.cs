using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RdHistory
/// </summary>
public class RqHistory
{
    public string rqId { get; set; }
    public DateTime date { get; set; }
    public string requester { get; set; }
    public string status { get; set; }
    public string comment { get; set; }
    public RqHistory()
    {

    }

    public RqHistory(string rqId, DateTime date, string requester, string status)
    {
        this.rqId = rqId;
        this.date = date;
        this.requester = requester;
        this.status = status;
    }

}