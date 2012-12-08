<%@ Page Title="" Language="C#" MasterPageFile="~/Mainpage.master" AutoEventWireup="true" CodeFile="CreateEmployeeRecord.aspx.cs" Inherits="CreateEmployeeRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 
    <table id="Table1" runat="server" 
    style="width: 819px; height: 391px; margin-left: 0px;">
   <tr><td colspan="2"></td></tr>
   <tr>    <td align="right"><font color = "#999999" size = "4px">Choose profile pic</font></td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" Height="31px" Width="218px" />
       </td>
    </tr>
    <tr>    <td align="right" style="width: 350px"><font color = "#999999" size = "4px"> first name :</font></td>
            <td><asp:TextBox ID="txtFirstName" runat="server" Height="29px" Width="145px"></asp:TextBox></td>
    </tr>
        <tr>    <td align="right" style="width: 350px"><font color = "#999999" size = "4px">last name:</font></td>
            <td><asp:TextBox ID="txtLastName" runat="server"  Height="29px" Width="145px"></asp:TextBox></td>
    </tr>
        <tr>    <td align="right" style="width: 350px"><font color = "#999999" size = "4px">working location</font></td>
            <td>

<asp:DropDownList id="State" runat="server" Height="24px" Width="149px">

    <asp:ListItem Value="AL">Alabama</asp:ListItem>

    <asp:ListItem Value="AK">Alaska</asp:ListItem>

    <asp:ListItem Value="AZ">Arizona</asp:ListItem>

    <asp:ListItem Value="AR">Arkansas</asp:ListItem>

    <asp:ListItem Value="CA">California</asp:ListItem>

    <asp:ListItem Value="CO">Colorado</asp:ListItem>

    <asp:ListItem Value="CT">Connecticut</asp:ListItem>

    <asp:ListItem Value="DC">District of Columbia</asp:ListItem>

    <asp:ListItem Value="DE">Delaware</asp:ListItem>

    <asp:ListItem Value="FL">Florida</asp:ListItem>

    <asp:ListItem Value="GA">Georgia</asp:ListItem>

    <asp:ListItem Value="HI">Hawaii</asp:ListItem>

    <asp:ListItem Value="ID">Idaho</asp:ListItem>

    <asp:ListItem Value="IL">Illinois</asp:ListItem>

    <asp:ListItem Value="IN">Indiana</asp:ListItem>

    <asp:ListItem Value="IA">Iowa</asp:ListItem>

    <asp:ListItem Value="KS">Kansas</asp:ListItem>

    <asp:ListItem Value="KY">Kentucky</asp:ListItem>

    <asp:ListItem Value="LA">Louisiana</asp:ListItem>

    <asp:ListItem Value="ME">Maine</asp:ListItem>

    <asp:ListItem Value="MD">Maryland</asp:ListItem>

    <asp:ListItem Value="MA">Massachusetts</asp:ListItem>

    <asp:ListItem Value="MI">Michigan</asp:ListItem>

    <asp:ListItem Value="MN">Minnesota</asp:ListItem>

    <asp:ListItem Value="MS">Mississippi</asp:ListItem>

    <asp:ListItem Value="MO">Missouri</asp:ListItem>

    <asp:ListItem Value="MT">Montana</asp:ListItem>

    <asp:ListItem Value="NE">Nebraska</asp:ListItem>

    <asp:ListItem Value="NV">Nevada</asp:ListItem>

    <asp:ListItem Value="NH">New Hampshire</asp:ListItem>

    <asp:ListItem Value="NJ">New Jersey</asp:ListItem>

    <asp:ListItem Value="NM">New Mexico</asp:ListItem>

    <asp:ListItem Value="NY">New York</asp:ListItem>

    <asp:ListItem Value="NC">North Carolina</asp:ListItem>

    <asp:ListItem Value="ND">North Dakota</asp:ListItem>

    <asp:ListItem Value="OH">Ohio</asp:ListItem>

    <asp:ListItem Value="OK">Oklahoma</asp:ListItem>

    <asp:ListItem Value="OR">Oregon</asp:ListItem>

    <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>

    <asp:ListItem Value="RI">Rhode Island</asp:ListItem>

    <asp:ListItem Value="SC">South Carolina</asp:ListItem>

    <asp:ListItem Value="SD">South Dakota</asp:ListItem>

    <asp:ListItem Value="TN">Tennessee</asp:ListItem>

    <asp:ListItem Value="TX">Texas</asp:ListItem>

    <asp:ListItem Value="UT">Utah</asp:ListItem>

    <asp:ListItem Value="VT">Vermont</asp:ListItem>

    <asp:ListItem Value="VA">Virginia</asp:ListItem>

    <asp:ListItem Value="WA">Washington</asp:ListItem>

    <asp:ListItem Value="WV">West Virginia</asp:ListItem>

    <asp:ListItem Value="WI">Wisconsin</asp:ListItem>

    <asp:ListItem Value="WY">Wyoming</asp:ListItem>

</asp:DropDownList>
</td>
    </tr>
        <tr>    <td align="right" style="width: 350px"><font color = "#999999" size = "4px">Address </font></td>
            <td><asp:TextBox ID="txtAddress" runat="server"  Height="29px" Width="145px"></asp:TextBox></td>
    </tr>
        <tr>    <td align="right" style="width: 350px"><font color = "#999999" size = "4px">Designation </font></td>
            <td><asp:TextBox ID="txtDesignation" runat="server"  Height="29px" Width="145px"></asp:TextBox></td>
    </tr>
        <tr>    <td align="right" style="width: 350px"><font color = "#999999" size = "4px">Manager name</font></td>
            <td><asp:TextBox ID="txtManager" runat="server"  Height="29px" Width="145px"></asp:TextBox></td>
    </tr>
        <tr>    <td align="right" style="width: 350px"><font color = "#999999" size = "4px">Phone</font>
        </td>
            <td><asp:TextBox ID="txtPhone" runat="server"  Height="29px" Width="145px"></asp:TextBox></td>
    </tr>
   
  
<tr>

<td align ="right" style="width: 394px" >
    &nbsp&nbsp
    </td>
    <td align ="justify">
        
   <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" 
        BackColor="#999999" BorderColor="White" Width="63px" /> &nbsp;&nbsp;&nbsp;
        
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="cancel" 
            BackColor="#999999" BorderColor="White" Width="63px" />
    </td>
    </tr>
    </table>
    <table id = "table2"  runat="server">
    <tr>
    <td style="width: 359px" align = "right">&nbsp&nbsp
    <asp:Label ID = "lblMessage" runat = "server" Font-Bold="True" 
        Font-Italic="True" Font-Size="Larger" ForeColor="#999999"></asp:Label>
    </td>
    <td>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Large" 
            ForeColor="#999999" NavigateUrl="~/CreateEmployeeRecord.aspx">BACK</asp:HyperLink>
    </td>
    </tr>
        </table>
        
       
       </asp:Content>

