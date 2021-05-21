using System;
using System.Collections.Generic;
using System.Text;

namespace KalbeData
{
    public partial class ExchangeRate
    {
        ExchangeRate()
        {
            OnCreated();
        }
        public virtual int Id { get; set; }
        public virtual DateTime StartDate { get; set; }
        public virtual DateTime EndDate { get; set; }
        public virtual string FromCurr { get; set; }
        public virtual string ToCurr { get; set; }
        public virtual decimal Rate { get; set; }

        #region Extensibility Method Definitions

        partial void OnCreated();

        #endregion
    }
}
