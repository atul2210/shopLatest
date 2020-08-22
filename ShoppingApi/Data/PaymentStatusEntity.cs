using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Data
{
        [Table("PaymentStatus")]
        public class PaymentStatusEntity
        {
            [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
            [Column(TypeName = "int")]
            public int ID { get; set; }
            public string Status { get; set; }
        }




    [Table("PaymentMethod")]
    public class PaymentMethodEntity
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int ID { get; set; }
        public string PaymentTypeName { get; set; }

        [Column(TypeName = "bit")]
        public bool Active { get; set; }
        

    }

}
