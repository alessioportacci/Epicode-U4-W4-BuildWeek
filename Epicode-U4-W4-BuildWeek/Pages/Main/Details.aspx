<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="height:35em" class="mb-5">
        <div id="ImgSfondo" runat="server" class="container-fluid h-100 libro-top-copertina">
        </div>
    </div>



    <div class="container">
        <div class="row d-flex flex-row justify-content-evenly">
            <div class="col col-12 col-md-4 me-5">
                <div class="card border-0" style="background-color: #adb5bd4a">

                    <div id="carouselExample" class="carousel slide p-5">

                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="..." class="d-block w-100" alt="..." id="DetailsImg" runat="server">
                            </div>
                            <div class="carousel-item">
                                <img src="..." class="d-block w-100" alt="..." id="DetailsImgR" runat="server">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>

                    <div class="card-body d-flex flex-column align-content-center flex-wrap">
                        <p id="Author" runat="server"></p>
                        <h5 class="card-title" id="DetailsTitle" runat="server"></h5>
                        <p class="card-text" id="Publisher" runat="server"></p>

                        <asp:Button ID="CarrelloButton" runat="server" Text="Aggiungi al carrello" CssClass="btn btn-outline-success" OnClick="ButtonAgg_Click" />

                    </div>

                </div>
            </div>
            <div class="col col-12 col-md-4 flex-grow-1 gx-2 ms-3">
                <div class="" style="">
                    <h5 id="DetailsAuthor" runat="server" class="text-decoration-underline text mb-3">.</h5>
                    <h5 id="DetailsGenre" runat="server" class="mb-5"></h5>


                    <div class="border border-bottom-3 border-end-0 border-start-0 border-top-0 border-dark-subtle pb-5 mb-3">
                        <span class="text-secondary">Condividi</span>
                        <a href="https://it-it.facebook.com/"><i class="bi bi-facebook" style="color: #9ae2d5 !important"></i></a>
                        <a href="https://twitter.com/search"><i class="bi bi-twitter" style="color: #9ae2d5 !important"></i></a>
                        <a href="https://it.linkedin.com/"><i class="bi bi-linkedin" style="color: #9ae2d5 !important"></i></a>
                        <a href="https://web.whatsapp.com/"><i class="bi bi-whatsapp" style="color: #9ae2d5 !important"></i></a>
                        <a href="https://mail.google.com/mail?hl=it"><i class="bi bi-envelope-heart-fill" style="color: #9ae2d5 !important"></i></a>
                    </div>

                    <h3 id="Title2" runat="server"></h3>
                    <p id="DetailsDescription" class="" runat="server"><small class="text-body-secondary"></small></p>
                    <h4 id="DetailsPublisher" class="" runat="server"></h4>

                </div>
            </div>
        </div>

    </div>

    <div class="container-fluid h-50" style="background-color: #adb5bd4a">
        <p>Foto autore</p>
    </div>
        
</asp:Content>
