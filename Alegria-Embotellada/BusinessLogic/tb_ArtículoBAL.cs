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

    }
}
