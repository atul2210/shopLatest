using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Antiforgery;
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
        private IAntiforgery _antiForgery;
        Imenu _imenu;
        public MenuController(Imenu imenu, IAntiforgery antiForgery)
        {
            _imenu = imenu;
            _antiForgery = antiForgery;
        }

        [AllowAnonymous]
        [HttpGet, Route("menu/menuitems/")]
        public ActionResult MenuItems()
        {
            var getcookies = Request.Cookies["XSRF-TOKEN"];

            if (getcookies == null)
            {
                var tokens = _antiForgery.GetAndStoreTokens(HttpContext);
                Response.Cookies.Append("XSRF-TOKEN", tokens.RequestToken, new Microsoft.AspNetCore.Http.CookieOptions
                {
                    HttpOnly = false,
                    Path = "/",
                    Expires = DateTime.Now.AddHours(10),
                    SameSite = SameSiteMode.Lax,
                    Secure=false,
                    
                });
            }
            return Ok(_imenu.getMenu());
                    


        }

    }
}