using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class AddItemRequest
    { 
        public List<Supplier> SupplierList { get; set; }
        public List<Size> Sizes { get; set; }
        public List<Menu> Menu { get; set; }
        public List<Color> Colors { get; set; }
                       
    }
 }
