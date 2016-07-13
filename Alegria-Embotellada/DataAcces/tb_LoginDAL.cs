using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAcces
{
   public class tb_LoginDAL
    {
        #region Validar NameNick
        public static bool validarNameNick (string username)
        { using(AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from b in bd.tb_Login
                             where b.UserName == username
                             select b).Count();
                if (query > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                
            }
            
        }
        #endregion
        #region Validar Password
        public static bool validarPassword(string password)
        {
            using(AlegriaEmbotelladaEntities bd = new AlegriaEmbotelladaEntities())
            {
                var query = (from b in bd.tb_Login
                             where b.PASSWORD == password
                             select b).Count();
                if(query > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        #endregion
        #region Insertar Datos 
        public static bool IngresarDatos (tb_Login login)
        {
            using(AlegriaEmbotelladaEntities bd  = new AlegriaEmbotelladaEntities())
            {
                bd.tb_Login.Add(login);
                bd.SaveChanges();
                return true;
            }
        }
        #endregion
    }
}
