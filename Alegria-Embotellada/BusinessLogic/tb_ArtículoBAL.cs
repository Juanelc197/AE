using DataAcces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
   public class tb_ArtículoBAL
    {
        #region Visualizar Articulo
        public static List<tb_Artículo> vizualisarArtículo()
        {
            return tb_ArtículoDAL.vizualisarArtículo();
        }
        #endregion

        #region Vizualizar Nombre
        public static tb_Artículo VisualizarNombre(string nombre)
        {
            return tb_ArtículoDAL.VisualizarNombre(nombre);
        }
        #endregion

        #region Vizualizar precio
        public static tb_Artículo VisualizarPrecio(decimal precio)
        {
            return tb_ArtículoDAL.VisualizarPrecio(precio);
        }
        #endregion
    }
}
