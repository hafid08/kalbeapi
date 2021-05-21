using System;
using System.Collections.Generic;
using System.Text;

namespace KalbeData
{
    public partial class SubInvoice
    {
        SubInvoice()
        {
            OnCreated();
        }
        public virtual int Id { get; set; }
        public virtual int InvoiceId { get; set; }
        public virtual int MeasurementId { get; set; }
        public virtual string Description { get; set; }
        public virtual decimal Rate { get; set; }
        public virtual int Quantity { get; set; }
        public virtual Invoice Invoice { get; set; }
        public virtual Measurement Measurement { get; set; }

        #region Extensibility Method Definitions

        partial void OnCreated();

        #endregion
    }
}
