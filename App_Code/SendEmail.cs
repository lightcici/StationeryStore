using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

/// <summary>
/// Summary description for testclass
/// </summary>
public class testclass
{
    public MailMessage Message;
    public SmtpClient client;
    public string subject;
    public string body;
    public testclass()
    {
        
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
        Message.Subject = subject;
        Message.Body = body;
        Message.SubjectEncoding = System.Text.Encoding.UTF8;
        Message.BodyEncoding = System.Text.Encoding.UTF8;
        Message.Priority = MailPriority.High;
        Message.IsBodyHtml = true;
        
        client.EnableSsl = true;
        client.Send(Message);
    }
}