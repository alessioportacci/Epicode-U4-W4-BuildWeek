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

                  <img id="CaroselloImg0" runat="server" height="5" src="..." class="img-thumbnail mx-auto d-block carosello-img shadow" alt="...">
                    <a id="CaroselloUrl0" runat="server" href=".." class="libro-redirect ">
                        <h4 class="text-center my-3"> 
                            <i class="bi bi-arrow-right-circle-fill"></i> 
                            Scopri di più
                        </h4>
                    </a>
              </div>
          </div>
        </div>

        <!-- Secondo elemento --> 
        <div class="carousel-item carosello-content" style="">
          <div class="pt-0 pt-md-3 pt-lg-5">
              <div class="">
                  <p ID="CaroselloAutore1" runat="server" class="text-center"> </p>
                  <h5 ID="CaroselloTitolo1" runat="server" class="text-center"> </h5>

                  <img id="CaroselloImg1" runat="server" src="" class="img-thumbnail mx-auto d-block carosello-img shadow" alt="...">
                    <a id="CaroselloUrl1" runat="server" href=".." class="libro-redirect ">
                        <h4 class="text-center my-3"> 
                            <i class="bi bi-arrow-right-circle-fill"></i> 
                            Scopri di più
                        </h4>
                    </a>              
              
              </div>
          </div>
        </div>

        <!-- Terzo elemento --> 
        <div class="carousel-item carosello-content" style="">
          <div class="pt-0 pt-md-5">
              <div class="">
                  <p ID="CaroselloAutore2" runat="server" class="text-center"> </p>
                  <h5 ID="CaroselloTitolo2" runat="server" class="text-center"> </h5>

                  <img id="CaroselloImg2" runat="server" src="..." class="img-thumbnail mx-auto d-block carosello-img shadow" alt="...">
                    <a id="CaroselloUrl2" runat="server" href=".." class="libro-redirect ">
                        <h4 class="text-center my-3"> 
                            <i class="bi bi-arrow-right-circle-fill"></i> 
                            Scopri di più
                        </h4>
                    </a>                
              </div>
          </div>
        </div>

        <!-- Quarto elemento --> 
        <div class="carousel-item carosello-content" style="">
          <div class="pt-0 pt-md-5">
              <div class="">
                  <p ID="CaroselloAutore3" runat="server" class="text-center"> </p>
                  <h5 ID="CaroselloTitolo3" runat="server" class="text-center"> </h5>

                  <img id="CaroselloImg3" runat="server" src="..." class="img-thumbnail mx-auto d-block carosello-img shadow" alt="...">
                    <a id="CaroselloUrl3" runat="server" href=".." class="libro-redirect ">
                        <h4 class="text-center my-3"> 
                            <i class="bi bi-arrow-right-circle-fill"></i> 
                            Scopri di più
                        </h4>
                    </a>                 
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

    <!-- In evidenza -->
    <div class="container my-5 mx-auto p-4 bg-gray shadow in-evidenza">
        <p class="in-evidenza-text text-end"> ⭐ in evidenza</p>
        <div class="row row-cols-1 row-cols-md-2 justify-content-evenly align-items-center ">

            <div class="text-center">
                <a id="evidenzaUrl" runat="server">
                    <img id="evidenzaImg" runat="server" src="../../Content/img/Libri/Dracula.jpg" height="500" class="mx-auto imgConsigliato" />
                </a>
            </div>
            <div>
                <h2 id="evidenzaTitolo" runat="server" class="mt-5">Titolo</h2>
                <p id="evidenzaAutore" runat="server" class="text-truncate text-secondary m-0">Autore</p>
                <p id="evidenzaDescrizione" runat="server" class="p-4"> Descrizione</p>
            </div>
        </div>

    </div>

    <!-- Best Seller -->
    <div class="container mt-5">
           <h2 class="nostro-catalogo-text title-text">Best Sellers</h2>

            <div class="row row-cols-2 row-cols-md-4 row-cols-lg-6 justify-content-center">

                <asp:Repeater ID="RepeaterBestSellers" runat="server" ItemType="Epicode_U4_W4_BuildWeek.Classes.Libri"  >
                     <ItemTemplate>

                         <div class="p-1">
                                <div class="card card-home  mx-auto imgConsigliato my-1" style="width: 10rem;">
                                    <img src="../../Content/img/Libri/<%# Item.Copertina %>" class="card-img-top" alt="avatar" height="230">
                                    <div class="card-body">

                                        <p class="text-truncate text-secondary m-0"> <%# Item.Autore %></p>
                                        <a href="Details.aspx?IdLibro=<%#Item.IDLibro %>" class="libro-redirect ">
                                            <h5 class="card-title"> 
                                                <i class="bi bi-arrow-right-circle-fill"></i> 
                                                <%# Item.Titolo %>
                                            </h5>
                                        </a>
                                        <p class="text-secondary editore-text"> <%# Item.Editore %></p>
                                    </div>
                                 </div>
                         </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>


    </div>

    <!-- Quadratini -->
    <div class="container my-5 mx-auto">
        <div class="row row-cols-1 row-cols-lg-2 mx-auto shadow">

            <!-- 1/2/3 -->
            <div class="container bg-sand">

                <h3 id="boxSuperTitle1" runat="server" class="m-2">Il mondo dell'arte</h3>
                
                <div class="row row-cols-3 justify-content-center p-3">
                    <!-- 1 -->
                    <div class="p-1">
                        <div class="card card-home  mx-auto" style="width: 10rem;">
                            <img id="boxImg1" runat="server" src="../../Content/img/Libri/Dracula.jpg" class="card-img-top" alt="avatar" height="230">
                            <div class="card-body">
                                <p id="boxAuthor1" runat="server" class="text-truncate text-secondary m-0">Fracula</p>
                                <a id="boxUrl1" runat="server" href="Details.aspx?IdLibro =1" class="libro-redirect">
                                    <h5 class="card-title"> 
                                        <i class="bi bi-arrow-right-circle-fill"></i> 
                                        <span id="boxTitle1" runat="server">Dracula </span>
                                    </h5>
                                </a>
                                <p id="boxEditor1" runat="server" class="text-secondary editore-text"> Dracula</p>
                            </div>
                        </div>
                    </div>
                    <!-- 2 -->
                    <div class="p-1">
                        <div class="card card-home  mx-auto" style="width: 10rem;">
                            <img id="boxImg2" runat="server" src="../../Content/img/Libri/Dracula.jpg" class="card-img-top" alt="avatar" height="230">
                            <div class="card-body">
                                <p id="boxAuthor2" runat="server" class="text-truncate text-secondary m-0">Fracula</p>
                                <a id="boxUrl2" runat="server" href="Details.aspx?IdLibro =1" class="libro-redirect">
                                    <h5 class="card-title"> 
                                        <i class="bi bi-arrow-right-circle-fill"></i> 
                                        <span id="boxTitle2" runat="server">Dracula </span>
                                    </h5>
                                </a>
                                <p id="boxEditor2" runat="server" class="text-secondary editore-text"> Dracula</p>
                            </div>
                        </div>
                    </div>
                    <!-- 3 -->
                    <div class="p-1">
                        <div class="card card-home  mx-auto" style="width: 10rem;">
                            <img id="boxImg3" runat="server" src="../../Content/img/Libri/Dracula.jpg" class="card-img-top" alt="avatar" height="230">
                            <div class="card-body">
                                <p id="boxAuthor3" runat="server" class="text-truncate text-secondary m-0">Fracula</p>
                                <a id="boxUrl3" runat="server" href="Details.aspx?IdLibro =1" class="libro-redirect">
                                    <h5 class="card-title"> 
                                        <i class="bi bi-arrow-right-circle-fill"></i> 
                                        <span id="boxTitle3" runat="server">Dracula </span>
                                    </h5>
                                </a>
                                <p id="boxEditor3" runat="server" class="text-secondary editore-text"> Dracula</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- 4/5/6 -->
            <div class="container bg-blue">

                <h3 id="boxSuperTitle2" runat="server" class="m-2">Il mondo dell'arte</h3>
                
                <div class="row row-cols-3 justify-content-center p-3">
                    <!-- 4 -->
                    <div class="p-1">
                        <div class="card card-home  mx-auto" style="width: 10rem;">
                            <img id="boxImg4" runat="server" src="../../Content/img/Libri/Dracula.jpg" class="card-img-top" alt="avatar" height="230">
                            <div class="card-body">
                                <p id="boxAuthor4" runat="server" class="text-truncate text-secondary m-0">Fracula</p>
                                <a id="boxUrl4" runat="server" href="Details.aspx?IdLibro =1" class="libro-redirect">
                                    <h5 class="card-title"> 
                                        <i class="bi bi-arrow-right-circle-fill"></i> 
                                        <span id="boxTitle4" runat="server">Dracula </span>
                                    </h5>
                                </a>
                                <p id="boxEditor4" runat="server" class="text-secondary editore-text"> Dracula</p>
                            </div>
                        </div>
                    </div>
                    <!-- 5 -->
                    <div class="p-1">
                        <div class="card card-home  mx-auto" style="width: 10rem;">
                            <img id="boxImg5" runat="server" src="../../Content/img/Libri/Dracula.jpg" class="card-img-top" alt="avatar" height="230">
                            <div class="card-body">
                                <p id="boxAuthor5" runat="server" class="text-truncate text-secondary m-0">Fracula</p>
                                <a id="boxUrl5" runat="server" href="Details.aspx?IdLibro =1" class="libro-redirect">
                                    <h5 class="card-title"> 
                                        <i class="bi bi-arrow-right-circle-fill"></i> 
                                        <span id="boxTitle5" runat="server">Dracula </span>
                                    </h5>
                                </a>
                                <p id="boxEditor5" runat="server" class="text-secondary editore-text"> Dracula</p>
                            </div>
                        </div>
                    </div>
                    <!-- 6 -->
                    <div class="p-1">
                        <div class="card card-home  mx-auto" style="width: 10rem;">
                            <img id="boxImg6" runat="server" src="../../Content/img/Libri/Dracula.jpg" class="card-img-top" alt="avatar" height="230">
                            <div class="card-body">
                                <p id="boxAuthor6" runat="server" class="text-truncate text-secondary m-0">Fracula</p>
                                <a id="boxUrl6" runat="server" href="Details.aspx?IdLibro =1" class="libro-redirect">
                                    <h5 class="card-title"> 
                                        <i class="bi bi-arrow-right-circle-fill"></i> 
                                        <span id="boxTitle6" runat="server">Dracula </span>
                                    </h5>
                                </a>
                                <p id="boxEditor6" runat="server" class="text-secondary editore-text"> Dracula</p>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        
        </div>          
      </div>


    <!-- Catalogo -->
    <div class="container mt-5 nostro-catalogo">
           <h2 class="nostro-catalogo-text title-text">Il nostro catalogo</h2>
            <div class="row row-cols-2 row-cols-md-4 row-cols-lg-6 justify-content-center">

                <asp:Repeater ID="Repeater1" runat="server" ItemType="Epicode_U4_W4_BuildWeek.Classes.Libri"  >
                     <ItemTemplate>

                         <div class="p-1">
                                <div class="card card-home  mx-auto imgConsigliato my-1" style="width: 10rem;">
                                    <img src="../../Content/img/Libri/<%# Item.Copertina %>" class="card-img-top" alt="avatar" height="230">
                                    <div class="card-body">

                                        <p class="text-truncate text-secondary m-0"> <%# Item.Autore %></p>
                                        <a href="Details.aspx?IdLibro=<%#Item.IDLibro %>" class="libro-redirect ">
                                            <h5 class="card-title"> 
                                                <i class="bi bi-arrow-right-circle-fill"></i> 
                                                <%# Item.Titolo %>
                                            </h5>
                                        </a>
                                        <p class="text-secondary editore-text"> <%# Item.Editore %></p>
                                    </div>
                                 </div>
                         </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>
    </div>

</asp:Content>
