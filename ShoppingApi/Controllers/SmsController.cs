using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using ShoppingApi.Model;
using System.Text;
using ShoppingApi.SmsNotifications.MessageFactory;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Options;
using System.Net;
using ShoppingApi.Interfaces;
using ShoppingApi.Email;
using System.Net.Mail;

namespace ShoppingApi.Controllers
{
  //  [AutoValidateAntiforgeryToken]
    [Produces("application/json")]
    [Route("api/")]

    public class SmsController : Controller
    {
        private IConfiguration _configuration;
        OtpAndSms otp = null;
        ImessageFactory _msgFactory = null;
        OtpSenderModel otpsender = null;
        private readonly IOptions<SmsSettingReader> appSettings;
        private IOptions<EmailSettings> _emailSettings;



        public SmsController(IConfiguration configuration, IOptions<SmsSettingReader> app, IOptions<EmailSettings> emailSettings)
        {
            _configuration = configuration;
            otp = new OtpAndSms();
            _msgFactory = new MsgFactory();
            appSettings = app;
            _emailSettings = emailSettings;

        }

        [AllowAnonymous]
        [HttpGet, Route("sms/Otpsender/")]
        [AutoValidateAntiforgeryToken]
        public async Task<IActionResult> SendOtp(string MobileNumber)
        {
            StringBuilder otpUrl = null;
            try
            {
                int attempt = 1;
                // otpsender = new OtpSenderModel();
               

                string ipAddress = HttpContext.Connection.RemoteIpAddress.ToString();
                string browser = Request.Headers["User-Agent"].ToString();




                if (MobileNumber.Length >= 10 && MobileNumber.Length <= 12)
                {


                    otp.baseAddress = appSettings.Value.BaseAddress;  //_configuration.GetSection("SmsAndOTP").GetSection("BaseAddress").Value;
                    otp.smsUserId = appSettings.Value.UserId;//_configuration.GetSection("SmsAndOTP").GetSection("UserId").Value;
                    otp.password = appSettings.Value.Password; //_configuration.GetSection("SmsAndOTP").GetSection("Password").Value;

                    otp.message = appSettings.Value.Message;
                    otp.route = appSettings.Value.route;
                    otp.senderId = appSettings.Value.senderId;
                    otpsender = new OtpSenderModel()
                    {
                        mobile = MobileNumber,
                        otpText = appSettings.Value.Message,
                        senderAttemp = attempt + 1,
                        senderBrowser = browser,
                        senderIP = ipAddress,
                        Active = true,
                        SenderDateTime = DateTime.Now,
                       LockHours = appSettings.Value.lockMinutes
                    };

                    }
                var result = _msgFactory.SendOtp(1, MobileNumber, otp, otpsender);

                if (result.IsFaulted)
                {
/////  return Json(new { status = HttpStatusCode.BadRequest, message = result.Exception.Message });
                    return BadRequest(result.Exception.Message);
                }
                return Ok(result);
            }
            
            catch (Exception exp)
            {
                return BadRequest(exp.Message);

            }


            


        }

        [AllowAnonymous]
        [HttpGet, Route("sms/ResetPassword/")]
        [AutoValidateAntiforgeryToken]
        public async Task<IActionResult> ResetPassword(string email)
        {

            var result = _msgFactory.SendEmail(email);
            // var emailsett = new EmailSettings()
            var emailsettin = new EmailSettings()

            {
                UsernameEmail = _emailSettings.Value.UsernameEmail,
                CcEmail = _emailSettings.Value.CcEmail,
                FromEmail = _emailSettings.Value.FromEmail,
                PrimaryDomain = _emailSettings.Value.PrimaryDomain,
                PrimaryPort = _emailSettings.Value.PrimaryPort,
                SecondaryPort = _emailSettings.Value.SecondaryPort,
                SecondayDomain = _emailSettings.Value.SecondayDomain,
                ToEmail = _emailSettings.Value.ToEmail,
                UsernamePassword = _emailSettings.Value.UsernamePassword
                

            };



          await   SendEmailAsync(email, "Password Reset - Vidhim Shoppings", result.Result, emailsettin);
            return Ok(result);

        }


        [AllowAnonymous]
        [HttpGet, Route("sms/ChangePassword/")]
        [AutoValidateAntiforgeryToken]
        public async Task<IActionResult> ChangePassword(string email,string password,string confirmpassword)
        {
            try
            {

                var result = _msgFactory.ComparePassword(email, password, confirmpassword);

                if (result.IsFaulted)
                {
                    return BadRequest(result.Result);
                }

                    return Ok(result);
            }
          

            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }




        public Task SendEmailAsync(string toEmail, string subject, string message, EmailSettings emailSettings)
        {
            Execute(toEmail, subject, message, emailSettings).Wait();
            return Task.FromResult(0);

        }



        public async Task Execute(string toEmail, string subject, string message, EmailSettings emailSettings)
        {
            try
            {


                //string toEmail = string.IsNullOrEmpty(email)
                //                 ? _emailSettings.ToEmail
                //                 : email;
                MailMessage mail = new MailMessage()
                {
                    From = new MailAddress(emailSettings.UsernameEmail)
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

                using (SmtpClient smtp = new SmtpClient(emailSettings.PrimaryDomain, emailSettings.PrimaryPort))
                {
                    smtp.Credentials = new NetworkCredential(emailSettings.UsernameEmail, emailSettings.UsernamePassword);
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