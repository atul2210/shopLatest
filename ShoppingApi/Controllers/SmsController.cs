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
        IotpChecker _iotpChecker = null;



        public SmsController(IConfiguration configuration, IOptions<SmsSettingReader> app,IotpChecker iotpchecker)
        {
            _configuration = configuration;
            otp = new OtpAndSms();
            _msgFactory = new MsgFactory();
            appSettings = app;
            _iotpChecker = iotpchecker;

        }

        [AllowAnonymous]
        [HttpGet, Route("sms/Otpsender/")]

        public async Task<IActionResult> SendOtp(string MobileNumber)
        {
            StringBuilder otpUrl = null;
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

                //otp sender data

                List<OtpSenderModel> otpData = _iotpChecker.GetOtpSenderDetails(MobileNumber);

                if(otpData.Count>0)
                {
                    attempt = otpData[0].senderAttemp;
                    
                    if(otpData[0].senderIP!= ipAddress)
                    {
                        throw new Exception("Invalid IP");
                    }

                    if(attempt>1 && attempt<=3)
                    {
                        Task.WaitAll(Task.Delay(30000));  // Next attemp will be allowed after 30 second.
                        //System.Threading.Thread.Sleep(30000);
                    }

                    //only 3 attempts are allowed.
                    if (attempt >= 3) throw new Exception("You have tried maximum attemps. Your account is locked. Please contact Customer Care");

                    //Request should come from same browser.
                    if (otpData[0].senderBrowser != browser) throw new Exception("Invalid attemp from different browser");


                    otpsender = new OtpSenderModel()
                    {
                        mobile = MobileNumber,
                        otpText = appSettings.Value.Message,
                        senderAttemp = attempt + 1,
                        senderBrowser = browser,
                        senderIP = ipAddress,
                        Active = true,
                        SenderDateTime = DateTime.Now
                    };

                }



                return Ok(_msgFactory.SendOtp(1, MobileNumber, otp,otpsender));

            }
            else
                return Json(new { status = HttpStatusCode.BadRequest, message = "Bad Request! chal bhaag yahan se" });
            //return BadRequest("Oops  Something bad has happened"); 



        }


    }
}