using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShoppingApi.Model;
using ShoppingApi.Data;
using Microsoft.AspNetCore.Authorization;
using ShoppingApi.Interfaces;
using System.Net;
using ShoppingApi.Email;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;

namespace ShoppingApi.Controllers
{
    [AutoValidateAntiforgeryToken]
    [Produces("application/json")]
    [Route("api/")]
    public class UserController : Controller
    {
        IotpChecker _iotpChecker ;
        private Microsoft.Extensions.Options.IOptions<EmailSettings> _emailSettings;
        //  Operations _operations;
        Ioperation _operations;
        private readonly IEmailSender _emailSender;
        private readonly IEmailSender emailSender;
        private IConfiguration _iConfiguration;
        public UserController(IotpChecker iotpchecker, Ioperation operations, IOptions<EmailSettings> emailSettings, IEmailSender emailSender, IConfiguration iConfiguration)
        {
            _iotpChecker = iotpchecker;
            _operations = operations;
            _emailSender = emailSender;
            _iConfiguration = iConfiguration;
            _emailSettings = emailSettings;
        }

        [AllowAnonymous]
        [HttpPost, Route("User/NewUser/")]
        //[ValidateAntiForgeryToken]

        [IgnoreAntiforgeryToken]
        public IActionResult AddUser([FromBody] User userData)
        {
            var data = _iotpChecker.GetOtpSenderDetails(userData.mobile);
            string ipAddress = HttpContext.Connection.RemoteIpAddress.ToString();
            string browser = Request.Headers["User-Agent"].ToString();
            int otpEnter = userData.EnterOPT;
            string mobile = userData.mobile;
            var parse = Int64.Parse(mobile); //checking only integer digits are entered not string value

            try
            {
                if (mobile.Length != 10)
                {
                    return BadRequest("Enter 10 digits mobile number.");
                }

                if (data.Count > 0)
                {
                    if (data[0].otpNumer != otpEnter) throw new Exception("Incorrect OTP entered");
                 ////   if (data[0].senderBrowser != browser) throw new Exception("Invalid request from other browser");
                    if (data[0].senderIP != ipAddress) throw new Exception("Invalid IP");

                }
                _operations.addUser(userData);
                bool value= Convert.ToBoolean(_iConfiguration.GetSection("SendMail").Value);
                SendEmailToNewUser(userData.emailId, value);
              
            }

            catch(Exception e)
            {
                // return Json(new { status = HttpStatusCode.BadRequest, statusText = e.Message });
                return BadRequest(e);
            }
            return Ok();
        }

        [HttpGet, Route("User/Address/")]
        [Authorize]
        public async Task<ActionResult> GetUserAddress(string email)
        {
            return  Ok(await _operations.GetAddress(email));
           
        }
        [HttpGet, Route("User/GetStates/")]
        public async Task<ActionResult> GetStates()
        {
            return Ok(await _iotpChecker.GetStates());

        }

        private void SendEmailToNewUser(string ToEmail,bool sendemail )
        {
            if (sendemail == true)
            {
                string Subject = "New User Registration  ";
                string body = string.Empty;
                body += "<a href=" + _iConfiguration.GetSection("FirstTimeUser").Value+ ToEmail + ">Thank you for registering with us. Please click here  to complete your registraion  </a>";
                _emailSender.SendEmailAsync(ToEmail, Subject, body);
            }
        }

        
        [AllowAnonymous]
        [HttpGet, Route("User/ActivateUser/")]
        //[ValidateAntiForgeryToken]

        [IgnoreAntiforgeryToken]
        public IActionResult ActivateUser(bool Activate, string email)
        {
            string status = string.Empty;
            var success =_operations.ActivateUser(email, true);
            if(success)
            {
                status = "Your account has been activated successfully.";
            }
            else
            {
                status = "Invalid User Id";
            }

            return Ok(status);
        }

        [HttpGet,Route("User/GetCities")]
        [IgnoreAntiforgeryToken]

        public async Task<ActionResult> GetCities(int StateId)
        {
            var cities = await _iotpChecker.GetCities(StateId);
            return Ok(cities);

        }




    }
}