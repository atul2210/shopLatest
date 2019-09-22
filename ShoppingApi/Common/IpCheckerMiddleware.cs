using System;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;

namespace ShoppingApi.Common
{
    public class IpCheckerMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<IpCheckerMiddleware> _logger;
        private readonly string _adminSafeList;

        private readonly RequestDelegate next;
        public IpCheckerMiddleware(RequestDelegate next, ILogger<IpCheckerMiddleware> logger, string adminWhiteList)
        {
            _adminSafeList = adminWhiteList;
            _next = next;
            _logger = logger;
        }

        public  async  Task Invoke(HttpContext context)
        {
            //if (context.Request.Method != "GET")
            //{
                var remoteIp = context.Connection.RemoteIpAddress;
               // _logger.LogDebug($"Request from Remote IP address: {remoteIp}");

                string[] ip = _adminSafeList.Split(';');

                var bytes = remoteIp.GetAddressBytes();
                var badIP = true;
                foreach (var address in ip)
                {
                    var testIp = IPAddress.Parse(address);
                    if (testIp.GetAddressBytes().SequenceEqual(bytes))
                    {
                    badIP = false;
                        break;
                    }
                }

                if (badIP)
                {
                    _logger.LogInformation($"Forbidden Request from Remote IP address: {remoteIp}");
                    context.Response.StatusCode = (int)HttpStatusCode.Forbidden;
                return;
                }
           // }

            await _next.Invoke(context);

        }



    }
}
