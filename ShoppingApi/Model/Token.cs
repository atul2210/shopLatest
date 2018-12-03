using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Model
{
    public class Token
    {
        public string token { get; set; }
        public string encodeed { get; set; }
        public string username { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }

        public double mobile { get; set; }

    }

    public class userDetails
    {
        public List<Token> details { get; set; }
    }

}

