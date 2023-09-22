using Epicode_U4_W4_BuildWeek.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epicode_U4_W4_BuildWeek.Pages.Main.Admin
{

    public partial class AggiungiProdotto : System.Web.UI.Page
    {

        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();
        SqlConnection conn = new SqlConnection(connectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                try
                {
                    FillAutori();
                    FillGeneri();
                    FillEditori();
                }
                catch { }
                finally 
                { 
                    conn.Close(); 
                }
            }

        }

        
        private void FillAutori()
        {
            conn.Open();
            Autori.Items.Clear();
            SqlDataReader sqlDataReader = new SqlCommand("SELECT IDAutore, Nome FROM T_Autori", conn).ExecuteReader();
            while (sqlDataReader.Read())
                Autori.Items.Add(new ListItem(sqlDataReader["Nome"].ToString(), sqlDataReader["IDAutore"].ToString()));

            conn.Close();
        }

        
        private void FillGeneri()
        {
            conn.Open();
            Generi.Items.Clear();
            SqlDataReader sqlDataReader = new SqlCommand("SELECT IDGenere, Genere  FROM T_Generi", conn).ExecuteReader();
            while (sqlDataReader.Read())
                Generi.Items.Add(new ListItem(sqlDataReader["Genere"].ToString(), sqlDataReader["IDGenere"].ToString())  );
            
            conn.Close();
        }

        
        private void FillEditori()
        {
            conn.Open();
            Editori.Items.Clear();
            SqlDataReader sqlDataReader = new SqlCommand("SELECT IDEditore, Nome FROM T_Editori", conn).ExecuteReader();
            while (sqlDataReader.Read())
                Editori.Items.Add(new ListItem(sqlDataReader["Nome"].ToString(), sqlDataReader["IDEditore"].ToString()));

            conn.Close();
        }


        private string uploadFile(string add)
        {
            if (FileUpload.HasFile)
                FileUpload.SaveAs(Server.MapPath($"../../../Content/img/Libri/{FileUpload.FileName + add}"));
            return FileUpload.FileName;
        }


        protected void Aggiungi_Click(object sender, EventArgs e)
        {
            try 
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                cmd.CommandText = "INSERT INTO T_Libri VALUES(@Titolo, @Copertina, @Retro, @Descrizione, @Anno, @Prezzo, @Autore, @Genere, @Editore)";
                cmd.Parameters.AddWithValue("Titolo", Titolo.Text);
                cmd.Parameters.AddWithValue("Copertina", uploadFile(""));
                cmd.Parameters.AddWithValue("Retro", uploadFile("2"));
                cmd.Parameters.AddWithValue("Descrizione", Descrizione.Text);
                cmd.Parameters.AddWithValue("Anno", Anno.Text);
                cmd.Parameters.AddWithValue("Prezzo", Double.Parse(Prezzo.Text));
                cmd.Parameters.AddWithValue("Autore",  Int32.Parse(Autori.SelectedItem.Value));
                cmd.Parameters.AddWithValue("Genere",  Int32.Parse(Generi.SelectedItem.Value));
                cmd.Parameters.AddWithValue("Editore", Int32.Parse(Editori.SelectedItem.Value));

                int inserimentoEffettuato = cmd.ExecuteNonQuery();
                if (inserimentoEffettuato != 0)
                    Response.Write("Errore nell'inserimento");
            }
            catch 
            {
                Response.Write("Errore nell'inserimento");
            }
            finally 
            { 
                conn.Close();
            }
        }


        protected void AggiungiAutore_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                cmd.CommandText = "INSERT INTO T_Autori VALUES(@Nome, @Biografia, @Foto, @Nascita, @Morte, @Corrente)";
                cmd.Parameters.AddWithValue("Nome", NomeAutore.Text);
                cmd.Parameters.AddWithValue("Biografia", Descrizione.Text);
                cmd.Parameters.AddWithValue("Foto", uploadFile(""));
                cmd.Parameters.AddWithValue("Nascita", NascitaAutore.Text);
                cmd.Parameters.AddWithValue("Morte", MorteAutore.Text);
                cmd.Parameters.AddWithValue("Corrente", CorrenteAutore.Text);

                int inserimentoEffettuato = cmd.ExecuteNonQuery();
                if (inserimentoEffettuato > 0)
                    Response.Write("Inserimento effettuato con successo");
                else
                    Response.Write("Errore nell'inserimento");
            }
            catch
            {
                Response.Write("Errore nell'inserimento");
            }
            finally
            {
                conn.Close();
                FillAutori();
            }
        }


        protected void AggiungiGenere_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();

                cmd.Connection = conn;
                cmd.CommandText = "INSERT INTO T_Generi VALUES(@Genere)";
                cmd.Parameters.AddWithValue("Genere", AddGenere.Text);

                int inserimentoEffettuato = cmd.ExecuteNonQuery();
                if (inserimentoEffettuato > 0)
                    Response.Write("Inserimento effettuato con successo");
                else
                    Response.Write("Errore nell'inserimento");
            }
            catch 
            {
                Response.Write("Errore nell'inserimento");
            }
            finally 
            { 
                conn.Close();
                FillGeneri();
            }
        }


        protected void AggiungiEditore_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();

                cmd.Connection = conn;
                cmd.CommandText = "INSERT INTO T_Editori VALUES(@Editore)";
                cmd.Parameters.AddWithValue("Editore", AddEditore.Text);

                int inserimentoEffettuato = cmd.ExecuteNonQuery();
                if (inserimentoEffettuato > 0)
                    Response.Write("Inserimento effettuato con successo");
                else
                    Response.Write("Errore nell'inserimento");
            }
            catch
            {
                Response.Write("Errore nell'inserimento");
            }
            finally
            {
                conn.Close();
                FillEditori();
            }
        }
    }
}