using DataAcces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
   public class tb_PromociónBAL
    {
        #region Visualizar Promoción
        public static DataTable VizualisarPromocion()
        {
            return tb_PromociónDAL.VizualisarPromocion();
        }
        #endregion

        #region Visualizar Promoción
        public static DataTable Vizualisarfiltro(string marca,decimal precio1, decimal precio2, string sucursal)
        {
            return tb_PromociónDAL.Vizualisarfiltor(marca, precio1, precio2, sucursal);
        }
        #endregion

    }
}
