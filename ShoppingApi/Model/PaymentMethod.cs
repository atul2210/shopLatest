using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class PaymentMethod
    {
         
        public int ID { get; set; }
        public string PaymentTypeName { get; set; }
        public bool Active { get; set; }
    }
}
