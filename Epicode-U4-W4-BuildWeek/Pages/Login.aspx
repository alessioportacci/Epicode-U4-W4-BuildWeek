<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Epicode_U4_W4_BuildWeek.Pages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="Username" runat="server"></asp:TextBox>
            <asp:TextBox ID="Password" runat="server"></asp:TextBox>
            <asp:Button ID="LoginButton" runat="server" Text="Button" OnClick=" LoginSend " />
        </div>
    </form>
</body>
</html>
