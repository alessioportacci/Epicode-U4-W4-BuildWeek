<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Admin.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="m-3 mb-4">Modifica prodotti</h1>

    <div class="row row-cols-2 row-cols-md-4 row-cols-lg-6 justify-content-center">
         <asp:Repeater ID="Repeater2" runat="server" ItemType="Epicode_U4_W4_BuildWeek.Classes.Libri"  >
              <ItemTemplate>

                    <div class="p-1">
                        <div class="card card-home  mx-auto" style="width: 10rem;">
                            <img src="../../../Content/img/Libri/<%# Item.Copertina %>" class="card-img-top" alt="avatar" height="230">
                            <div class="card-body">
                                <p id="boxAuthor1" runat="server" class="text-truncate text-secondary m-0"><%# Double.Parse(Item.Prezzo).ToString("C0")%></p>
                                <a id="boxUrl1" href="Modifica.aspx?id=<%# Item.IDLibro %>" class="libro-redirect"> 
                                    <h5 class="card-title"> 
                                        <i class="bi bi-arrow-right-circle-fill"></i> 
                                        <span id="boxTitle1" runat="server" style="text-decoration:underline">Modifica </span>  <%# Item.Titolo %>
                                    </h5>
                                </a>
                            </div>
                        </div>
                    </div>
             </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

