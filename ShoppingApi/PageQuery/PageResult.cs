using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Collections;
using System.Text;
namespace ShoppingApi.PageQuery
{
    public class PageResult<T>
    {
        public PageResult()
        {
            Results = new List<T>();
        }

        public List<T> Results { get; set; }

        public int Count { get; set; }
    }

}
