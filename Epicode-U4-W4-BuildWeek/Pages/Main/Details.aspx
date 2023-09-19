<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card mb-3" style="max-width: 540px;">
        <div class="row g-0">
            <div class="col-md-4">
                <img id="DetailsImg" src="..." class="img-fluid rounded-start" alt="..." runat="server">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h3 id="DetailsTitle" class="card-title" text="" runat="server">Card title</h3>
                    <p id="DetailsDate" class="card-text" text="" runat="server">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                </div>
            </div>
        </div>
    </div>

    <h5 id="DetailsGenre" text="" runat="server"></h5>
    <p id="DetailsDescription" class="" text="" runat="server"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
    <h4 id="DetailsAuthor" class="" text="" runat="server"></h4>
    <h5 id="DetailsPublisher" text="" runat="server"></h5>


</asp:Content>
