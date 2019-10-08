using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingApi.Data
{
    [Table("SizeMaster")]
    public class SizeMasterEntity
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int SizeId { get; set; }

        [Column(TypeName = "varchar(50)")]
        public string SizeName { get; set; }
       
    }
}
