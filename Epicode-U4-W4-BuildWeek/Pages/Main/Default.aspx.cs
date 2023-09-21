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
                book.Autore = sqlDataReader["NomeAutore"].ToString();
                book.IdGenere = Int32.Parse(sqlDataReader["IdGenere"].ToString());
                book.Genere = sqlDataReader["Genere"].ToString();
                book.Editore = sqlDataReader["NomeEditore"].ToString();

                listalibri.Add(book);

            }
            Repeater1.DataSource = listalibri;
            Repeater1.DataBind();

            RepeaterBestSellers.DataSource = listalibri.OrderBy(x => rnd.Next()).Take(6);
            RepeaterBestSellers.DataBind();

            conn.Close();

            fillConsigliati(listalibri, conn);
            fillInEvidenza(listalibri);
            fillCarosello(listalibri);

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
            //Mi la lista dei generi
            List<String> generi = new List<string>();
            SqlCommand cmd = new SqlCommand("select * from T_Generi", conn);
            SqlDataReader sqlDataReader;
            conn.Open();
            sqlDataReader = cmd.ExecuteReader();
            while (sqlDataReader.Read())
                generi.Add(sqlDataReader["IDGenere"].ToString());

            //Prima selezione
            int index = rnd.Next(generi.Count);
            index = index == 0 ? 1 : index;

            List<Libri> libriAppoggio = libriList.Where(gen => gen.IdGenere == index).ToList();

            //Primi 3

            boxSuperTitle1.InnerText = "Consigli " + libriAppoggio[0].Genere;

            boxImg1.Src = "../../Content/img/Libri/" + libriAppoggio[0].Copertina;
            boxAuthor1.InnerText = libriAppoggio[0].Autore;
            boxTitle1.InnerText = libriAppoggio[0].Titolo;
            boxEditor1.InnerText = libriAppoggio[0].Editore;
            boxUrl1.HRef = "Details?IdLibro=" + libriAppoggio[0].IDLibro;

            boxImg2.Src = "../../Content/img/Libri/" + libriAppoggio[1].Copertina;
            boxAuthor2.InnerText = libriAppoggio[1].Autore;
            boxTitle2.InnerText = libriAppoggio[1].Titolo;
            boxEditor2.InnerText = libriAppoggio[1].Editore;
            boxUrl2.HRef = "Details?IdLibro=" + libriAppoggio[1].IDLibro;

            boxImg3.Src = "../../Content/img/Libri/" + libriAppoggio[2].Copertina;
            boxAuthor3.InnerText = libriAppoggio[2].Autore;
            boxTitle3.InnerText = libriAppoggio[2].Titolo;
            boxEditor3.InnerText = libriAppoggio[2].Editore;
            boxUrl3.HRef = "Details?IdLibro=" + libriAppoggio[2].IDLibro;

            //Altri 3

            int index2 = rnd.Next(generi.Count);
            index2 = index2 == 0 || index2 == index ? 8 : index2;

            libriAppoggio = libriList.Where(gen => gen.IdGenere == index2).ToList();

            boxSuperTitle2.InnerText = "Consigli " + libriAppoggio[0].Genere;

            boxImg4.Src = "../../Content/img/Libri/" + libriAppoggio[0].Copertina;
            boxAuthor4.InnerText = libriAppoggio[0].Autore;
            boxTitle4.InnerText = libriAppoggio[0].Titolo;
            boxEditor4.InnerText = libriAppoggio[0].Editore;
            boxUrl4.HRef = "Details?IdLibro=" + libriAppoggio[0].IDLibro;

            boxImg5.Src = "../../Content/img/Libri/" + libriAppoggio[1].Copertina;
            boxAuthor5.InnerText = libriAppoggio[1].Autore;
            boxTitle5.InnerText = libriAppoggio[1].Titolo;
            boxEditor5.InnerText = libriAppoggio[1].Editore;
            boxUrl5.HRef = "Details?IdLibro=" + libriAppoggio[1].IDLibro;

            boxImg6.Src = "../../Content/img/Libri/" + libriAppoggio[2].Copertina;
            boxAuthor6.InnerText = libriAppoggio[2].Autore;
            boxTitle6.InnerText = libriAppoggio[2].Titolo;
            boxEditor6.InnerText = libriAppoggio[2].Editore;
            boxUrl6.HRef = "Details?IdLibro=" + libriAppoggio[2].IDLibro;


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


    
