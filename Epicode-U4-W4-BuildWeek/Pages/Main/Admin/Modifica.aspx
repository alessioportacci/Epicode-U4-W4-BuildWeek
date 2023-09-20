<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Modifica.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Admin.Modifica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container justify-content-center align-items-center">
        <div class="mx-auto w-25">
            <h1 class="mt-3">Aggiungi libro</h1>

            <asp:Label ID="Label1" runat="server" CssClass="form-label" Text="Titolo:"></asp:Label>
            <asp:TextBox ID="Titolo" CssClass="form-control mb-3" runat="server"></asp:TextBox>

            <p class="form-label">Copertina: </p>
            <asp:FileUpload ID="FileUpload" CssClass="form-control mb-3" runat="server" />

            <p class="form-label">Descrizione: </p>
            <asp:TextBox ID="Descrizione" CssClass="form-control mb-3" runat="server"></asp:TextBox>

            <p class="form-label">Anno: </p>
            <asp:TextBox ID="Anno" runat="server" CssClass="form-control mb-3" placeholder="From" type="date"></asp:TextBox>

            <p class="form-label">Prezzo: </p>
            <asp:TextBox ID="Prezzo" CssClass="form-control mb-3" runat="server" type="number"></asp:TextBox>

            <p class="form-label">Autori: </p>
            <asp:DropDownList ID="Autori" CssClass="form-control mb-3" runat="server">
            </asp:DropDownList>


            <p class="form-label">Generi: </p>
            <asp:DropDownList ID="Generi" CssClass="form-control mb-3" runat="server">
            </asp:DropDownList>

             <p class="form-label">Editori: </p>
            <asp:DropDownList ID="Editori" CssClass="form-control mb-3" runat="server">
            </asp:DropDownList>

            <asp:Button ID="Aggiungi" runat="server" CssClass="btn  btn-success" Text="Modifica Libro" OnClick="Aggiungi_Click" />
        </div>
    </div>
</asp:Content>

