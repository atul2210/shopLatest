using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShoppingApi.Email;

namespace ShoppingApi.Controllers
{
   // [AutoValidateAntiforgeryToken]
    [Produces("application/json")]
    [Route("api/EmailSender")]
    public class EmailSenderController : Controller
    {
        private readonly IEmailSender _emailSender;

        public EmailSenderController(IEmailSender emailSender)
        {
            _emailSender = emailSender;
        }
        [Authorize]
        [AutoValidateAntiforgeryToken]
        [HttpGet, Route("/SendEmail/")]
        public async Task TestAction(string ToEmail,string Subject,string body)
        {
            await _emailSender.SendEmailAsync(ToEmail,Subject,body);
        }
    }
}