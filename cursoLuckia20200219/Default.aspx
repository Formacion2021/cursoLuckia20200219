<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Pulsame para ver los datos de la BD" OnClick="Button1_Click" />
    <asp:Button ID="Button4" runat="server" CssClass="btn btn-primary" Text="Pulsame para ocultar los datos de la BD" OnClick="Button4_Click" />
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
            </asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableCell>
                <label>Apellido:</label>
            </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="tbApellido" runat="server" />
            </asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableCell>
                <label>Password:</label>
            </asp:TableCell><asp:TableCell>
                <asp:TextBox TextMode="Password" ID="tbPassword" runat="server" />
            </asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary" Text="Guardar" OnClick="BtnGuardar_Click" />
            </asp:TableCell></asp:TableRow></asp:Table><asp:GridView ID="GridView2" runat="server" PageSize="3" AutoGenerateColumns="false" AllowPaging="true" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" OnPageIndexChanging="GridView2_PageIndexChanging"  OnRowDeleting="GridView2_RowDeleting">
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <Columns>

            <asp:TemplateField HeaderText="Nombre">
                <ItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("nombre")%>' Enabled="false"> </asp:TextBox></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Apellido">
                <ItemTemplate>
                    <asp:TextBox ID="txtApellido" runat="server" Text='<%#Eval ("Apellido") %>'></asp:TextBox></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Password">
                <ItemTemplate>
                    <asp:TextBox ID="txtPassword" runat="server" Text='<%#Eval ("Password")%>'> </asp:TextBox></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Edit" ShowHeader="false">
                <EditItemTemplate>
                    <asp:LinkButton ID="lnkbtnUpdate" runat="server" CausesValidation="true" Text="Update" CommandName="Update"></asp:LinkButton><asp:LinkButton ID="lnkbtnCancel" runat="server" CausesValidation="false" Text="Cancel" CommandName="Cancel"></asp:LinkButton></EditItemTemplate><ItemTemplate>
                    <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="false" CommandName="Edit" Text="Edit"></asp:LinkButton></ItemTemplate></asp:TemplateField><asp:CommandField HeaderText="Delete" ShowDeleteButton="true" ShowHeader="true" />
            <asp:CommandField HeaderText="Select" ShowSelectButton="true" ShowHeader="true" />
        </Columns>
    </asp:GridView>
   
                
                <asp:Button ID="Reset" runat="server" Text="Refresh" OnClick="Reset_Click1" />
           
</asp:Content>
