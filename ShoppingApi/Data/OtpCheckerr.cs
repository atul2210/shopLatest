using ShoppingApi.Interfaces;
using ShoppingApi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Data
{
    public class OtpChecker : IotpChecker
    {
        public List<OtpSenderModel> GetOtpSenderDetails(string MobileNumer)
        {
            var connectionString = Startup.connectionstring;
            var con = new ShoppingContext(connectionString);
            //return con.OtpMasterEntity.Where(m => m.Mobile == MobileNumer && m.Active==true && m.SenderDateTime== DateTime.Now )
            return con.OtpMasterEntity.Where(m => m.Mobile == MobileNumer && m.Active == true)
           .Select(x => new OtpSenderModel()
           {
               mobile = x.Mobile,
               otpText = x.OtpText,
               senderAttemp = x.SenderAttempt,
               senderBrowser = x.SenderBrowser,
               senderIP = x.SenderIP,
               SenderDateTime = x.SenderDateTime,
               Active = x.Active,
               otpNumer = x.OtpNumber

           }).ToList();  // need to use first and default

        }

        public void OtpData(OtpSenderModel otpData)
        {

        }
    }
}
