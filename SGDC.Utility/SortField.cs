using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SGDC.Utility
{
    [Serializable]
    public class SortField
    {
        // Methods
        public SortField()
        {
        }

        public SortField(string fieldName, bool sortDirection)
        {
            this.FieldName = fieldName;
            this.SortDirection = sortDirection;
        }

        // Properties
        public string FieldName { get; set; }

        public bool SortDirection { get; set; }
    }
}
