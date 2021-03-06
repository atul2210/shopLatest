﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using System.Data.Entity;
using Microsoft.EntityFrameworkCore;
using ShoppingApi.Model;

namespace ShoppingApi.Data
{
    public class ShoppingContext : Microsoft.EntityFrameworkCore.DbContext
    {
        string connectionString = Startup.connectionstring;
        //public ShoppingContext(DbContextOptions<ShoppingContext> options)
        //     : base(options)
        //{


        //}
        public ShoppingContext(string connectionString) : base(GetOptions(connectionString))
        {
        }


        public Microsoft.EntityFrameworkCore.DbSet<CheckInEntity> CheckInEntity {get;set;}
        public Microsoft.EntityFrameworkCore.DbSet<itemMasterEntity> itemMasterEntity { get; set; }
        public Microsoft.EntityFrameworkCore.DbSet<ColorMasterEntity> ColorMasterEntity { get; set; }
        public Microsoft.EntityFrameworkCore.DbSet<UserRegistrationEntity> Users { get; set; }



        private static DbContextOptions GetOptions(string connectionString)
        {
            return SqlServerDbContextOptionsExtensions.UseSqlServer(new DbContextOptionsBuilder(), connectionString).Options;
        }



    }
}
