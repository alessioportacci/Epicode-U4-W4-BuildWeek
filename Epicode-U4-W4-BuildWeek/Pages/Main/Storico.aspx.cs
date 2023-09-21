using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epicode_U4_W4_BuildWeek.Pages.Main
{
    public partial class Storico : System.Web.UI.Page
    {
        List<StoricoProdotti> listaStorico = new List<StoricoProdotti>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StoricoCarrello();
            }
        }
        private void StoricoCarrello()
        {
            string userId = Session["UserID"].ToString();
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();
                string storedProcedure = "SP_Acquisti";
                SqlCommand cmd = new SqlCommand(storedProcedure, conn);
                
                cmd.Parameters.AddWithValue("@IdUtente", userId);
                cmd.CommandType = CommandType.StoredProcedure;
                
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read()) 
                {
                    string titolo = reader["Titolo"].ToString();
                    double prezzo = Convert.ToDouble(reader["Prezzo"]);
                    string img = reader["Copertina"].ToString();
                    StoricoProdotti storicoProdotti = new StoricoProdotti { Titolo = titolo, Prezzo = prezzo, Img = img };
                    listaStorico.Add(storicoProdotti);


                }
                Repeater1.DataSource = listaStorico;
                Repeater1.DataBind();

            }
            catch (Exception ex) 
            {
                Response.Write(ex.ToString());
            }

        }


        public class StoricoProdotti
        {
            public string Titolo { get; set; }

            public double Prezzo { get; set; }

            public string Img { get; set; }
        }
    }


}