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
        public void  clean()
        {
            txt_Contraseña.Text="";
            txt_Usuario.Text = "";
        }
        private void btn_Acceder_Click(object sender, EventArgs e)
        {
            DataAcces.tb_Login login = new DataAcces.tb_Login();
            string username = txt_Usuario.Text;
            string passwoord = txt_Contraseña.Text;
            tb_LoginBAL.validarNameNick(username);
            tb_LoginBAL.validrPassword(passwoord);
            if(txt_Contraseña.Text =="")
            {
                MessageBox.Show("Introduzca una contraseña por favor.");
            }
            if (txt_Usuario.Text == "")
            {
                MessageBox.Show("Introduzca un nombre de usuario por favor.");
            }
            bool isExistente = tb_LoginBAL.validarNameNick(username);
            if (isExistente)
            {
                Menu_P.Menu menu = new Menu_P.Menu();
                menu.Show();
                clean();
            }
            else
            {
                MessageBox.Show("Favor de registrarse.");
                clean();
            }

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Formulario.Formulario from = new Formulario.Formulario();
            from.Show();
            
        }
    }
}
