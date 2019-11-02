using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Data
{
    [Table("PaymentReceived")]
    public class PaymentReceivedEntity
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int PaymentId { get; set; }

        [Column(TypeName = "int")]
        public int itemId { get; set; }

        public string sessionid { get; set; }

        [Column(TypeName = "int")]
        public int Quantity { get; set; }

        [Column(TypeName = "money")]
        public double TotalPaymentAmount { get; set; }

        [Column(TypeName = "money")]
        public double TotalOfferAmount { get; set; }

        public string ReceivedFormEmailId { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MiddleName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Pin { get; set; }
        public string State { get; set; }

    }
}
