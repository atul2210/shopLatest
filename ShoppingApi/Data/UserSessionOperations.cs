using ShoppingApi.Interfaces;
using ShoppingApi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
 
namespace ShoppingApi.Data
{
    public class UserSessionOperations : IUserSession
    {
        public List<UserSessionDto> AddUserSession(string SessionKey, string UserId)
        {
            var connectionString = Startup.connectionstring;
            var con = new ShoppingContext(connectionString);

            IQueryable<UserSessionEntity> data = con.UserSessionEntity.Where(mm => mm.UserId == UserId && mm.Active==true).AsQueryable();

            //foreach (var deactivate in data) //deactivating previous session first
            //{
            //    deactivate.Active = false;
            //}
            //con.SaveChanges();

            UserSessionEntity usersession = new UserSessionEntity()
            {
                UserId = UserId,
                SessionKey = SessionKey,
                Active = true
            };
            con.UserSessionEntity.Add(usersession);
            con.SaveChanges();

            return con.UserSessionEntity.Where(m => m.SessionKey == SessionKey)
                    .Select(x => new UserSessionDto()
                    {
                        SessionKey=x.SessionKey,
                        UserId= x.UserId,
                        Active=true
                    }).ToList();

        }

        public List<UserSessionDto> GetUserSession(string SessionKey)
        {
            var connectionString = Startup.connectionstring;
            var con = new ShoppingContext(connectionString);
            return con.UserSessionEntity.Where(m => m.SessionKey == SessionKey && m.Active==true )
                 .Select(x => new UserSessionDto()
                 {
                     SessionKey = x.SessionKey,
                     UserId = x.UserId
                 }).ToList();

        }
    }
}
