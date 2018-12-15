using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class MenuModel
    {
        public int Id { get; set; }
        public string MenuName { get; set; }
        public int ParentId { get; set; }
        public bool Status { get; set; }
        public List<MenuModel> Children { get; set; }
    }
}
