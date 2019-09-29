using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class UserSessionDto
    {
      
        public int Id { get; set; }
        public string SessionKey { get; set; }
        public string UserId { get; set; }
        public bool Active { get; set; }
    }
}
