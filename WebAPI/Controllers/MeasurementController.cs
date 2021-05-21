﻿using KalbeData;
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
    public class MeasurementController : ControllerBase
    {
        private DbContextOptions<KalbeContext> dbContextOptions;
        public MeasurementController(DbContextOptions<KalbeContext> dbContextOptions)
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
                        var res = kalbeContext.Measurements.ToList();
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
