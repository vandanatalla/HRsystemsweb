<%@ Page Title="" Language="C#" MasterPageFile="~/Mainpage.master" AutoEventWireup="true"
    CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<html>
<head>

 <script src="http://code.jquery.com/jquery-1.8.2.js" type= "text/javascript"></script>
 <script src="Scripts/jquery-ui-1.9.0.custom.js" type= "text/javascript"></script>
<script src = "Scripts/jquery.cycle.all.js" type = "text/javascript"></script>
<style>
.font
{
    color="#999999"; 
    size="4px";
}
</style>
<script type = "text/javascript">
		$(document).ready(function(){
			$('#slides').cycle({
			    fx: 'shuffle',
			    easing: 'easeOutBack',
				speed: 1000,
				timeout: 1000
			});

		}); 
        </script>
</head>
<body>
    <p style="margin-left: 40px">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Size="X-Large" ForeColor="#999999" Text="WELCOME !!!!"></asp:Label>
        </p>
        <table >
        <tr align = "center">
        <td>
        <div id = "slides">
        <img src = "images/slide1.jpg" width = "500" height = "300"/>
        <img src = "images/slide2.jpg" width = "500" height = "300"/>
        <img src = "images/slide3.jpg" width = "500" height = "300"/>
        </div>
        </td>
        <td>
        <p style = "color : #999999">
        Welcome To HR System<br />
        This tool is  For HR's To make their work easy.<br />
        You have options to create employee reocord and search for employee, and also you have provison to search for employee reocrd by name or id<br />
        even if you forgot the id dont worry the tool will suggest you the names of employees as you type in<br />
        Go ahead !!!!!
        </p>
        <td>

        </tr>
        </table>
      </body>
        </html>
</asp:Content>
