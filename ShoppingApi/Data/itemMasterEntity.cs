using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace ShoppingApi.Model
{
    [Table("ItemMaster")]
    public class itemMasterEntity
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ItemId { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string ItemName { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string ItemDescripton { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string AvailableColor { get; set; }

        [Column(TypeName = "int")]
        public int InitialQty { get; set; }

        [Column(TypeName = "int")]
        public int AvailableQty { get; set; }

        [Column(TypeName = "int")]
        public int ReserveQty { get; set; }

        [Column(TypeName = "int")]
        public double SizeId { get; set; }

       [Column(TypeName = "money")]
        public double Price { get; set; }

        [Column(TypeName = "money")]
        public double OfferPrice { get; set; }

        [Column(TypeName = "int")]
        public int ChildMenuId{ get; set; }

        //Column(TypeName = "nvarchar(50)")]
        public string Color { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public int Brand { get; set; }

        [Column(TypeName = "int")]
        public int? detailId { get; set; }

        [Column(TypeName = "int")]
        public int DeliveryCharges { get; set; }

        [Column(TypeName = "bit")]
        public bool Active { get; set; }

        public string image { get; set; }

        public string brand { get; set; }

        [Column(TypeName = "int")]
        public int deliveryCharges { get; set; }

        [Column(TypeName = "int")]
        public int ColorId { get; set; }


        [Column(TypeName = "varbinary(max)")]
        public Byte[] Image1 { get; set; }

        [Column(TypeName = "varbinary(max)")]
        public Byte[] Image2 { get; set; }

        [Column(TypeName = "varbinary(max)")]
        public Byte[] Image3 { get; set; }




    }
}
