using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class Supplier
    {
        public int SupplierId { get; set; }
        public string SupFirstName { get; set; }
        public string SupMidName { get; set; }
        public string SupLastName { get; set; }
        public string SupAdd1 { get; set; }
        public string SupAdd2 { get; set; }
        public string SupAdd3 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Pin { get; set; }
       public bool Active { get; set; } = true;
    }
}
