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
    public class LanguageController : ControllerBase
    {

        private DbContextOptions<KalbeContext> dbContextOptions;
        public LanguageController(DbContextOptions<KalbeContext> dbContextOptions)
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
                        var res = kalbeContext.Languages.Select(x => new { x.Id, Name = string.Format("{0} ({1})", x.Value, x.Code.ToUpper()) }).ToList();
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
