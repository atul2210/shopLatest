using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Email
{
    public interface IEmailSender
    {
        Task SendEmailAsync(string toEmail,string subject, string message);

    }
}
