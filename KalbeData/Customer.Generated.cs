using System;
using System.Collections.Generic;
using System.Text;

namespace KalbeData
{
    public partial class Customer
    {
        Customer()
        {
            OnCreated();
            Invoices = new List<Invoice>();
        }
        public virtual int Id { get; set; }
        public virtual string FullName { get; set; }
        public virtual string Address { get; set; }
        public virtual string Logo { get; set; }
        public virtual List<Invoice> Invoices { get; set; }

        #region Extensibility Method Definitions

        partial void OnCreated();

        #endregion
    }
}
