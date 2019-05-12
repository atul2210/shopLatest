using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Data
{
    [Table("ErrorLogging")]

    public class ErrorLoggerEntity
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int id { get; set; }

        public string ErrorDescription { get; set; }

        
    }
}

   