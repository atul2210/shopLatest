using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
namespace ShoppingApi.Model
{
    public class User
    {
        public string emailId { get; set; }
        public string password { get; set; }
        public string firstName { get; set; }
        public string middleName { get; set; }
        public string lastName { get; set; }
        public string mobile { get; set; }
        public string ulternateMobile { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string address { get; set; }
        public string pin { get; set; }

    }
}
