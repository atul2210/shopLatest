using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ShoppingApi.Model;

namespace ShoppingApi.SmsNotifications.MessageFactory
{
    interface ImessageFactory
    {
        //IsmsNotification<string, OtpAndSms> SendOtp(int msgType, string mobile, OtpAndSms smsUrl);
        Task<int> SendOtp(int msgType, string mobile, OtpAndSms smsUrl);

    }
}
