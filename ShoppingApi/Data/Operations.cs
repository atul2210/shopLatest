using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using ShoppingApi.Model;
using ShoppingApi.PageQuery;
using ShoppingApi.Interfaces;
using ShoppingApi.Security.Hashing;
using System.IO;
using Microsoft.AspNetCore.Hosting;
using ShoppingApi.Common;
using ShoppingApi.Email;
using System.Text;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using System.Net.Http.Headers;

namespace ShoppingApi.Data
{
    public class Operations : Ioperation
    {
        public PageResult<ItemMaster> getItems(int childmenuid, PageAndSortedQuery<ItemDetailsQuery> query)
        {

            try
            {

                var connectionString = Startup.connectionstring;

                var con = new ShoppingContext(connectionString);
                var searchResult = con.itemMasterEntity.Where(m => m.ChildMenuId == childmenuid && m.Active == true && m.AvailableQty > 0)
                .Select(x => new ItemMaster
                {
                    ItemName = x.ItemName.Trim(),
                    Active = x.Active,
                    AvailableColor = x.AvailableColor.Trim(),
                    AvailableQty = x.AvailableQty,
                    brand = x.brand.Trim(),
                    childmenuid = x.ChildMenuId,

                    detailId = x.detailId,
                    InitialQty = x.InitialQty,
                    DeliveryCharges = x.deliveryCharges,
                    itemDescription = x.ItemDescripton.Trim(),
                    OfferPrice = x.OfferPrice,
                    Price = x.Price,
                    ReserveQty = x.ReserveQty,
                    SizeId = x.SizeId,
                    itemid = x.ItemId,
                    ColorId = x.ColorId,
                    //                    Image1 = x.Image1 == null ? " " : Convert.ToBase64String(x.Image1),

                    Image1 = GetBase64Image(x.Image1) //"data:image/jpeg;base64," + Convert.ToBase64String(File.ReadAllBytes(x.Image1)), //x.cm.item.Image1 == null ? " " : x.cm.item.Image1, //System.IO.File.ReadAllBytes(x.Image1) //x.Image1 == null ? " ": x.Image1,

                    // Image2 = x.Image1 == null ? " " : Convert.ToBase64String(x.Image2),
                    // Image3 = x.Image1 == null ? " " : Convert.ToBase64String(x.Image3),
                })
                .ApplySorting(query)
                .Paging(query);

                return searchResult;
            }


            catch
            {
                throw;
            }
            // return items;
        }


        public Items getItemDetail(int itemId)
        {
            Items items = null;

            try
            {

                var connectionString = Startup.connectionstring;
                var con = new ShoppingContext(connectionString);

                items = con.itemMasterEntity.Where(m => m.ItemId == itemId && m.AvailableQty > 0 && m.Active == true).Join(con.ColorMasterEntity, item => item.ColorId, clr => clr.Colorid,
                (item, clr) => new
                {
                    item,
                    clr
                })
                .Join(con.SizeMasterEntity, cm => cm.item.SizeId, size => size.SizeId,
                  (cm, size) => new { cm, size })
                
                .Select(x => new Items
                {
                    itemid = x.cm.item.ItemId,
                    itemName = x.cm.item.ItemName.Trim(),
                    itemDescription = x.cm.item.ItemDescripton.Trim(),
                    sizeId = x.cm.item.AvailableQty,
                    sizeName = x.size.SizeName,
                    price = x.cm.item.Price,
                    offerPrice = x.cm.item.OfferPrice,
                    color = x.cm.clr.ColorName,
                    brand = x.cm.item.brand.Trim(),
                    deliveryCharges = x.cm.item.deliveryCharges,
                    availableQty = x.cm.item.AvailableQty,
                    availableColor = x.cm.item.AvailableColor,
                    colorId = x.cm.clr.Colorid,
                    Image1 = GetBase64Image(x.cm.item.Image1), // System.IO.File.ReadAllBytes(x.cm.item.Image1)///x.cm.item.Image1 == null ? " " : x.cm.item.Image1
                    //Image1 = x.cm.item.Image1 == null ? " " : Convert.ToBase64String(x.cm.item.Image1),
                    //  Image2 = x.cm.item.Image1 == null ? " " : Convert.ToBase64String(x.cm.item.Image2),
                    //  Image3 = x.cm.item.Image1 == null ? " " :  Convert.ToBase64String(x.cm.item.Image3),

                    ImageSmall3 = x.cm.item.ImageSmall3==null?null:SplitToArray( x.cm.item.ImageSmall3, '#')


                })
               
                .AsQueryable().SingleOrDefault();


                var grpId = con.itemMasterEntity.Where(xx => xx.ItemId == itemId).FirstOrDefault();

                var gorupId = con.itemMasterEntity.Where(x => x.GroupId == grpId.GroupId)
                   .Join(con.SizeMasterEntity, im => im.SizeId, ssm => ssm.SizeId, (im, sm) =>
                         new { im, sm })
                   .Select(xx => new GroupMaster (){ SizeIdy = xx.im.SizeId, GroupId = xx.im.GroupId, SizeName = xx.sm.SizeName,ItemId=xx.im.ItemId })
                   .ToList();

                if (items != null)
                {
                    items.AvailableSize = gorupId;
                }





                con.Dispose();

            }

            catch
            {

                throw;
            }

            return items;
        }




        public AddToCart getAddToCart(int itemId, string IPAddress, int quantity, string sessionid)
        {


            AddToCart items = null;
            try
            {
                var connectionString = Startup.connectionstring;
                var condb = new ShoppingContext(connectionString);


                //cross check if someone change quantity,price,officeprice using fiddler

                var inputItems = condb.itemMasterEntity.Where(x => x.ItemId == itemId && x.Active == true)
                                    .Select(m => new AddToCart
                                    {


                                        price = m.Price,
                                        offerPrice = m.OfferPrice,
                                        DeliveryCharges = m.deliveryCharges,
                                        colorId = m.ColorId,
                                        quantity = m.AvailableQty
                                    }).FirstOrDefault();


                if(quantity> inputItems.quantity)
                {
                    throw new Exception("Quantity Not Available");
                }


                if (inputItems != null && inputItems.quantity > 0 && quantity<= inputItems.quantity)
                {
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        SqlCommand cmd = new SqlCommand("AddToCart", con);
                        SqlDataAdapter da = new SqlDataAdapter(cmd);

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@itemId", itemId);
                        cmd.Parameters.AddWithValue("@IPAddress", IPAddress);
                        cmd.Parameters.AddWithValue("@Quantity", quantity);
                        cmd.Parameters.AddWithValue("@sessionid", sessionid);

                        cmd.Parameters.AddWithValue("@price", inputItems.price);
                        cmd.Parameters.AddWithValue("@offerprice", inputItems.offerPrice);
                        cmd.Parameters.AddWithValue("@deliveryCharges", inputItems.DeliveryCharges);
                        cmd.Parameters.AddWithValue("@ColorId", inputItems.colorId);


                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();

                        items = new AddToCart();

                        while (dr.Read())
                        {

                            items.itemid = Convert.ToInt32(dr["itemId"].ToString());
                            items.itemName = dr["itemName"].ToString();
                            items.itemDescription = dr["ItemDescripton"].ToString();
                            items.sizeId = Convert.ToInt32(dr["SizeId"].ToString());
                            items.sizeName = dr["SizeName"].ToString();
                            items.price = Convert.ToDouble(dr["Price"].ToString());
                            items.offerPrice = Convert.ToDouble(dr["OfferPrice"].ToString());
                            items.ColorName = dr["ColorName"].ToString().Trim();

                            items.DeliveryCharges = Convert.ToInt32(dr["DeliveryCharges"].ToString());
                            items.quantity = Convert.ToInt32(dr["quantity"].ToString());
                            items.sessionIdToken = dr["userSessionId"].ToString();


                        }

                        dr.NextResult();
                        while (dr.Read())
                        {
                            items.count = Convert.ToInt32(dr[0].ToString());
                        }

                        con.Close();
                    }
                }
            }

            catch
            {

                throw;
            }
            return items;
        }

        public userDetails AuthenticateUser(string userId, string password)
        {
            DataSet ds = new DataSet();
            userDetails lstToken = new userDetails();

            try
            {

                var connectionString = Startup.connectionstring;
                var connect = new ShoppingContext(connectionString);
                bool match = false;
                var message = password;
                
                var salter = connect.Users.Where(x => x.Active == true && x.Email == userId)
                    .FirstOrDefault();
                var hash = Hash.Create(message, salter.salt);


                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("authenticate", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", userId);
                    cmd.Parameters.AddWithValue("@hash", hash);
                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    adapter.Fill(ds);


                    con.Close();
                }

                if (ds.Tables[0].Rows.Count == 0) throw new Exception("Invalid User Id or Password, please try again.");


                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        match = Hash.Validate(password, dr["salt"].ToString(), dr["hash"].ToString());

                        if (match == false) throw new Exception("Invalid User Id or Password, please try again.");

                        lstToken.details = new List<Token>();
                        lstToken.details.Add(new Token
                        {
                            firstName = dr["FirsName"].ToString(),
                            lastName = dr["LastName"].ToString(),
                            username = dr["Email"].ToString(),
                            mobile = Convert.ToDouble(dr["Mobile"].ToString().Trim())
                        });
                    }
                }
            }

            catch
            {
                throw;
            }
            return lstToken;
        }

        public List<checkedInItem> getCheckInItem(string usersession)
        {
            var connectionString = Startup.connectionstring;
            var con = new ShoppingContext(connectionString);
            var data = con.itemMasterEntity.Join(con.CheckInEntity.Where(checkin => checkin.UserSessionId == usersession && checkin.Active == true), item => item.ItemId, checkin => checkin.itemId,
               (item, checkin)
               => new
               {
                   item,
                   checkin
               })
                .Join(con.ColorMasterEntity, cm => cm.checkin.Colorid, color1 => color1.Colorid,
                (cm, color1) => new { cm, color1 })
                .Select(m => new checkedInItem     //model class
                {
                    colorname = m.color1.ColorName,
                    colorid = m.color1.Colorid,
                    itemname = m.cm.item.ItemName,
                    userSessionId = m.cm.checkin.UserSessionId,
                    itemId = m.cm.checkin.itemId,
                    quantity = m.cm.checkin.Quantity,
                    checkOut = m.cm.checkin.CheckOut,
                    userIp = m.cm.checkin.UserIp,
                    price = m.cm.checkin.Price,
                    offerprice = m.cm.checkin.OfferPrice,
                    deliveryCharges = m.cm.checkin.DeliveryCharges,

                    brand = m.cm.item.brand,
                    id = m.cm.checkin.id,
                    //image1 = m.cm.item.Image1 == null ? " " : Convert.ToBase64String(m.cm.item.Image1),
                    image1 = GetBase64Image(m.cm.item.Image1), //m.cm.item.Image1 == null ? " " : m.cm.item.Image1
                    //  Image2 = m.cm.item.Image1 == null ? " " : Convert.ToBase64String(m.cm.item.Image2),
                    //  Image3 = m.cm.item.Image1 == null ? " " :  Convert.ToBase64String(m.cm.item.Image3),
                    PaidAmount= Convert.ToDouble(m.cm.checkin.OfferPrice)*m.cm.checkin.Quantity,
                   


                }).ToList();

            var totoalOfferAmount = data.Sum(x => x.PaidAmount);
            var totalprice = data.Sum(x => x.price*x.quantity);
            if (data.Count > 0)
            {
                data[0].TotalPaidAmunt = totoalOfferAmount;
                data[0].TotaPrice = totalprice;
            }


            return data;
        }

        public PageResult<ItemMaster> GetPageItemsList(PageAndSortedQuery<ItemDetailsQuery> query)

        {
            var connectionString = Startup.connectionstring;

            var con = new ShoppingContext(connectionString);
            var searchResult = con.itemMasterEntity.Where(m => m.Active == true && m.AvailableQty > 0).Join(con.ColorMasterEntity, item => item.ColorId, clr => clr.Colorid,
                (item, clr) => new
                {
                    item, clr
                })
                .Join(con.SizeMasterEntity, cm => cm.item.SizeId, size => size.SizeId,
                  (cm, size) => new { cm, size })

                .Select(x => new ItemMaster
                {
                    ItemName = x.cm.item.ItemName.Trim(),
                    Active = x.cm.item.Active,
                    AvailableColor = x.cm.item.AvailableColor.Trim(),
                    AvailableQty = x.cm.item.AvailableQty,
                    brand = x.cm.item.brand.Trim(),
                    childmenuid = x.cm.item.ChildMenuId,
                    Color = x.cm.clr.ColorName.Trim(),
                    detailId = x.cm.item.detailId,

                    InitialQty = x.cm.item.InitialQty,
                    DeliveryCharges = x.cm.item.deliveryCharges,
                    itemDescription = x.cm.item.ItemDescripton.Trim(),
                    OfferPrice = x.cm.item.OfferPrice,
                    Price = x.cm.item.Price,
                    ReserveQty = x.cm.item.ReserveQty,
                    SizeId = x.cm.item.SizeId,
                    itemid = x.cm.item.ItemId,
                    ColorId = x.cm.item.ColorId,
                    SizeName = x.size.SizeName,
                    //Image1 = x.cm.item.Image1==null?" ":Convert.ToBase64String(x.cm.item.Image1),
                    //   Image1 = System.IO.File.ReadAllBytes(x.cm.item.Image1),


                    Image1 = GetBase64Image(x.cm.item.Image1)    //"data:image/jpeg;base64," + Convert.ToBase64String(File.ReadAllBytes(x.cm.item.Image1)), //x.cm.item.Image1 == null ? " " : x.cm.item.Image1,
                    //  Image2 = x.cm.item.Image1 == null ? " " : Convert.ToBase64String(x.cm.item.Image2),
                    //  Image3 = x.cm.item.Image1 == null ? " " :  Convert.ToBase64String(x.cm.item.Image3),
                })
                  .ApplySorting(query)
                  .Paging(query);




            return searchResult;
        }


        public RemoveItem RemoveItems(int itemId, int returnedItemQty, string sessionId, int checkedinId)
        {
            var connectionString = Startup.connectionstring;

            using (var con = new ShoppingContext(connectionString))
            {
                var context = con.itemMasterEntity.Where(k => k.Active == true && k.ItemId == itemId).SingleOrDefault();
                context.ReserveQty = context.ReserveQty - returnedItemQty;
                context.AvailableQty = context.AvailableQty + returnedItemQty;
                con.SaveChanges();
                var remove = con.CheckInEntity.Where(m => m.UserSessionId == sessionId && m.id == checkedinId).SingleOrDefault();
                remove.Active = false;
                con.SaveChanges();
                var count = con.CheckInEntity.Where(m => m.UserSessionId == sessionId && m.Active == true).Count();

                var result = new RemoveItem()
                {
                    count = count,
                    successs = true
                };

                return result;

            }


        }

        public (bool success, string result) addUser(User user)
        {
            bool success = false;
            string result;
            try
            {
                var connectionString = Startup.connectionstring;


                var message = user.password;
                var salt = Salt.Create();
                var hash = Hash.Create(message, salt);




                using (var con = new ShoppingContext(connectionString))
                {

                    var city = con.StateEntity.Where(st => st.StateId == Convert.ToInt32(user.city) && st.Active == true)
                        .Select(xx => new { city = xx.City }).FirstOrDefault();

                    var state = con.StateEntity.Where(st => st.StateId == Convert.ToInt32(user.state) && st.Active == true)
                        .Select(xx => new { state = xx.StateName }).FirstOrDefault();


                    var data = con.Users.Where(x => x.Email == user.emailId).FirstOrDefault();
                    if (data == null && city!=null && state!=null)
                    {
                        var entity = new UserRegistrationEntity
                        {
                            hash = hash,
                            salt = salt,
                            FirsName = user.firstName,

                            MiddleName = user.middleName,
                            LastName = user.lastName,
                            Email = user.emailId,
                            Mobile = Convert.ToDouble(user.mobile),
                            UlternateMobile = user.ulternateMobile.Length > 0 ? Convert.ToDouble(user.ulternateMobile) : 0,
                            Address = user.address,
                            City = user.city,// city.city,//user.city,
                            Pin = user.pin,
                            State = user.state,//state.state,//user.state,
                            Active = false
                        };

                        con.Users.Add(entity);
                        con.SaveChanges();

                        success = true;
                        result = "Added successfylly";
                    }
                    else
                    {
                        result = "This Email Id is aleady exhisting";
                        success = false;
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return (success, result);

        }


        public PageResult<ItemMaster> Search(string SearchItem, PageAndSortedQuery<ItemDetailsQuery> query)
        {
            var connectionString = Startup.connectionstring;

            var con = new ShoppingContext(connectionString);

            var searchResult = con.itemMasterEntity.Where(m => m.ItemName.Contains(SearchItem) && m.Active == true && m.AvailableQty > 0).Join(con.ColorMasterEntity, item => item.ColorId, clr => clr.Colorid,
               (item, clr) => new
               {
                   item,
                   clr
               })
               .Join(con.SizeMasterEntity, cm => cm.item.SizeId, size => size.SizeId,
                 (cm, size) => new { cm, size })

               .Select(x => new ItemMaster
               {
                   ItemName = x.cm.item.ItemName.Trim(),
                   Active = x.cm.item.Active,
                   AvailableColor = x.cm.item.AvailableColor.Trim(),
                   AvailableQty = x.cm.item.AvailableQty,
                   brand = x.cm.item.brand.Trim(),
                   childmenuid = x.cm.item.ChildMenuId,
                   Color = x.cm.clr.ColorName.Trim(),
                   detailId = x.cm.item.detailId,

                   InitialQty = x.cm.item.InitialQty,
                   DeliveryCharges = x.cm.item.deliveryCharges,
                   itemDescription = x.cm.item.ItemDescripton.Trim(),
                   OfferPrice = x.cm.item.OfferPrice,
                   Price = x.cm.item.Price,
                   ReserveQty = x.cm.item.ReserveQty,
                   SizeId = x.cm.item.SizeId,
                   itemid = x.cm.item.ItemId,
                   ColorId = x.cm.item.ColorId,
                   SizeName = x.size.SizeName,
                   //      data:image/jpeg;base64,             Image1 = x.cm.item.Image1 == null ? " " : Convert.ToBase64String(x.cm.item.Image1),
                   Image1 = GetBase64Image(x.cm.item.Image1)  //"data:image/jpeg;base64," + Convert.ToBase64String(File.ReadAllBytes(x.cm.item.Image1)), //x.cm.item.Image1 == null ? " " : x.cm.item.Image1,

                   //  Image2 = x.cm.item.Image1 == null ? " " : Convert.ToBase64String(x.cm.item.Image2),
                   //  Image3 = x.cm.item.Image1 == null ? " " :  Convert.ToBase64String(x.cm.item.Image3),
               })
                 .ApplySorting(query)
                 .Paging(query);


            return searchResult;

        }


        public bool PaymentReceived(string emailId, string UserSession, EmailSettings emailSettings, User user, bool sendEmail,int PaymentOption)
        {
            var connectionString = Startup.connectionstring;
            StringBuilder emailBody = new StringBuilder("Congratulations!! Your order is confirmed <br><br><br>  ");
            bool success = false;
            double paymentAmount = 0, OfferAmount = 0;
            double deliveryCharges = 0;
            var conn = new ShoppingContext(connectionString);
            var pmt = conn.CheckInEntity.Where(m => m.UserSessionId == UserSession && m.Active == true)
                        .Join(conn.itemMasterEntity, item => item.itemId, chk => chk.ItemId,
                          (chk, item) => new
                          {
                              chk,
                              item

                          });




            string consign = GenerateConsignmentNumber();

           var check= conn.PaymentReceivedEntity.Where(x => x.ConsignmentNum == consign).ToList();
            if(check.Count>0 || check!=null)
            {

                consign = GenerateConsignmentNumber();
            }

            if(check.Count==0 || check==null)
            {
                using (var con = new ShoppingContext(connectionString))
                {
                    emailBody.Append("<html> ");
                    emailBody.Append("<head>");
                    emailBody.Append("<style type='text/css'> </style> </head>");

                    emailBody.Append("<body>");
                    emailBody.Append("<h4>" + "Date: " + DateTime.Now.ToString("dddd, dd MMMM yyyy") + "</hr><br>");
                    emailBody.Append("<table class='auto' border='1' width='100%'>");
                    emailBody.Append("<caption> Your Order Details:- </caption>");
                    emailBody.Append("<tr>");
                    emailBody.Append("<td width='50%'>Invoice Number: </td>");
                    emailBody.Append("<td width='50%'>" + consign + "</td>");
                    emailBody.Append("</tr>");

                    foreach (var items in pmt)
                    {
                        var add = con.PaymentReceivedEntity.Add(new PaymentReceivedEntity
                        {
                            itemId = items.chk.itemId,
                            ReceivedFormEmailId = emailId,
                            Quantity = items.chk.Quantity,
                            sessionid = UserSession,
                            TotalOfferAmount = items.chk.OfferPrice,
                            TotalPaymentAmount = items.chk.Price,
                            FirstName = user.firstName,
                            LastName = user.lastName,
                            Address = user.address,
                            MiddleName = user.middleName,
                            City = user.city,
                            Pin = user.pin,
                            State = user.state,
                            PrivacyAgreed = user.PrivacyAgreed,
                            PaymentMethodType = PaymentOption,
                            PaymentStatus = (int)ShoppingApi.Data.Enum.PaymentStatus.PmtStatus.Received,
                            ConsignmentNum = consign

                        });
                        deliveryCharges = Convert.ToDouble(items.chk.DeliveryCharges);
                        paymentAmount = paymentAmount + items.chk.OfferPrice;
                        OfferAmount = OfferAmount + items.chk.OfferPrice;
                        emailBody.Append("<tr>");
                        //emailBody.Append("<td width='50%'>Consignment Number: </td>");
                        //emailBody.Append("<td width='50%'>" + consign + "</td>");
                        emailBody.Append("</tr>");
                        emailBody.Append("<tr>");
                        emailBody.Append("<td width='50%'>Description: </td>");
                        emailBody.Append("<td width='50%'>" + items.item.ItemName + "</td>");
                        emailBody.Append("</tr>");

                        emailBody.Append("<tr>");
                        emailBody.Append("<td width='50%'>Quanity: </td>");
                        emailBody.Append("<td width='50%'>" + items.chk.Quantity + "</td>");
                        emailBody.Append("</tr>");

                        emailBody.Append("<tr>");
                        //emailBody.Append("<td width='50%'>Delivery Charges: </td>");
                        // emailBody.Append("<td width='50%'> ₹ " + item.deliveryCharges + "</td>");
                        emailBody.Append("</tr>");

                        emailBody.Append("<tr>");
                        emailBody.Append("<td width='50%'>Price: </td>");
                        emailBody.Append("<td width='50%'> ₹ " + string.Format(String.Format("{0:N2}", items.chk.Price)) + "</td>");
                        emailBody.Append("</tr>");

                        emailBody.Append("<tr>");
                        emailBody.Append("<td width='50%'>Offer Price: </td>");
                        emailBody.Append("<td width='50%'>₹ " + string.Format(String.Format("{0:N2}", items.chk.OfferPrice)) + "</td>");

                        emailBody.Append("</tr>");



                    }


                    OfferAmount = OfferAmount + deliveryCharges;

                    emailBody.Append("</table><br>");
                    emailBody.Append("<p>Delivery Charges ₹ " + string.Format(String.Format("{0:N2}", deliveryCharges)) + "</p><br>");
                    emailBody.Append("<p>Total Amount ₹ " + string.Format(string.Format("{0:N2}", Convert.ToDecimal(paymentAmount))) + "</p><br>");
                    emailBody.Append("<p>Total Offered Amount Payble including Delivery Charges ₹ " + string.Format(string.Format("{0:N2}", Convert.ToDecimal(OfferAmount))) + "</p><br>");
////                    emailBody.Append("<p>Total Saving ₹ " + string.Format(string.Format("{0:N2}", Convert.ToDecimal(paymentAmount - (OfferAmount - deliveryCharges)))) + "</p><br>");
                    emailBody.Append("<p>Total Saving ₹ " + string.Format(string.Format("{0:N2}", Convert.ToDecimal(paymentAmount - OfferAmount ))) + "</p><br>");

                    emailBody.Append("<p>Thank You !!  Happy Shopping!!!</p>");
                    emailBody.Append("</body></html>");

                    if (sendEmail == true)
                    {
                        EmailSender.SendEmailAsync(emailId, "Vidhimas Shopping - Order Confirmation", emailBody.ToString(), emailSettings);
                    }




                    con.SaveChanges();
                }
              //  int id = pmt.
                success = true;
            }

            return success;

        }


        public async Task<List<files>> getAllImmages(string filepath)
        {
            DirectoryInfo di = new DirectoryInfo(filepath);

            //Get All Files  

            List<files> files = di.GetFiles("*.*")
                                // .Where(file => file.Name.EndsWith(".csv"))
                                .Select(file => new files()
                                {
                                    fileName = file.FullName

                                }).ToList();

            return files;

        }
        public void DeActivatesAfterPaymentReceived(string sessionId)
        {
            var connectionString = Startup.connectionstring;

            using (var con = new ShoppingContext(connectionString))
            {
                var remove = con.CheckInEntity.Where(m => m.UserSessionId == sessionId).ToList();
                foreach (var item in remove)
                {
                    item.Active = false;
                }
                con.SaveChanges();
            }
        }

        public async Task<User> GetAddress(string email)
        {
            var connectionString = Startup.connectionstring;
            var con = new ShoppingContext(connectionString);

            //var user = await con.UserSessionEntity.Where(m => m.Active == true && m.SessionKey == usersession).FirstOrDefaultAsync();


            //if (user != null)
            //{
                var data = con.Users.Where(usr => usr.Email == email)
                     .Select(k => new User()
                     {
                         firstName = k.FirsName,
                         middleName = k.MiddleName,
                         lastName = k.LastName,
                         address = k.Address,
                         city = k.City,
                         pin = k.Pin,
                         mobile = k.Mobile.ToString(),
                         emailId = k.Email,
                         state = k.State

                     }

                     ).FirstOrDefaultAsync();
                return await data;
          //  }
          //  return null;
        }

        private string GetBase64Image(string url)
        {
            string img = null;
            try
            {
                img = "data:image/jpeg;base64," + Convert.ToBase64String(File.ReadAllBytes(url));
            }
            catch
            {
                var configurationBuilder = new ConfigurationBuilder();
                var root = configurationBuilder.Build();
                string imgNotFound = Startup.imageNotFound;//root.GetSection("ImageNotFound").ToString();
                img = "data:image/jpeg;base64," + Convert.ToBase64String(File.ReadAllBytes(imgNotFound));
                return img;
            }

            return img;
        }

        public bool EditAddress(EditAddress user)
        {
            var connectionString = Startup.connectionstring;
            var con = new ShoppingContext(connectionString);
            bool success = false;
            using (var conn = new ShoppingContext(connectionString))
            {
                var editUser = conn.Users.Where(x => x.Email == user.emailId).FirstOrDefault();
                editUser.Address = user.address;
                editUser.City = user.city;
                editUser.FirsName = user.firstName;
                editUser.LastName = user.lastName;
                editUser.MiddleName = user.middleName;
                editUser.Pin = user.pin;
                editUser.State = user.state;
                conn.SaveChanges();
                success = true;
            }

            return success;


        }


        public bool ActivateUser(string emailId, bool active)
        {

            bool success = false;

            try
            {
                var connectionString = Startup.connectionstring;

                using (var con = new ShoppingContext(connectionString))
                {

                    var data = con.Users.Where(x => x.Email == emailId).FirstOrDefault();
                    if (data != null)
                    {
                        //var entity = new UserRegistrationEntity
                        //{

                        //    Active = true
                        //};
                        data.Active = true;
                        con.SaveChanges();

                        success = true;

                    }
                    else
                    {
                        success = false;
                    }
                }



            }
            catch (Exception ex)
            {
                throw ex;
            }
            return success;
        }

        public async Task<List<PaymentMethod>> PaymenOpions()
        {
            var connectionString = Startup.connectionstring;// Task<List<States>> GetStates()
            Task<List<PaymentMethod>> data;
            //using (var con = new ShoppingContext(connectionString))
            // {
            var con = new ShoppingContext(connectionString);
                data = con.PaymentMethodEntity.Where(x => x.Active == true)
                    .Select(k=> new PaymentMethod() {
                        Active=k.Active,
                        PaymentTypeName=k.PaymentTypeName,
                        ID=k.ID
                       
                    }).ToListAsync();
          //  }
            return await data;
        }


      

        private string GenerateConsignmentNumber()
        {

            int _min = 1;
            int _max = 9999;
            Random _rdm = new Random();
            int num = _rdm.Next(_min, _max);

            return "VH-" + num.ToString();

        }


        private Array SplitToArray(string strvalue,char splietter)
        {
            var arrobject = strvalue!=null ? strvalue.Split(splietter):null;
            for (int i =0; i < arrobject.Length;i++)
            {
                arrobject[i] = GetBase64Image(arrobject[i]);
            }
            return arrobject;

        }

        public Task<List<AddItem>> AddNewItem(AddItem item,string UploadImagePath, dynamic files)
        {
            string smallImage = string.Empty;
            int addedItemId = 0;

            var connectionString = Startup.connectionstring;// Task<List<States>> GetStates()
           
                foreach (var file in files)
                {
                   // smallImage += file.FileName + "#";
                    // var folderName = Path.Combine("Resources", "Images");

                    var pathToSave = UploadImagePath; //_iConfiguration.GetSection("UploadImagePath").Value;
                                                      // var pathToSave = Path.Combine(Directory.GetCurrentDirectory(), folderName);
                    if (file.Length > 0)
                    {
                        var fileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                        if (System.IO.File.Exists(Path.Combine(pathToSave, fileName)))
                        {
                            Random r = new Random();
                            int genRand = r.Next(1, 2);

                            var filetypt = fileName.Substring(fileName.LastIndexOf(@".") + 1, ((fileName.Length - 1) - fileName.LastIndexOf(@".")));
                            fileName = fileName.Substring(0, fileName.LastIndexOf(@".")) + genRand + 1.ToString();
                            fileName = fileName + "." + filetypt;
                        };
                        var fullPath = Path.Combine(pathToSave, fileName);
                        /// var dbPath = Path.Combine(folderName, fileName);
                        using (var stream = new FileStream(fullPath, FileMode.Create))
                        {
                            file.CopyTo(stream);

                            /// System.Drawing.Image myImage = System.Drawing.Image.FromFile(fullPath, true);

                        }
                      string NewFilePath=  FileSaver.SaveJpeg(fullPath, pathToSave, 20);
                    smallImage += NewFilePath + "#";
                }
                    else
                    {
                        throw new Exception("Bad Reqest");
                    }
                }

//                smallImage = UploadImagePath + "\\" + smallImage.Substring(0, (smallImage.LastIndexOf("#")));

            smallImage = smallImage.Substring(0, (smallImage.LastIndexOf("#")));

            item.ImageSmall3 = smallImage;
                item.CreateDate = null;
                item.UpdateDate = null;
                using (var con = new ShoppingContext(connectionString))
                {
                    using (var transaction = con.Database.BeginTransaction())
                    {
                        try {
                            var groupItem = new GroupMasterEntity()
                            {
                                Active = true,
                                SupplierId = item.supplierId,
                                CreatedBy = "N/A"

                            };

                            con.Add(groupItem);
                            con.SaveChanges();

                            item.GroupId = groupItem.GroupId;
                            var itemdata = new itemMasterEntity()
                            {
                                Active = true,
                                AvailableColor = item.availableColor,
                                AvailableQty = item.availableQty,
                                brand = item.brand,
                                ChildMenuId = item.ChileMenuId,
                                //Color=item.color,
                                ColorId = item.colorId,
                                deliveryCharges = item.deliveryCharges,
                                detailId = item.DetailId,
                               Image1 = item.ImageSmall3.IndexOf("#") == 0 || item.ImageSmall3.IndexOf("#") == -1 ? item.ImageSmall3 : item.ImageSmall3.Substring(0, (item.ImageSmall3.IndexOf("#"))),
                              ////  Image1 = item.ImageSmall3.Substring(0, (item.ImageSmall3.IndexOf("#"))),

                                Image2 = item.Image2,
                                Image3 = item.Image3,
                                ImageSmall3 = item.ImageSmall3,
                                InitialQty = item.initialQty,
                                ItemDescripton = item.itemDescription,
                                ItemName = item.itemName,
                                OfferPrice = item.offerPrice,
                                Price = item.price,
                                SizeId = item.sizeId,
                                GroupId = item.GroupId,
                                SupplierId=item.supplierId
                                //CreateDate = item.CreateDate,
                                //UpdateDate = item.UpdateDate
                                // si=item.sizeName

                                
                            };
                            con.Add(itemdata);
                            con.SaveChanges();
                            con.Database.CommitTransaction();
                            addedItemId = itemdata.ItemId;

                        
                    }
                        catch(Exception ex)
                        {
                            con.Database.RollbackTransaction();
                        }

                    
                }

                var newitem = con.itemMasterEntity.Where(m => m.ItemId == addedItemId)
                  .Select(x => new AddItem()
                  {
                      availableColor = x.AvailableColor,
                      availableQty = x.AvailableQty,
                      brand = x.brand,
                      ChileMenuId = x.ChildMenuId,
                               //color = x.colo,
                               colorId = x.ColorId,
                      deliveryCharges = x.deliveryCharges,
                      DetailId = x.detailId,
                      Image1 = x.Image1,
                      Image2 = x.Image2,
                      Image3 = x.Image3,
                      ImageSmall3 = x.ImageSmall3,
                      initialQty = x.InitialQty,
                      itemDescription = x.ItemDescripton,
                      itemName = x.ItemName,
                      offerPrice = x.OfferPrice,
                      price = x.Price,
                      sizeId = x.SizeId,
                  }).ToListAsync();
                return newitem;
            }

            
        }

        public  List<Supplier> GetSuppliers()
        {
            var connectionString = Startup.connectionstring;// Task<List<States>> GetStates()
           
            //using (var con = new ShoppingContext(connectionString))
            // {
            var con = new ShoppingContext(connectionString);
           var  data = con.SupplierEntity.Where(x => x.Active == true)
                .Select(vv => new Supplier()
                {
                    Active=vv.Active,
                    City=vv.City,
                    Pin=vv.Pin,
                    SupplierId=vv.SupplierId,
                    State=vv.State,
                    SupAdd1=vv.SupAdd1,
                    SupAdd2=vv.SupAdd2,
                    SupAdd3=vv.SupAdd3,
                    SupFirstName=vv.SupFirstName,
                    SupLastName=vv.SupLastName,
                    SupMidName =vv.SupMidName
                    


                }).ToList();
            return data;
          

        }

        public List<Size> GetSizes()
        {
            var connectionString = Startup.connectionstring;// Task<List<States>> GetStates()

            //using (var con = new ShoppingContext(connectionString))
            // {
            var con = new ShoppingContext(connectionString);
            var data = con.SizeMasterEntity
                 .Select(vv => new Size()
                 {
                     SizeId= vv.SizeId,
                     SizeName=vv.SizeName
                 }).ToList();
            return data;
        }

        public List<Menu> GetItemMenus()
        {
            var connectionString = Startup.connectionstring;// Task<List<States>> GetStates()

            //using (var con = new ShoppingContext(connectionString))
            // {
            var con = new ShoppingContext(connectionString);
            var data = con.MenuEntity.Where(ss=>ss.Status==true && ss.ParentId==0)
                 .Select(vv => new Menu()
                 {
                    Id=vv.Id,
                    MainMenuId=vv.MainMenuId,
                    MainMenuName=vv.MainMenuName,
                    MainTrigger=vv.MainTrigger,
                    MenuName=vv.MenuName,
                    ParentId=vv.ParentId,
                    RouterLink=vv.RouterLink,
                    Status=vv.Status,
                    SubMenuId=vv.SubMenuId,
                    SubMenuName=vv.SubMenuName,
                    SubTrigger=vv.SubTrigger,
                     
                 }).ToList();
            return data;

        }

        public List<Color> GetItemColors()
        {
            var connectionString = Startup.connectionstring;// Task<List<States>> GetStates()

         
            var con = new ShoppingContext(connectionString);
            var data = con.ColorMasterEntity
                 .Select(vv => new Color()
                 {
                   Colorid= vv.Colorid,
                   ColorName=vv.ColorName

                 }).ToList();
            return data;
        }

        public  List<AddItemRequest> GetNewItemRequest()
        {

            var connectionString = Startup.connectionstring;// Task<List<States>> GetStates()


            var con = new ShoppingContext(connectionString);
            //var data = con.itemMasterEntity.Where(xx => xx.Active == true)
            //    .Select(vv => new AddItemRequest()
            //    {
            //        Colors = GetItemColors(),
            //        Menu = GetItemMenus(),
            //        Sizes = GetSizes(),
            //        SupplierList = GetSuppliers()
            //    }).ToListAsync();
            List<AddItemRequest> data = new List<AddItemRequest>();    
            data.Add(new AddItemRequest
            {
                Colors = GetItemColors(),
                Sizes = GetSizes(),
                Menu = GetItemMenus(),
                SupplierList = GetSuppliers()
            });

            return data;
            

        }

        public Task<bool> UploadImage()
        {
            throw new NotImplementedException();
        }

        public  Task<List<Menu>> GetSubMenu(int ParentId)
        {
            var connectionString = Startup.connectionstring;// Task<List<States>> GetStates()

            //using (var con = new ShoppingContext(connectionString))
            // {
            var con = new ShoppingContext(connectionString);
            var data = con.MenuEntity.Where(ss => ss.Status == true && ss.ParentId==ParentId)
                 .Select(vv => new Menu()
                 {
                     Id = vv.Id,
                     MainMenuId = vv.MainMenuId,
                     MainMenuName = vv.MainMenuName,
                     MainTrigger = vv.MainTrigger,
                     MenuName = vv.MenuName,
                     ParentId = vv.ParentId,
                     RouterLink = vv.RouterLink,
                     Status = vv.Status,
                     SubMenuId = vv.SubMenuId,
                     SubMenuName = vv.SubMenuName,
                     SubTrigger = vv.SubTrigger,

                 }).ToListAsync();
            return data;
        }
    }
}


 








