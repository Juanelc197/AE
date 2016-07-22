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
        public void clean()
        {
            txtapellido.Text = "";
            txtContraseña.Text = "";
            txtedad.Text = "";
            txtemail.Text = "";
            txtUsario.Text = "";
            txtContraseña.Text = "";
        }

      
        private void btn_Cancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btn_Aceptar_Click(object sender, EventArgs e)
        {
            DataAcces.tb_Login login = new DataAcces.tb_Login();
            login.UserName = txtUsario.Text;
            login.PASSWORD = txtContraseña.Text;    
            bool IsInsert = tb_LoginBAL.IngresarDatos(login);
            DataAcces.tb_Consumidor consumidor = new DataAcces.tb_Consumidor();
            consumidor.email = txtemail.Text;
            consumidor.Primer_Nombre = txtnombre.Text;
            consumidor.Primer_Apellido = txtapellido.Text;
            consumidor.edad = Convert.ToInt32(txtedad.Text);
            bool IsInsert1 = tb_ConsumidoBAL.IngresarDatosConsumidor(consumidor);
            if (IsInsert)
            {
                MessageBox.Show("Usted ha quedado registrado correctamente.");
                if (IsInsert1)
                {
                    MessageBox.Show("Usted ha quedado registrado correctamente.");
                }   
            }
            else
            {
                MessageBox.Show("¡Atención! Compruebe que todos los campos han sido llenados.");
            }
          
            
           

        }
    }
}
