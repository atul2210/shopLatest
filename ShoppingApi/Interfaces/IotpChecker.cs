using ShoppingApi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Interfaces
{
    public interface IotpChecker
    {
        void OtpData(OtpSenderModel otpData);
        List<OtpSenderModel> GetOtpSenderDetails(string MobileNumer);
        Task<List<States>> GetStates();
    }
}
