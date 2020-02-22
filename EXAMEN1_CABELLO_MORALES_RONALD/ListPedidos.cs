using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using EXAMEN1_CABELLO_MORALES_RONALD.Clases;
using EXAMEN1_CABELLO_MORALES_RONALD.Classes;

namespace EXAMEN1_CABELLO_MORALES_RONALD
{
    public partial class ListPedidos
    {
        public static DataSet MostrarGrid(string ordena, string campo, string chipName)
        {
            SqlParameter[] dbParams = new SqlParameter[]
				{                     
                     DBHelper.MakeParam("@ordena", SqlDbType.VarChar, 0, ordena),
                     DBHelper.MakeParam("@campo", SqlDbType.VarChar, 0, campo),
                     DBHelper.MakeParam("@chipName", SqlDbType.VarChar, 0, chipName)
				};
            return DBHelper.ExecuteDataSet("spListaPedido", dbParams);
        }
        public static DataSet MostrarGridBuscar(string orderna, string campo, string chipName)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {                    
                     DBHelper.MakeParam("@ordena", SqlDbType.VarChar, 0, orderna),
                     DBHelper.MakeParam("@campo", SqlDbType.VarChar, 0, campo),
                     DBHelper.MakeParam("@chipName", SqlDbType.VarChar, 0, chipName)
                };
            return DBHelper.ExecuteDataSet("spListaPedido", dbParams);
        }
      
        
        public static int Actualiza(Pedido pedido)
        {
            SqlParameter[] dbParams = new SqlParameter[]
                {
                    DBHelper.MakeParam("@OrderID", SqlDbType.Int, 0, pedido.OrderID),
                    DBHelper.MakeParam("@Motivo", SqlDbType.VarChar, 0, pedido.Motivo),                 
                    DBHelper.MakeParam("@RequiredDate", SqlDbType.Date, 0, pedido.RequiredDate),
                    DBHelper.MakeParam("@Estado", SqlDbType.Bit, 0, pedido.Estado)
                   
                };
            return Convert.ToInt32(DBHelper.ExecuteScalar("Actualiza_Pedido", dbParams));
        }
     
    }
}