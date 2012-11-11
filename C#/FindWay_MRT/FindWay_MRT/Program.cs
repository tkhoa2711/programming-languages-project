using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace FindWay_MRT
{    
    public class Program : System.Windows.Forms.Form
    {
        // Variables declaration //
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private ComboBox comboBox1;
        private ComboBox comboBox2; 
        private System.Windows.Forms.Button GetResult;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox TimeResult;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox RouteResult;
        
        
        private System.ComponentModel.Container components = null;

        public Program()
        {
            InitializeComponent();
        }
                
        // Clean up any resources being used.
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (components != null)
                {
                    components.Dispose();
                }
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code
        
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.GetResult = new System.Windows.Forms.Button();
            this.TimeResult = new System.Windows.Forms.TextBox();
            this.RouteResult = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(8, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(100, 16);
            this.label1.TabIndex = 1;
            this.label1.Text = "Boarding Station";
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(364, 21);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(100, 16);
            this.label2.TabIndex = 2;
            this.label2.Text = "Alighting Station";
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(8, 140);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(122, 16);
            this.label3.TabIndex = 2;
            this.label3.Text = "Shortest Travel Time";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // label4
            // 
            this.label4.Location = new System.Drawing.Point(8, 169);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(122, 16);
            this.label4.TabIndex = 2;
            this.label4.Text = "Shortest Travel Route";
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "pasir_ris",
            "tampines",
            "simei",
            "tanah_merah",
            "bedok",
            "kembangan",
            "eunos",
            "paya_lebar",
            "aljunied",
            "kallang",
            "lavender",
            "bugig",
            "city_hall",
            "raffles_place",
            "tanjong_pagar",
            "outram_park",
            "tiong_bahru",
            "redhill",
            "queenstown",
            "commonwealth",
            "bouna_vista",
            "dover",
            "clementi",
            "jurong_east",
            "chinese_garden",
            "lakeside",
            "boon_lay",
            "pioneer",
            "joo_koon",
            "expo",
            "changi_airport",
            "bukit_batok",
            "bukit_gombak",
            "choa_chu_kang",
            "yew_tee",
            "kranji",
            "marsiling",
            "woodland",
            "admiralty",
            "sembawang",
            "yishun",
            "khatib",
            "yio_chu_kang",
            "ang_mo_kio",
            "bishan",
            "braddell",
            "toa_payoh",
            "novena",
            "newton",
            "orchard",
            "somerset",
            "dhoby_ghaut",
            "marina_bay",
            "bras_brasah",
            "esplanade",
            "promenade",
            "nicoll_highway",
            "stadium",
            "mountbatten",
            "dakota",
            "macpherson",
            "tai_seng",
            "bartley",
            "serangoon",
            "lorong_chuan",
            "bishan",
            "marymount",
            "caldecott",
            "botanic_garden",
            "farrer_road",
            "holland_village)",
            "one_north",
            "kent_ridge",
            "haw_par_villa",
            "pasir_panjang",
            "labrador_park",
            "telok_blangah",
            "harbourfront",
            "bayfront",
            "chinatown",
            "clarke_quay",
            "little_india",
            "farrer_park",
            "boon_keng",
            "potong_pasir",
            "woodleigh",
            "kovan",
            "hougang",
            "buangkok",
            "sengkang",
            "punggol"});
            this.comboBox1.Location = new System.Drawing.Point(156, 16);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(121, 21);
            this.comboBox1.TabIndex = 7;
            // 
            // comboBox2
            // 
            this.comboBox2.FormattingEnabled = true;
            this.comboBox2.Items.AddRange(new object[] {
            "pasir_ris",
            "tampines",
            "simei",
            "tanah_merah",
            "bedok",
            "kembangan",
            "eunos",
            "paya_lebar",
            "aljunied",
            "kallang",
            "lavender",
            "bugig",
            "city_hall",
            "raffles_place",
            "tanjong_pagar",
            "outram_park",
            "tiong_bahru",
            "redhill",
            "queenstown",
            "commonwealth",
            "bouna_vista",
            "dover",
            "clementi",
            "jurong_east",
            "chinese_garden",
            "lakeside",
            "boon_lay",
            "pioneer",
            "joo_koon",
            "expo",
            "changi_airport",
            "bukit_batok",
            "bukit_gombak",
            "choa_chu_kang",
            "yew_tee",
            "kranji",
            "marsiling",
            "woodland",
            "admiralty",
            "sembawang",
            "yishun",
            "khatib",
            "yio_chu_kang",
            "ang_mo_kio",
            "bishan",
            "braddell",
            "toa_payoh",
            "novena",
            "newton",
            "orchard",
            "somerset",
            "dhoby_ghaut",
            "marina_bay",
            "bras_brasah",
            "esplanade",
            "promenade",
            "nicoll_highway",
            "stadium",
            "mountbatten",
            "dakota",
            "macpherson",
            "tai_seng",
            "bartley",
            "serangoon",
            "lorong_chuan",
            "bishan",
            "marymount",
            "caldecott",
            "botanic_garden",
            "farrer_road",
            "holland_village)",
            "one_north",
            "kent_ridge",
            "haw_par_villa",
            "pasir_panjang",
            "labrador_park",
            "telok_blangah",
            "harbourfront",
            "bayfront",
            "chinatown",
            "clarke_quay",
            "little_india",
            "farrer_park",
            "boon_keng",
            "potong_pasir",
            "woodleigh",
            "kovan",
            "hougang",
            "buangkok",
            "sengkang",
            "punggol"});
            this.comboBox2.Location = new System.Drawing.Point(470, 18);
            this.comboBox2.Name = "comboBox2";
            this.comboBox2.Size = new System.Drawing.Size(121, 21);
            this.comboBox2.TabIndex = 8;
            // 
            // GetResult
            // 
            this.GetResult.Location = new System.Drawing.Point(156, 85);
            this.GetResult.Name = "GetResult";
            this.GetResult.Size = new System.Drawing.Size(81, 32);
            this.GetResult.TabIndex = 4;
            this.GetResult.Text = "Get Result";
            this.GetResult.Click += new System.EventHandler(this.GetResult_Click);
            // 
            // TimeResult
            // 
            this.TimeResult.Location = new System.Drawing.Point(156, 136);
            this.TimeResult.Name = "TimeResult";
            this.TimeResult.Size = new System.Drawing.Size(435, 20);
            this.TimeResult.TabIndex = 3;
            // 
            // RouteResult
            // 
            this.RouteResult.Location = new System.Drawing.Point(156, 166);
            this.RouteResult.Multiline = true;
            this.RouteResult.Name = "RouteResult";
            this.RouteResult.Size = new System.Drawing.Size(435, 100);
            this.RouteResult.TabIndex = 3;
            // 
            // Program
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(618, 364);
            this.Controls.Add(this.comboBox2);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.GetResult);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.TimeResult);
            this.Controls.Add(this.RouteResult);
            this.Name = "Program";
            this.Text = "Get shortest travel Time for MRT journey";
            this.ResumeLayout(false);
            this.PerformLayout();

        }
        #endregion

        /// The main entry point for the application.
        [STAThread]
        static void Main()
        {
            Application.Run(new Program());
        }

        // handle actions when button 'Get Result' is clicked
        private void GetResult_Click(object sender, System.EventArgs e)
        {
            LogicServer ls;
            int term;

            try
            {
                // Initialize the logic server //
                ls = new LogicServer();
                ls.Init("");
                const string x = @"C:\Program Files\amzi\ide\workspace\cpe425\bin\cpe425.xpl";
                ls.Load(x);
              
                // get boarding station and alighting station input and execute corresponding command in Prolog //
                term = ls.ExecStr("shortest(" + (comboBox1.SelectedItem).ToString() + "," + (comboBox2.SelectedItem).ToString() + ", MinTime, MinRoute)");
                                
                // analyse the return value, if return value != 0, means the command was successfully executed //
                if (term != 0)
                {
                    // show out the shortest travel time,
                    TimeResult.Text = (ls.GetIntArg(term, 3)).ToString();
                    
                    // show out the shortest travel route, as return value is list, we must recursively get all elements in this list //                    
                    int term1 = ls.GetArg(term, 4);
                    string s = ls.GetStrHead(term1);
                    while (ls.GetTail(term1) != 0)
                    {
                        s += " -> " + ls.GetStrHead(ls.GetTail(term1));
                        term1 = ls.GetTail(term1);
                    }
                    RouteResult.Text = s;
                }
                else
                {
                    TimeResult.Text = "Invalid Request!";
                    RouteResult.Text = "Invalid Request!";
                }

                // close the logic server 
                ls.Close();
            }
            catch (LSException ex)
            {
                String message = ex.GetMessage();
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }


    }
}
