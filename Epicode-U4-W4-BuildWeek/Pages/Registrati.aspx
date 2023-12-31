﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrati.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Registrati" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
     <link href="../Content/site.css" rel="stylesheet" />

    <style>
        .container {
            margin-top: 200px;
        }
    </style>
    <title></title>
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
                        <h3>Registrati</h3>

                        <asp:Label ID="Label3" runat="server" CssClass="form-label" Text="Nome"></asp:Label>
                        <asp:TextBox ID="Nome" runat="server" CssClass="form-control mb-2 w-100 mw-100"></asp:TextBox>

                        <asp:Label ID="Label4" runat="server" CssClass="form-label" Text="Cognome"></asp:Label>
                        <asp:TextBox ID="Cognome" runat="server" CssClass="form-control mb-2 w-100 mw-100"></asp:TextBox>

                        <asp:Label ID="Label1" runat="server" CssClass="form-label" Text="Username"></asp:Label>
                        <asp:TextBox ID="Username" runat="server" CssClass="form-control mb-2 w-100 mw-100"></asp:TextBox>

                        <asp:Label ID="Label2" runat="server" CssClass="form-label" Text="Password"></asp:Label>
                        <asp:TextBox ID="Password" TextMode="Password" runat="server" CssClass="form-control mb-4 w-100 mw-100"></asp:TextBox>  
                        
                        <asp:Button ID="LoginButton" runat="server" Text="Registrati" CssClass="btn btn-outline-success d-block w-100 mw-100" OnClick="Registrazionebtn" />
 
                    </div>
               
                    <p class="mt-4">
                        Hai già un account?
                        <a href="Login.aspx" runat="server" >Accedi</a>                
                    </p>
                
                </div>
        </div> 

    </form>
</body>
</html>
