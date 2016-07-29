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

    }
}
