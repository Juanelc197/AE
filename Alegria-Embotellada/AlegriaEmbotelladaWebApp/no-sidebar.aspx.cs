using BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace AlegriaEmbotelladaWebApp
{
    public partial class no_sidebar : System.Web.UI.Page
    {
        #region Metódo para Limpiar campos
        public void clean()
        {
           
            txtpassword.Text = "";
            txtEdad.Text = "";
            txtemail.Text = "";
            txtusuario.Text = "";

            txtnombre.Text = "";
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {   //Se insertan los Campos para Hacer la validación
                string username = txtusuario.Text;
                string password = txtpassword.Text;
                string email = txtemail.Text;
                string name = txtnombre.Text;
                string lastname = txtapellido.Text;
                string mensajeDato = tb_ConsumidoBAL.DatosExiste(name, lastname, email);
                string mensajeUsuario = tb_LoginBAL.usauarioExisteformu(password, username);
                //Validación para los campos a Sql si estan vaciós y Existen
                if (string.IsNullOrEmpty(mensajeDato) && string.IsNullOrEmpty(mensajeUsuario))
                {   //Validación para la edad
                    int edad = Convert.ToInt32(txtEdad.Text);
                    if (edad < 18)
                    {
                        MessageBox.Show("Lo sentimos, usted es menor de edad. No puede ser registrado.", "¡ATENCIÓN!", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        clean();
                    }

                    else
                    {   //Se insertan los Datos a Sql
                        DataAcces.tb_Login logiear = new DataAcces.tb_Login();
                        logiear.UserName = txtusuario.Text;
                        logiear.PASSWORD = txtpassword.Text;
                        string Logininsertar = tb_LoginBAL.MensajesIngresarDatos(logiear);
                        DataAcces.tb_Consumidor consumidor = new DataAcces.tb_Consumidor();
                        consumidor.email = txtemail.Text;
                        consumidor.Primer_Nombre = txtnombre.Text;
                        consumidor.Primer_Apellido = txtapellido.Text;
                        consumidor.edad = Convert.ToInt32(txtEdad.Text);
                        consumidor.FK_Usuario = logiear.PK_Usuario;
                        string consumidorinsertar = tb_ConsumidoBAL.MensajeConsumidor(consumidor);
                        // Validación para insertar los datos en Sql
                        if (string.IsNullOrEmpty(Logininsertar) && string.IsNullOrEmpty(consumidorinsertar))
                        {
                            MessageBox.Show("Usted ha quedado registrado correctamente.", "¡BIENVENIDO!", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            clean();
                        }
                        else
                        {
                            MessageBox.Show("Compruebe que todos los campos han sido llenados correctamente.", "¡ATENCIÓN", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation);
                        }
                    }
                }

                else
                {
                    if (string.IsNullOrEmpty(mensajeDato))
                    {
                        MessageBox.Show(mensajeUsuario, "¡ATENCIÓN!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else
                    {
                        MessageBox.Show(mensajeDato, "¡ATENCIÓN!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }





                }
            }
            //Excepción para el campos de la Edad
            catch (FormatException)
            {
                MessageBox.Show("El campo Edad no admite letras.", "¡ATENCIÓN", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                clean();
            }
        }


    }

}

