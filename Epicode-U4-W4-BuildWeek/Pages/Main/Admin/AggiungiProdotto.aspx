<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="AggiungiProdotto.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Admin.AggiungiProdotto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Aggiungi libro</h1>

    <p> Titolo: </p>
    <asp:TextBox ID="Titolo" runat="server"></asp:TextBox>

    <p> Copertina: </p>
    <asp:FileUpload ID="FileUpload" runat="server" />

    <p> Descrizione: </p>
    <asp:TextBox ID="Descrizione" runat="server"></asp:TextBox>

    <p> Anno: </p>
    <asp:TextBox ID="Anno" runat="server" placeholder="From" type="date"></asp:TextBox>

    <p> Prezzo: </p>
    <asp:TextBox ID="Prezzo" runat="server" type="number"></asp:TextBox>

    <asp:DropDownList ID="Autori" runat="server">
    </asp:DropDownList>

    <asp:DropDownList ID="Generi" runat="server">
    </asp:DropDownList>

    <asp:DropDownList ID="Editori" runat="server">
    </asp:DropDownList>

    <asp:Button ID="Aggiungi" runat="server" Text="Aggiungi Libro" OnClick="Aggiungi_Click" />


    <h1> Aggiungi Autore</h1>
    <p> Nome </p>
    <asp:TextBox ID="NomeAutore" runat="server"></asp:TextBox>

    <p> Bio </p>
    <asp:TextBox ID="BiografiaAutore" runat="server"></asp:TextBox>

    <p>Foto</p>
    <asp:FileUpload ID="FileUploadAutore" runat="server" />

    <p> Nascita </p>
    <asp:TextBox ID="NascitaAutore" runat="server" placeholder="From" type="date"></asp:TextBox>

    <p> Morte </p>
    <asp:TextBox ID="MorteAutore" runat="server" placeholder="From" type="date"></asp:TextBox>

    <p> Corrente </p>
    <asp:TextBox ID="CorrenteAutore" runat="server"></asp:TextBox>



    <asp:Button ID="AggiungiAutore" runat="server" Text="Aggiungi" OnClick="AggiungiAutore_Click" />


    <h1> Aggiungi Genere</h1>
    <asp:TextBox ID="AddGenere" runat="server"></asp:TextBox>
    <asp:Button ID="AggiungiGenere" runat="server" Text="Aggiungi" OnClick="AggiungiGenere_Click"  />


    <h1> Aggiungi Editore</h1>
    <asp:TextBox ID="AddEditore" runat="server"></asp:TextBox>
    <asp:Button ID="AggiungiEditore" runat="server" Text="Aggiungi" OnClick="AggiungiEditore_Click"  />


</asp:Content>
