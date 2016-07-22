using DataAcces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class tb_ConsumidoBAL
    {
        #region Ingresar Datos Consumidor
        public static bool IngresarDatosConsumidor(tb_Consumidor consumidor)
        {
            return tb_ConsumidoDAL.IngresarDatosConsumidor(consumidor);
        }
        #endregion

        #region Modificar Consumidor
        public static bool ModificarConsumidor(tb_Consumidor consumido)
        {
            return tb_ConsumidoDAL.ModificarConsumidor(consumido);
        }
        #endregion

        #region Vizualizar Consumidor
        public static List<tb_Consumidor> VisualizarConsumidor()
        {
            return tb_ConsumidoDAL.VisualizarConsumidor();
        }
        #endregion

        #region validacacion de e-mail
        public static bool validaremail(string email)
        {
            return tb_ConsumidoDAL.validaremail(email);
        }
        #endregion
    }
}
