using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPI.Models;

namespace WebAPI.Commands
{
    public class DeleteInvoice : IRequest<ReturnValue>
    {
        public int InvoiceId { get; set; }
        public DeleteInvoice(int invoiceId)
        {
            InvoiceId = invoiceId;
        }


    }
}
