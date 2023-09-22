<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Ordine.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Carrello" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: url(https://learndesigntutorial.com/wp-content/uploads/2021/03/bg.png) no-repeat;
            background-size: cover;
            background-position: bottom;
            background-color: rgba(0,0,0,0.7);
            background-blend-mode: overlay;
            height: 100vh;
            overflow: hidden;
        }

        .wrap {
            position: absolute;
            height: 150px;
            bottom: 100px;
            left: 0;
            width: 100%;
        }

        .image {
            width: 150px;
            position: absolute;
        }

        .truck-img {
            bottom: 0;
            left: -150px;
            z-index: 2;
            animation: truck 10s linear infinite;
        }

        @keyframes truck {
            40%, 70% {
                left: 60%;
            }

            100% {
                left: 100%;
            }
        }

        .box-img {
            width: 35px;
            z-index: 1;
            top: 55%;
            left: 60%;
            opacity: 0;
            animation: box 10s linear infinite;
        }

        .box-img2 {
            animation-delay: 1s;
        }

        @keyframes box {
            0%, 40% {
                opacity: 0;
                left: 55%;
            }

            50% {
                opacity: 1;
                left: 60%;
            }

            60%, 100% {
                opacity: 0;
                left: 60%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container w-100 justify-content-center align-items-center text-light">

        <h1 id="nomeCognomeUtente" runat="server"></h1>
        <h2>Stiamo Processando il tuo Ordine ... </h2>
        <a  href="Default.aspx" class=" text-decoration-none text-light fs-4 ">Torna alla home</a> <br />
        <a href="Storico.aspx" class=" text-decoration-none text-light fs-4 ">Visualizza i tuoi ordini</a>
    </div>


    <div class="wrap">
        <img class="image truck-img" src="https://learndesigntutorial.com/wp-content/uploads/2021/03/truck.png" alt="">
        <img class="image box-img" src="https://learndesigntutorial.com/wp-content/uploads/2021/03/box.png" alt="">
        <img class="image box-img box-img2" src="https://learndesigntutorial.com/wp-content/uploads/2021/03/box.png" alt="">
    </div>

 

</asp:Content>
