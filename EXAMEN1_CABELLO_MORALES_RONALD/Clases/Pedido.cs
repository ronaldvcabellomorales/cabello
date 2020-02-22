using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EXAMEN1_CABELLO_MORALES_RONALD.Clases
{
    public class Pedido
    {
        public int OrderID { get; set; }
        public String Motivo { get; set; }
        public DateTime RequiredDate { get; set; }
        public bool Estado{ get; set; }
        public String ordena { get; set; }

    }
}