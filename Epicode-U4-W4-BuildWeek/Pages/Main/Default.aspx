<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div class="container">

        <div class="row g-2">
            <asp:Repeater ID="Repeater1" runat="server" ItemType="Epicode_U4_W4_BuildWeek.Pages.Main.Libri"  >

             <ItemTemplate>
                <div class="col col-sm-12 col-md-6 col-lg-4 ">
                    <div class="card" style="width: 18rem; height:100%" >
                        <img src="../../Content/img/<%# Item.Copertina %>" class="card-img-top" alt="avatar" style="height:300px">
                        <div class="card-body">
                        <h5 class="card-title"><%# Item.Titolo %></h5>
                        <p class="card-text"> <%# Item.Descrizione %></p>
                         <p class="card-text"> <%# Item.Anno %></p>
                          
                        <p class="card-text"> <%# Item.Prezzo %></p>
                       
                        <a href="Details.aspx?IDlibro=<%# Item.IDLibro %>" class="btn btn-success">Dettaglio</a>
                        </div>
                    </div>
                </div>
                 
            </ItemTemplate>
                  </asp:Repeater>
                </div>
          
           </div>

          


</asp:Content>
