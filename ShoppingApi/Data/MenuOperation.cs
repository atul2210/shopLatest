using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ShoppingApi.Interfaces;
using ShoppingApi.Model;
namespace ShoppingApi.Data
{
    public class MenuOperation : Imenu
    {
        
        public List<MenuModel> getMenu()
        {

            var connectionString = Startup.connectionstring;
            var con = new ShoppingContext(connectionString);
            List<MenuModel> hierarchy = new List<MenuModel>();

            return hierarchy = con.Menu
                             .Where(c => c.ParentId == 0 && c.Status==true)
                             .Select(c => new MenuModel()
                             {
                                 Id = c.Id,
                                 MenuName = c.MenuName,
                                 ParentId = c.ParentId,
                                 MainMenuName = c.MainMenuName,
                                 SubMenuName = c.SubMenuName,
                                 MainTrigger = c.MainTrigger,
                                 SubTrigger =  c.SubTrigger,
                                 MainMenuId = c.MainMenuId,
                                 SubMenuId = c.SubMenuId,
                                 RouterLink = c.RouterLink,
                                 Children = GetChildren(hierarchy, c.Id)
                             }).ToList();

        }

        public static List<MenuModel> GetChildren(List<MenuModel> comments, int parentId)
        {
            var connectionString = Startup.connectionstring;
            var con = new ShoppingContext(connectionString);
            return con.Menu  //comments
                    .Where(c => c.ParentId == parentId && c.Status==true)
                    .Select(c => new MenuModel
                    {
                        Id = c.Id,
                        MenuName = c.MenuName,
                        ParentId = c.ParentId,
                        RouterLink = c.RouterLink,
                        MainMenuName =c.MainMenuName,
                        SubMenuName = c.SubMenuName,
                        MainTrigger = c.MainTrigger,
                        SubTrigger = c.SubTrigger,
                        MainMenuId = c.MainMenuId,
                        SubMenuId = c.SubMenuId,
                        Children = GetChildren(comments, c.Id)
                    }).ToList();
        }




    }
}
