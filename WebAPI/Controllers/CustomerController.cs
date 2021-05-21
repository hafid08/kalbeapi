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
    public class CustomerController : ControllerBase
    {
        private DbContextOptions<KalbeContext> dbContextOptions;
        public CustomerController(DbContextOptions<KalbeContext> dbContextOptions)
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
                        var res = kalbeContext.Customers.Select(x=> new { x.Id, x.FullName }).ToList();
                        return Ok(new SuccessReturnValue { Data = res });
                    }
                });
            }
            catch (Exception ex)
            {
                return Ok(new FailedReturnValue(ex.Message));
            }
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            try
            {
                return await Task.Run(() =>
                {
                    using (KalbeContext kalbeContext = new KalbeContext(dbContextOptions))
                    {
                        var res = kalbeContext.Customers.FirstOrDefault(x=>x.Id == id);
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
