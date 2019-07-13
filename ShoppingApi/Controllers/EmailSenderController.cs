using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using ShoppingApi.Email;

namespace ShoppingApi.Controllers
{
   // [AutoValidateAntiforgeryToken]
    [Produces("application/json")]
    [Route("api/EmailSender")]
    public class EmailSenderController : Controller
    {
        private readonly IEmailSender _emailSender;
        private IOptions<EmailSettings> _emailSettings;
        public EmailSenderController(IEmailSender emailSender, IOptions<EmailSettings> emailSettings)
        {
            _emailSender = emailSender;
            _emailSettings = emailSettings;
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