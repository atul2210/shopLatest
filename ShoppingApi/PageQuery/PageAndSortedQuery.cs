using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Text;
namespace ShoppingApi.PageQuery
{
    public class PageAndSortedQuery<T> : IQuery<T>, IPagingParameters,ISortingParameters where T:QueryBase
    {
        public int? Page { get; set; }

        public int?Count { get; set; }

        public bool IsPagingSpecified => Page.HasValue && Count.HasValue;

        public T Filter { get; set; }

        public string SortField { get; set; }

        public SortDirection? SortDir { get; set; }

        public bool IsSortingSpecified => SortField != null && SortDir.HasValue;

        public bool IsSortBy (string fieldName)=>
        string.Equals(SortField,fieldName, StringComparison.InvariantCultureIgnoreCase);
    }


    public interface IQuery<T>
    {
        T Filter { get; set; }

    }

    public interface IPagingParameters
    {
         int? Page { get; set; }
         int? Count { get; set; }
         bool IsPagingSpecified { get; }   
    }

    public interface ISortingParameters
    {
        string SortField { get; set; }
        SortDirection? SortDir { get; set; }
        bool IsSortingSpecified { get; }

    }




}
