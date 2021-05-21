using System;
using System.Collections.Generic;
using System.Text;

namespace KalbeData
{
    public partial class Invoice
    {
        Invoice()
        {
            OnCreated();
            SubInvoices = new List<SubInvoice>();
        }
        public virtual int Id { get; set; }
        public virtual int LanguageId { get; set; }
        public virtual int CurrencyId { get; set; }
        public virtual int PurchaseOrderId { get; set; }
        public virtual int CustomerId { get; set; }
        public virtual string Code { get; set; }
        public virtual string InvoiceBy { get; set; }
        public virtual DateTime InvoiceDate { get; set; }
        public virtual bool IsImmediately { get; set; }
        public virtual int Discount { get; set; }
        public virtual int Status { get; set; }
        public virtual Language Language { get; set; }
        public virtual Currency Currency { get; set; }
        public virtual PurchaseOrder PurchaseOrder { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual List<SubInvoice> SubInvoices { get; set; }
        

        #region Extensibility Method Definitions

        partial void OnCreated();

        #endregion
    }
}
