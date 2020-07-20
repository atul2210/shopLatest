using Microsoft.EntityFrameworkCore;
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
            //List<OtpSenderModel> top1 = con.OtpMasterEntity.Where(mm => mm.Mobile == MobileNumer).Take(1)
            //    .Select(xx => new OtpSenderModel()
            //    {
            //        mobile = xx.Mobile,
            //        SenderDateTime = xx.SenderDateTime
            //    }).ToList();



           List<OtpSenderModel> top1  = con.OtpMasterEntity.Where(m => m.Mobile == MobileNumer && m.Active == true ).OrderByDescending(aa=>aa.SenderDateTime).Take(1)
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

            // var otpDate = top1[0].SenderDateTime.Date;
            //System.TimeSpan OtpTime = DateTime.Now.Subtract(otpDate);
            //if(DateTime.Now.Date!=otpDate)
            //{


            //}
            if (top1.Count > 0)
            {
                if (top1[0].senderAttemp == 3)
                {
                    throw new Exception("This is email is locked.  Will be unlock after 5 hours");

                }
            }


            return top1;

        }

        public  Task<List<States>> GetStates()
        {
            var connectionString = Startup.connectionstring;
            var con = new ShoppingContext(Startup.connectionstring);
            Task<List<States>> data = null;
         
                data =  con.StateEntity.Where(ac=> ac.ParentStateId==0 &&ac.Active==true).Select(x => new States()
                {
                    Stateid=x.StateId,
                    StateName=x.StateName,
                    Active= x.Active
                     
                }
                ).ToListAsync();

          
            return data;
        }



        public Task<List<States>> GetCities(int StateId)
        {
            var connectionString = Startup.connectionstring;
            var con = new ShoppingContext(connectionString);

            return con.StateEntity.Where(x => x.ParentStateId == StateId && x.Active == true)
                .Select(x => new States()
                {
                    Stateid=x.StateId,
                    StateName=x.StateName,
                    ParentStateId =x.ParentStateId,
                    City =x.City,
                    Active=x.Active

                }).ToListAsync();

        }





        public void OtpData(OtpSenderModel otpData)
        {

        }
    }
}
