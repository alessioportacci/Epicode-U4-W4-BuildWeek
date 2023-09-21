using Epicode_U4_W4_BuildWeek.Classes;
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
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand("select * from V_Libri", conn);
            SqlDataReader sqlDataReader;


            conn.Open();

            List<Libri> listalibri = new List<Libri>();
            sqlDataReader = cmd.ExecuteReader();

            while (sqlDataReader.Read())
            {
                Libri book = new Libri();
                book.IDLibro = Convert.ToInt32(sqlDataReader["IDlibro"]);
                book.Titolo = sqlDataReader["Titolo"].ToString();
                book.Copertina = sqlDataReader["Copertina"].ToString();
                book.Descrizione = sqlDataReader["Descrizione"].ToString();
                book.Anno = sqlDataReader["Anno"].ToString();
                book.Prezzo = sqlDataReader["Prezzo"].ToString();
                book.Autore = sqlDataReader["NomeAutore"].ToString();
                book.Genere = sqlDataReader["Genere"].ToString();
                book.Editore = sqlDataReader["NomeEditore"].ToString();

                listalibri.Add(book);

            }
            Repeater2.DataSource = listalibri;
            Repeater2.DataBind();

            conn.Close();

        }


    }
}