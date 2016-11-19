using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.DataAccess;
using DevExpress.DataAccess.ConnectionParameters;

namespace Web
{
    public partial class Default : System.Web.UI.Page
    {    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["server"] != null)
            {
                dash.Visible = true;
                bemvindo.Visible = false;
            }
        }

        protected void dbvPrincipal_ConfigureDataConnection(object sender, DevExpress.DashboardWeb.ConfigureDataConnectionWebEventArgs e)
        {
            MySqlConnectionParameters parameters = e.ConnectionParameters as MySqlConnectionParameters;            
            if (parameters != null)
            {
                parameters.ServerName = Session["server"].ToString();
                parameters.Port = Session["porta"].ToString();
                parameters.UserName = Session["user"].ToString();
                parameters.DatabaseName = Session["banco"].ToString();
                parameters.Password = Session["senha"].ToString();
            }            
        }

        protected void cbpPrincipal_Callback(object sender, CallbackEventArgsBase e)
        {
            Session["server"] = txtServer.Text;
            Session["porta"] = txtPorta.Text;
            Session["user"] = txtUser.Text;
            Session["banco"] = txtBanco.Text;
            Session["senha"] = txtSenha.Text;

            dash.Visible = true;
            bemvindo.Visible = false;
        }
    }
}