<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Navbar.Master" AutoEventWireup="true" CodeBehind="Carrello.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Main.Carrello" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
    <asp:Repeater ID="repeaterItems" runat="server">
        <ItemTemplate>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col" style="width: 50%;">Titolo</th>
                        <th scope="col" style="width: 25%;">Prezzo</th>
                        <th scope="col" style="width: 25%;"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%# Eval("Titolo") %></td>
                        <td>Prezzo: €<%# Eval("Prezzo", "{0:N2}") %></td>
                        <td>
                          <asp:Button ID="btnRimuovi" runat="server" Text="Rimuovi" CssClass="btn btn-danger"  CommandArgument='<%# Container.ItemIndex %>' />

                        </td>
                    </tr>
                </tbody>
            </table>
        </ItemTemplate>
     
    </asp:Repeater>
           <FooterTemplate>
       <table class="table table-bordered">
           <tfoot>
               <tr>
                   <td colspan="2"><strong>Totale:</strong></td>
                   <td><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                   </td>
               </tr>
           </tfoot>
       </table>
   </FooterTemplate>
<asp:Button ID="btnSvuotaCarrello" runat="server" Text="Svuota Carrello" CssClass="btn btn-danger" OnClick="btnSvuotaCarrello_Click" />

    <a class="btn btn-success" href="https://www.youtube.com/watch?v=dQw4w9WgXcQ">Concludi l'ordine</a>
        </div>

</asp:Content>
