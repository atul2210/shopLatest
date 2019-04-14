using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class OtpSenderModel
    {
        public string mobile { get; set; }
        public int  otpNumer{ get; set; }
        public string otpText { get; set; }
        public string senderIP { get; set; }
        public string senderBrowser { get; set; }
        public int senderAttemp { get; set; }
        public DateTime SenderDateTime { get; set; }
        public bool Active { get; set; }

    }
}
