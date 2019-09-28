using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using ShoppingApi.Model;
using ShoppingApi.Data;
using Microsoft.AspNetCore.Authorization;

namespace ShoppingApi.Controllers
{
    [AllowAnonymous]
    [Produces("application/json")]
    [Route("api/token")]
  //  [AutoValidateAntiforgeryToken]
    public class AddController : Controller
    {

        [HttpGet]
        [AutoValidateAntiforgeryToken]
        //public async Task<userDetails> token()
        public async Task<ActionResult> token()

        {


            byte[] encodedDataAsBytes = System.Convert.FromBase64String(Request.Headers["Authorization"]);

            string encodedText = Encoding.UTF8.GetString(encodedDataAsBytes);
            bool success = false;
            string authToken=null;
            string[] words=null;
            Operations operations = new Operations();
            userDetails lstToken = new userDetails();
            try { 
            if (encodedText != null && encodedText.Contains(":"))
            {
                words = encodedText.Split(':');
                lstToken = operations.AuthenticateUser(words[0],words[1]);
                success = true;
               
            }

            if (success == true)
            {
                    var claims = new[]
                    {
                        new Claim (JwtRegisteredClaimNames.Sub,words[0]),
                        new Claim (JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString())
                    };

                    var keyname = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("abcabcabcabcabcabcabcabcabcabc"));
                   ///////// var signInCred = new SigningCredentials(keyname, SecurityAlgorithms.HmacSha256Signature);
                   
                    var token = new JwtSecurityToken(
                        issuer: "lowCart.com",
                        audience: "lowCart.com",
                        expires: DateTime.Now.AddMinutes(20),
                        claims: claims,
                        signingCredentials: new Microsoft.IdentityModel.Tokens.SigningCredentials(keyname,SecurityAlgorithms.HmacSha256)
                        );

                    authToken = new JwtSecurityTokenHandler().WriteToken(token);
                    lstToken.details[0].token = authToken;


                    authToken = new JwtSecurityTokenHandler().WriteToken(token);
                    lstToken.details[0].token = authToken;
                    return Ok(new
                    {
                        authToken,
                        expiration = token.ValidTo,
                        fullname=lstToken.details[0].lastName +", "+ lstToken.details[0].firstName,
                        Email= lstToken.details[0].username
                    });

                }

            }



            catch (Exception ex)
            {
                var s = ex.Message;
            }



            return BadRequest("Something wrong has happened. Plase try again");
            //return lstToken;
        }

        [Authorize]
        [HttpGet]
        [AutoValidateAntiforgeryToken]

        [Route("api/checkout")]
        public IActionResult Checkout()
        {
            return Ok(null);

        }
     

    }
}