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

                SqlCommand cmd = new SqlCommand("SELECT * FROM V_Libri WHERE IDLibro=@IDLibro", conn);
                cmd.Parameters.AddWithValue("IDLibro", Request.QueryString["IDLibro"]);
                SqlDataReader sqlDataReader;

                try
                {
                    conn.Open();
                    sqlDataReader = cmd.ExecuteReader();

                    while (sqlDataReader.Read())
                    {
                        string libro = sqlDataReader["Copertina"].ToString();

                        DetailsImg.Src = "../../Content/img/Libri/" + libro;
                        DetailsImgR.Src = "../../Content/img/Libri/" + sqlDataReader["Retro"].ToString();

                        ImgSfondo.Attributes.CssStyle.Add("background-image", String.Concat("url(../../Content/img/Libri/", libro, ")"));

                        string TitoloLibro = sqlDataReader["Titolo"].ToString();
                        string DescrizioneLibro = sqlDataReader["Descrizione"].ToString();
                        string AnnoPubblicazione = sqlDataReader["Anno"].ToString();
                        string PrezzoLibro = sqlDataReader["Prezzo"].ToString();
                        string AutoreLibro = sqlDataReader["NomeAutore"].ToString();
                        string GenereLibro = sqlDataReader["Genere"].ToString();
                        string EditoreLibro = sqlDataReader["NomeEditore"].ToString();
                        
                        DetailsTitle.InnerText = TitoloLibro;
                        DetailsDate.InnerText = AnnoPubblicazione;
                        DetailsGenre.InnerText = GenereLibro;
                        DetailsDescription.InnerText = DescrizioneLibro;
                        DetailsAuthor.InnerText = AutoreLibro;
                        DetailsPublisher.InnerText = EditoreLibro;


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

        protected void ButtonAgg_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "INSERT INTO T_Carrello VALUES(@FKUtente, @FKLibro, NULL)";

                string userId = Session["UserID"].ToString();
                cmd.Parameters.AddWithValue("FKUtente", userId);
                cmd.Parameters.AddWithValue("FKLibro", Request.QueryString["IDLibro"]);

                cmd.ExecuteNonQuery();

            }

            catch {
                Response.Write("Errore");
            }
            finally
            {
                conn.Close();
                //Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }

        }

    }
}