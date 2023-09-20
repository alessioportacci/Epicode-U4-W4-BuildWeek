using Epicode_U4_W4_BuildWeek.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epicode_U4_W4_BuildWeek.Pages.Main
{
    public partial class Default : System.Web.UI.Page
    {
        Random rnd = new Random();

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
                book.Autore = sqlDataReader["Autore"].ToString();
                book.Genere = sqlDataReader["Genere"].ToString();
                book.Editore = sqlDataReader["Editore"].ToString();

                listalibri.Add(book);

            }
            Repeater1.DataSource = listalibri;
            Repeater1.DataBind();

            conn.Close();


            fillCarosello(listalibri);
            fillInEvidenza(listalibri);
            fillConsigliati(listalibri, conn);

        }


        protected void fillCarosello(List<Libri> libriList)
        {
            int index = rnd.Next(libriList.Count);
            //1
            CaroselloAutore0.InnerText = libriList[index].Autore;
            CaroselloTitolo0.InnerText = libriList[index].Titolo.ToString();
            CaroselloImg0.Src = "../../Content/img/Libri/" + libriList[index].Copertina;
            CaroselloUrl0.HRef = "details.aspx?IdLibro=" + libriList[index].IDLibro;
            libriList.RemoveAt(index);

            //2
            index = rnd.Next(libriList.Count);
            CaroselloAutore1.InnerText = libriList[index].Autore;
            CaroselloTitolo1.InnerText = libriList[index].Titolo.ToString();
            CaroselloImg1.Src = "../../Content/img/Libri/" + libriList[index].Copertina;
            CaroselloUrl1.HRef = "details.aspx?IdLibro=" + libriList[index].IDLibro;
            libriList.RemoveAt(index);

            //3
            index = rnd.Next(libriList.Count);
            CaroselloAutore2.InnerText = libriList[index].Autore;
            CaroselloTitolo2.InnerText = libriList[index].Titolo.ToString();
            CaroselloImg2.Src = "../../Content/img/Libri/" + libriList[index].Copertina;
            CaroselloUrl2.HRef = "details.aspx?IdLibro=" + libriList[index].IDLibro;
            libriList.RemoveAt(index);

            //4
            index = rnd.Next(libriList.Count);
            CaroselloAutore3.InnerText = libriList[index].Autore;
            CaroselloTitolo3.InnerText = libriList[index].Titolo.ToString();
            CaroselloImg3.Src = "../../Content/img/Libri/" + libriList[index].Copertina;
            CaroselloUrl3.HRef = "details.aspx?IdLibro=" + libriList[index].IDLibro;

        }


        protected void fillConsigliati(List<Libri> libriList, SqlConnection conn)
        {
            //Mi prendo due generi a caso
            SqlCommand cmd = new SqlCommand("select * from T_Generi", conn);
            SqlDataReader sqlDataReader;

            conn.Open();

            List<String> generi = new List<string >();
            sqlDataReader = cmd.ExecuteReader();

            while (sqlDataReader.Read())
                generi.Add(sqlDataReader["Genere"].ToString());

            conn.Close();
        }


        protected void fillInEvidenza(List<Libri> libriList)
        {
            int index = rnd.Next(libriList.Count);
            evidenzaTitolo.InnerText = libriList[index].Titolo;
            evidenzaAutore.InnerText = libriList[index].Autore;
            evidenzaDescrizione.InnerText = libriList[index].Descrizione;
            evidenzaImg.Src = "../../Content/img/Libri/" + libriList[index].Copertina;
            evidenzaUrl.HRef = "details.aspx?IdLibro=" + libriList[index].IDLibro;
        }

    }

}


    
