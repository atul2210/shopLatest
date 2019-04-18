using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ShoppingApi.Data
{
    [Table("user")]
    public class UserRegistrationEntity
    {
      
        [Column(TypeName = "nvarchar(50)")]
        [Key]
        public string Email { get; set; }

        [Column(TypeName = "nvarchar(max)")]
        public string salt { get; set; }

        [Column(TypeName = "nvarchar(max)")]
        public string hash { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string FirsName { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string MiddleName { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string LastName { get; set; }

        [Column(TypeName = "numeric(18,0)")]
        public double Mobile { get; set; }

        [Column(TypeName = "numeric(18,0)")]
        public double? UlternateMobile { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string City { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string State { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string Pin { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public string Address { get; set; }


    }
}
