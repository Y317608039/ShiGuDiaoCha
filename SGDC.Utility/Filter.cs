using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SGDC.Utility
{
    [Serializable]
    public class Filter
    {
        // Methods
        public Filter()
        {
        }

        public Filter(string colname, FilterOp op, object value)
        {
            this.Name = colname;
            this.Op = op;
            this.Value = value;
        }

        // Properties
        public string Name { get; set; }

        public FilterOp Op { get; set; }

        public object Value { get; set; }
    }
}
