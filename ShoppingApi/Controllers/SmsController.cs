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

namespace ShoppingApi.Controllers
{
    [Produces("application/json")]
    [Route("api/")]
    public class SmsController : Controller
    {
        private IConfiguration _configuration;
        OtpAndSms otp = null;
        ImessageFactory _msgFactory = null;
        OtpSenderModel otpsender = null;
        private readonly IOptions<SmsSettingReader> appSettings;
       



        public SmsController(IConfiguration configuration, IOptions<SmsSettingReader> app)
        {
            _configuration = configuration;
            otp = new OtpAndSms();
            _msgFactory = new MsgFactory();
            appSettings = app;
          

        }

        [AllowAnonymous]
        [HttpGet, Route("sms/Otpsender/")]

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

        public async Task<IActionResult> ResetPassword(string email)
        {

            var result = _msgFactory.SendEmail(email);
            return Ok(result);

        }
    }
}