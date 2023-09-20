<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Carosello -->
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner home-carosello-top home-carosello-bg">

        <!-- Primo elemento --> 
        <div class="carousel-item h-100 active " style="">
          <div class="row row-cols-1 h-100 pt-5">
              <div class="h-100">
                  <p ID="CaroselloAutore0" runat="server" class="text-center"> George Orwell </p>
                  <p ID="CaroselloTitolo0" runat="server" class="text-center"> </p>

                  <img id="CaroselloImg0" runat="server" src="..." class="img-thumbnail h-50 mx-auto d-block" alt="...">
                  <a id="CaroselloUrl0" runat="server" class="mx-auto my-3 btn btn-scopri btn-primary"> Scopri di più </a>
              </div>
          </div>
        </div>

        <!-- Secondo elemento --> 
        <div class="carousel-item h-100 " style="">
          <div class="row row-cols-1 h-100 pt-5">
              <div class="h-100">
                  <p ID="CaroselloAutore1" runat="server" class="text-center"> </p>
                  <p ID="CaroselloTitolo1" runat="server" class="text-center"> </p>

                  <img id="CaroselloImg1" runat="server" src="" class="img-thumbnail h-50 mx-auto d-block" alt="...">
                  <a id="CaroselloUrl1" runat="server" class="mx-auto my-3 btn btn-scopri btn-primary"> Scopri di più </a>
              </div>
          </div>
        </div>

        <!-- Terzo elemento --> 
        <div class="carousel-item h-100 " style="">
          <div class="row row-cols-1 h-100 pt-5">
              <div class="h-100">
                  <p ID="CaroselloAutore2" runat="server" class="text-center"> </p>
                  <p ID="CaroselloTitolo2" runat="server" class="text-center"> </p>

                  <img id="CaroselloImg2" runat="server" src="..." class="img-thumbnail h-50 mx-auto d-block" alt="...">
                  <a href="..." id="CaroselloUrl2" runat="server" class="mx-auto my-3 btn btn-scopri btn-primary"> Scopri di più </a>
              </div>
          </div>
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

    <hr />


       <div class="container">
            <div class="row">




                <asp:Repeater ID="Repeater1" runat="server" ItemType="Epicode_U4_W4_BuildWeek.Classes.Libri"  >

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
