using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class ItemMaster
    {

        public int itemid { get; set; }
        public string ItemName { get; set; }
        public string itemDescription { get; set; }
        public string AvailableColor { get; set; }
        public int InitialQty { get; set; }
        public int AvailableQty { get; set; }
        public int ReserveQty { get; set; }
        public double SizeId { get; set; }
        public double Price { get; set; }
        public double OfferPrice { get; set; }
        public int childmenuid { get; set; }
        public string Color { get; set; }
      
        public int? detailId { get; set; }
        public int DeliveryCharges { get; set; }
        public bool Active { get; set; }
        
        public string brand { get; set; }
        public int ColorId { get; set; }
        public string SizeName { get; set; }


       
        public string Image1 { get; set; }
        public string Image2 { get; set; }
        public string Image3 { get; set; }



    }
}
