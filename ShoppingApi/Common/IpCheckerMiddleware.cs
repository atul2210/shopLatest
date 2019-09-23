using System;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Configuration;
namespace ShoppingApi.Common
{
    public class IpCheckerMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<IpCheckerMiddleware> _logger;
        private readonly string _adminSafeList;
        private readonly RequestDelegate next;
        private IConfiguration _iConfiguration;
        public IpCheckerMiddleware(RequestDelegate next, ILogger<IpCheckerMiddleware> logger, string adminWhiteList, IConfiguration iconfiguration)
        {
            _adminSafeList = adminWhiteList;
            _next = next;
            _logger = logger;
            _iConfiguration = iconfiguration;


        }
     
        public  async  Task Invoke(HttpContext context)
        {
            var val = context.Request.Headers["Referer"].ToString();
            var origin = context.Request.Headers["Origin"].ToString();
            var corectorigin = _iConfiguration.GetSection("OriginUrl").Value;
            IPHostEntry iphostinfo = Dns.GetHostEntry(Dns.GetHostName());
          
            var remoteIp = context.Connection.RemoteIpAddress;
           

                string[] ip = _adminSafeList.Split(';');

                var bytes = remoteIp.GetAddressBytes();
                var badIP = true;
                foreach (var address in ip)
                {
                    var testIp = IPAddress.Parse(address);
                    if (testIp.GetAddressBytes().SequenceEqual(bytes))
                    {
                        badIP = false;
                        //break;
                        await _next.Invoke(context);
                        break;
                    }
                }

                if (badIP && origin.Trim()== corectorigin.Trim())
                {

                     await _next.Invoke(context);
                }


          else if (badIP)
                {
                    _logger.LogInformation($"Forbidden Request from Remote IP address: {remoteIp}");
                    context.Response.StatusCode = (int)HttpStatusCode.Forbidden;
                return;
                }
           // }

           

        }



    }
}
