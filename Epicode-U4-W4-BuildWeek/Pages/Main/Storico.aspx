<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Storico.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Storico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="text-center mt-4 mb-5">Il tuo storico Ordini:
    </h1>

    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="container w-25   ">

                <div class=" d-flex my-3 ">
                    <a href="Details.aspx?IdLibro=<%# Eval ("IDProdotto") %>"> 
                    <img src="../../Content/img/Libri/<%# Eval("Img") %>" class="imgConsigliato" alt="avatar" height="200">
                    </a>
                    <div class="d-flex flex-column justify-content-center  ms-5">
                        <h1 class=" fw-bold">  <%# Eval("Titolo") %> </h1>
                        <strong class="fs-4 text-secondary">Prezzo:</strong> <p class="fs-5">  <%# Eval("Prezzo", "{0:C}") %> </p> 
                         <p class="text-secondary m-0 p-0"><%# Eval("DataAcquisto") %></p>
                    </div>
                </div>
                 <hr />
            </div>

        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
