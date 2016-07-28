using DataAcces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class tb_LoginBAL
    {
        #region ingresar datos
        public static string MensajesIngresarDatos(tb_Login login)
        {
            string mensaje = "";
            bool isInsert = false;
            isInsert = tb_LoginDAL.IngresarDatos(login);
            //Validación para insertar Datos de Login
            if (isInsert)
            {
                mensaje = "";
            }
            else
            {
                mensaje = "Atención no se a registrado correctamente";
            }
            return mensaje;
        }
        #endregion

        #region Validar PasswordyUser del Login
        public static string usauarioExiste(string pass, string user)
        {
            string mensaje = "";
            bool isExiste = false;
            //Validación si los campos viene vaciós
            if (string.IsNullOrEmpty(user) || string.IsNullOrEmpty(pass))
            {
                mensaje = "Existen campos vacios, Favor de introducir usuarito y/o constraña";
            }
            else
            {
                isExiste = tb_LoginDAL.validarPasswordyNameNick(pass, user);
                //Validación si exixten los campos en el Login
                if (isExiste)
                {
                    mensaje = "";
                }
                else
                {
                    mensaje = "no se registrado";
                }
            }
            return mensaje;
        }
        #endregion

        #region Validar PasswordyUser del Fromulario
        public static string usauarioExisteformu(string pass, string user)
        {
            string mensaje = "";
            bool isExiste = false;
            //Validación para si Los campos no estan vaciós
            if (string.IsNullOrEmpty(user) || string.IsNullOrEmpty(pass))
            {
                mensaje = "Existen campos vacios, Favor de introducir usuarito y/o constraña";
            }
            else
            {    //Validación si  Existen los campos en el Formulario
                isExiste = tb_LoginDAL.validarPasswordyNameNick(pass, user);

                if (isExiste)
                {
                    mensaje = "Ya esta registrado, Favor de volver llenar los campos";
                }
                else
                {
                    mensaje = "";
                }
            }
            return mensaje;
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
