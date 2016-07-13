using DataAcces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAcces
{
    public class tb_ConsumidoDAL
    {
        #region Ingresar Datos Consumido
        public static bool IngresarDatosConsumidor ( tb_Consumidor consumidor)
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                bd.tb_Consumidor.Add(consumidor);
                bd.SaveChanges();
                return true;
            }
        }
        #endregion
    }
}
