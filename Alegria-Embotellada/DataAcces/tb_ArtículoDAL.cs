using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAcces
{
    public class tb_ArtículoDAL
    {
        #region vizualizar Articulo
        public static List<tb_Artículo> vizualisarArtículo()
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from d in bd.tb_Artículo
                             select d).ToList();
                return query;
            }
        }
        #endregion

        #region Visualizar Nombre del articulo
        public static tb_Artículo VisualizarNombre(string nombre)
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from b in bd.tb_Artículo
                             where b.Nombre == nombre
                             select b).Single();
                return query;
            }
        }
        #endregion

        #region Visualizar Precio
        public static tb_Artículo VisualizarPrecio(decimal precio)
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from b in bd.tb_Artículo
                             where b.Precio == precio
                             select b).Single();
                return query;
            }
        }
        #endregion
    }
}
