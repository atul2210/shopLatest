using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class States
    {
        public int Stateid { get; set; }
        public string StateName { get; set; }
        public int ParentStateId { get; set; }
        public string City { get; set; }
        public bool Active { get; set; }
    }
}
