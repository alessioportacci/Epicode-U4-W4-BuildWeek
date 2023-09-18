using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
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
                SqlDataReader sqlDataReader = new SqlCommand("SELECT Username, Password FROM T_Utenti", conn).ExecuteReader();
                while (sqlDataReader.Read()) 
                {
                    if(Username.Text == sqlDataReader["Username"].ToString() && Password.Text == sqlDataReader["Password"].ToString()) 
                    {
                        FormsAuthentication.SetAuthCookie(sqlDataReader["Username"].ToString(), true);
                        Response.Redirect("./Main/Default.aspx");
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
            }
        }

    }
}