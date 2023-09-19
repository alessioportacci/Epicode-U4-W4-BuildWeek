using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epicode_U4_W4_BuildWeek.Pages.Main
{
    public partial class Carrello : System.Web.UI.Page
    {
        
        List<Prodotto> listaProdotti = new List<Prodotto>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //prendo UserID dalla session storage
                string userId = Session["UserID"].ToString();

                double totaleCarrello = 0;

                //Connection string per connettermi con il DB
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();

                string nomeCognome = GetNomeCognomeUtente(userId);

              
                nomeCognomeUtente.InnerText = nomeCognome;

                SqlConnection conn = new SqlConnection(connectionString);

                try
                {
                    conn.Open();
                    
                    string storedProcedure = "SP_Carrello";
                    //Richiamo la storedprocedure
                    SqlCommand cmd = new SqlCommand(storedProcedure, conn);

                    //Prendo userId e lo inserisco come parametro per la storedprocedure
                    cmd.Parameters.AddWithValue("@IdUtente", userId);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataReader reader = cmd.ExecuteReader();

                    

                    while (reader.Read())
                    {
                       
                        string titolo = reader["Titolo"].ToString();
                        double prezzo = Convert.ToDouble(reader["Prezzo"]);
                        int idCarrello = Convert.ToInt32(reader["IDCarrello"]);
                       

                        Prodotto prodotto = new Prodotto { Titolo = titolo, Prezzo = prezzo, IDCarrello = idCarrello };
                        listaProdotti.Add(prodotto);

                        // aggiorna il totale del carrello 
                        totaleCarrello += prezzo;
                    }

                    //aggiorno il repeater aggiungendo i dati
                    repeaterItems.DataSource = listaProdotti;
                    repeaterItems.DataBind();

                    //aggiorno label per il totale del carrello
                    Label1.Text = totaleCarrello.ToString("C");

                   
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    conn.Close();

                }

            }


        }

        private void SvuotaCarrello()
        {
            string userId = Session["UserID"] as string;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    //Verifico che idutente siano uguali e che il prodotto non sia stato ancora acquistato 

                    string sqlQuery = "DELETE FROM T_Carrello WHERE FKUtente = @IdUtente AND DataAcquisto IS NULL";


                    SqlCommand cmd = new SqlCommand(sqlQuery, conn);
                    cmd.Parameters.AddWithValue("@IdUtente", userId);



                    cmd.ExecuteNonQuery();


                    //rimuove tutti gli elementi dalla lista
                    listaProdotti.Clear();

                    //aggiorna il repeater
                    repeaterItems.DataSource = listaProdotti;
                    repeaterItems.DataBind();

                    //aggiorna il totale del carrello di nuovo a 0
                    Label1.Text = "0";
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
        }


        protected void btnSvuotaCarrello_Click(object sender, EventArgs e)
        {
            SvuotaCarrello();
        }

        protected void btnRimuovi_Click(object sender, EventArgs e)
        {

            Button btnRimuovi = (Button)sender;

            //Prendo idCarrello dal commandArgument
            int idCarrelloToRemove = Convert.ToInt32(btnRimuovi.CommandArgument);

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                   
                    string sqlQuery = "DELETE FROM T_Carrello WHERE IDCarrello = @IDCarrello";


                    SqlCommand cmd = new SqlCommand(sqlQuery, conn);
                    cmd.Parameters.AddWithValue("@IDCarrello", idCarrelloToRemove);

                    cmd.ExecuteNonQuery();

                    Response.Redirect(Request.RawUrl);


                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
        }

        private string GetNomeCognomeUtente(string userId)
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

        public class Prodotto
        {
            public string Titolo { get; set; }
            public double Prezzo { get; set; }
            public int IDCarrello { get; set; }
         

        }


    }


}