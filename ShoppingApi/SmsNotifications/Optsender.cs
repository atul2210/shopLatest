using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ShoppingApi.Model;
using Microsoft.Extensions.Configuration;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;

namespace ShoppingApi.SmsNotifications
{
    public class Otpsender : IsmsNotification<string,OtpAndSms>
    {
        private IConfiguration _configuration;

        public Otpsender()
        {
           

        }

        public async Task<int> SendOtp(string MobileNumber, OtpAndSms model)
        {
            int otp = 0;

            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(model.baseAddress);
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                //GET Method  
               
                int _min = 1000;
                int _max = 9999;
                Random _rdm = new Random();
                otp = _rdm.Next(_min, _max);
            
                model.smsUrl = model.baseAddress + "username=" + model.smsUserId + "&pass=" + model.password + "&route="+model.route +"&senderid="+model.senderId+ "&numbers=" + MobileNumber +
                   "&message=" + model.message + otp.ToString();

                HttpResponseMessage response = await client.GetAsync(model.smsUrl);
                if (response.StatusCode== System.Net.HttpStatusCode.BadRequest)
                {
                    otp = 0;

                }
            }
            return otp;
        }

      
    }
}
