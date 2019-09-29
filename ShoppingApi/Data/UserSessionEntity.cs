using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingApi.Model
{
    [Table("UserSession")]
    public class UserSessionEntity
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int Id { get; set; }

        public string SessionKey { get; set; }
                     
        public string UserId { get; set; }

        [Column(TypeName = "bit")]
        public bool Active { get; set; }

    }


}
