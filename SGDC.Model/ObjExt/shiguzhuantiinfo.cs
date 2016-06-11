

namespace SGDC.Model
{
    using System;
    using System.Collections.Generic;

    public partial class shiguzhuantiinfo : ICloneable
    {

        public object Clone()
        {
            return MemberwiseClone(); //浅复制 
        }
    }
}
