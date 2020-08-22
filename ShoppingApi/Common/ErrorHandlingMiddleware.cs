using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ShoppingApi.Model;
using ShoppingApi.Data;

namespace ShoppingApi.Common
{
    public class ErrorHandlingMiddleware
    {
      
            private readonly RequestDelegate next;
            public ErrorHandlingMiddleware(RequestDelegate next)
            {
                this.next = next;
            }

            public async Task Invoke(HttpContext context /* other dependencies */)
            {
                try
                {
                    await next(context);
                }
                catch (Exception ex)
                {
                    await HandleExceptionAsync(context, ex);
                }
            }

            private static Task HandleExceptionAsync(HttpContext context, Exception ex)
            {
                var code = System.Net.HttpStatusCode.InternalServerError; // 500 if unexpected

                //if (ex is MyNotFoundException) code = System.Net.HttpStatusCode.NotFound;
                //else if (ex is MyUnauthorizedException) code = System.Net.HttpStatusCode.Unauthorized;
                //else if (ex is MyException) code = HttpStatusCode.BadRequest;

                var result = JsonConvert.SerializeObject(new { error = ex.Message });
                context.Response.ContentType = "application/json";
                context.Response.StatusCode = (int)code;
                var connectionString = Startup.connectionstring;

             var con = new ShoppingContext(connectionString);
            var log = new ErrorLoggerEntity() { ErrorDescription = ex.Message};
            con.ErrorLoggerEntity.Add(log);

            con.SaveChanges();
                return context.Response.WriteAsync(result);
            }
        }
    }

