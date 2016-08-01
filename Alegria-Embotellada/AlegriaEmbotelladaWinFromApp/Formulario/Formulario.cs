using BusinessLogic;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AlegriaEmbotelladaWinFromApp.Formulario
{
    public partial class Formulario : Form
    {
        public Formulario()
        {
            InitializeComponent();
        }

        #region Metódo para Limpiar campos
        public void clean()
        {
            txtapellido.Text = "";
            txtContraseña.Text = "";
            txtedad.Text = "";
            txtemail.Text = "";
            txtUsario.Text = "";
            txtContraseña.Text = "";
            txtnombre.Text = "";
        }
        #endregion

        #region Botón Cancelar
        private void btn_Cancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        #endregion

        #region Botón de Aceptar
        private void btn_Aceptar_Click(object sender, EventArgs e)
        {
            try
            {   //Se insertan los Campos para Hacer la validación
                string username = txtUsario.Text;
                string password = txtContraseña.Text;
                string email = txtemail.Text;
                string name = txtnombre.Text;
                string lastname = txtapellido.Text;
                string mensajeDato = tb_ConsumidoBAL.DatosExiste(name, lastname, email);
                string mensajeUsuario = tb_LoginBAL.usauarioExisteformu(password, username);
                //Validación para los campos a Sql si estan vaciós y Existen
                if (string.IsNullOrEmpty(mensajeDato) && string.IsNullOrEmpty(mensajeUsuario))
                {   //Validación para la edad
                    int edad = Convert.ToInt32(txtedad.Text);
                    if (edad < 18)
                    {
                        MessageBox.Show("No puedes registrare eres menor de edad");
                        clean();
                    }

                    else
                    {   //Se insertan los Datos a Sql
                        DataAcces.tb_Login logiear = new DataAcces.tb_Login();
                        logiear.UserName = txtUsario.Text;
                        logiear.PASSWORD = txtContraseña.Text;
                        string Logininsertar = tb_LoginBAL.MensajesIngresarDatos(logiear);
                        DataAcces.tb_Consumidor consumidor = new DataAcces.tb_Consumidor();
                        consumidor.email = txtemail.Text;
                        consumidor.Primer_Nombre = txtnombre.Text;
                        consumidor.Primer_Apellido = txtapellido.Text;
                        consumidor.edad = Convert.ToInt32(txtedad.Text);
                        consumidor.FK_Usuario = logiear.PK_Usuario;
                        string consumidorinsertar = tb_ConsumidoBAL.MensajeConsumidor(consumidor);
                        // Validación para insertar los datos en Sql
                        if (string.IsNullOrEmpty(Logininsertar) && string.IsNullOrEmpty(consumidorinsertar))
                        {
                            MessageBox.Show("Usted ha quedado registrado correctamente.");
                            clean();
                        }
                        else
                        {
                            MessageBox.Show("¡Atención! Compruebe que todos los campos han sido llenados.");
                        }
                    }
                }

                else
                {
                    if (string.IsNullOrEmpty(mensajeDato))
                    {
                        MessageBox.Show(mensajeUsuario);
                    }
                    else
                    {
                        MessageBox.Show(mensajeDato);
                    }
                    
                    
                    clean();
                }
            }
            //Excepción para el campos de la Edad
            catch (FormatException)
            {
                MessageBox.Show("El campo Edad no admite letras");
                clean();
            }
        }
        #endregion
    }
}
