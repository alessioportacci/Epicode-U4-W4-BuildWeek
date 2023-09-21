<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
     <link href="../Content/site.css" rel="stylesheet" />

      <style>
    
       .login-container
       {
            width: 50%;
            margin-top:30%;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container login-container shadow">
            <div class="p-5 m-auto">
                <div class="d-flex justify-content-center">
                    <img src="../Content/img/LogoBiblio.png" height="30"/>
                    <h4 class="mx-2">BiblioTu</h4> 
                </div>
                <div class="mx-auto">
                    <h3>Accedi</h3>
                    <asp:Label ID="Label1" runat="server" CssClass="form-label" Text="Username"></asp:Label>
                    <asp:TextBox ID="Username" runat="server" CssClass="form-control mb-2 mw-100"></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" CssClass="form-label"  Text="Password"></asp:Label>
                    <asp:TextBox ID="Password" TextMode="Password" runat="server" CssClass="form-control mb-4 w-100 mw-100"></asp:TextBox>
                    <asp:Button ID="LoginButton" runat="server" Text="Accedi" CssClass="btn btn-outline-success d-block w-100 mw-100" OnClick="LoginSend" />
 
                </div>
               
                <p class="mt-4">
                    Sei nuovo?
                    <a href="Registrati.aspx" runat="server" >Registrati</a>                
                </p>
                
            </div>
        </div> 
    </form>
</body>
</html>
