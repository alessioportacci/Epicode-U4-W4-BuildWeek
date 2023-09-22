﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="height:35em" class="mb-5">
        <div id="ImgSfondo" runat="server" class="container-fluid h-100 libro-top-copertina">
        </div>
    </div>



    <div class="container">
        <div class="row d-flex flex-row justify-content-evenly">
            <div class="col">
                <div class="card" style="">

                    <div id="carouselExample" class="carousel slide">

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

                    <div class="card-body">
                        <h5 class="card-title" id="DetailsTitle" runat="server"></h5>
                        <p class="card-text" id="DetailsDate" runat="server"></p>

                        <div class="d-flex align-items-center" >
                            <asp:Button ID="CarrelloButton" runat="server" Text="Aggiungi al carrello" CssClass="btn btn-outline-success d-inline Aggiungi-carrello-button"  OnClick="ButtonAgg_Click" />
                            <asp:TextBox ID="Quantita" CssClass="Quantita-button form-control w-25 d-inline " runat="server" type="number" Text="1"></asp:TextBox>
                        </div>

                    </div>

                </div>
            </div>
            <div class="col flex-grow-1">
                <div class="" style="">
                    <h5 id="DetailsGenre" runat="server"></h5>
                    <p id="DetailsDescription" class="" runat="server"><small class="text-body-secondary"></small></p>
                    <h4 id="DetailsAuthor" class="" runat="server"></h4>
                    <h5 id="DetailsPublisher" runat="server">.</h5>
                </div>
            </div>

        </div>

    </div>
        
</asp:Content>
