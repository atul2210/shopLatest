using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShoppingApi.Model;
using ShoppingApi.Data;
using Microsoft.AspNetCore.Authorization;

namespace ShoppingApi.Controllers
{
    [Produces("application/json")]
    [Route("api/")]
    public class UserController : Controller
    {

        Operations _operations;

        [AllowAnonymous]
        [HttpPost, Route("User/NewUser/")]
        public IActionResult AddUser([FromBody] User userData)
        {
            _operations = new Operations();
            return Ok(_operations.addUser(userData));
        }

    }
}