using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAcces
{
  public  class ConnecionDAL
    {

        #region Conexión a Sql
        public static bool ConnectToSql()
        {
            string conexion = "";
            string connectionstring = ConfigurationManager.ConnectionStrings["AlegriaEmbotelladaConnectionString"].ToString();
            SqlConnection sqlcon = new SqlConnection();
            try
            {
                sqlcon.ConnectionString = connectionstring;
                sqlcon.Open();
            }
            catch (Exception exepcion)
            {
                conexion = exepcion.Message;
            }
            if (sqlcon.State == ConnectionState.Open)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }
        #endregion
    }
}
