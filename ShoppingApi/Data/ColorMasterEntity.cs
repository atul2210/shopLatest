using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingApi.Model
{
    [Table("ColorMaster")]
    public class ColorMasterEntity
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "varchar(50)")]
        public string ColorName { get; set; }

        [Column(TypeName = "int")]
        public int Colorid { get; set; }
    }
}
