<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Pulsame para ver los datos de la BD" OnClick="Button1_Click" />
    <asp:GridView ID="GridView1" CssClass="table table-dark" runat="server"></asp:GridView>

    <br />
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <%# Container.DataItem %>
            <br />
        </ItemTemplate>
    </asp:Repeater>
    <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="Pulsame para NO usar un updatepanel" OnClick="Button2_Click" />
    <asp:Label ID="lbNoUpdate" runat="server"></asp:Label>

    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="updatePanel1">
        <ContentTemplate>
            <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary" Text="Pulsame para usar un updatepanel" OnClick="Button3_Click" />
            <asp:Label ID="lbUpdate" runat="server"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <label>Nombre:</label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="tbNombre" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <label>Apellido:</label>
            </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="tbApellido" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <label>Password:</label>
            </asp:TableCell><asp:TableCell>
                <asp:TextBox TextMode="Password" ID="tbPassword" runat="server" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary" Text="Guardar" OnClick="BtnGuardar_Click"  />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
