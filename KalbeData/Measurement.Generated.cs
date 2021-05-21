using System;
using System.Collections.Generic;
using System.Text;

namespace KalbeData
{
    public partial class Measurement
    {
        Measurement()
        {
            OnCreated();
            SubInvoices = new List<SubInvoice>();
        }
        public virtual int Id { get; set; }
        public virtual string Unit { get; set; }
        public virtual string Symbol { get; set; }
        public virtual List<SubInvoice> SubInvoices { get; set; }

        #region Extensibility Method Definitions

        partial void OnCreated();

        #endregion
    }
}
