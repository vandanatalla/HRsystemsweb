<%@ Page Title="" Language="C#" MasterPageFile="~/Mainpage.master" AutoEventWireup="true"
    CodeFile="Searchemployee.aspx.cs" Inherits="Searchemployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table id = "table1" runat= "server" style="width: 100%;">
        <tr>
            <td style="width: 180px" align="right">
                <font color="#999999" size="4px">Enter the Employee ID</font> &nbsp;
            </td>
            <td style="width: 166px" align="right">
                <asp:TextBox ID="txtSearchId" runat="server" Height="26px" Width="158px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Searchbtn" runat="server" Height="28px" OnClick="Button1_Click" BackColor="#999999"
                    BorderColor="White" Width="111px" Text="Search" />
            </td>
        </tr>
    </table >
    <table id= "table2" runat= "server">
    <tr>
    <td style="width: 257px"  align="right">
                <font color="#999999" size="4px">&nbsp;Profile Image :</font>
            </td>
            <td style="width: 132px">
            <asp:Image ID="Image1" runat="server" src='"<%=imageSrc%>"' Height="60px" Width="110px" />
            </td>
    
    </tr>
       
        <tr>
            <td style="width: 257px"  align="right">
                <font color="#999999" size="4px">&nbsp;First Name :</font>
            </td>
            <td style="width: 132px">
                <asp:Label ID="Label0" runat="server" ForeColor="#999999"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 257px"  align="right">
                <font color="#999999" size="4px">&nbsp;Last Name :</font>
            </td>
            <td style="width: 132px">
                <asp:Label ID="Label1" runat="server" ForeColor="#999999"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 257px"  align="right">
                <font color="#999999" size="4px">&nbsp;Working location :</font>
            </td>
            <td style="width: 132px">
                <asp:Label ID="Label2" runat="server" ForeColor="#999999"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 257px"  align="right">
                <font color="#999999" size="4px">&nbsp;Address :</font>
            </td>
            <td style="width: 132px">
                <asp:Label ID="Label3" runat="server" ForeColor="#999999"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 257px"  align="right">
                <font color="#999999" size="4px">&nbsp;Designation :</font>
            </td>
            <td style="width: 132px">
                <asp:Label ID="Label4" runat="server" ForeColor="#999999"></asp:Label>
            </td>
        </tr>
         <tr>
            <td  align="right" style="width: 257px">
                <font color="#999999" size="4px">&nbsp;Manager Name :</font>
            </td>
            <td   style="width: 132px">
                <asp:Label ID="Label5" runat="server" ForeColor="#999999"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 257px"  align="right">
                <font color="#999999" size="4px">&nbsp;Phone No :</font>
            </td>
            <td style="width: 132px">
                <asp:Label ID="Label6" runat="server" ForeColor="#999999"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
