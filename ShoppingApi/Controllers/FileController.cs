using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using ShoppingApi.Interfaces;
using ShoppingApi.SmsNotifications.MessageFactory;

namespace ShoppingApi.Controllers
{

    [Produces("application/json")]
    [Route("api/")]
   // [AutoValidateAntiforgeryToken]
    public class FileController : Controller

    {

        private IConfiguration _configuration;
        Ioperation _operations;
        private IHostingEnvironment _env;
        private readonly IOptions<fileSettingReader> appSettings;

        public FileController(IHostingEnvironment env ,IConfiguration configuration, IOptions<fileSettingReader> app, Ioperation operation)
        {
            _configuration = configuration;
            _operations = operation;
            appSettings = app;
            _env = env;
        }

        [AllowAnonymous]
        [HttpGet, Route("file/images/")]
        [AutoValidateAntiforgeryToken]
        public async Task<IActionResult> getimages()
        {
            var webRoot = _env.WebRootPath;
            var data = _operations.getAllImmages( webRoot + @"\" + appSettings.Value.fileName);


            List<string> name = new List<string>();
            foreach (var val in data.Result)
            {
                name.Add(System.IO.Path.Combine(webRoot, val.fileName));
            }
            return Ok(name);
         //   var data = _operations.getAllImmages(appSettings.Value.fileName);

           // return  Ok(_operations.getAllImmages(appSettings.Value.fileName));
        }

    }
}