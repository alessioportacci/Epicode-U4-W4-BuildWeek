using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Epicode_U4_W4_BuildWeek.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LoginSend (object sender, EventArgs e) 
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionDb"].ConnectionString.ToString();
            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();
                SqlDataReader sqlDataReader = new SqlCommand("SELECT IDUtente, Username, Password, Amministratore FROM T_Utenti", conn).ExecuteReader();
                while (sqlDataReader.Read()) 
                {
                    if(Username.Text == sqlDataReader["Username"].ToString() && Password.Text == sqlDataReader["Password"].ToString()) 
                    {
                        Session["UserID"] = sqlDataReader["IDUtente"];
                      
                        //Se l'utente e un amministatore, ha un ruolo in piu' (admin)
                        string ruoli = string.Empty;
                        if (sqlDataReader["Amministratore"].ToString() == "True")
                            ruoli += "Admin";

                        //Genero il ticket di autenticazione
                        //Maggiori inf: https://learn.microsoft.com/it-it/dotnet/api/system.web.security.formsauthenticationticket?view=netframework-4.8
                        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket
                        (
                            1,                                      //Versione
                            sqlDataReader["Username"].ToString(),   //Username
                            DateTime.Now,                           //Generazione
                            DateTime.Now.AddDays(1),                //Scadenza
                            true,                                   //Persistente 
                            ruoli,                                  //Ruoli sottoforma di stringa
                            FormsAuthentication.FormsCookiePath     //Path di autenticazione del cookie
                        );

                        //Per salvare il ticket in un cookie, bisogna crittografarlo
                        string encryptedTicket = FormsAuthentication.Encrypt(ticket);
                        //Creo un HttpCookie passando il ticket crittografato e lo aggiungo alla response
                        HttpCookie authenticationCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket); // Name of auth cookie (it's the name specified in web.config) // Hashed ticket
                        authenticationCookie.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(authenticationCookie);

                        break;
                    }
                }
            } 
            catch 
            {
                Response.Write("Credenziali Errate");

            }
            
            finally 
            {
                conn.Close();
                Response.Redirect("./Main/Default.aspx");

            }
        }

    }
}