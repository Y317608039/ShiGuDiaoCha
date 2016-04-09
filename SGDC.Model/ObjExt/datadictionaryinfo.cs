
namespace SGDC.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class datadictionaryinfo: ICloneable
    {

        public object Clone()
        {
            return MemberwiseClone(); //浅复制 
        }
    }
}
