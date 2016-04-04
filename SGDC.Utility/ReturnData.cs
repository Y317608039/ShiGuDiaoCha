using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SGDC.Utility
{
    public class ReturnData<TEntity>
    {
        // Fields
        public int total { get; set; }
        public List<TEntity> rows { get; set; }
    }
}
