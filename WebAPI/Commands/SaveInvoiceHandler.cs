using KalbeData;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using WebAPI.Models;

namespace WebAPI.Commands
{
    public class SaveInvoiceHandler : IRequestHandler<SaveInvoice, ReturnValue>
    {

        private readonly DbContextOptions<KalbeContext> dbContextOptions;
        public SaveInvoiceHandler(DbContextOptions<KalbeContext> dbContextOptions)
        {
            this.dbContextOptions = dbContextOptions;
        }
        public async Task<ReturnValue> Handle(SaveInvoice request, CancellationToken cancellationToken)
        {
            using (KalbeContext kalbeContext = new KalbeContext(dbContextOptions))
            {
                Invoice invoice = request.Invoice;
                if (invoice.Id > 0)
                {
                    var subs = kalbeContext.SubInvoices.Where(x => x.InvoiceId == invoice.Id);
                    kalbeContext.SubInvoices.RemoveRange(subs);
                    kalbeContext.Invoices.Attach(invoice).State = EntityState.Modified;
                    kalbeContext.SubInvoices.AddRange(invoice.SubInvoices);
                    kalbeContext.SaveChanges();
                }
                else
                {
                    if(kalbeContext.Invoices.Any(x=>x.Code == invoice.Code))
                    {
                        return new FailedReturnValue("Invoice No was already exist");
                    }
                    kalbeContext.Invoices.Add(invoice);
                    kalbeContext.SaveChanges();
                    invoice.SubInvoices.ForEach(x => x.InvoiceId = invoice.Id);
                    kalbeContext.SubInvoices.AddRange(invoice.SubInvoices);
                    kalbeContext.SaveChanges();
                }
                return new SuccessReturnValue();
            }
        }
    }
}
