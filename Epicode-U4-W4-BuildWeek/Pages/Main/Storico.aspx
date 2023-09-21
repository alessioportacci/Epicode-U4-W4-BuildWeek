<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Storico.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Storico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="text-center mb-5">Storico Ordini
    </h1>

    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="container w-25   ">

                <div class=" d-flex my-3 ">
                    <img src="../../Content/img/Libri/<%# Eval("Img") %>" class="imgConsigliato" alt="avatar" height="200">
                    <div class="d-flex flex-column justify-content-center  ms-5">
                        <strong class="fs-3">Titolo:</strong> <p class="fs-5">  <%# Eval("Titolo") %> </p>
                        <strong class="fs-3">Prezzo:</strong> <p class="fs-5"> <%# Eval("Prezzo", "{0:C}") %> </p> 
                       
                    </div>
                </div>
                 <hr />
            </div>

        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
