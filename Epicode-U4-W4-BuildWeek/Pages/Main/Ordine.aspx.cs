using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epicode_U4_W4_BuildWeek.Pages.Main
{
    public partial class Carrello : System.Web.UI.Page
    {
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            string userId = Session["UserID"].ToString();
            string nomeCognome = GetNomeCognomeUtente(userId);


            nomeCognomeUtente.InnerText = nomeCognome;


        }


        public string GetNomeCognomeUtente(string userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();
            string nomeCognome = "";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string sqlQuery = "SELECT Nome, Cognome FROM T_Utenti WHERE IDUtente = @UserID";

                    SqlCommand cmd = new SqlCommand(sqlQuery, conn);
                    cmd.Parameters.AddWithValue("@UserID", userId);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        string nome = reader["Nome"].ToString();
                        string cognome = reader["Cognome"].ToString();

                        nomeCognome = $"Ciao, {nome} {cognome}";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }

            return nomeCognome;
        }



    }


}