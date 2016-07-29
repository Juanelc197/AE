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

        #region Buscar Marca
        public static DataTable buscarmarca(string marca)
        {
            return tb_PromociónDAL.buscarmarca(marca);
        }
        #endregion

        #region Buscar Sucursal
        public static DataTable buscarsucrusal(string sucursal)
        {
            return tb_PromociónDAL.buscarsucrusal(sucursal);
        }
        #endregion

        #region Buscar Precio
        public static DataTable buscarprecio(decimal precio1, decimal precio2)
        {
            return tb_PromociónDAL.buscarprecio(precio1, precio2);
        }
        #endregion

        }
    }