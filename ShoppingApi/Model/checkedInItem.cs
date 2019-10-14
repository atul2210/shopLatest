using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class checkedInItem
    {

        public int id { get; set; }

        public string userIp { get; set; }

        public int itemId { get; set; }

        public int quantity { get; set; }

        public bool checkOut { get; set; }

        public int colorid { get; set; }

        public string userSessionId { get; set; }
        public string color { get; set; }
        public string itemname { get; set; }
        public string colorname { get; set; }
        public double price { get; set; }
        public double offerprice { get; set; }
        public double deliveryCharges { get; set; }
        
        public string brand { get; set; }
        public string image1 { get; set; }
        public string image2 { get; set; }
        public string image3 { get; set; }

    }

    public class colorsDetails
    {
        public string ColorName { get; set; }


        public int Colorid { get; set; }

    }
}