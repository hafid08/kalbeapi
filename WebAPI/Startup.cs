using KalbeData;
using MediatR;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json.Serialization;
//using Swashbuckle.AspNetCore.Swagger;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPI.Data;

namespace WebAPI
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();

            // Add KalbeContext
            DbContextOptions<KalbeContext> kalbeContextOptions = null;
            services.AddDbContext<KalbeContext>(optionsBuilder =>
            {
                optionsBuilder.UseSqlServer(Configuration.GetConnectionString("Kalbe"), sqlServerOptionsAction: sqlOptions =>
                {
                    sqlOptions.CommandTimeout(1200);
                });
                kalbeContextOptions = (DbContextOptions<KalbeContext>)optionsBuilder.Options;
            });


            services.AddScoped<IKalbeDbInitializer, KalbeDbInitializer>();
            IServiceProvider serviceProvider = services.BuildServiceProvider();
            // Initilize database
            IKalbeDbInitializer loyaltoDbInitializer = serviceProvider.GetService<IKalbeDbInitializer>();
            loyaltoDbInitializer.InitializeAsync();


            //Add DbContextOption
            services.AddSingleton(kalbeContextOptions);

            // Add MediatR
            services.AddMediatR();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
