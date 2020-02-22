using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EXAMEN1_CABELLO_MORALES_RONALD;
using System.Data;
using EXAMEN1_CABELLO_MORALES_RONALD.Clases;
using EXAMEN1_CABELLO_MORALES_RONALD.Classes;

namespace EXAMEN1_CABELLO_MORALES_RONALD
{
    public partial class Menuprincipal : System.Web.UI.MasterPage
    {
    
    //    EXAMEN1_CABELLO_MORALES_RONALD.Clases.Conexion conectar = new EXAMEN1_CABELLO_MORALES_RONALD.Clases.Conexion();

        protected void Page_Load(object sender, EventArgs e)
        {
            string cadena = HttpContext.Current.Request.Url.AbsoluteUri;
            string[] Separado = cadena.Split('/');
            string Final = Separado[Separado.Length - 1];

            if (!IsPostBack)
            {
               
             txNomEmp.Text = " CONTACT CENTER ";
             txRucEmp.Text = "10158468650";
             Image.ImageUrl = "~/assets/img/Fotos/foto2.jpg";                      
             txtUser.Text = "RONALD CABELLO MORALES";
             Nivel.Text = "Administrador";
            }
        }


      
    }
}
