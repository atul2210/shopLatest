using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class PaymentReceived
    {
        public int itemId { get; set; }
        public int PaymentId { get; set; }
        public string sessionid { get; set; }
        public double TotalPaymentAmount { get; set; }
        public double TotalOfferAmount { get; set; }
        public string ReceivedFormEmailId { get; set; }

    }

    

}
