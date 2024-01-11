using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using MSTSCLib;


namespace SampleRDC
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            AxMSTSCLib.AxMsRdpClient8 rdp1 = new AxMSTSCLib.AxMsRdpClient8();
            MSTSCLib.IMsRdpClientAdvancedSettings5 settings = rdp.AdvancedSettings as MSTSCLib.IMsRdpClientAdvancedSettings5;

            try
            {
                rdp.Server = "192.168.100.1";
                rdp.UserName = "t\\t";
                settings.RDPPort = 33818;
                IMsTscNonScriptable secured = (IMsTscNonScriptable)rdp.GetOcx();

                secured.ClearTextPassword = "123456";


                rdp.Connect();
                button1.Visible = false;
            }
            catch (Exception Ex)
            {
                MessageBox.Show("Error Connecting", "Error connecting to remote desktop " + txtServer.Text + " Error:  " + Ex.Message, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                // Check if connected before disconnecting
                if (rdp.Connected.ToString() == "1")
                    rdp.Disconnect();
            }
            catch (Exception Ex)
            {
                MessageBox.Show("Error Disconnecting", "Error disconnecting from remote desktop " + txtServer.Text + " Error:  " + Ex.Message, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public void rdp_OnConnected(object sender, EventArgs e)
        {
        //  rdp..RemoteProgram.ServerStartProgram("c:\\windows\\system32\\calc.exe", "c:\\windows\\system32", "c:\\", false, "", false);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Maximized;
           
        }
    }
}