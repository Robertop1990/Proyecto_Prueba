using Agenda.API.Abstractions;
using Agenda.API.Application.Commands.ProspectoCommand;
using Agenda.API.Application.Comun;
using Agenda.API.Configurations;
using Agenda.API.Extensions;
using Agenda.API.Infrastructure.AutofacModules;
using Agenda.Infrastucture;
using Autofac;
using Autofac.Extensions.DependencyInjection;
using AutoMapper;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.Filters;
using System;
using System.Reflection;

namespace Agenda.API
{
    public class Startup
    {
        readonly string CorsPolicy = "CorsPolicy";
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public virtual IServiceProvider ConfigureServices(IServiceCollection services)
        {
            services
                .AddGrpc(options =>
                {
                    options.EnableDetailedErrors = true;
                })
                .Services
                .AddAutoMapper(Assembly.GetExecutingAssembly())
                .AddCustomMvc()
                .AddCustomDbContext(Configuration)
                .AddCustomSwagger(Configuration);

            services.AddScoped<IHeaderConfiguration, HeaderConfiguration>();
            services.AddTransient<IImpresionLog, ImpresionLog>();

            var builder = new ContainerBuilder();
            builder.Populate(services);

            builder.RegisterModule(new MediatorModule());
            builder.RegisterModule(new CommandsModule());
            builder.RegisterModule(new QueriesModule(Configuration.GetConnectionString("Organizate")));
            builder.RegisterModule(new RepositoryModule());
            builder.RegisterModule(new ValidatorModule());

            var container = builder.Build();

            return container.Resolve<IServiceProvider>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                string swaggerJsonBasePath = string.IsNullOrWhiteSpace(c.RoutePrefix) ? "." : "..";
                c.SwaggerEndpoint($"{swaggerJsonBasePath}/swagger/v1/swagger.json", "API Portal Asesoria Digital - Agenda");
            });

            app.UseHttpsRedirection();
            app.UseHeaderConfiguration();
            app.UseRouting();
            app.UseCors(CorsPolicy);
            app.UseAuthorization();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
    static class CustomExtensionsMethods
    {
        public static IServiceCollection AddCustomMvc(this IServiceCollection services)
        {
            services.AddCors(options =>
            {
                options.AddPolicy("CorsPolicy",
                                  builder =>
                                  {
                                      builder.AllowAnyOrigin()
                                             .AllowAnyHeader()
                                             .AllowAnyMethod();
                                  });
            });
            services.AddControllers();
            return services;
        }
        public static IServiceCollection AddCustomDbContext(this IServiceCollection services, IConfiguration configuration)
        {
            return services.AddDbContext<AgendaContext>(options =>
                    options.UseSqlServer(configuration.GetConnectionString("Organizate")));
        }
        public static IServiceCollection AddCustomSwagger(this IServiceCollection services, IConfiguration configuration)
        {
            return services.AddSwaggerGen(c =>
            {
                c.DescribeAllEnumsAsStrings();
                c.EnableAnnotations();
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "Portal Asesoria Digital - Agenda",
                    Version = "v1",
                    Description = "API para exponer servicios de Portal Asesoria Digital - Agenda"
                });
                c.ExampleFilters();

            }).AddSwaggerExamplesFromAssemblyOf<RequestCrearProspectoCommandExample>();
        }
    }
}
