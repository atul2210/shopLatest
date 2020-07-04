using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ShoppingApi.Model;
using Microsoft.Extensions.Configuration;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using ShoppingApi.Data;
using ShoppingApi.Security.Hashing;

namespace ShoppingApi.SmsNotifications
{
    public class Otpsender : IsmsNotification<string, OtpAndSms, OtpSenderModel>
    {
        private IConfiguration _configuration;

        public Otpsender()
        {


        }

        private int GenerateOtp(int min,int max)
        {
           
            int _min = 1000;
            int _max = 9999;
            Random _rdm = new Random();
            return _rdm.Next(_min, _max);

        }


        public async Task<int> SendOtp(string MobileNumber, OtpAndSms model, OtpSenderModel otpData)
        {
            int otp = 0;
            try {
                using (var client = new HttpClient())
              //  using (HttpClientFactory client = new RestClient())
                {
                    client.BaseAddress = new Uri(model.baseAddress);
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                    //GET Method  

                    //int _min = 1000;
                    //int _max = 9999;
                    //Random _rdm = new Random();
                    //otp = _rdm.Next(_min, _max);

                    otp = GenerateOtp(1,4);


                    //

                    var connectionString = Startup.connectionstring;

                    // check whether first time on current date 
                    using (var con = new ShoppingContext(connectionString))
                    {
                        var data = con.OtpMasterEntity.Where(m => m.Mobile == MobileNumber && m.SenderDateTime.Date == otpData.SenderDateTime.Date).FirstOrDefault();
                        if (data == null)  //add new record
                        {
                            var entity = new OtpMasterEntity
                            {
                                Active = true,
                                Mobile = MobileNumber,
                                OtpNumber = otp,
                                OtpText = model.message,
                                SenderAttempt = 1,
                                SenderBrowser = otpData.senderBrowser,
                                SenderDateTime = DateTime.Now,
                                SenderIP = otpData.senderIP
                            };

                            con.OtpMasterEntity.Add(entity);
                            con.SaveChanges();


                        }

                        //else if (data.SenderIP != otpData.senderIP)
                        //{
                        //    client.Dispose();
                        //    throw new InvalidOperationException("Invalid IP");
                        //}


                        //Request should come from same browser.
                      //  else if (data.SenderBrowser != otpData.senderBrowser) throw new Exception("Invalid attemp from different browser");

                        else if (data.SenderAttempt >= 3)  //only three attemps are allowed
                        {
                            var totalMinutes = DateTime.Now.Subtract(data.SenderDateTime).TotalMinutes;
                            if (totalMinutes < otpData.LockHours)  // 5 hours
                            {
                                
                                client.Dispose();
                                throw (new InvalidOperationException("Your mobile number is locked, it will be unlocked after 5 hours"));
                            }

                            else
                                System.Threading.Thread.Sleep(30000);// next request will be only after 30 seconds.
                            data.SenderAttempt = 1;  //reset attempt if difference is greater than 300 minutes i.e. 5 hours
                            data.SenderDateTime = DateTime.Now;
                            data.OtpNumber = otp;
                            con.SaveChanges();


                        }

                        else  // main if  upate database
                        {
                            if (data.SenderAttempt > 1 && data.SenderAttempt <= 3)
                            {
                                System.Threading.Thread.Sleep(30000);
                            }
                            data.SenderAttempt = (data.SenderAttempt + 1);
                            data.OtpNumber = otp;
                            con.SaveChanges();

                        }

                        model.smsUrl = model.baseAddress + "username=" + model.smsUserId + "&pass=" + model.password + "&route=" + model.route + "&senderid=" + model.senderId + "&numbers=" + MobileNumber +
                       "&message=" + model.message + otp.ToString();

                        HttpResponseMessage response = await client.GetAsync(model.smsUrl);
                        if (response.StatusCode == System.Net.HttpStatusCode.BadRequest)
                        {
                            otp = 0;

                        }
                    }

                }
            

            }
          

            catch(Exception ex)
            {
                throw ex ;
            }


            return otp;


        }

        public string SendEmail(string email)
        {
            string message = string.Empty;
            try
                {
                var connectionString = Startup.connectionstring;
                using (var con = new ShoppingContext(connectionString))
                {
                    var data = con.Users.Where(m => m.Email == email).SingleOrDefault();
                    if (data == null)

                    {
                        return "This Email is not registered with us";
                    }

                    message = "Welcome@";
                   
                    int otp = GenerateOtp(1, 4);

                    string hashmessage = message + otp.ToString();
                    var salt = Salt.Create();
                    var hash = Hash.Create(hashmessage, salt);
                    //update database
                    data.salt = salt;
                    data.hash = hash;
                   con.SaveChanges();
                }
            }
            catch(Exception exp)
            {
                throw exp;
            }
            return message;
               /// return "Your new password has been emailed on  " + email + "." + "<br> Please log on and check" ;
        }

        public string ComparePassword(string emailId, string password, string confrmpassword)
        {
            string status  = string.Empty;
            try
            {
                if (!password.Equals(confrmpassword))
                {
                    throw new Exception("Confirm password is not matching. Please reenter");
                }

                var connectionString = Startup.connectionstring;
                using (var con = new ShoppingContext(connectionString))
                {
                    var data = con.Users.Where(m => m.Email == emailId).SingleOrDefault();
                    if (data == null)

                    {
                        throw new Exception("This Email is not registered with us");
                    }
                    var salt = Salt.Create();
                    var hash = Hash.Create(password, salt);
                    //update database
                    data.salt = salt;
                    data.hash = hash;
                    con.SaveChanges();
                    status = "Your password changed successfully";

                }
            }

            catch(Exception ex)
            {
                throw ex;
            }

            return status;

        }

    }
}
