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
            dataGridView1.DataSource = tb_PromociónBAL.VizualisarPromocion();

        }


        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {  

            
         



        }

        private void cmbSucrusal_SelectedIndexChanged(object sender, EventArgs e)
        {
            //    int marca = Convert.ToInt32(cmbMarcas.SelectedValue.ToString());
            //    dataGridView1.DataSource = tb_PromociónBAL.Vizualisarfiltro(marca);
        }

        private void cmbMarcas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}