﻿using ShoppingApi.Model;
using ShoppingApi.PageQuery;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Interfaces
{
    public interface Ioperation
    {
        GetAllItems getItems(int categoryId, int pageIndex);
        Items getItemDetail(int itemId);
        AddToCart getAddToCart(int itemId, string IPAddress, int quantity, string color, string sessionid, double price, double offerprice, double deliverycharges);
        userDetails AuthenticateUser(string userId, string password);
        List<checkedInItem> getCheckInItem(string usersession);
        PageResult<ItemMaster> GetPageItemsList(PageAndSortedQuery<ItemDetailsQuery> query);
        RemoveItem RemoveItems(int itemId, int returnedItemQty, string sessionId, int checkedinId);
        bool addUser(User user);
    }
}
