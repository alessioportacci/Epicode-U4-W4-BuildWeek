using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epicode_U4_W4_BuildWeek.Pages.Main
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();
                SqlConnection conn = new SqlConnection(connectionString);

                SqlCommand cmd = new SqlCommand("SELECT * FROM T_Libri WHERE IDLibro=@id", conn);
                cmd.Parameters.AddWithValue("id", Request.QueryString["IDLibro"]);
                SqlDataReader sqlDataReader;

                conn.Open();
                sqlDataReader = cmd.ExecuteReader();

                while (sqlDataReader.Read())
                {
                    string CopertinaLibro = sqlDataReader["Copertina"].ToString();
                    string TitoloLibro = sqlDataReader["Titolo"].ToString(); 
                    string DescrizioneLibro = sqlDataReader["Descrizione"].ToString();
                    string AnnoPubblicazione = sqlDataReader["Anno"].ToString();
                    string PrezzoLibro = sqlDataReader["Prezzo"].ToString();
                    string AutoreLibro = sqlDataReader["Autore"].ToString();
                    string GenereLibro = sqlDataReader["Genere"].ToString();
                    string EditoreLibro = sqlDataReader["Editore"].ToString();

                    DetailsImg.Src = "";
                    DetailsTitle.InnerText = TitoloLibro;
                    DetailsDate.InnerText = AnnoPubblicazione;
                    DetailsGenre.InnerText = GenereLibro;
                    DetailsDescription.InnerText = DescrizioneLibro;
                    DetailsAuthor.InnerText = AutoreLibro;
                    DetailsPublisher.InnerText = EditoreLibro;
                }

                conn.Close();

            }
        }
    }
}