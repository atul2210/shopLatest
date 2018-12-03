using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace ShoppingApi.Model
{
    public class AddToCart
    {
        public int itemid { get; set; }
        public int quantity { get; set; }
        public string itemName { get; set; }
        public string itemDescription { get; set; }
        public double price { get; set; }
        public double offerPrice { get; set; }
        public int DeliveryCharges { get; set; }
        public string sizeName{ get; set; }
        public int sizeId { get; set; }
        public string ColorName { get; set; }
        public string sessionIdToken { get; set; }

        public int count { get; set; }


    }
}
