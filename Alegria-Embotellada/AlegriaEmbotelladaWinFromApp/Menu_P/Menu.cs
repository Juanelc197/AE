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

namespace AlegriaEmbotelladaWinFromApp.Menu_P
{
    public partial class Menu : Form
    {
        public Menu()
        {
            InitializeComponent();
            cmbSucrusal.DataSource = tb_SucursalBAL.VisualizarSucrusal();
            cmbSucrusal.ValueMember = "PK_Sucursal";
            cmbSucrusal.DisplayMember = "Nombre_Sucursal";
            cmbMarcas.DataSource = tb_ArtículoBAL.vizualisarArtículo();
            cmbMarcas.ValueMember = "PK_Artículo";
            cmbMarcas.DisplayMember = "Marca";
           
        

        }
       

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {

            decimal id = Convert.ToInt32(cmbMarcas.SelectedValue.ToString());
            DataAcces.tb_Artículo articulo = tb_ArtículoBAL.VisualizarPrecio(id);
            //DataAcces.tb_Artículo pre = tb_ArtículoBAL.VisualizarPrecio(precio);
        }
    }
}
