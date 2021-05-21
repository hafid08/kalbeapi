using System;
using System.Collections.Generic;
using System.Text;

namespace KalbeData
{
    public partial class PurchaseOrder
    {
        PurchaseOrder()
        {
            OnCreated();
            Invoices = new List<Invoice>();
        }
        public virtual int Id { get; set; }
        public virtual string Code { get; set; }
        public virtual decimal Amount { get; set; }
        public virtual string PIC { get; set; }
        public virtual List<Invoice> Invoices { get; set; }

        #region Extensibility Method Definitions

        partial void OnCreated();

        #endregion
    }
}
