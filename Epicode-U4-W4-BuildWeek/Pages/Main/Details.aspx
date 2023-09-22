<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class=" position-absolute row row-cols-1 m-5 d-none d-md-block"  style="z-index:5">
        <h1 id="titololibrotop" class="titolo-libro text-truncate" runat="server"> TESTO LIBRO</h1>
        <h3 class="autore-libro mx-4" id="autorelibrotop" runat="server"> AUTORE</h3>
    </div>


    <div style="height:35em" class="mb-5 d-none d-md-block">
        <div id="ImgSfondo" runat="server" class="container-fluid h-100 libro-top-copertina">
        </div>
    </div>


    <div class="container">
        <div class="row d-flex flex-row justify-content-evenly">
            <!-- Blocco di sinistra -->
            <div class="col col-12 col-md-4 mt-4 mt-md-0 m-auto">
                <div class="card border-0 shadow" style="background-color: #adb5bd4a">

                    <!-- Carosello -->
                    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                        <!-- Contenuto carosello -->
                        <div class="carousel-inner home-carosello-top">
                            
                            <!-- Copertina -->
                            <div class="carousel-item active carosello-content" style="">
                              <div class="m-2">
                                    <img id="DetailsImg" runat="server" height="5" src="..." class="img-thumbnail mx-auto d-block carosello-img shadow" alt="...">
                              </div>
                            </div>

                            <!-- Retro -->
                            <div class="carousel-item carosello-content" style="">
                              <div class="my-2">
                                    <img id="DetailsImgR" runat="server" height="5" src="..." class="img-thumbnail mx-auto d-block carosello-img shadow" alt="...">
                              </div>
                            </div>

                        </div>

                        <!-- Pulsante indietro -->
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <!-- Pulsante avanti -->
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                          <span class="carousel-control-next-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Next</span>
                        </button>
                    </div>

                    <!-- Testo in basso -->
                    <div class="card-body d-flex flex-column align-content-center flex-wrap m-2">
                        <h5 class="card-title" id="DetailsTitle" runat="server"></h5>
                        <div class="row row-cols-2">
                            <div>                        
                                <p id="Author" runat="server" class="m-0 text-secondary"></p>
                                <p class="card-text p-0 m-0 text-secondary" id="Publisher" runat="server"></p>
                            </div>
                            <div>
                                <p class="card-text p-0 m-0 fw-bold" id="DetailsPrice" runat="server"></p>
                            </div>

                        </div>


                        <div class="d-flex align-items-center justify-content-center" >
                            <asp:Button ID="CarrelloButton" runat="server" Text="Aggiungi al carrello" CssClass="btn btn-outline-success d-inline Aggiungi-carrello-button"  OnClick="ButtonAgg_Click" />
                            <asp:TextBox ID="Quantita" CssClass="Quantita-button form-control w-25 d-inline " runat="server" type="number" Text="1"></asp:TextBox>
                        </div>


                    </div>

                </div>
            </div>

            <!-- Blocco di destra -->
            <div class="col col-12 col-md-4 mt-4 mt-md-0 flex-grow-1 gx-2 ms-3">
                <div class="" style="">
                    <a href="#SectionAutore" class="text-black">
                        <h5 id="DetailsAuthor"  runat="server" class="text-decoration-underline text mb-3">.</h5>
                    </a>
                    
                    <h5 id="DetailsGenre" runat="server" class="mb-3"></h5>

                    <!-- Condividi -->
                    <div class="border border-bottom-3 border-end-0 border-start-0 border-top-0 border-dark-subtle pb-1 mb-3">
                        <span class="text-secondary">Condividi</span>
                        <a href="https://it-it.facebook.com/"><i class="bi bi-facebook" style="color: #9ae2d5 !important"></i></a>
                        <a href="https://twitter.com/search"><i class="bi bi-twitter" style="color: #9ae2d5 !important"></i></a>
                        <a href="https://it.linkedin.com/"><i class="bi bi-linkedin" style="color: #9ae2d5 !important"></i></a>
                        <a href="https://web.whatsapp.com/"><i class="bi bi-whatsapp" style="color: #9ae2d5 !important"></i></a>
                        <a href="https://mail.google.com/mail?hl=it"><i class="bi bi-envelope-heart-fill" style="color: #9ae2d5 !important"></i></a>
                    </div>

                    <!-- Info libro -->
                    <h3 id="Title2" runat="server"></h3>
                    <p id="DetailsDescription" class="" runat="server" style="overflow-y: scroll; height:300px;">
                        <small class="text-body-secondary"></small></p>
                    <h4 id="DetailsPublisher" class="" runat="server"></h4>

                </div>
            </div>
        </div>

    </div>

    <hr class="mt-5 pt-2"/>

    <!-- Sezione Autore -->
    <div id="SectionAutore" class="container-fluid mt-5 py-2 bg-gray shadow">
        <div class="row">
            <div class="col-3">
                <img id="AutoreDescImg" runat="server" src="..." class="h-100 img-thumbnail"/>
            </div>
            <div class="col-9">
                <h3 id="AutoreDescNome" runat="server"></h3>
                <p id="AutoreDescBio" runat="server"></p>
            </div>
        </div>
        
    </div>
        
</asp:Content>
