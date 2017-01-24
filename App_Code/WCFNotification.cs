using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for WCFNotification
/// </summary>
public class WCFNotification
{
    private int notification;
    private string userid;
    private string subject;
    private string message;
    private string status;
    private DateTime date;

    public WCFNotification(int notification, string userid, string subject, string message, string status, DateTime date)
    {
        this.notification = notification;
        this.userid = userid;
        this.subject = subject;
        this.message = message;
        this.status = status;
        this.date = date;
    }

    public int Notification
    {
        get
        {
            return notification;
        }

        set
        {
            notification = value;
        }
    }

    public string Userid
    {
        get
        {
            return userid;
        }

        set
        {
            userid = value;
        }
    }

    public string Subject
    {
        get
        {
            return subject;
        }

        set
        {
            subject = value;
        }
    }

    public string Message
    {
        get
        {
            return message;
        }

        set
        {
            message = value;
        }
    }

    public string Status
    {
        get
        {
            return status;
        }

        set
        {
            status = value;
        }
    }

    public DateTime Date
    {
        get
        {
            return date;
        }

        set
        {
            date = value;
        }
    }
}



