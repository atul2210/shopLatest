using ShoppingApi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Interfaces
{
    public interface IUserSession
    {
       List<UserSessionDto> AddUserSession(string SessionKey, string UserId);
       List<UserSessionDto> GetUserSession(string SessionKey);


    }
}
