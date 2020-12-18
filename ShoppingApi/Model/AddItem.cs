using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class AddItem
    { 

    public int supplierId { get; set; }
    public string itemName { get; set; }
    public string itemDescription { get; set; }
    public double sizeId { get; set; }
    public string sizeName { get; set; }
    public double price { get; set; }
    public double offerPrice { get; set; }

    public string categoryName { get; set; }
   // public int categoryId { get; set; }
    public string imaggeUrl { get; set; }
    public string brand { get; set; }
    public string color { get; set; }
    public int deliveryCharges { get; set; }
    public int availableQty { get; set; }
   ///// public int rowNum { get; set; }
    public string availableColor { get; set; }
    public int colorId { get; set; }
    public string Image1 { get; set; }
    public Byte[] Image2 { get; set; }
    public Byte[] Image3 { get; set; }
    public int GroupId { get; set; }
    ////public List<GroupMaster> AvailableSize { get; set; }
    public string ImageSmall3 { get; set; }
    public int ChileMenuId { get; set; }
    public int? DetailId { get; set; }
    public int initialQty { get; set; }

    public DateTime? CreateDate { get; set; }
    public DateTime? UpdateDate { get; set; }
    }
}
