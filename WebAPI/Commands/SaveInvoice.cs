using KalbeData;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPI.Models;

namespace WebAPI.Commands
{
    public class SaveInvoice : IRequest<ReturnValue>
    {
        public Invoice Invoice { get; private set; }

        public SaveInvoice(Invoice invoice)
        {
            Invoice = invoice;
        }
    }
}
