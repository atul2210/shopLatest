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

namespace ShoppingApi.Data
{
    public class Operations : Ioperation
    {

        public GetAllItems getItems(int categoryId, int pageIndex)
        {
            GetAllItems items = null;
            try
            {

                var connectionString = Startup.connectionstring;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("GetAllItems", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@categoryid", categoryId);
                    cmd.Parameters.AddWithValue("@page", pageIndex);


                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    items = new GetAllItems();
                    items.allItems = new List<Items>();


                    while (dr.Read())
                    {
                        items.count = Convert.ToInt32(dr[0].ToString());
                    }

                    dr.NextResult();

                    while (dr.Read())
                    {

                        items.allItems.Add(new Items
                        {

                            itemid = Convert.ToInt32(dr["itemId"].ToString()),
                            itemName = dr["itemName"].ToString(),
                            itemDescription = dr["ItemDescripton"].ToString(),

                            sizeId = Convert.ToInt32(dr["SizeId"].ToString()),
                            sizeName = dr["SizeName"].ToString(),
                            price = Convert.ToDouble(dr["Price"].ToString()),
                            offerPrice = Convert.ToDouble(dr["OfferPrice"].ToString()),
                            categoryName = dr["categoryName"].ToString(),
                            categoryId = Convert.ToInt32(dr["CategoryId"].ToString()),
                            imaggeUrl = dr["image"].ToString(),
                            rowNum = Convert.ToInt32(dr["RowNum"].ToString()),
                            color = dr["color"].ToString(),
                            brand = dr["Brand"].ToString(),
                            deliveryCharges = Convert.ToInt32(dr["DeliveryCharges"].ToString()),
                            availableQty = Convert.ToInt32(dr["AvailableQty"].ToString()),
                            availableColor = dr["availableColor"].ToString()
                        });



                    }


                    con.Close();
                }
            }

            catch
            {
                throw;
            }
            return items;
        }


        public Items getItemDetail(int itemId)
        {
            Items items = null;
            try
            {

                var connectionString = Startup.connectionstring;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("GetItemDetail", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@itemId", itemId);

                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    items = new Items();

                    while (dr.Read())
                    {

                        items.itemid = Convert.ToInt32(dr["itemId"].ToString());
                        items.itemName = dr["itemName"].ToString();
                        items.itemDescription = dr["ItemDescripton"].ToString();
                        items.sizeId = Convert.ToInt32(dr["SizeId"].ToString());
                        items.sizeName = dr["SizeName"].ToString();
                        items.price = Convert.ToDouble(dr["Price"].ToString());
                        items.offerPrice = Convert.ToDouble(dr["OfferPrice"].ToString());
                        items.categoryName = dr["categoryName"].ToString();
                        items.categoryId = Convert.ToInt32(dr["CategoryId"].ToString());
                        items.imaggeUrl = dr["image"].ToString();
                        items.color = dr["Color"].ToString();
                        items.brand = dr["Brand"].ToString();
                        items.deliveryCharges = Convert.ToInt32(dr["DeliveryCharges"].ToString());
                        items.availableQty = Convert.ToInt32(dr["AvailableQty"].ToString());
                        items.availableColor = dr["availableColor"].ToString();

                    }


                    con.Close();
                }
            }

            catch
            {
                throw;
            }
            return items;
        }



        public AddToCart getAddToCart(int itemId, string IPAddress, int quantity, string color, string sessionid,double price,double offerprice,double deliverycharges)
        {
            AddToCart items = null;
            try
            {

                var connectionString = Startup.connectionstring;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("AddToCart", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@itemId", itemId);
                    cmd.Parameters.AddWithValue("@IPAddress", IPAddress);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    cmd.Parameters.AddWithValue("@Color", color);
                    cmd.Parameters.AddWithValue("@sessionid", sessionid);

                    cmd.Parameters.AddWithValue("@price", price);
                    cmd.Parameters.AddWithValue("@offerprice", offerprice);
                    cmd.Parameters.AddWithValue("@deliveryCharges", deliverycharges);
                    

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
                        items.sessionIdToken= dr["userSessionId"].ToString();


                    }

                    dr.NextResult();
                    while (dr.Read())
                    {
                        items.count = Convert.ToInt32(dr[0].ToString());
                    }

                    

                    con.Close();
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
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("authenticate", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", userId);
                    cmd.Parameters.AddWithValue("@password", password);

                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);

                    adapter.Fill(ds);


                    con.Close();
                }

                if (ds.Tables[0].Rows.Count > 0)
                {

                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        //@email,FirsName,MiddleName,LastName,Mobile,UlterNateMobile
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
                    imageUrl = m.cm.item.image,
                    brand = m.cm.item.brand,
                    id = m.cm.checkin.id

                }).ToList();
            return data;
        }

        public PageResult<ItemMaster> GetPageItemsList (PageAndSortedQuery<ItemDetailsQuery> query)
            
        {
            var connectionString = Startup.connectionstring;
            
            var con = new ShoppingContext(connectionString);
            var searchResult = con.itemMasterEntity.Select(x => new ItemMaster
            {
                ItemName = x.ItemName.Trim(),
                Active = x.Active,
                AvailableColor = x.AvailableColor.Trim(),
                AvailableQty = x.AvailableQty,
                brand = x.brand.Trim(),
                CategoryId = x.CategoryId,
                Color = x.Color.Trim(),
                detailId = x.detailId,
                image = x.image.Trim(),
                InitialQty = x.InitialQty,
                DeliveryCharges = x.deliveryCharges,
                itemDescription = x.ItemDescripton.Trim(),
                OfferPrice = x.OfferPrice,
                Price = x.Price,
                ReserveQty = x.ReserveQty,
                SizeId = x.SizeId,
                itemid = x.ItemId
            })
            .ApplySorting(query)
            .Paging(query);

            return searchResult;
        }


        public RemoveItem RemoveItems(int itemId,int returnedItemQty,string sessionId,int checkedinId)
        {
            var connectionString = Startup.connectionstring;

            using (var con = new ShoppingContext(connectionString))
            {
                var context = con.itemMasterEntity.Where(k=>k.Active==true).SingleOrDefault(m => m.ItemId == itemId);
                context.ReserveQty = context.ReserveQty - returnedItemQty;
                context.AvailableQty = context.AvailableQty + returnedItemQty;

                var remove = con.CheckInEntity.Where(m => m.UserSessionId == sessionId && m.id== checkedinId).SingleOrDefault();
                remove.Active = false;
                con.SaveChanges();
                var count = con.CheckInEntity.Where(m => m.UserSessionId == sessionId && m.Active==true).Count();

                var result = new RemoveItem()
                {
                    count = count,
                    successs = true
                };
               
                return result;

            }

           
        }

        public bool addUser(User user)
        {
            var connectionString = Startup.connectionstring;
            bool success = false;

            using (var con = new ShoppingContext(connectionString))
            {
                var entity = new UserRegistrationEntity
                {
                    Password = user.password,

                    FirsName = user.firstName,
                   
                    MiddleName = user.middleName,
                    LastName = user.lastName,
                    Email = user.emailId,
                    Mobile =  Convert.ToDouble(user.mobile),
                    UlternateMobile= Convert.ToDouble(user.ulternateMobile),
                    Address = user.address,
                    City = user.city,
                    Pin = user.pin,
                    State = user.state
                };

                con.Users.Add(entity);
                con.SaveChanges();

                success = true;
               
            }

            return success;
           
        }
          

        }




    }

