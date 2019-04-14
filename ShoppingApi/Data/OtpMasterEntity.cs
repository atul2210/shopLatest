using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ShoppingApi.Data
{
    [Table("OTPMaster")]
    public class OtpMasterEntity
    {

        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int Id { get; set; }

        public string Mobile { get; set; }

        [Column(TypeName = "numeric(18,0)")]
        public int OtpNumber { get; set; }

        public string OtpText { get; set; }

        public string SenderIP { get; set; }
        public string SenderBrowser { get; set; }

        [Column(TypeName = "int")]
        public int SenderAttempt { get; set; }

        [Column(TypeName = "datetime")]
        public DateTime SenderDateTime { get; set; }

        [Column(TypeName = "bit")]
        public bool Active { get; set; }



    }
}
