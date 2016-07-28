using BusinessLogic;
using DataAcces;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AlegriaEmbotelladaWinFromApp.Login
{
    public partial class Form_Login : Form
    {
        public Form_Login()
        {
            InitializeComponent();
        }

        #region Metodo para limpiar campos
        public void clean()
        {
            txt_Contraseña.Text = "";
            txt_Usuario.Text = "";
        }
        #endregion

        #region Boton Aceptar
        private void btn_Acceder_Click(object sender, EventArgs e)
        {
            string username = txt_Usuario.Text;
            string passwoord = txt_Contraseña.Text;

            string mensaje = tb_LoginBAL.usauarioExiste(passwoord, username);

            if(string.IsNullOrEmpty(mensaje))
            {
                Menu_P.Menu menu = new Menu_P.Menu();
                menu.Show();
                clean();
            }
            else
            {
                MessageBox.Show(mensaje);
                clean();
            }
        }
        #endregion

        #region Boton Para Registrar
        private void btn_Registrar_Click(object sender, EventArgs e)
        {
            Formulario.Formulario from = new Formulario.Formulario();
            from.Show();
        }

    }
    #endregion
}
