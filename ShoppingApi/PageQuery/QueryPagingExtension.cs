using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.PageQuery
{
    public static class QueryPagingExtension
    {
        public static PageResult<T> Paging<T> (this IQueryable<T> query, IPagingParameters paging)
        {
            int? count = null;
            if(paging!=null && paging.IsPagingSpecified)
            {
                count = query.Count();
                int skip = (paging.Page.Value - 1) * paging.Count.Value;
                query = query.Skip(skip).Take(paging.Count.Value);

            }
            var result = new PageResult<T>();
            
            result.Results = query.ToList();
            result.Count = count ?? result.Results.Count();
            return result;

        }


    }

    public class Paging<T>
    {
        public IQueryable<T> Query { get; set; }
        public int? Count { get; set; }

    }
}
