﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShoppingApi.Data.Enum
{
    public class PaymentStatus
    {
        public enum PmtStatus
        {
            Received=1,
            Pending=2,
            Hold=3
        }
    }
}