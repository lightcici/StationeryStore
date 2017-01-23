using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

/// <summary>
/// Summary description for testclass
/// </summary>
public class SendEmail
{
    public MailMessage Message;
    public SmtpClient client;
    private string subject;
    private string body;
    private string userid;
    private string address;

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

    public string Body
    {
        get
        {
            return body;
        }

        set
        {
            body = value;
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

    public SendEmail(string userid,string subject, string body)
    {
        this.userid = userid;
        this.subject = subject;
        this.body = body;
        this.address = Work.getUser(userid).Email;
    }
    
    public void initEmail()
    {
        client = new SmtpClient("smtp.office365.com", 587);
        client.UseDefaultCredentials = true;
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.Credentials = new System.Net.NetworkCredential("e0046794@u.nus.edu", "15008488856*ZZ");
        Message = new MailMessage();
        Message.From = new MailAddress("e0046794@u.nus.edu");
    }
   
    public void sendEmail()
    {
        Message.Subject = Subject;
        Message.Body = Body;
        Message.To.Add("e0046825@u.nus.edu");
        Message.SubjectEncoding = System.Text.Encoding.UTF8;
        Message.BodyEncoding = System.Text.Encoding.UTF8;
        Message.Priority = MailPriority.High;
        Message.IsBodyHtml = true;
        
        client.EnableSsl = true;
        client.Send(Message);
        insertNotification();
    }

    public void insertNotification()
    {
        Notification n = new Notification();
        n.UserID = userid;
        n.Subject = subject;
        n.Message = body;
        n.Status = "Unread";
        n.Date = DateTime.Now;
        Work.insertNotification(n);

    }
}