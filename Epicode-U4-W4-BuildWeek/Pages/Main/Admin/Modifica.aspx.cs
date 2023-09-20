using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epicode_U4_W4_BuildWeek.Pages.Main.Admin
{
    public partial class Modifica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillAutori();
                FillEditori();
                FillGeneri();
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    int productId = Convert.ToInt32(Request.QueryString["id"]);
                    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();
                    SqlConnection conn = new SqlConnection(connectionString);

                    try
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand("SELECT * FROM T_Libri WHERE IDLibro = @IdLibro", conn);
                        cmd.Parameters.AddWithValue("@IDLibro", productId);
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            string titolo = reader["Titolo"].ToString();
                            string descrizione = reader["Descrizione"].ToString();
                            int prezzo = Convert.ToInt32(reader["Prezzo"]);

                            // Set the text boxes
                            Titolo.Text = titolo;
                            Descrizione.Text = descrizione;
                            Prezzo.Text = prezzo.ToString();

                            // Set selected items in dropdown lists based on values from the database
                            string autoreID = reader["FKAutore"].ToString();
                            string genereID = reader["FKGenere"].ToString();
                            string editoreID = reader["FKEditore"].ToString();

                            // Find and select the item in the Autori dropdown
                            Autori.Items.FindByValue(autoreID).Selected = true;

                            // Find and select the item in the Generi dropdown
                            Generi.Items.FindByValue(genereID).Selected = true;

                            // Find and select the item in the Editori dropdown
                            Editori.Items.FindByValue(editoreID).Selected = true;
                        }
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
        }

        private void FillAutori()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            Autori.Items.Clear();
            SqlDataReader sqlDataReader = new SqlCommand("SELECT IDAutore, Nome FROM T_Autori", conn).ExecuteReader();
            while (sqlDataReader.Read())
                Autori.Items.Add(new ListItem(sqlDataReader["Nome"].ToString(), sqlDataReader["IDAutore"].ToString()));

            conn.Close();
        }
        private void FillGeneri()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            Generi.Items.Clear();
            SqlDataReader sqlDataReader = new SqlCommand("SELECT IDGenere, Genere  FROM T_Generi", conn).ExecuteReader();
            while (sqlDataReader.Read())
                Generi.Items.Add(new ListItem(sqlDataReader["Genere"].ToString(), sqlDataReader["IDGenere"].ToString()));

            conn.Close();
        }


        private void FillEditori()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            Editori.Items.Clear();
            SqlDataReader sqlDataReader = new SqlCommand("SELECT IDEditore, Nome FROM T_Editori", conn).ExecuteReader();
            while (sqlDataReader.Read())
                Editori.Items.Add(new ListItem(sqlDataReader["Nome"].ToString(), sqlDataReader["IDEditore"].ToString()));

            conn.Close();
        }
        private string uploadFile()
        {
            if (FileUpload.HasFile)
                FileUpload.SaveAs(Server.MapPath($"../../../Content/img/{FileUpload.FileName}"));
            return FileUpload.FileName;
        }
        protected void Aggiungi_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                int productId = Convert.ToInt32(Request.QueryString["id"]);
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE T_Libri SET Titolo = @Titolo, Descrizione = @Descrizione, Prezzo = @Prezzo, Copertina = @Copertina, FKAutore= @AutoreID, FKGenere = @GenereID, FKEditore = @EditoreID WHERE IDLibro = @IdLibro", conn);
                cmd.Parameters.AddWithValue("@IdLibro", productId);
                cmd.Parameters.AddWithValue("@Titolo", Titolo.Text);
                cmd.Parameters.AddWithValue("@Descrizione", Descrizione.Text);
                cmd.Parameters.AddWithValue("@Prezzo", Convert.ToInt32(Prezzo.Text));
                cmd.Parameters.AddWithValue("@Copertina", uploadFile());
                cmd.Parameters.AddWithValue("@AutoreID", Int32.Parse(Autori.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@GenereID", Int32.Parse(Generi.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@EditoreID", Int32.Parse(Editori.SelectedItem.Value));

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    // Update was successful, you can perform any additional actions or redirect the user.
                    Response.Redirect("Admin.aspx");
                }
                else
                {
                   
                    
                }
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
}