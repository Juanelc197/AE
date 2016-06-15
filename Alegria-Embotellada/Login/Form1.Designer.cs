namespace Login
{
    partial class Form1
    {
        /// <summary>
        /// Variable del diseñador necesaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén usando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben desechar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido de este método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.Ejem_Logo = new System.Windows.Forms.GroupBox();
            this.btn_Regis = new System.Windows.Forms.Button();
            this.txt_User = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txt_Contra = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.Ejem_logo2 = new System.Windows.Forms.GroupBox();
            this.linkLabel1 = new System.Windows.Forms.LinkLabel();
            this.button2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // Ejem_Logo
            // 
            this.Ejem_Logo.Location = new System.Drawing.Point(218, 12);
            this.Ejem_Logo.Name = "Ejem_Logo";
            this.Ejem_Logo.Size = new System.Drawing.Size(169, 148);
            this.Ejem_Logo.TabIndex = 0;
            this.Ejem_Logo.TabStop = false;
            this.Ejem_Logo.Text = "Logo";
            // 
            // btn_Regis
            // 
            this.btn_Regis.Location = new System.Drawing.Point(497, 376);
            this.btn_Regis.Name = "btn_Regis";
            this.btn_Regis.Size = new System.Drawing.Size(75, 23);
            this.btn_Regis.TabIndex = 1;
            this.btn_Regis.Text = "Registro";
            this.btn_Regis.UseVisualStyleBackColor = true;
            // 
            // txt_User
            // 
            this.txt_User.Location = new System.Drawing.Point(265, 186);
            this.txt_User.Name = "txt_User";
            this.txt_User.Size = new System.Drawing.Size(109, 20);
            this.txt_User.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(215, 189);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "Nombre";
            // 
            // txt_Contra
            // 
            this.txt_Contra.Location = new System.Drawing.Point(282, 243);
            this.txt_Contra.Name = "txt_Contra";
            this.txt_Contra.Size = new System.Drawing.Size(109, 20);
            this.txt_Contra.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(215, 246);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(61, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Contraseña";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // Ejem_logo2
            // 
            this.Ejem_logo2.Location = new System.Drawing.Point(12, 344);
            this.Ejem_logo2.Name = "Ejem_logo2";
            this.Ejem_logo2.Size = new System.Drawing.Size(81, 58);
            this.Ejem_logo2.TabIndex = 6;
            this.Ejem_logo2.TabStop = false;
            this.Ejem_logo2.Text = "Logo_de_la_empresa";
            // 
            // linkLabel1
            // 
            this.linkLabel1.AutoSize = true;
            this.linkLabel1.Location = new System.Drawing.Point(409, 389);
            this.linkLabel1.Name = "linkLabel1";
            this.linkLabel1.Size = new System.Drawing.Size(55, 13);
            this.linkLabel1.TabIndex = 7;
            this.linkLabel1.TabStop = true;
            this.linkLabel1.Text = "linkLabel1";
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(282, 297);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 8;
            this.button2.Text = "Aceptar";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnablePreventFocusChange;
            this.ClientSize = new System.Drawing.Size(584, 411);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.linkLabel1);
            this.Controls.Add(this.Ejem_logo2);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txt_Contra);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txt_User);
            this.Controls.Add(this.btn_Regis);
            this.Controls.Add(this.Ejem_Logo);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "Form1";
            this.Text = "Login";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox Ejem_Logo;
        private System.Windows.Forms.Button btn_Regis;
        private System.Windows.Forms.TextBox txt_User;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txt_Contra;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox Ejem_logo2;
        private System.Windows.Forms.LinkLabel linkLabel1;
        private System.Windows.Forms.Button button2;
    }
}

