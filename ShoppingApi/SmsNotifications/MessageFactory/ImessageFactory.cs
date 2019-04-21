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
        Task<int> SendOtp(int msgType, string mobile, OtpAndSms smsUrl, OtpSenderModel otpData);
        Task<string> SendEmail(string emailId);
        Task<string> ComparePassword(string emailId, string password, string confrmpassword);
    }
}
