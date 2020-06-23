using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Data
{
    [Table("States")]
    public class StatesEntity
    {
            [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
            [Column(TypeName = "int")]
            public int StateId { get; set; }
            [Column(TypeName = "nvarchar(50)")]
            public string StateName { get; set; }
    }
}
