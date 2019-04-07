using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.SmsNotifications.MessageFactory
{
    public class SmsSettingReader
    {
        public string UserId { get; set; }
        public string Password { get; set; }
        public string Messge { get; set; }
        public string BaseAddress { get; set; }
        public string senderId { get; set; }
        public string Message { get; set; }
        public string route { get; set; }
    }
}
