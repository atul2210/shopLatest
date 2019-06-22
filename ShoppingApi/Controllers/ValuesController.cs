﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace ShoppingApi.Controllers
{
   /// [AutoValidateAntiforgeryToken]
    [Route("api/[controller]")]
    public class ValuesController : Controller
    {
        // GET api/values
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        [AutoValidateAntiforgeryToken]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        //[ValidateAntiForgeryToken]

        [IgnoreAntiforgeryToken]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        //[ValidateAntiForgeryToken]

        [IgnoreAntiforgeryToken]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        //[ValidateAntiForgeryToken]

        [IgnoreAntiforgeryToken]
        public void Delete(int id)
        {
        }
    }
}
