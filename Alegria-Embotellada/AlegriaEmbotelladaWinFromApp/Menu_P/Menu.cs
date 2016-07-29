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
        #region Constructor
        public Menu()
        {
            InitializeComponent();
            cmbSucrusal.DataSource = tb_SucursalBAL.VisualizarSucrusal();
            cmbSucrusal.ValueMember = "Nombre_Sucursal";
            cmbSucrusal.DisplayMember = "Nombre_Sucursal";
            cmbMarcas.DataSource = tb_ArtículoBAL.vizualisarArtículo();
            cmbMarcas.ValueMember = "Marca";
            cmbMarcas.DisplayMember = "Marca";
            dataGridView1.DataSource = tb_PromociónBAL.VizualisarPromocion();

        }
        #endregion

        #region Metodo Para Limpiar Campos 
        public void clean()
        {
            txtprecio1.Text = "";
            txtprecio2.Text = "";
        }
        #endregion

        #region Botón de Buscar Precios
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtprecio1.Text == "" || txtprecio2.Text == "")
                {
                    MessageBox.Show("Favor de llenar los  Campos De Precios");
                    clean();    
                }
                else
                {
                    decimal preciomenor = Convert.ToDecimal(txtprecio1.Text);
                    decimal preciomayor = Convert.ToDecimal(txtprecio2.Text);
                    dataGridView1.DataSource = tb_PromociónBAL.buscarprecio(preciomenor, preciomayor);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Favor de introducir formato Correcto");
                clean();
            }
        }
        #endregion

        #region Evento al Seleccionar del combo sucrusal
        private void cmbSucrusal_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sucursal = Convert.ToString(cmbSucrusal.SelectedValue.ToString());
            dataGridView1.DataSource = tb_PromociónBAL.buscarsucrusal(sucursal);
        }
        #endregion

        #region Evento de Seleccionar del combo Marca
        private void cmbMarcas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string marca = Convert.ToString(cmbMarcas.SelectedValue.ToString());
            dataGridView1.DataSource = tb_PromociónBAL.buscarmarca(marca);
        }
        #endregion
    }
}