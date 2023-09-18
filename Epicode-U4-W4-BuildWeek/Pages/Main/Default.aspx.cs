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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            SqlCommand cmd = new SqlCommand("select * from T_Libri", conn);
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
               

                listalibri.Add(book);

            }
            Repeater1.DataSource = listalibri;
            Repeater1.DataBind();

         

            conn.Close();
        }
    }

    public class Libri
    {
        public int IDLibro { get; set; }
        public string Titolo { get; set; }
        public string Copertina { get; set; }
        public string Descrizione { get; set; }
        public string Anno { get; set; }

        public string Prezzo { get; set;}
       
    }
}


    
