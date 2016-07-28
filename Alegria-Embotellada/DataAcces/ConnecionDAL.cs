using System;
using System.Collections.Generic;
using System.Configuration;
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
            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["AlegriaEmbotelladaConnectionString"].ToString();
            try
            {
                conn.Open();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
        #endregion
    }
}
