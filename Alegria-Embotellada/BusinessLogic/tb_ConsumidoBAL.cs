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
            //Validación para insertar consumidor
            inIsert = tb_ConsumidoDAL.IngresarDatosConsumidor(consumido);
            if (inIsert)
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
            //Validación si los Campos están Vaciós
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(lastname) || string.IsNullOrEmpty(email))
            {
                mensaje = "Existen campos vacios, Favor de llenar los campos vacios";
            }
            else
            {    //Validación de Email
                if (!IsValidEmail(email))
                {
                    mensaje = "El usuario no contiene el formato deseado,Favor d introducir formato correcto";
                }
                else
                {
                    //Validación para La comporbación si exixte
                    isExiste = tb_ConsumidoDAL.validarCampos(name, lastname, email);

                    if (isExiste)
                    {
                        mensaje = "Ya esta registrado, Favor de volver llenar los campos";
                    }
                    else
                    {
                        mensaje = "";
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


        #endregion
    }
}



