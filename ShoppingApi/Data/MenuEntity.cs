using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingApi.Data
{
    [Table("Menu")]
    public class MenuEntity
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int Id { get; set; }

        [Column(TypeName = "int")]
        public int ParentId { get; set; }

        public string MenuName { get; set; }
        [Column(TypeName = "bit")]
        public bool Status { get; set; }
    }
}
