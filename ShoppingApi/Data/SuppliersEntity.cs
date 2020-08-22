using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingApi.Data
{
    [Table("Suppliers")]
    public class SuppliersEntity
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int SupplierId { get; set; }

        [Required]
        public string SupFirstName { get; set; }
        public string SupMidName { get; set; }
        public string SupLastName { get; set; }
        public string SupAdd1 { get; set; }
        public string SupAdd2 { get; set; }
        public string SupAdd3 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Pin { get; set; }
        [Column(TypeName = "bit")]
        [Required]
        public bool Active { get; set; } = true;
    }
}
