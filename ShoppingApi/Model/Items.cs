﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class Items
    {
        public int itemid { get; set; }
        public string itemName { get; set; }
        public string itemDescription { get; set; }
        public int sizeId { get; set; }
        public string sizeName { get; set; }
        public double price { get; set; }
        public double offerPrice { get; set; }

        public string categoryName { get; set; }
        public int categoryId { get; set; }
        public string imaggeUrl { get; set; }
        public string brand { get; set; }
        public string color { get; set; }
        public int deliveryCharges { get; set; }
        public int availableQty { get; set; }

        public int rowNum { get; set; }

        public string availableColor { get; set; }
    }

    public class GetAllItems
    {
        public int count { get; set; }
        public List<Items> allItems { get; set; }

    }


}
