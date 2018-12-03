using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Threading.Tasks;
using ShoppingApi.Model;

namespace ShoppingApi.SmsNotifications
{
    public interface IsmsNotification<T,M> where M : OtpAndSms
    {
        //  Task<bool> SendMessage(T MobileNumber,M model);
        Task<int> SendOtp(T MobileNumber, M model);

    }
}
