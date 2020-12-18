using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace ShoppingApi.Model
{
    [Table("GroupMaster")]
    public class GroupMasterEntity

    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(TypeName = "int")]
        public int GroupId { get; set; }

        public string CreatedBy { get; set; }

        [Column(TypeName = "int")]
        public int SupplierId { get; set; }

       // [Column(TypeName = "datetime")]
        public DateTime? CreateDate { get; set; }

        //[Column(TypeName = "datetime")]
       // public DateTime ModifyDate { get; set; }

        [Column(TypeName = "bit")]
        public bool Active { get; set; }

    }
}
