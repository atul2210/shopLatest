using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.AspNetCore.Session;
using Swashbuckle.AspNetCore.Swagger;

using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Microsoft.EntityFrameworkCore;
using ShoppingApi.Data;
using System.Net.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Antiforgery;
using ShoppingApi.Interfaces;
using ShoppingApi.Email;
using ShoppingApi.Common;

namespace ShoppingApi
{
    public class Startup
    {
        public Startup(IConfiguration configuration, IHostingEnvironment env)
        {
            Configuration = configuration;

            var builder = new ConfigurationBuilder()
            .SetBasePath(env.ContentRootPath)
            .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);

            smsSettings = builder.Build();
            var ss = env.IsDevelopment();


        }

        public IConfiguration Configuration { get; }

        public IConfigurationRoot smsSettings { get; set; }


        //  public IConfiguration Configuration { get; set; }
        public static string connectionstring { get; set; }
        


        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddSwaggerGen(options =>
            {
                options.SwaggerDoc("help", new Info
                {
                    Title = "Safety for All Help",
                    Version = "v1"
                });
            });


            //jwt 14 October 2018
            //////services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            //////    .AddJwtBearer(options =>
            //////    {
            //////        options.Authority = "lowCart.com";
            //////        options.Audience = "lowCart.com";
            //////    });

            // jwt 14 October end here 

            /////////*
            ////////            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            ////////                .AddJwtBearer(options =>
            ////////                {
            ////////                    options.TokenValidationParameters = new TokenValidationParameters
            ////////                    {

            ////////                        ValidateIssuer = true,
            ////////                        ValidateAudience = false,
            ////////                        ValidateLifetime = true,
            ////////                        ClockSkew = TimeSpan.FromMinutes(2),
            ////////                        ValidateIssuerSigningKey = true,
            ////////                        ValidIssuer = "lowCart.com",
            ////////                        ValidAudience = "lowCart.com",
            ////////                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("abcabcabcabcabcabcabcabcabcabc"))
            ////////                    };
            ////////                });


            ////////    */

            services.AddAuthentication(opt =>
            {
                opt.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                opt.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                opt.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(opt =>
            {
                opt.SaveToken = true;
                opt.RequireHttpsMetadata = false;
                opt.TokenValidationParameters = new TokenValidationParameters()
                {

                    ValidateIssuer = true,
                    ValidateAudience = false,
                    ValidIssuer = "lowCart.com",
                    ValidAudience = "lowCart.com",
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("abcabcabcabcabcabcabcabcabcabc"))
                };

            });

            //xsrf AntiForgeryToken Feature

            services.AddAntiforgery(options =>
            {
                options.HeaderName = "X-XSRF-TOKEN";

                options.CookiePath = "/";
                options.FormFieldName = "AntiforgeryFieldname";


            });
            services.Configure<EmailSettings>(Configuration.GetSection("EmailSettings"));
            services.AddCors();
            services.AddMvc();



            //Add database services.
            connectionstring = this.Configuration.GetConnectionString("ShoppingConnectionString");
           

            services.AddSingleton<IConfiguration>(Configuration);
          
            // 

            services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromMinutes(20);
                options.CookieHttpOnly = true;

            });

            services.AddOptions();
            services.Configure<SmsNotifications.MessageFactory.SmsSettingReader>(Configuration.GetSection("SmsAndOTP"));
            services.Configure<SmsNotifications.MessageFactory.fileSettingReader>(Configuration.GetSection("FileSettings"));


            services.AddDbContext<ShoppingContext>(options => options.UseSqlServer(connectionstring));
            services.AddSingleton<Microsoft.AspNetCore.Http.IHttpContextAccessor, Microsoft.AspNetCore.Http.HttpContextAccessor>();

            services.AddTransient<Imenu, MenuOperation>();
            services.AddTransient<Ioperation, Operations>();
            services.AddTransient<IEmailSender, AuthMessageSender>();
            services.AddTransient<IotpChecker, OtpChecker>();
        }
        

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        //public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, IAntiforgery antiforgery)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            //app.UseAuthentication(); //commented on 14 October 2018

            app.UseSession();

            app.UseSwagger();
            app.UseSwaggerUI(options =>
            {
                options.SwaggerEndpoint(
                  "/swagger/help/swagger.json", "Safety for All API");
            });

            //app.UseCors(
            //      options => options.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader().AllowCredentials());

            //This way Angulra is ready to read/access the cookies
            app.Use(async (context, next) =>
            {
                string path = "/";
                string path1 = context.Request.Path.Value;
                if (path1 != null && path1.Contains("menu"))
                {
                    // XSRF-TOKEN used by angular in the $http if provided
                    var tokens = antiforgery.GetAndStoreTokens(context);
                    context.Response.Cookies.Append("XSRF-TOKEN",
                      tokens.RequestToken, new CookieOptions()
                      {
                          HttpOnly = false

                          //Secure = true
                      }
                    );
                }

                await next();
                //return next();      
            });

            app.UseCors(
                 options => options.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader().AllowCredentials());
           

            app.UseAuthentication();
            app.UseMiddleware(typeof(ErrorHandlingMiddleware));
            
            app.UseMvc();

        }
    }
}
