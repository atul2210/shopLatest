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

namespace ShoppingApi.Controllers
{
    [Produces("application/json")]
    [Route("api/")]
    public class SmsController : Controller
    {
        private IConfiguration _configuration;
        OtpAndSms otp = null;
        ImessageFactory _msgFactory = null;

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


            if (MobileNumber.Length >= 10 && MobileNumber.Length <= 12)
            {
                

                otp.baseAddress = appSettings.Value.BaseAddress;  //_configuration.GetSection("SmsAndOTP").GetSection("BaseAddress").Value;
                otp.smsUserId = appSettings.Value.UserId;//_configuration.GetSection("SmsAndOTP").GetSection("UserId").Value;
                otp.password = appSettings.Value.Password; //_configuration.GetSection("SmsAndOTP").GetSection("Password").Value;

                otp.message = appSettings.Value.Message;
                otp.route = appSettings.Value.route;
                otp.senderId = appSettings.Value.senderId;
               

                return Ok(_msgFactory.SendOtp(1, MobileNumber, otp));

            }
            else
                return Json(new { status = HttpStatusCode.BadRequest, message = "Bad Request! chal bhaag yahan se" });
            //return BadRequest("Oops  Something bad has happened"); 



        }


    }
}