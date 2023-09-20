<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Carosello -->
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner home-carosello-top home-carosello-bg">

        <!-- Primo elemento --> 
        <div class="carousel-item active carosello-content" style="">
          <div class="pt-0 pt-md-5">
              <div class="">
                  <p ID="CaroselloAutore0" runat="server" class="text-center"> George Orwell </p>
                  <h5 ID="CaroselloTitolo0" runat="server" class="text-center"> </h5>

                  <img id="CaroselloImg0" runat="server" height="5" src="..." class="img-thumbnail mx-auto d-block carosello-img" alt="...">
                  <a id="CaroselloUrl0" runat="server" class="mx-auto my-3 btn btn-scopri btn-primary"> Scopri di più </a>
              </div>
          </div>
        </div>

        <!-- Secondo elemento --> 
        <div class="carousel-item carosello-content" style="">
          <div class="pt-0 pt-md-3 pt-lg-5">
              <div class="">
                  <p ID="CaroselloAutore1" runat="server" class="text-center"> </p>
                  <h5 ID="CaroselloTitolo1" runat="server" class="text-center"> </h5>

                  <img id="CaroselloImg1" runat="server" src="" class="img-thumbnail mx-auto d-block carosello-img" alt="...">
                  <a id="CaroselloUrl1" runat="server" class="mx-auto my-3 btn btn-scopri btn-primary"> Scopri di più </a>
              </div>
          </div>
        </div>

        <!-- Terzo elemento --> 
        <div class="carousel-item carosello-content" style="">
          <div class="pt-0 pt-md-5">
              <div class="">
                  <p ID="CaroselloAutore2" runat="server" class="text-center"> </p>
                  <h5 ID="CaroselloTitolo2" runat="server" class="text-center"> </h5>

                  <img id="CaroselloImg2" runat="server" src="..." class="img-thumbnail mx-auto d-block carosello-img" alt="...">
                  <a href="..." id="CaroselloUrl2" runat="server" class="mx-auto my-3 btn btn-scopri btn-primary"> Scopri di più </a>
              </div>
          </div>
        </div>

        <!-- Quarto elemento --> 
        <div class="carousel-item carosello-content" style="">
          <div class="pt-0 pt-md-5">
              <div class="">
                  <p ID="CaroselloAutore3" runat="server" class="text-center"> </p>
                  <h5 ID="CaroselloTitolo3" runat="server" class="text-center"> </h5>

                  <img id="CaroselloImg3" runat="server" src="..." class="img-thumbnail mx-auto d-block carosello-img" alt="...">
                  <a href="..." id="CaroselloUrl3" runat="server" class="mx-auto my-3 btn btn-scopri btn-primary"> Scopri di più </a>
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


       <div class="container mt-5">
            <div class="row col-10">

                <asp:Repeater ID="Repeater1" runat="server" ItemType="Epicode_U4_W4_BuildWeek.Classes.Libri"  >
                     <ItemTemplate>

                         <div>
                                <div class="card card-home" style="width: 15rem;">
                                    <img src="../../Content/img/Libri/<%# Item.Copertina %>" class="card-img-top" alt="avatar">
                                    <div class="card-body">

                                        <p class="text-truncate text-secondary m-0"> <%# Item.Autore %></p>
                                        <a href="Details.aspx?IdLibro=<%#Item.IDLibro %>" class="libro-redirect">
                                            <h5 class="card-title"> 
                                                <i class="bi bi-arrow-right-circle-fill"></i> 
                                                <%# Item.Titolo %>
                                            </h5>
                                        </a>
                                        <p class="text-secondary editore-text"> <%# Item.Editore %></p>
                                    </div>
                         </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>

</asp:Content>
