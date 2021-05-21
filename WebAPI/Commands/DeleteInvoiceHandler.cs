using KalbeData;
using MediatR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using WebAPI.Models;

namespace WebAPI.Commands
{
    public class DeleteInvoiceHandler : IRequestHandler<DeleteInvoice, ReturnValue>
    {

        private readonly DbContextOptions<KalbeContext> dbContextOptions;
        public DeleteInvoiceHandler(DbContextOptions<KalbeContext> dbContextOptions)
        {
            this.dbContextOptions = dbContextOptions;
        }

        public async Task<ReturnValue> Handle(DeleteInvoice request, CancellationToken cancellationToken)
        {
            using (KalbeContext kalbeContext = new KalbeContext(dbContextOptions))
            {
                var invoice = kalbeContext.Invoices.FirstOrDefault(x => x.Id == request.InvoiceId);
                if (invoice != null)
                {
                    var subs = kalbeContext.SubInvoices.Where(x => x.InvoiceId == request.InvoiceId);
                    kalbeContext.SubInvoices.RemoveRange(subs);
                    kalbeContext.Invoices.Remove(invoice);
                }
                kalbeContext.SaveChanges();
                return new SuccessReturnValue();
            }
        }
    }
}
