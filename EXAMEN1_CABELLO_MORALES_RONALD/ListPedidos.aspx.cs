using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Drawing;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;

using EXAMEN1_CABELLO_MORALES_RONALD.Clases;
using EXAMEN1_CABELLO_MORALES_RONALD.Classes;

namespace EXAMEN1_CABELLO_MORALES_RONALD
{
    public partial class ListPedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                // Fin Ocultamiento 
                txtId.Visible = false;
                Tab1.CssClass = "Clicked";
                MainView.ActiveViewIndex = 0;
                Tab1.Visible = false;
                Tab2.Visible = false;
                MainView.ActiveViewIndex = 0;   
                try
                {
                    CargarGrilla();
                }
                catch (Exception ex)
                {

                   mensaje23(ex.Message);
                }
    
            }

        }

        protected void Tab1_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Clicked";
            Tab2.CssClass = "Initial";            
            MainView.ActiveViewIndex = 0;
        }

        protected void Tab2_Click(object sender, EventArgs e)
        {
            Tab1.CssClass = "Initial";
            Tab2.CssClass = "Clicked";           
            MainView.ActiveViewIndex = 1;
        }

  
        public void CargarGrilla()
        // ************************
        {
            try
            {
                GridView1.DataSource = ListPedidos.MostrarGrid("LISTAR", ".", ".");
                GridView1.DataBind();
                GridView1.UseAccessibleHeader = true;  // cambiar modelo
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader; // cambiar imagen 
            }
            catch (Exception Ex)
            {

                Response.Write(Ex.Message);
            }
        }
        private void mensaje23(string msg)
        {
            string jsAlert = String.Format("alert('{0}');", msg);
            ClientScript.RegisterStartupScript(GetType(), "Alerta", jsAlert, true);
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            if (txtBuscar.Text != "")
            {
                CargarGrillaBuscar();
            }
            else
            {
                CargarGrilla();
            }
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                txtId.Text = GridView1.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text.ToString();
               Tab1.Visible = false; Tab2.Visible = false; 
               MainView.ActiveViewIndex = 1;
                CargarGrillaD(GridView1.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text.ToString());
                decimal imp = 0;

                foreach (GridViewRow row in GridView2.Rows)
                {
                    imp += Convert.ToDecimal(row.Cells[4].Text);

                }

                txtga_totimporte.Text = imp.ToString("N2");
                Label3.Text = "PEDIDO   " + GridView1.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text.ToString() +"   "+ GridView1.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text.ToString();
                dtRequiredDate.Text = Convert.ToString(DateTime.Today).Substring(0, 10);
                txtga_totimporte.Enabled = false;
               

            }            

        }

        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    row.Attributes["onmouseover"] = "this.style.background = '#ffb294'; this.style.cursor = 'pointer'";
                    row.Attributes["onmouseout"] = "this.style.background='#ffffff'";
                    row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + row.DataItemIndex, true);
                }
            }
          

            base.Render(writer);
        }


        protected void txtBuscar_Load(object sender, EventArgs e)
        {
            CargarGrillaBuscar();
        }

        protected void ButtBuscar_Click(object sender, EventArgs e)
        {
            CargarGrillaBuscar();
        }

        public void CargarGrillaBuscar()
        {
            if (txtBuscar.Text != "")
            {
                switch (DirectionList.SelectedValue)
                {
                    case "Nombre/Razon Social":
                        GridView1.DataSource = ListPedidos.MostrarGridBuscar("DESCRI", txtBuscar.Text, ".");
                        GridView1.DataBind();
                        break;
                    default:
                        break;
                }
            }
            else
            {
                CargarGrilla();
            }
        }

        public void CargarGrillaD(string documento)
        // ************************
        {
            try
            {
                GridView2.DataSource = ListPedidos.MostrarGrid("DETALLE", documento, ".");
                GridView2.DataBind();
                GridView2.UseAccessibleHeader = true;  // cambiar modelo
                GridView2.HeaderRow.TableSection = TableRowSection.TableHeader; // cambiar imagen 
                decimal imp = 0;
                //decimal igv = 0;
                //decimal tot = 0;
                foreach (GridViewRow row1 in GridView2.Rows)
                {
                    imp += Convert.ToDecimal(row1.Cells[4].Text);
                }

                txtga_totimporte.Text = imp.ToString("N2");
            }
            catch (Exception Ex)
            {
                Response.Write(Ex.Message);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {


                Pedido pedido = new Pedido();
                pedido.OrderID = Convert.ToInt32(txtId.Text);               
                pedido.Motivo = txtga_Motivo.Text;
                pedido.RequiredDate = Convert.ToDateTime(dtRequiredDate.Text);
                pedido.Estado = checkBox_estado.Checked;
               
                if (ListPedidos.Actualiza(pedido) > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randowtext", "alertModificar()", true);
                    txtga_Motivo.Text = "";
                    checkBox_estado.Checked = false;
                    dtRequiredDate.Text = Convert.ToString(DateTime.Today).Substring(0, 10);
                    MainView.ActiveViewIndex = 0;
                    CargarGrilla();
                }
            
            }
            catch (Exception ex)
            {
                mensaje23(ex.Message + ex.StackTrace);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            MainView.ActiveViewIndex = 0;
        }
    }
}