using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingApi.Model
{
    [Table("CheckIn")]
    public class CheckInEntity
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int id { get; set; }

        //[Column(TypeName = "nvarchar(max)")]
        public string UserIp { get; set; }

        [Column(TypeName = "int")]
        public int itemId { get; set; }

        [Column(TypeName = "int")]
        public int Quantity { get; set; }

        [Column(TypeName = "bit")]
        public bool CheckOut { get; set; }

        [Column(TypeName = "int")]
        public int Colorid { get; set; }

        public string UserSessionId { get; set; }

        [Column(TypeName = "bit")]
        public bool Active { get; set; }

        [Column(TypeName = "money")]
        public double Price { get; set; }

        [Column(TypeName = "money")]
        public double OfferPrice { get; set; }

        [Column(TypeName = "money")]
        public double DeliveryCharges { get; set; }

    }


}
