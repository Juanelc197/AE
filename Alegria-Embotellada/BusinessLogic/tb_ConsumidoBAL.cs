using DataAcces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;


namespace BusinessLogic
{
    public class tb_ConsumidoBAL
    {
        #region Ingresar Datos Consumidor
        public static string MensajeConsumidor(tb_Consumidor consumido)
        {
            string mensaje = "";
            bool inIsert = false;
            if (ConnecionDAL.ConnectToSql())
            {
                mensaje = "No hay conexión";
            }
            else
            {
                //Validación para insertar consumidor
                inIsert = tb_ConsumidoDAL.IngresarDatosConsumidor(consumido);
                if (inIsert)
                {
                    mensaje = "";

                }
                else
                {
                    mensaje = "¡ATENCIÓN! No se ha podido registrar correctamente.";
                }

            }
            return mensaje;
        }
        #endregion

        #region Modificar Consumidor
        public static bool ModificarConsumidor(tb_Consumidor consumido)
        {
            return tb_ConsumidoDAL.ModificarConsumidor(consumido);
        }
        #endregion

        #region Vizualizar Consumidor
        public static List<tb_Consumidor> VisualizarConsumidor()
        {
            return tb_ConsumidoDAL.VisualizarConsumidor();
        }
        #endregion

        #region Validar Name , Last Name , Email
        public static string DatosExiste(string name, string lastname, string email)
        {
            string mensaje = "";
            bool isExiste = false;

            if (ConnecionDAL.ConnectToSql())
            {
                mensaje = "No hay conexión";
            }
            else
            {
                //Validación si los Campos están Vaciós
                if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(lastname) || string.IsNullOrEmpty(email))
                {
                    mensaje = "ERROR. Existen campos vacíos. Favor de llenar llenarlos.";
                }
                else
                {
                    //Validación para La comporbación si exixte
                    isExiste = tb_ConsumidoDAL.validarCampos(name, lastname, email);
                    {
                        if (IsLetters(name) || IsLetters(lastname))
                        {
                            mensaje = "Favor de introducir solo letras en los campos de Nombre y Apellido.";
                        }
                        else
                        {
                            //Validación de Email
                            if (!IsValidEmail(email))
                            {
                                mensaje = "La dirección de correo electrónico no es válida. Introduzca una distinta. ";
                            }
                            else
                            {
                                //Validación para La comporbación si exixte
                                isExiste = tb_ConsumidoDAL.validarCampos(name, lastname, email);

                                if (isExiste)
                                {
                                    mensaje = "El nombre de usuario ya existe. Favor de introducir uno distinto.";
                                }
                                else
                                {
                                    mensaje = "";
                                }


                            }

                        }
                    }
                }
            }

            return mensaje;
            
        }
        //Metodo Para validar Email
        private static bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
        public static bool IsLetters(string name)
        {
            foreach (char ch in name)
            {
                if (!Char.IsLetter(ch) && ch != 32)
                {
                    return true;
                }
            }
            return false;
        }


        #endregion
    }
}



