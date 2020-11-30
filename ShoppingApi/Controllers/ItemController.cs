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
using System.IO;
using System.Net.Http.Headers;
using Microsoft.AspNetCore.Http.Internal;

namespace ShoppingApi.Controllers
{
    [Authorize]
    [Produces("application/json")]
    [Route("api/")]
    // [ValidateAntiForgeryToken]
    //  [AutoValidateAntiforgeryToken]

    public class ItemController : ControllerBase
    {
        private IOptions<EmailSettings> _emailSettings;
        Ioperation _operations;
        IUserSession _iusersession;
        private IConfiguration _iConfiguration;
        public ItemController(Ioperation operations, IOptions<EmailSettings> emailSettings, IUserSession iusersession, IConfiguration iConfiguration)
        {
            _operations = operations;
            _emailSettings = emailSettings;
            _iusersession = iusersession;
            _iConfiguration = iConfiguration;
        }


        [AllowAnonymous]
        [AutoValidateAntiforgeryToken]
        [HttpGet, Route("items/AllItems/")]
        [ResponseCache(Duration = 50)]
        public IActionResult AllItems(int ChildMenuId, PageAndSortedQuery<ItemDetailsQuery> query)
        {
            try
            {
                return Ok(_operations.getItems(ChildMenuId, query));
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
        public AddToCart adaddCart([FromQuery] int itemid, [FromQuery] int quantity, [FromQuery] string UserSessioin)
        {
            ///// string sessionId = string.Empty;
            AddToCart addCart = null;
            if (UserSessioin == "null" || UserSessioin == String.Empty || UserSessioin == "" || UserSessioin == null)
            {
                UserSessioin = GetSessionToken();
            }
            string ipAddress = string.Empty;
            try
            {
                ipAddress = HttpContext.Connection.RemoteIpAddress.ToString();
                addCart = _operations.getAddToCart(itemid, ipAddress, quantity, UserSessioin);
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
        //[ResponseCache(Duration = 50)]
        [Produces(typeof(PageResult<ItemMaster>))]
        public IActionResult AllItemsOnPaging(PageAndSortedQuery<ItemDetailsQuery> query)

        {
            PageResult<ItemMaster> data = null;
            try
            {

                return Ok(_operations.GetPageItemsList(query));
            }

            catch (Exception e)
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
        public IActionResult SearchItems(PageAndSortedQuery<ItemDetailsQuery> query, string itemSearch)
        {
            return Ok(_operations.Search(itemSearch, query));
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
        public IActionResult PaymentReceived(string UserSession, int PaymentOption, [FromBody] User user)
        {

            //List<UserSessionDto> sessionData = _iusersession.GetUserSession(UserSession);

            // if (EmailValidator.IsValidEmail(sessionData[0].UserId))
            // {
            var emailsettin = new EmailSettings()

            {
                UsernameEmail = _emailSettings.Value.UsernameEmail,
                CcEmail = _emailSettings.Value.CcEmail,
                FromEmail = _emailSettings.Value.FromEmail,
                PrimaryDomain = _emailSettings.Value.PrimaryDomain,
                PrimaryPort = _emailSettings.Value.PrimaryPort,
                SecondaryPort = _emailSettings.Value.SecondaryPort,
                SecondayDomain = _emailSettings.Value.SecondayDomain,
                // ToEmail = sessionData[0].UserId,//_emailSettings.Value.ToEmail,
                ToEmail = user.emailId,// _emailSettings.Value.ToEmail,
                UsernamePassword = _emailSettings.Value.UsernamePassword
            };

            if (emailsettin.ToEmail == null || emailsettin.ToEmail == string.Empty || emailsettin.ToEmail == "undefined")
            {
                return BadRequest("Invalid Email id.  Please login again");
            }

            bool sendEmail = Convert.ToBoolean(_iConfiguration.GetSection("SendMail").Value);

            _operations.PaymentReceived(emailsettin.ToEmail, UserSession, emailsettin, user, sendEmail, PaymentOption);
            _operations.DeActivatesAfterPaymentReceived(UserSession);
            return Ok("Order Placed successfully.");
        }
        //else
        //{
        //    return BadRequest("Invalid Email id.  Please login again");

        //  }

        //return Ok(paymentreceived);

        //}

        [AllowAnonymous]
        [HttpGet, Route("items/PaymenOptions")]
        [IgnoreAntiforgeryToken]
        public async Task<IActionResult> PaymenOptions()
        {
            return Ok(await _operations.PaymenOpions());
        }



        //   [AllowAnonymous]
        [HttpPut, Route("items/EditAddress")]
        [IgnoreAntiforgeryToken]
        public IActionResult EditAddress([FromBody] EditAddress editUserAddress)
        {
            return Ok(_operations.EditAddress(editUserAddress));
        }
        private string GetSessionToken()
        {
            string authToken = null;
            var claims = new[]
                    {
                        new Claim (JwtRegisteredClaimNames.Sub,"usersession"),
                        new Claim (JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString())
                    };

            var keyname = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("abcabcabcabcabcabcabcabcabcabc"));


            var token = new JwtSecurityToken(
                issuer: "lowCart.com",
                audience: "lowCart.com",
                expires: DateTime.Now.AddMinutes(20),
                claims: claims,
                signingCredentials: new Microsoft.IdentityModel.Tokens.SigningCredentials(keyname, SecurityAlgorithms.HmacSha256)
                );

            authToken = new JwtSecurityTokenHandler().WriteToken(token);
            //lstToken.details[0].token = authToken;


            authToken = new JwtSecurityTokenHandler().WriteToken(token);
            return authToken;

        }



        [HttpPost, Route("item/AddNewItem")]
        [IgnoreAntiforgeryToken]
        [Produces("application/json")]
        [AllowAnonymous]
        public async Task<IActionResult> AddNewItem(AddItem NewItem)
        {
            try
            {
                var file = Request.Form.Files[0];

                var folderName = Path.Combine("Resources", "Images");
                var pathToSave = Path.Combine(Directory.GetCurrentDirectory(), folderName);
                if (file.Length > 0)
                {
                    var fileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    var fullPath = Path.Combine(pathToSave, fileName);
                    var dbPath = Path.Combine(folderName, fileName);
                    using (var stream = new FileStream(fullPath, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }
                    return Ok(new { dbPath });
                }
                else
                {
                    return BadRequest();
                }
               
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex}");
            }
        
            ///return Ok(await _operations.AddNewItem(NewItem));
        }

        [HttpGet, Route("item/AddNewItemRequest")]
        [IgnoreAntiforgeryToken]
        [AllowAnonymous]
        public async Task<IActionResult> AddNewItemRequest()
        {
            return Ok(await _operations.GetNewItemRequest());
        }

        [HttpPost, Route("item/UploadNewItem")]
        [IgnoreAntiforgeryToken]
        [AllowAnonymous]
        [HttpPost, DisableRequestSizeLimit]
        public async Task<IActionResult> UploadNewItem()
        {
            try
            {
                var file = Request.Form.Files[0];

                var folderName = Path.Combine("Resources", "Images");
                var pathToSave = Path.Combine(Directory.GetCurrentDirectory(), folderName);
                if (file.Length > 0)
                {
                    var fileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    var fullPath = Path.Combine(pathToSave, fileName);
                    var dbPath = Path.Combine(folderName, fileName);
                    using (var stream = new FileStream(fullPath, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }
                    return Ok(new { dbPath });
                }
                else
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex}");
            }

        }
        

        [HttpGet, Route("item/SubMenu")]
        [IgnoreAntiforgeryToken]
        [AllowAnonymous]
        public async Task<IActionResult> SubMenu(int ParentId)
        {
            return Ok(await _operations.GetSubMenu(ParentId));
        }


    }

}