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
            {
                int edad = Convert.ToInt32(txtedad.Text);
                if (edad >= 18)
                {
                    string username = txtUsario.Text;
                    string password = txtContraseña.Text;
                    tb_LoginBAL.validarNameNick(username);
                    tb_LoginBAL.validrPassword(password);
                    string email = txtemail.Text;
                    string name = txtnombre.Text;

                    string lastname = txtapellido.Text;
                    tb_ConsumidoBAL.validaremail(email);
                    tb_ConsumidoBAL.validarname(name);
                    tb_ConsumidoBAL.validarlastname(lastname);
                    bool IsExistusername = tb_LoginBAL.validarNameNick(username);
                    bool IsExistpassword = tb_LoginBAL.validrPassword(password);
                    bool IsExistemil = tb_ConsumidoBAL.validaremail(email);
                    bool IsExistName = tb_ConsumidoBAL.validarname(name);
                    bool IsExistlastname = tb_ConsumidoBAL.validarlastname(lastname);


                    if (txtapellido.Text == "" || txtContraseña.Text == "" || txtedad.Text == "" || txtemail.Text == "" || txtnombre.Text == "" || txtUsario.Text == "")
                    {
                        MessageBox.Show("Favor de llenar  los campos restantes");
                    }
                    else
                    {
                        if (IsExistusername || IsExistpassword || IsExistName || IsExistName || IsExistlastname || IsExistemil)
                        {
                            MessageBox.Show("Alguno de los campos ya existse");
                            clean();
                        }
                        else
                        {
                            DataAcces.tb_Login login = new DataAcces.tb_Login();
                            login.UserName = txtUsario.Text;
                            login.PASSWORD = txtContraseña.Text;
                            bool IsInsertlogin = tb_LoginBAL.IngresarDatos(login);
                            DataAcces.tb_Consumidor consumidor = new DataAcces.tb_Consumidor();
                            consumidor.email = txtemail.Text;
                            consumidor.Primer_Nombre = txtnombre.Text;
                            consumidor.Primer_Apellido = txtapellido.Text;
                            consumidor.edad = Convert.ToInt32(txtedad.Text);
                            consumidor.FK_Usuario = login.PK_Usuario;
                            bool IsInsertconsumidor = tb_ConsumidoBAL.IngresarDatosConsumidor(consumidor);
                            if (IsInsertconsumidor && IsInsertlogin)
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
                }
                else
                {
                    MessageBox.Show("No puedes registrare eres menor de edad");
                    clean();
                }
            }
            catch (FormatException)
            {
                MessageBox.Show("El campo Edad no admite letras");
            }
        }
        #endregion
    }
}
