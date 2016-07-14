using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAcces
{
  public  class tb_PromociónDAL
    {
        #region Vizaualizar Promoción
        public static List<tb_Promoción> VizualisarPromocion()
        {
            using(AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from d in bd.tb_Promoción
                             select d).ToList();
                return query;
            }
        }
        #endregion
    }
}
