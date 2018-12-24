using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShoppingApi.Data;
using ShoppingApi.Interfaces;

namespace ShoppingApi.Controllers
{
    [Produces("application/json")]
    [Route("api")]
    public class MenuController : Controller
    {
        Imenu _imenu;
        public MenuController(Imenu imenu)
        {
            _imenu = imenu;

        }

        [AllowAnonymous]
        [HttpGet, Route("menu/menuitems/")]
        public ActionResult MenuItems()
        {
            return Ok(_imenu.getMenu());


        }

    }
}