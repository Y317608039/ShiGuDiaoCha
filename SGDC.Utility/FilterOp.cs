using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SGDC.Utility
{
    [Serializable]
    public enum FilterOp
    {
        Equals = 0,
        NotEqual = 1,
        Contains = 2,
        NotContains = 3,
        StartsWith = 4,
        EndsWith = 5,
        GreaterThan = 6,
        GreaterThanOrEqual = 7,
        LessThan = 8,
        LessThanOrEqual = 9,
        IN = 10,
    }
}
