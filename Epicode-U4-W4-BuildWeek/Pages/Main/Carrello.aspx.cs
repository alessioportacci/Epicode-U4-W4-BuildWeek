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
                string userId = Session["UserId"] as string;
                double totaleCarrello = 0;
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();

                SqlConnection conn = new SqlConnection(connectionString);

                try
                {
                    conn.Open();
                    string storedProcedure = "SP_Carrello";

                    SqlCommand cmd = new SqlCommand(storedProcedure, conn);


                    cmd.Parameters.AddWithValue("@IdUtente", userId);

                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataReader reader = cmd.ExecuteReader();



                    while (reader.Read())
                    {
                        string titolo = reader["Titolo"].ToString();
                        double prezzo = Convert.ToDouble(reader["Prezzo"]);

                        Prodotto prodotto = new Prodotto { Titolo = titolo, Prezzo = prezzo };
                        listaProdotti.Add(prodotto);
                        totaleCarrello += prezzo;
                    }


                    repeaterItems.DataSource = listaProdotti;
                    repeaterItems.DataBind();

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
            string userId = Session["UserId"] as string;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();


                    string sqlQuery = "DELETE FROM T_Carrello WHERE FKUtente = @IdUtente AND DataAcquisto IS NULL";


                    SqlCommand cmd = new SqlCommand(sqlQuery, conn);
                    cmd.Parameters.AddWithValue("@IdUtente", userId);


                    cmd.ExecuteNonQuery();



                    listaProdotti.Clear();

                    repeaterItems.DataSource = listaProdotti;
                    repeaterItems.DataBind();

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

        public class Prodotto
        {
            public string Titolo { get; set; }
            public double Prezzo { get; set; }

        }


    }

}