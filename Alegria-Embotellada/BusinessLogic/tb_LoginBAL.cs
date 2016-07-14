using DataAcces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
  public  class tb_LoginBAL
    {
        #region ingresar datos
        public static bool IngresarDatos(tb_Login login)
        {
            return tb_LoginDAL.IngresarDatos(login);
        }
        #endregion
        #region Validar NameNick
        public static bool validarNameNick(string username)
        {
            return tb_LoginDAL.validarNameNick(username);
        }
        #endregion
        #region Validar Password
        public static bool validrPassword(string password)
        {
            return tb_LoginDAL.validarPassword(password);
        }
        #endregion
        #region Modificar Login
        public static bool ModificarLogin(tb_Login login)
        {
            return tb_LoginDAL.ModificarLogin(login);
        }
        #endregion
    }
}
