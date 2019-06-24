using Microsoft.Extensions.Options;
using ShoppingApi.Email;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace ShoppingApi.Common
{
    public class EmailSender
    {
       ////// IOptions<EmailSettings> emailSettings = null;
        public EmailSender(IOptions<EmailSettings> emailSettings)
        {
            _emailSettings = emailSettings.Value;
        }
        public static EmailSettings _emailSettings; 

        public static Task SendEmailAsync(string toEmail, string subject, string message, IOptions<EmailSettings> emailSettings)
        {
            Execute(toEmail, subject, message,emailSettings).Wait();
            return Task.FromResult(0);

        }



        public static async Task Execute(string toEmail, string subject, string message, IOptions<EmailSettings> emailSettings)
        {
            try
            {
               

                //string toEmail = string.IsNullOrEmpty(email)
                //                 ? _emailSettings.ToEmail
                //                 : email;
                MailMessage mail = new MailMessage()
                {
                    From = new MailAddress(_emailSettings.UsernameEmail)
                };
                mail.To.Add(new MailAddress(toEmail));
                ////    mail.CC.Add(new MailAddress(_emailSettings.CcEmail));

                mail.Subject = "Vidhimas Shopping " + subject;
                mail.Body = message;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;

                //System.Net.ServicePointManager.Expect100Continue = false;

                //SmtpClient client = new SmtpClient("mysmtpserver");
                //client.UseDefaultCredentials = false;
                //client.Credentials = new NetworkCredential("username", "password");

                //MailMessage mailMessage = new MailMessage();
                //mailMessage.From = new MailAddress("whoever@me.com");
                //mailMessage.To.Add("receiver@me.com");
                //mailMessage.Body = "body";
                //mailMessage.Subject = "subject";
                //client.Send(mailMessage);




                //                //mail.Attachments.Add(new Attachment(Server.MapPath("~/myimage.jpg")));
                //                You can send to more than one person at the same time
                //                mail.To.Add("test@email.com");
                //                mail.To.Add("test2@email.com");
                //You can set a name for the sender
                //mail.From = new MailAddress("test@email.com", "Hello");

                //                mail.IsBodyHtml = true;
                //                mail.Body = "Testing <b>123!</b>";
                //                You can use the CC and BCC fields
                //mail.CC.Add("test@email.com");
                //                mail.Bcc.Add("test2@email.com");
                //                You can set the priority of an e-mail
                //mail.Priority = MailPriority.High;
                //using (SmtpClient smtp = new SmtpClient(_emailSettings.PrimaryDomain, _emailSettings.PrimaryPort))
                //{

                using (SmtpClient smtp = new SmtpClient(_emailSettings.PrimaryDomain, _emailSettings.PrimaryPort))
                {
                    smtp.Credentials = new NetworkCredential(_emailSettings.UsernameEmail, _emailSettings.UsernamePassword);
                    smtp.EnableSsl = false;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.UseDefaultCredentials = false;
                    smtp.Send(mail);
                    //  await smtp.SendMailAsync(mail);
                }
            }
            catch (Exception ex)
            {
                //do something here
            }
        }

    }
}
