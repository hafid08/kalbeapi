using KalbeData;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CurrencyController : ControllerBase
    {
        private DbContextOptions<KalbeContext> dbContextOptions;
        public CurrencyController(DbContextOptions<KalbeContext> dbContextOptions)
        {
            this.dbContextOptions = dbContextOptions;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                return await Task.Run(() =>
                {
                    using (KalbeContext kalbeContext = new KalbeContext(dbContextOptions))
                    {
                        var res = kalbeContext.Currencies.Select(x => new { x.Id, Name = string.Format("{0} {1} ({2})", x.Country, x.Value, x.Code.ToUpper()), x.Symbol }).ToList();
                        return Ok(new SuccessReturnValue { Data = res });
                    }
                });
            }
            catch (Exception ex)
            {
                return Ok(new FailedReturnValue(ex.Message));
            }
        }


        [HttpGet("Rate")]
        public async Task<IActionResult> GetRates()
        {
            try
            {
                return await Task.Run(() =>
                {
                    using (KalbeContext kalbeContext = new KalbeContext(dbContextOptions))
                    {
                        var res = kalbeContext.ExchangeRates.Where(y => y.EndDate >= DateTime.Now && y.StartDate <= y.StartDate)
                            .Select(x => new { Code = string.Format("{0}{1}", x.FromCurr, x.ToCurr), x.Rate }).ToList();
                        return Ok(new SuccessReturnValue { Data = res });
                    }
                });
            }
            catch (Exception ex)
            {
                return Ok(new FailedReturnValue(ex.Message));
            }
        }
    }
}
