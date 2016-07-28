using DataAcces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
   public class tb_SucursalBAL
    {
        #region Visualizar Sucursal
        public static List<tb_Sucursal> VisualizarSucrusal()
        {
            return tb_SucursalDAL.VisualizarSucrusal();
        }
        #endregion

        #region Visualizar Colonia
        public static tb_Sucursal VisualizarColonia(string colonia)
        {
            return tb_SucursalDAL.VisualizarColonia(colonia);
        }
        #endregion

        #region Visualizar Marca
        public static List<tb_Sucursal> vizualisarsLugar(int sucursal)
        {
            return tb_SucursalDAL.vizualisarLugar(sucursal);
        }
        #endregion

    }
}
