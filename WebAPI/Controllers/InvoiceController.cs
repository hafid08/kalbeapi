using KalbeData;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPI.Commands;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InvoiceController : ControllerBase
    {
        private DbContextOptions<KalbeContext> dbContextOptions;
        private readonly IMediator mediator;
        private const string INVALID_INPUT_PARAMETERS = "Invalid input parameters.";
        public InvoiceController(DbContextOptions<KalbeContext> dbContextOptions, IMediator mediator)
        {
            this.dbContextOptions = dbContextOptions;
            this.mediator = mediator;
        }
        [AllowAnonymous]
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                return await Task.Run(() =>
                {
                    using (KalbeContext kalbeContext = new KalbeContext(dbContextOptions))
                    {
                        var res = kalbeContext.Invoices.Select(x => new {
                            x.Id,
                            x.Code,
                            Customer = x.Customer.FullName,
                            PurchaseOrder = x.PurchaseOrder.Code,
                            Language = string.Format("{0} ({1})", x.Language.Value, x.Language.Code.ToUpper()),
                            Currency = string.Format("{0} {1} - {2}", x.Currency.Country, x.Currency.Value, x.Currency.Code),
                            x.Status,
                        }).ToList();
                        return Ok(new SuccessReturnValue { Data = res });
                    }
                });
            }
            catch (Exception ex)
            {
                return Ok(new FailedReturnValue(ex.Message));
            }
        }
        [AllowAnonymous]
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                return await Task.Run(() =>
                {
                    using (KalbeContext kalbeContext = new KalbeContext(dbContextOptions))
                    {
                        var res = kalbeContext.Invoices.FirstOrDefault(x => x.Id == id);
                        return Ok(new SuccessReturnValue { Data = res });
                    }
                });
            }
            catch (Exception ex)
            {
                return Ok(new FailedReturnValue(ex.Message));
            }
        }
        [HttpPost]
        public async Task<IActionResult> Save([FromBody] Invoice invoice)
        {
            if (!ModelState.IsValid)
            {
                return Ok(new FailedReturnValue(INVALID_INPUT_PARAMETERS));
            }
            try
            {
                SaveInvoice saveInvoice = new SaveInvoice(invoice);
                var res = await mediator.Send(saveInvoice);
                return Ok(res);
            }
            catch (Exception ex)
            {
                return Ok(new FailedReturnValue(ex.Message));
            }
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (!ModelState.IsValid)
            {
                return Ok(new FailedReturnValue(INVALID_INPUT_PARAMETERS));
            }
            try
            {
                DeleteInvoice deleteInvoice = new DeleteInvoice(id);
                var res = await mediator.Send(deleteInvoice);
                return Ok(res);
            }
            catch (Exception ex)
            {
                return Ok(new FailedReturnValue(ex.Message));
            }
        }
    }
}
