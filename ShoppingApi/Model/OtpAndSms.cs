using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class OtpAndSms
    {
        public string baseAddress { get; set; }
        public string smsUserId { get; set; }
        public string password { get; set; }
        public string smsUrl { get; set; }
        public string senderId { get; set; }
        public string message { get; set; }
        public string route { get; set; }

    }
}
