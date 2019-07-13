using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ShoppingApi.Model;
using System.Collections;
using ShoppingApi.Security.Hashing;

namespace ShoppingApi.SmsNotifications.MessageFactory
{
    public class MsgFactory : ImessageFactory
    {

        public async Task<int> SendOtp(int msgType, string mobile, OtpAndSms smsUrl, OtpSenderModel otpData)
        {


            IsmsNotification<string, OtpAndSms, OtpSenderModel> factory = null;
           
            try
            {



                switch (msgType)
                {
                    case 1: //MessageTypeEnum.otp:
                        {
                            factory = new Otpsender();
                            break;

                        }
                    default:
                        {
                            throw new InvalidOperationException();

                        }

                }

              var otp = await factory.SendOtp(mobile, smsUrl, otpData);
              return otp;
            }
            catch
            {
                throw;

            }
           
        }

        public async  Task<string> SendEmail(string emailId)
        {
            string password = null;
            try
            {
                var connectionString = Startup.connectionstring;
                IsmsNotification<string, OtpAndSms, OtpSenderModel> factory = null;
                factory = new Otpsender();
                password =  factory.SendEmail(emailId);
            }

            catch
            {
                throw;

            }
            return "Your password has been emailed to  " + emailId+"#"+password ;
        }

        public async Task<string> ComparePassword(string emailId, string password, string confrmpassword)
        {

            var connectionString = Startup.connectionstring;
            IsmsNotification<string, OtpAndSms, OtpSenderModel> factory = null;
            factory = new Otpsender();
            return  factory.ComparePassword(emailId,password, confrmpassword);


        }

    }
}

