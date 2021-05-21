using KalbeData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPI.Data
{
    public class KalbeDbInitializer : IKalbeDbInitializer
    {
        private readonly KalbeContext kalbeContext;

        public KalbeDbInitializer(KalbeContext context)
        {
            kalbeContext = context;
        }
        public void InitializeAsync()
        {
            Console.WriteLine("Kalbe DB Initilization...");
            // Make sure database created
            kalbeContext.Database.CanConnect();
        }
    }
}
