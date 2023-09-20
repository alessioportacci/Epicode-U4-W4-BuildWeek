<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div class="container">

        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server" ItemType="Epicode_U4_W4_BuildWeek.Pages.Main.Libri"  >

             <ItemTemplate>
                <div class="col-4">
                    <div class="card" style="width: 18rem;">
                        <img src="../../Content/img/<%# Item.Copertina %>" class="card-img-top" alt="avatar">
                        <div class="card-body">
                        <h5 class="card-title"><%# Item.Titolo %></h5>
                        <p class="card-text"> <%# Item.Descrizione %></p>
                         <p class="card-text"> <%# Item.Anno %></p>
                          
                        <p class="card-text"> <%# Item.Prezzo %></p>
                       
                        <a href="Details.aspx?IDlibro=<%# Item.IDLibro %>" class="btn btn-success">Dettaglio</a>
                        </div>
                    </div>
                
                 
            </ItemTemplate>
                  </asp:Repeater>
                </div>
          
           </div>

          


</asp:Content>
