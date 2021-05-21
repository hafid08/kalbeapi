using System;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;

namespace KalbeData
{
    public partial class KalbeContext : DbContext
    {
        public KalbeContext() :
            base()
        {
            OnCreated();

        }
        public KalbeContext(DbContextOptions<KalbeContext> options) :
            base(options)
        {
            OnCreated();

        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.Options.Extensions.OfType<RelationalOptionsExtension>().Any(ext => !string.IsNullOrEmpty(ext.ConnectionString) || ext.Connection != null))
                CustomizeConfiguration(ref optionsBuilder);
            base.OnConfiguring(optionsBuilder);
            //optionsBuilder.UseMySQL("server=localhost;database=library;user=user;password=password");
        }

        partial void CustomizeConfiguration(ref DbContextOptionsBuilder optionsBuilder);
        public DbSet<Language> Languages { get; set; }
        public DbSet<Measurement> Measurements { get; set; }
        public DbSet<Currency> Currencies { get; set; }
        public DbSet<ExchangeRate> ExchangeRates { get; set; }
        public DbSet<PurchaseOrder> PurchaseOrders { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Invoice> Invoices { get; set; }
        public DbSet<SubInvoice> SubInvoices { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Language>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Code).IsRequired();
                entity.Property(e => e.Value).IsRequired();
            });
            modelBuilder.Entity<Measurement>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Unit).IsRequired();
                entity.Property(e => e.Symbol).IsRequired();
            });
            modelBuilder.Entity<Currency>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Code).IsRequired();
                entity.Property(e => e.Value).IsRequired();
                entity.Property(e => e.Country).IsRequired();
                entity.Property(e => e.Symbol).IsRequired();
                entity.Property(e => e.IsActive).IsRequired();
            });
            modelBuilder.Entity<ExchangeRate>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.StartDate).IsRequired();
                entity.Property(e => e.EndDate).IsRequired();
                entity.Property(e => e.FromCurr).IsRequired();
                entity.Property(e => e.ToCurr).IsRequired();
                entity.Property(e => e.Rate).HasColumnType("decimal(24,8)").IsRequired();
            });
            modelBuilder.Entity<PurchaseOrder>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Code).IsRequired();
                entity.Property(e => e.PIC).IsRequired();
                entity.Property(e => e.Amount).HasColumnType("decimal(24,8)").IsRequired();
            });
            modelBuilder.Entity<Customer>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.FullName).IsRequired();
                entity.Property(e => e.Address).IsRequired();
                entity.Property(e => e.Logo).IsRequired();
            });
            modelBuilder.Entity<Invoice>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.LanguageId).IsRequired();
                entity.Property(e => e.CurrencyId).IsRequired();
                entity.Property(e => e.PurchaseOrderId).IsRequired();
                entity.Property(e => e.CustomerId).IsRequired();
                entity.Property(e => e.Code).IsRequired();
                entity.Property(e => e.InvoiceBy).IsRequired();
                entity.Property(e => e.InvoiceDate).IsRequired();
                entity.Property(e => e.Discount).IsRequired();
                entity.Property(e => e.IsImmediately).IsRequired();
                entity.Property(e => e.Status).IsRequired();
                entity.HasOne(e => e.Language).WithMany(op => op.Invoices).OnDelete(DeleteBehavior.Cascade).IsRequired(true).HasForeignKey(e => e.LanguageId);
                entity.HasOne(e => e.Currency).WithMany(op => op.Invoices).OnDelete(DeleteBehavior.Cascade).IsRequired(true).HasForeignKey(e => e.CurrencyId);
                entity.HasOne(e => e.PurchaseOrder).WithMany(op => op.Invoices).OnDelete(DeleteBehavior.Cascade).IsRequired(true).HasForeignKey(e => e.PurchaseOrderId);
                entity.HasOne(e => e.Customer).WithMany(op => op.Invoices).OnDelete(DeleteBehavior.Cascade).IsRequired(true).HasForeignKey(e => e.CustomerId);
                entity.HasMany(e => e.SubInvoices).WithOne(op => op.Invoice).OnDelete(DeleteBehavior.Cascade).IsRequired(true).HasForeignKey(op => op.InvoiceId);
            });
            modelBuilder.Entity<SubInvoice>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.InvoiceId).IsRequired();
                entity.Property(e => e.MeasurementId).IsRequired();
                entity.Property(e => e.Description).IsRequired();
                entity.Property(e => e.Rate).HasColumnType("decimal(24,8)").IsRequired();
                entity.Property(e => e.Quantity).IsRequired();
                entity.HasOne(e => e.Invoice).WithMany(op => op.SubInvoices).OnDelete(DeleteBehavior.Cascade).IsRequired(true).HasForeignKey(e => e.InvoiceId);
                entity.HasOne(e => e.Measurement).WithMany(op => op.SubInvoices).OnDelete(DeleteBehavior.Cascade).IsRequired(true).HasForeignKey(e => e.MeasurementId);
            });
        }

        #region Extensibility Method Definitions

        partial void OnCreated();

        #endregion
    }
}
