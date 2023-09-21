<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="AggiungiProdotto.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Admin.AggiungiProdotto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row  row-cols-1 row-cols-xl-3">
            <%-- Div Libro --%>

            <div class="col mt-3 mb-3">
                <a class="btn btn-outline-success" data-bs-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="true" aria-controls="multiCollapseExample1">Aggiungi Libro</a>

                <div class="collapse multi-collapse" id="multiCollapseExample1">


                    <h1 class="mt-3">Aggiungi libro</h1>

                    <asp:Label ID="Label1" runat="server" CssClass="form-label" Text="Titolo:"></asp:Label>
                    <asp:TextBox ID="Titolo" CssClass="form-control mb-3" runat="server"></asp:TextBox>

                    <p class="form-label" >Copertina: </p>
                    <asp:FileUpload ID="FileUpload" CssClass="form-control mb-3" runat="server" />

                    <p class="form-label">Descrizione: </p>
                    <asp:TextBox ID="Descrizione" CssClass="form-control mb-3" runat="server"></asp:TextBox>

                    <p class="form-label">Anno: </p>
                    <asp:TextBox ID="Anno" runat="server" CssClass="form-control mb-3" placeholder="From" type="date"></asp:TextBox>

                    <p class="form-label">Prezzo: </p>
                    <asp:TextBox ID="Prezzo" CssClass="form-control mb-3" runat="server" type="number"></asp:TextBox>

                    <asp:DropDownList ID="Autori" CssClass="form-control mb-3" runat="server">
                    </asp:DropDownList>

                    <asp:DropDownList ID="Generi" CssClass="form-control mb-3" runat="server">
                    </asp:DropDownList>

                    <asp:DropDownList ID="Editori" CssClass="form-control mb-3" runat="server">
                    </asp:DropDownList>

                    <asp:Button ID="Aggiungi" runat="server" CssClass="btn  btn-success" Text="Aggiungi Libro" OnClick="Aggiungi_Click" />
                </div>
            </div>

            <%-- Div Autore --%>
            <div class="col mt-3 mb-3">
                <a class="btn btn-outline-success" data-bs-toggle="collapse" href="#multiCollapseExample2" role="button" aria-expanded="false" aria-controls="multiCollapseExample2  ">Aggiungi Autore</a>

                <div class="collapse multi-collapse" id="multiCollapseExample2">
                    <h1 class="mt-3">Aggiungi Autore</h1>
                    <p class="form-label">Nome </p>
                    <asp:TextBox ID="NomeAutore" CssClass="form-control mb-3" runat="server"></asp:TextBox>

                    <p class="form-label">Bio </p>
                    <asp:TextBox ID="BiografiaAutore" CssClass="form-control mb-3" runat="server"></asp:TextBox>

                    <p class="form-label">Foto</p>
                    <asp:FileUpload ID="FileUploadAutore" CssClass="form-control mb-3" runat="server" />

                    <p class="form-label">Nascita </p>
                    <asp:TextBox ID="NascitaAutore" CssClass="form-control mb-3" runat="server" placeholder="From" type="date"></asp:TextBox>

                    <p class="form-label">Morte </p>
                    <asp:TextBox ID="MorteAutore" CssClass="form-control mb-3" runat="server" placeholder="From" type="date"></asp:TextBox>

                    <p class="form-label">Corrente </p>
                    <asp:TextBox ID="CorrenteAutore" CssClass="form-control mb-3" runat="server"></asp:TextBox>



                    <asp:Button ID="AggiungiAutore" CssClass="btn  btn-success" runat="server" Text="Aggiungi" OnClick="AggiungiAutore_Click" />
                </div>
            </div>

            <%-- Div Genere --%>
            <div class="col mt-3 mb-3">
                <a class="btn btn-outline-success" data-bs-toggle="collapse" href="#multiCollapseExample3" role="button" aria-expanded="false" aria-controls="multiCollapseExample3">Aggiungi Editore O Genere</a>

                <div class="collapse multi-collapse" id="multiCollapseExample3">
                    <h1 class="mt-3" >Aggiungi Genere</h1>
                    <asp:TextBox ID="AddGenere" CssClass="form-control mb-3" runat="server"></asp:TextBox>
                    <asp:Button ID="AggiungiGenere" CssClass="btn  btn-success" runat="server" Text="Aggiungi" OnClick="AggiungiGenere_Click" />
                    <div class="mt-5">
                        <h1 class="mt-3">Aggiungi Editore</h1>
                        <asp:TextBox ID="AddEditore" CssClass="form-control mb-3" runat="server"></asp:TextBox>
                        <asp:Button ID="AggiungiEditore" CssClass="btn  btn-success" runat="server" Text="Aggiungi" OnClick="AggiungiEditore_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

     <script type="text/javascript">
         document.addEventListener('DOMContentLoaded', function () {
             const collapseList = document.querySelectorAll('.collapse');

             collapseList.forEach(function (collapse) {
                 collapse.addEventListener('show.bs.collapse', function () {
                     collapseList.forEach(function (otherCollapse) {
                         if (otherCollapse !== collapse) {
                             otherCollapse.classList.remove('show');
                         }
                     });
                 });
             });
         });
     </script>

</asp:Content>
