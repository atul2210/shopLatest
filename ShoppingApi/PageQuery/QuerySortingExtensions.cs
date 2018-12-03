using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Linq.Dynamic.Core;
namespace ShoppingApi.PageQuery
{
    public static class QuerySortingExtensions
    {
        public static IQueryable<ModelT> ApplySorting<ModelT>(
            this IQueryable<ModelT> query,
            ISortingParameters sortingParameters)
        {
            if (sortingParameters == null)
                return query;

            var sortQuery = GenerateSortQuery(new[] { sortingParameters });
            return string.IsNullOrEmpty(sortQuery) ? query : query.OrderBy(sortQuery);
        }

        public static IQueryable<ModelT> ApplySorting<ModelT>(
            this IQueryable<ModelT> query,
            IEnumerable<ISortingParameters> sortingParameters)
        {

            if(sortingParameters==null || sortingParameters.Any())
            {
                return query;

            }
            var sortQuery = GenerateSortQuery(sortingParameters);
            return string.IsNullOrEmpty(sortQuery) ? query : query.OrderBy(sortQuery);
        }

        private static string GenerateSortQuery(IEnumerable<ISortingParameters> parameters)
        {


               return string.Join(",", parameters.Where(x => !string.IsNullOrEmpty(x.SortField))
                .Select(x => x.SortDir == SortDirection.Desc ? $"{x.SortField} {SortDirection.Desc }" : x.SortField));

        }

    }
}
