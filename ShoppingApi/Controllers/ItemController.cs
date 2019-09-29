using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShoppingApi.Model;
using ShoppingApi.Data;

using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using ShoppingApi.PageQuery;
using ShoppingApi.Interfaces;
using ShoppingApi.Email;
using Microsoft.Extensions.Options;
using ShoppingApi.Common;

namespace ShoppingApi.Controllers
{
   [Authorize]
    [Produces("application/json")]
    [Route("api/")]
   // [ValidateAntiForgeryToken]
  //  [AutoValidateAntiforgeryToken]
   
    public class ItemController : Controller
    {
        private IOptions<EmailSettings> _emailSettings;
        Ioperation _operations;
        IUserSession _iusersession;
        public ItemController(Ioperation operations, IOptions<EmailSettings> emailSettings, IUserSession iusersession)
        {
            _operations = operations;
            _emailSettings = emailSettings;
            _iusersession = iusersession;
        }

     
       [AllowAnonymous]
        [AutoValidateAntiforgeryToken]
        [HttpGet, Route("items/AllItems/")]

        public  IActionResult AllItems(int ChildMenuId, PageAndSortedQuery<ItemDetailsQuery> query)
        {
            try
            {
                return  Ok(_operations.getItems(ChildMenuId, query));
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        [AllowAnonymous]
        [HttpGet, Route("items/itemDetail/")]
              [AutoValidateAntiforgeryToken]
        //  [ValidateAntiForgeryToken]
        public Items itemDetail(int itemId)
        {


            Items items = null;
            try
            {
                items = _operations.getItemDetail(itemId);
                return items;
            }

            catch (Exception ex)
            {
                throw ex;

            }

        }


        [HttpPost, Route("items/addCart/")]
        //[ValidateAntiForgeryToken]

        [IgnoreAntiforgeryToken]
        [Authorize]
        public AddToCart adaddCart([FromQuery]  int itemid, [FromQuery]int quantity, string sessionId)
        {
            AddToCart addCart = null;
            string ipAddress = string.Empty;
            try
            {
                ipAddress = HttpContext.Connection.RemoteIpAddress.ToString();
                addCart = _operations.getAddToCart(itemid, ipAddress, quantity,sessionId);
            }

            catch (Exception ex)
            {
                throw ex;

            }
            return addCart;

        }

        [Authorize]
        [HttpGet, Route("items/getcheckedinItem/")]
        [AutoValidateAntiforgeryToken]

        public List<checkedInItem> checkedInIten(string userSession)
        {
            var data = _operations.getCheckInItem(userSession);
            return data;
        }

        [AllowAnonymous]
        [HttpGet, Route("items/AllItemsOnPaging/")]
             [AutoValidateAntiforgeryToken]
        [Produces(typeof(PageResult<ItemMaster>))]
        public IActionResult AllItemsOnPaging(PageAndSortedQuery<ItemDetailsQuery> query)

        { 
            PageResult<ItemMaster> data = null;
            try
            {
                
               return Ok(_operations.GetPageItemsList(query));
            }

            catch(Exception e)
            {
                return (BadRequest());

            }


        }

        private string getToken()
        {
            string authToken = null;

                    
            var claims = new[]
                {
                    new Claim(ClaimTypes.Name, "aaaaa")
                    
                };
            var keyname = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdc"));
            var signInCred = new SigningCredentials(keyname, SecurityAlgorithms.HmacSha256Signature);
            var token = new JwtSecurityToken(
                issuer: "lowCart.com",
                audience: "lowCart.com",
                expires: DateTime.Now.AddMinutes(1),
                claims: claims,
                signingCredentials: signInCred
                );

            authToken = new JwtSecurityTokenHandler().WriteToken(token);

            return authToken;
        }


        [AllowAnonymous]
        [HttpGet, Route("items/SearchItem/")]
        [AutoValidateAntiforgeryToken]
        public IActionResult SearchItems(PageAndSortedQuery<ItemDetailsQuery> query,string itemSearch)
        {
            return Ok(_operations.Search(itemSearch,query));
        }

        [Authorize]
        [HttpPost, Route("items/RemoveItems/")]
        //[ValidateAntiForgeryToken]

        [IgnoreAntiforgeryToken]
        public IActionResult RemoveItems(int itemId, int returnedItemQty, string sessionId, int checkedinId)
        {
            return Ok(_operations.RemoveItems(itemId, returnedItemQty, sessionId, checkedinId));
        }

        [Authorize]
        [HttpPost, Route("items/CheckoutPaymentReceived/")]
        //[ValidateAntiForgeryToken]

        [IgnoreAntiforgeryToken]
        public IActionResult PaymentReceived(string emailId, string UserSession, [FromBody] List<checkedInItem> paymentreceived)
        {
            if(emailId==null || emailId==string.Empty || emailId=="undefined")
            {
                return BadRequest("Invalid Email id.  Please login again");
            }
            List<UserSessionDto> sessionData = _iusersession.GetUserSession(UserSession);

            if (EmailValidator.IsValidEmail(sessionData[0].UserId))
            {
                var emailsettin = new EmailSettings()

                {
                    UsernameEmail = _emailSettings.Value.UsernameEmail,
                    CcEmail = _emailSettings.Value.CcEmail,
                    FromEmail = _emailSettings.Value.FromEmail,
                    PrimaryDomain = _emailSettings.Value.PrimaryDomain,
                    PrimaryPort = _emailSettings.Value.PrimaryPort,
                    SecondaryPort = _emailSettings.Value.SecondaryPort,
                    SecondayDomain = _emailSettings.Value.SecondayDomain,
                    ToEmail = sessionData[0].UserId,//_emailSettings.Value.ToEmail,
                    UsernamePassword = _emailSettings.Value.UsernamePassword


                };
                return Ok(_operations.PaymentReceived(emailId, UserSession, paymentreceived, emailsettin));
            }
            else
            {
                return BadRequest("Invalid Email id.  Please login again");

            }
           
            //return Ok(paymentreceived);
          
        }

    }
}