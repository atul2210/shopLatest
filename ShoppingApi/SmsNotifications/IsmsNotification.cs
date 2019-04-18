using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Threading.Tasks;
using ShoppingApi.Model;

namespace ShoppingApi.SmsNotifications
{
    public interface IsmsNotification<T,M,O> where M : OtpAndSms
    {
        //  Task<bool> SendMessage(T MobileNumber,M model);
        Task<int> SendOtp(T MobileNumber, M model, O data);
        Task<string> SendEmail(string email);

    }
}
