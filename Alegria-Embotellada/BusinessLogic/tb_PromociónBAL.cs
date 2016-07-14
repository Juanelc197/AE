using DataAcces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
   public class tb_PromociónBAL
    {
        #region Visualizar Promoción
        public static List<tb_Promoción> VizualisarPromocion()
        {
            return tb_PromociónDAL.VizualisarPromocion();
        }
        #endregion
    }
}
