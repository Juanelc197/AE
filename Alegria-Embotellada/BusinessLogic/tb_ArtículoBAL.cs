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
            return tb_ArtículoDAL.vizualisarArticulo();
        }
        #endregion

        #region Vizualizar Nombre
        public static tb_Artículo VisualizarNombre(string nombre)
        {
            return tb_ArtículoDAL.VisualizarNombre(nombre);
        }
        #endregion

        #region Vizualizar precio
        public static List<tb_Artículo> VisualizarPrecio(decimal precio1,decimal precio2)
        {
            return tb_ArtículoDAL.VisualizarPrecio(precio1,precio2);
        }
        #endregion

        #region Visualizar Marca
        public static List<tb_Artículo> vizualisarMarca(int marca)
        {
            return tb_ArtículoDAL.vizualisarMarca(marca);
        }
        #endregion




    }
}
