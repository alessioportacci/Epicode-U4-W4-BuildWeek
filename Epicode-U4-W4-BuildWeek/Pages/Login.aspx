<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
   
      <style>
    
       
   
        .container {
            margin-top: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="w-25 mx-auto mt-5">
                <asp:Label ID="Label1" runat="server" CssClass="form-label" Text="Username"></asp:Label>
                <asp:TextBox ID="Username" runat="server" CssClass="form-control mb-3"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" CssClass="form-label"  Text="Password"></asp:Label>
                <asp:TextBox ID="Password" TextMode="Password" runat="server" CssClass="form-control mb-3"></asp:TextBox>
                <asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="btn btn-outline-success" OnClick="LoginSend" />
                <a href="Registrati.aspx" class="btn btn-outline-primary" runat="server" >Registrati</a>
            </div>
        </div> 
    </form>
</body>
</html>
