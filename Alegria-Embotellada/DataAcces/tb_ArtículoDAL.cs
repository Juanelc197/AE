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
        public static List<tb_Artículo> vizualisarArticulo()
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
        public static List<tb_Artículo> VisualizarPrecio(decimal precio1, decimal precio2)
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from b in bd.tb_Artículo
                             where b.Precio >= precio1 && b.Precio <= precio2
                             select b).ToList();
                return query;
            }
        }
        #endregion

        #region vizualizar Marca
        public static List<tb_Artículo> vizualisarMarca(int marca)
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from d in bd.tb_Artículo
                             where d.PK_Artículo == marca
                             select d).ToList();
                return query;
            }
        }
        #endregion

        #region Visualizar Id
        public static tb_Artículo VisualizarId(int id)
        {
            using (AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from b in bd.tb_Artículo
                             where b.PK_Artículo == id
                             select b).Single();
                return query;
            }
        }
        #endregion

    }
}

