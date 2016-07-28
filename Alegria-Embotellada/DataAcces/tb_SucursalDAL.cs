using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAcces
{
    public class tb_SucursalDAL
    {
        #region VizualizarSucrusal
        public static List<tb_Sucursal> VisualizarSucrusal()
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from d in bd.tb_Sucursal
                             select d).ToList();
                return query;
            }
        }
        #endregion

        #region Visualizar Colonia
        public static tb_Sucursal VisualizarColonia(string colonia)
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from b in bd.tb_Sucursal
                             where b.Colonia == colonia
                             select b).Single();
                return query;
            }
        }
        #endregion

        #region vizualizar Lugar
        public static List<tb_Sucursal> vizualisarLugar(int sucrusal)
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from d in bd.tb_Sucursal
                             where d.PK_Sucursal == sucrusal
                             select d).ToList();
                return query;
            }
        }
        #endregion

    }
}
