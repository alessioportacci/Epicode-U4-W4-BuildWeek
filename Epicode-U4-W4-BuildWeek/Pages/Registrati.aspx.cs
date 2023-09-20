using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epicode_U4_W4_BuildWeek
{
    public partial class Registrati : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Registrazionebtn(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "INSERT INTO T_Utenti (Nome, Cognome, Username, Password) VALUES (@Nome, @Cognome, @Username, @Password)";

                    cmd.Parameters.AddWithValue("@Nome", Nome.Text);
                    cmd.Parameters.AddWithValue("@Cognome", Cognome.Text);
                    cmd.Parameters.AddWithValue("@Username", Username.Text);
                    cmd.Parameters.AddWithValue("@Password", Password.Text);

                    cmd.ExecuteNonQuery();
                    Response.Redirect("login.aspx");
                }
                catch (SqlException ex)
                {
                  
                 
                    Response.Write("Errore durante l'inserimento nel database: " + ex.Message);
                }
            }
        }

    }
}