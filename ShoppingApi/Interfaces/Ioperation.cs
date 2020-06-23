using ShoppingApi.Model;
using ShoppingApi.PageQuery;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ShoppingApi.Email;
namespace ShoppingApi.Interfaces
{
    public interface Ioperation
    {
        PageResult<ItemMaster> getItems(int childmenuid, PageAndSortedQuery<ItemDetailsQuery> query);
        Items getItemDetail(int itemId);

        AddToCart getAddToCart(int itemId, string IPAddress, int quantity, string sessionid);
        userDetails AuthenticateUser(string userId, string password);
        List<checkedInItem> getCheckInItem(string usersession);
        PageResult<ItemMaster> GetPageItemsList(PageAndSortedQuery<ItemDetailsQuery> query);
        RemoveItem RemoveItems(int itemId, int returnedItemQty, string sessionId, int checkedinId);
        (bool success, string result)addUser(User user);
        PageResult<ItemMaster> Search(string SearchItem, PageAndSortedQuery<ItemDetailsQuery> query);
        bool PaymentReceived(string emailId, string UserSession, EmailSettings emailSettings,User user,bool sendEmail);
        Task<List<files>> getAllImmages(string filepath);
        void DeActivatesAfterPaymentReceived(string sessionId);
        Task<User> GetAddress(string usersession);
        bool EditAddress(EditAddress user);
    }
}
