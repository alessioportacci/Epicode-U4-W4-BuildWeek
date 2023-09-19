<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
<div class="h-50">
    <div class="">
    <div class="card mb-3" style="">
        <div class="row g-0">
            <div class="col-md-4">
                <img id="DetailsImg" src="http://placekitten.com/500" class="img-fluid rounded-start p-2" alt="..." runat="server">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h3 id="DetailsTitle" class="card-title" text="" runat="server">Card title</h3>
                    <p id="DetailsDate" class="card-text" text="" runat="server">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success w-50" runat="server">LinkButton</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
   </div> 
    </div></div>

        <div class="bg-black h-100" style="padding-top:10rem!important">
    <h5 id="DetailsGenre" text="" runat="server">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</h5>
    <p id="DetailsDescription" class="" text="" runat="server"><small class="text-body-secondary">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</small></p>
    <h4 id="DetailsAuthor" class="" text="" runat="server">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</h4>
    <h5 id="DetailsPublisher" text="" runat="server">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</h5>
</div>
        
</asp:Content>
