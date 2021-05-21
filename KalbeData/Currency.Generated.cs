using System;
using System.Collections.Generic;
using System.Text;

namespace KalbeData
{
    public partial class Currency
    {
        Currency()
        {
            OnCreated();
            Invoices = new List<Invoice>();
        }
        public virtual int Id { get; set; }
        public virtual string Code { get; set; }
        public virtual string Value { get; set; }
        public virtual string Country { get; set; }
        public virtual string Symbol { get; set; }
        public virtual bool IsActive { get; set; }
        public virtual List<Invoice> Invoices { get; set; }

        #region Extensibility Method Definitions

        partial void OnCreated();

        #endregion
    }
}
