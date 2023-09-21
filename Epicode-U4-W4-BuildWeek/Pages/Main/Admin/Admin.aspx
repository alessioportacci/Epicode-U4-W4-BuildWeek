<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Admin.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row row-cols-2 row-cols-md-4 row-cols-lg-6 justify-content-center">
     <asp:Repeater ID="Repeater2" runat="server" ItemType="Epicode_U4_W4_BuildWeek.Classes.Libri"  >
          <ItemTemplate>
                <div class="card-container  ">
                <div class="card12  mx-auto" style="width: 14rem;">
                <img src="../../../Content/img/Libri/<%# Item.Copertina %>" class="card-img-top" alt="avatar" height="230">
                <h2><%# Item.Titolo %></h2>
                <p><strong>AUTORE: </strong>   <%# Item.Autore %>  </p>
                <p><strong>PREZZO: </strong>  <%# Item.Prezzo %></p>
                <button class="btn btn-success"> <a href="Modifica.aspx?id=<%#Item.IDLibro %>">Modifica Prodotto</a></button>
                </div>
                </div>
         </ItemTemplate>
    </asp:Repeater>
                </div>
</asp:Content>

