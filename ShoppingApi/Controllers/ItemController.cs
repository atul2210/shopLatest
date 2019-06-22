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

namespace ShoppingApi.Controllers
{
   [Authorize]
    [Produces("application/json")]
    [Route("api/")]
   // [ValidateAntiForgeryToken]
  //  [AutoValidateAntiforgeryToken]
   
    public class ItemController : Controller
    {
    
        Ioperation _operations;
        public ItemController(Ioperation operations )
        {
            _operations = operations;
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
        [AllowAnonymous]
        public AddToCart adaddCart([FromQuery]  int itemid, [FromQuery]int quantity, [FromQuery]string color,string sessionId,double price,double offerprice,double deliverycharges,int ColorId)
        {
            AddToCart addCart = null;
           
        

            string ipAddress = string.Empty;
            try
            {

                if (sessionId== "null" || sessionId == null || sessionId == string.Empty || sessionId == "")
                {
                    sessionId = getToken(); ;

                }
                ipAddress = HttpContext.Connection.RemoteIpAddress.ToString();
                addCart = _operations.getAddToCart(itemid, ipAddress, quantity, color, sessionId, price,offerprice,deliverycharges, ColorId);


            }

            catch (Exception ex)
            {
                throw ex;

            }
            return addCart;

        }

        [AllowAnonymous]
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

        [AllowAnonymous]
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
            //return Ok(paymentreceived);
            return Ok(_operations.PaymentReceived(emailId,UserSession, paymentreceived));
        }

    }
}