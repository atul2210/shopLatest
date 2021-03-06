﻿using System;
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


namespace ShoppingApi.Controllers
{
   [Authorize]
    [Produces("application/json")]
    [Route("api/")]


    public class ItemController : Controller
    {
        Operations _operations;

        public ItemController()
        {
            _operations = new Operations();
        }

        //  [HttpGet, Route("items/AllItems/{categoryId},{pageIndex}")]
       // [Authorize]
       [AllowAnonymous]
        [HttpGet, Route("items/AllItems/")]

        public GetAllItems AllItems(int categoryId, int pageIndex)
        {


            GetAllItems items = null;
            try
            {
                items = _operations.getItems(categoryId, pageIndex);
                return items;
            }

            catch (Exception ex)
            {
                throw ex;

            }

        }

        [AllowAnonymous]
        [HttpGet, Route("items/itemDetail/")]
        [ValidateAntiForgeryToken]
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


        /// <summary>
        /// Saving add to cart items to DB table checkin and getting response.  
        ///  // </summary>
        /// <param name="itemid"></param>
        /// <param name="quantity"></param>
        /// <param name="color"></param>
        /// <returns></returns>t
        [HttpPost, Route("items/addCart/")]
        [AllowAnonymous]
        public AddToCart adaddCart([FromQuery]  int itemid, [FromQuery]int quantity, [FromQuery]string color,string sessionId,double price,double offerprice,double deliverycharges)
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
                addCart = _operations.getAddToCart(itemid, ipAddress, quantity, color, sessionId, price,offerprice,deliverycharges);


            }

            catch (Exception ex)
            {
                throw ex;

            }
            return addCart;

        }

        [AllowAnonymous]
        [HttpGet, Route("items/getcheckedinItem/")]

        //public async List<Task<checkedInItem>> checkedInIten(string userSession)
        public List<checkedInItem> checkedInIten(string userSession)
        {
            var data = _operations.getCheckInItem(userSession);
            return data;
        }

        [AllowAnonymous]
        [HttpGet, Route("items/AllItemsOnPaging/")]
       [Produces(typeof(PageResult<ItemMaster>))]
        public IActionResult AllItemsOnPaging(PageAndSortedQuery<ItemDetailsQuery> query)

        { 
            PageResult<ItemMaster> data = null;
            try
            {
                //data = _operations.GetPageItemsList(query);
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

                     //  var claimData = new[] { new Claim(ClaimTypes.Name, "data.userId") };
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
        [HttpPost, Route("items/RemoveItems/")]
        public IActionResult RemoveItems(int itemId, int returnedItemQty,string sessionId, int checkedinId)
        {
            return Ok(_operations.RemoveItems(itemId, returnedItemQty,sessionId,checkedinId));
        }
    }
}