using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace ShoppingApi.Email
{
    public class AuthMessageSender : IEmailSender
    {

        public AuthMessageSender(IOptions<EmailSettings> emailSettings)
        {
            _emailSettings = emailSettings.Value;
        }

        public EmailSettings _emailSettings { get; }

        public Task SendEmailAsync(string toEmail, string subject, string message)
        {
            Execute(toEmail,  subject, message).Wait();
            return Task.FromResult(0);

        }



        public async Task Execute(string toEmail, string subject, string message)
        {
            try
            {
                //string toEmail = string.IsNullOrEmpty(email)
                //                 ? _emailSettings.ToEmail
                //                 : email;
                MailMessage mail = new MailMessage()
                {
                    From = new MailAddress(_emailSettings.UsernameEmail, "Paadu Singh")
                };
                mail.To.Add(new MailAddress(toEmail));
            ////    mail.CC.Add(new MailAddress(_emailSettings.CcEmail));

                mail.Subject = "Vidhimas Shopping " + subject;
                mail.Body = message;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;


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
                using (SmtpClient smtp = new SmtpClient(_emailSettings.PrimaryDomain, _emailSettings.PrimaryPort))
                {
                    smtp.Credentials = new NetworkCredential(_emailSettings.UsernameEmail, _emailSettings.UsernamePassword);
                    smtp.EnableSsl = true;
                    await smtp.SendMailAsync(mail);
                }
            }
            catch (Exception ex)
            {
                //do something here
            }
        }


    }
}
