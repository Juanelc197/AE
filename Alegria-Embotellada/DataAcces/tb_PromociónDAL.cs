using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAcces
{
    public class tb_PromociónDAL
    {
        #region Vizaualizar Promoción
        public static  List<tb_Promoción> VizualisarPromocion()
        {
            using(AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from p in bd.tb_Promoción
                             join s in bd.tb_Sucursal
                             on p.PK_Promoción equals s.PK_Sucursal
                             orderby s.PK_Sucursal ascending
                             select new
                             {
                                 Descripcion = p.Descripción,
                                 Dia_Inicial = p.Dia_Inicio,
                                 Dia_FInal = p.Dia_Finalización,
                                 Nombre_Sucrusal = s.Nombre_Sucursal,
                                 Colonia = s.Colonia,
                                 Calle = s.Calle,
                                 Numero = s.Número,
                                 Muicipio = s.Municipio_Estado
                             }).ToList();
                return query;
            }
        }
        #endregion
    }
}
