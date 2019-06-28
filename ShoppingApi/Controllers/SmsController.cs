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
using ShoppingApi.Common;

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
       // [IgnoreAntiforgeryToken]
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
        //[IgnoreAntiforgeryToken]
        public async Task<IActionResult> ResetPassword(string email)
        {
            var result = _msgFactory.SendEmail(email);
            try
            {
                
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

                string emailBody = "Your new password for Vidhim Shopping is  " + result.Result;
                if (result.Result != "This Email is not registered with us")
                {
                    await EmailSender.SendEmailAsync(email, "Password Reset - Vidhim Shoppings", emailBody, emailsettin);
                }
            }
            catch(Exception e)
            {
                throw e;
            }
            //  return Ok("Your Password has been emailed to " + email + "." );
         
            return Ok(result);

        }


        [AllowAnonymous]
        [HttpGet, Route("sms/ChangePassword/")]
       [AutoValidateAntiforgeryToken]
       // [IgnoreAntiforgeryToken]
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




        


    }
}