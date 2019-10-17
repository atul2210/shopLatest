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

namespace ShoppingApi.Controllers
{
    [AutoValidateAntiforgeryToken]
    [Produces("application/json")]
    [Route("api/")]
    public class UserController : Controller
    {
        IotpChecker _iotpChecker ;

      //  Operations _operations;
        Ioperation _operations;

        public UserController(IotpChecker iotpchecker, Ioperation operations )
        {
            _iotpChecker = iotpchecker;
            _operations = operations;
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
                    if (data[0].senderBrowser != browser) throw new Exception("Invalid request from other browser");
                    if (data[0].senderIP != ipAddress) throw new Exception("Invalid IP");

                }

            }

            catch(Exception e)
            {
                // return Json(new { status = HttpStatusCode.BadRequest, statusText = e.Message });
                return BadRequest(e);
            }
            return Ok(_operations.addUser(userData));
        }

        [HttpGet, Route("User/Address/")]
        public async Task<ActionResult> GetUserAddress(string Email)
        {
            return  Ok(await _operations.GetAddress(Email));
           
        }

    }
}