using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class Menu
    {

        public int Id { get; set; }
        public int ParentId { get; set; }

        public string MenuName { get; set; }
        public string MainMenuName { get; set; }
        public string SubMenuName { get; set; }
        public string RouterLink { get; set; }
        public string MainTrigger { get; set; }
        public string SubTrigger { get; set; }
        public string MainMenuId { get; set; }
        public string SubMenuId { get; set; }
        public bool Status { get; set; }
    }
}
