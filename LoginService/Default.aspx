﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:TextBox ID="tbMessage" runat="server" TextMode="MultiLine" Rows="5" Columns="30"></asp:TextBox>
<br /><asp:Button ID="btnSubmit" runat="server" Text="Send to my Facebook" OnClick="btnSubmit_Click" />
    </div>
    </form>
</body>
</html>
