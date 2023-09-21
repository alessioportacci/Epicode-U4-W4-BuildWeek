using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Caching;

namespace Epicode_U4_W4_BuildWeek.Pages
{
    public partial class Navbar : System.Web.UI.MasterPage
    {
        List<Prodotto> listaProdotti = new List<Prodotto>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AggiornaCarrello();
                if (Session["UserID"] != null)
                {
                    string userId = Session["UserID"].ToString();
                    string nomeCognome = GetNomeCognomeUtente(userId);

                    // Imposta il nome e il cognome nell'etichetta lblNomeCognome            
                }

            }


        }

        // Svuota il carrello
        private void SvuotaCarrello()
        {
            string userId = Session["UserID"].ToString();
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    // Verifico che ci siano elementi nel carrello prima di svuotarlo
                    string verificaCarrelloQuery = "SELECT COUNT(*) FROM T_Carrello WHERE FKUtente = @IdUtente AND DataAcquisto IS NULL";
                    SqlCommand verificaCarrelloCmd = new SqlCommand(verificaCarrelloQuery, conn);
                    verificaCarrelloCmd.Parameters.AddWithValue("@IdUtente", userId);

                    int numeroElementiNelCarrello = (int)verificaCarrelloCmd.ExecuteScalar();

                    if (numeroElementiNelCarrello > 0)
                    {
                        // Ci sono elementi nel carrello, posso procedere con la cancellazione
                        string sqlQuery = "DELETE FROM T_Carrello WHERE FKUtente = @IdUtente AND DataAcquisto IS NULL";
                        SqlCommand cmd = new SqlCommand(sqlQuery, conn);
                        cmd.Parameters.AddWithValue("@IdUtente", userId);
                        cmd.ExecuteNonQuery();

                        // Rimuove tutti gli elementi dalla lista
                        listaProdotti.Clear();

                        // Aggiorna il repeater
                        repeaterItems.DataSource = listaProdotti;
                        repeaterItems.DataBind();

                        // Aggiorna il totale del carrello di nuovo a 0
                        Label1.Text = "0";
                    }
                    else
                    {
                      
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
        }


        //svuota carrello al click del bottone
        protected void btnSvuotaCarrello_Click(object sender, EventArgs e)
        {
            SvuotaCarrello();
        }

        //svuota il carrello al click del bottone e ti reinderizza alla pagina conclusiva
        protected void ConcludiOrdine(object sender, EventArgs e)
        {
            // Prima di svuotare il carrello, verifica se ci sono elementi nel carrello
            string userId = Session["UserID"].ToString();
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string verificaCarrelloQuery = "SELECT COUNT(*) FROM T_Carrello WHERE FKUtente = @IdUtente AND DataAcquisto IS NULL";
                    SqlCommand verificaCarrelloCmd = new SqlCommand(verificaCarrelloQuery, conn);
                    verificaCarrelloCmd.Parameters.AddWithValue("@IdUtente", userId);

                    int numeroElementiNelCarrello = (int)verificaCarrelloCmd.ExecuteScalar();

                    if (numeroElementiNelCarrello > 0)
                    {
                        // Esegui la stored procedure SP_Carrello
                        SqlCommand cmd = new SqlCommand("SP_Carrello", conn);
                        cmd.Parameters.AddWithValue("@IdUtente", userId);
                        cmd.CommandType = CommandType.StoredProcedure;

                        SqlDataReader reader = cmd.ExecuteReader();

                        reader.Close();

                        // Dopo aver letto i risultati e prima di chiudere la connessione, esegui l'aggiornamento della data di acquisto
                        string updateDataAcquistoQuery = "UPDATE T_Carrello SET DataAcquisto = GETDATE() WHERE FKUtente = @IdUtente AND DataAcquisto IS NULL";
                        SqlCommand updateDataAcquistoCmd = new SqlCommand(updateDataAcquistoQuery, conn);
                        updateDataAcquistoCmd.Parameters.AddWithValue("@IdUtente", userId);
                        updateDataAcquistoCmd.ExecuteNonQuery();

                        // Svuota il carrello dopo l'aggiornamento della data di acquisto
                        SvuotaCarrello();

                        // Reindirizza alla pagina conclusiva
                        Response.Redirect("Ordine.aspx");
                    }
                    else
                    {
                        
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
        }

        //Prende il nome e cognome dal db
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

                        nomeCognome = $"  {nome} {cognome}";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }

            return nomeCognome;
        }

        //bottone per prendere id del libro
        protected void Button1_Click(object sender, EventArgs e)
        {
           
            Button btn = (Button)sender;

            //Prendo Idlibro dal command argument
            int idLibro = Convert.ToInt32(btn.CommandArgument);

          
            if (int.TryParse(Session["UserID"].ToString(), out int userIdInt))
            {
                
                ExecuteSP_Carrello(userIdInt, idLibro);
            }
            else
            {
                
                Response.Write("Invalid user ID");
            }

            
        }

        //elimina la singola riga del carrello
        private void ExecuteSP_Carrello(int idUtente, int idLibro)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    
                    SqlCommand cmd = new SqlCommand("SP_Delete", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                  
                    cmd.Parameters.AddWithValue("@IdUtente", idUtente);
                    cmd.Parameters.AddWithValue("@IdLibro", idLibro);

                    cmd.ExecuteNonQuery();
                    AggiornaCarrello();


                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally { conn.Close(); }
            }
        }

        //Popola il carrello dinamicamente
        private void AggiornaCarrello() 
        {
            string userId = Session["UserID"].ToString();

            double totaleCarrello = 0;

            //Connection string per connettermi con il DB
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();

            string nomeCognome = GetNomeCognomeUtente(userId);


            nomeCognomeUtente.InnerText = $" Ciao,{ nomeCognome}";

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
                    int idLibro = Convert.ToInt32(reader["FKLibro"]);
                    int quantita = Convert.ToInt32(reader["Quantita"]);


                    Prodotto prodotto = new Prodotto { Titolo = titolo, Prezzo = prezzo, Quantita = quantita, IdLibro = idLibro };
                    listaProdotti.Add(prodotto);

                    // aggiorna il totale del carrello 
                    totaleCarrello += prezzo * quantita;
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

        protected void CercaButton_Click(object sender, EventArgs e)
        {
            string userId = Session["UserID"].ToString();
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SP_SearchLibro", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Search", CercaText.Text);

                    SqlDataReader sqlDataReader = cmd.ExecuteReader();

                    string id = string.Empty;
                    while (sqlDataReader.Read()) 
                        id = sqlDataReader["IDLibro"].ToString();

                    id = id == "" ? "54" : id;

                    if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("Admin"))
                        Response.Redirect("../Details.aspx?IDLibro=" + id);
                    Response.Redirect("Details.aspx?IDLibro=" + id);

                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
        }

        protected void logout(object sender, EventArgs e)
        {
            string a = "ciao";
        }

        public class Prodotto
        {
            public string Titolo { get; set; }
            public double Prezzo { get; set; }

            public int IdLibro { get; set; }

            public int Quantita { get; set; }


        }
    }
}