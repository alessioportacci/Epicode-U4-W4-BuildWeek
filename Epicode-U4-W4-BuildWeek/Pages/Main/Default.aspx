<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="..." class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="..." class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="..." class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


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
                       
                                <a href="details.aspx?IDlibro=<%# Item.IDLibro %>" class="btn btn-success">Dettaglio</a>
                                </div>
                            </div>
                
                    </ItemTemplate>

                </asp:Repeater>

            </div>
        </div>

</asp:Content>
