using ShoppingApi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Interfaces
{
    public interface Imenu
    {
        List<MenuModel>  getMenu();
    }
}
