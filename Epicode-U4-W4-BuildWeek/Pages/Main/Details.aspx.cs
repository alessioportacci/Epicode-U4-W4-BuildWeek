using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGrease.Activities;

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

                SqlCommand cmd = new SqlCommand("SELECT * FROM T_Libri WHERE IDLibro=@IDLibro", conn);
                cmd.Parameters.AddWithValue("IDLibro", Request.QueryString["IDLibro"]);
                SqlDataReader sqlDataReader;

                try
                {
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
                        //DetailsDate.Text = AnnoPubblicazione;
                        //DetailsGenre.Text = GenereLibro;
                        //DetailsDescription.Text = DescrizioneLibro;
                        //DetailsAuthor.Text = AutoreLibro;
                        //DetailsPublisher.Text = EditoreLibro;


                        break;
                    }
                }
                catch 
                {
                    Response.Write("Errore nel caricamento della pagina");
                }
                finally
                {
                    conn.Close();
                }
                

            }
        }
    }
}