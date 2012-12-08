<%@ Page Title="" Language="C#" MasterPageFile="~/Mainpage.master" AutoEventWireup="true"
    CodeFile="Editinfo.aspx.cs" Inherits="Editinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <html>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.8.2.js" type= "text/javascript"></script>
        <script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js" type= "text/javascript"></script>
        <link rel="stylesheet" href="/resources/demos/style.css" />
        <style>
        .content{ height:auto;}
            .btnSearchId
            {
                width: 184px;
            }
            .btnSearchName
            {
                width: 209px;
                margin-left: 80px;
            }
        </style>
        <script type= "text/javascript">
            $(document).ready(function () {
                $('#accordion').accordion();
                $('#accordion').find("input:text").hide();
                $(".disco").hide();
                $(".disco").find("input").hide();
                $(".searchid").hide();
                $(".searchname").hide();

                $('.editHider').click(function () {
                    $(this).parent().find("span").toggle();
                    $(this).parent().find("input").toggle();
                    $(this).parent().find(".disco").find("input").show();
                    $(this).next().next().val($(this).parent().find("span").first().text());
                    // alert($(this).parent().find("span").first().text()+":"+$(this).next().val());
                });

                $(".cancelhider").click(function () {
                    $(this).parent().parent().find("input").toggle();
                    $(this).parent().parent().find("span").toggle();


                });
                $(".btnSearchName").click(function () {
                    $(".searchid").hide();
                    $(".searchname").show();
                });
                $(".btnSearchId").click(function () {
                    $(".searchname").hide();
                    $(".searchid").show();
                });
                $("#<%=txtSearch.ClientID %>").autocomplete({
                    source: function (request, response) {
                        $.ajax({
                            url: '<%=ResolveUrl("~/CommonLogonService.asmx/RetriveByName") %>',
                            data: "{ 'name': '" + request.term + "'}",
                            dataType: "json",
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item.split('-')[0],
                                        val: item.split('-')[1]
                                    }
                                }))
                            },
                            error: function (response) {
                                alert(response.responseText);
                            },
                            failure: function (response) {
                                alert(response.responseText);
                            }
                        });
                    },
                    select: function (e, i) {
                        $("#<%=hfCustomerId.ClientID %>").val(i.item.val);
                    },
                    minLength: 1
                });

            });
          
        </script>
    </head>
    <body>
    <table>
    <tr>
    <td>
    <input type ="button" value ="search by name" class = "btnSearchName"/> <font color="#999999" size="4px"> OR</font>
     </td>
     <td>
     <input type ="button" value ="search by ID" class = "btnSearchId"/> 
    </td>
    </tr>
    </table>
        <table>
            <tr class = "searchid">
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
             <tr class = "searchname">
                <td style="width: 180px" align="right">
                    <font color="#999999" size="4px">Enter the Employee Name</font> &nbsp;
                </td>
                <td style="width: 166px" align="right">
                    <asp:TextBox ID="txtSearch" runat="server" Height="26px" Width="158px"></asp:TextBox>
                     <asp:HiddenField ID="hfCustomerId" runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Height="28px" OnClick="Submit" BackColor="#999999"
                        BorderColor="White" Width="111px" Text="Search" />
                        
                </td>
            </tr>
        </table>
       
        <div id="accordion">
        <h3>
                Profile Image</h3>
            <div>
                <asp:Image ID="Image1" runat="server" src='"<%=imageSrc%>"' Height="60px" Width="110px" />
                <input type="button" id="Button20" name="Edit" value="Edit" class = "editHider" />
                 <br />
                 
                 <span class="disco">
                  <input type="file" id = "imagefile" name="datafile" size="40"/>
                  <input type="button" id="Button21" name="cancel" value="cancel" class = "cancelhider" />
                 <asp:Button  ID = "imgupload1" runat = "server" Text = "save" 
                    onclick="imgupload_Click" />
                 </span>
            </div>
            <h3>
                First Name</h3>
            <div>
                <asp:Label ID="Label1" runat="server" Text="First Name" ForeColor="#999999"></asp:Label>
                <input type="button" id="Button1" name="Edit" value="Edit" class = "editHider" />
                 <br />
                <asp:TextBox ID="firstname" runat="server"></asp:TextBox>
                <span class="disco">
                 <input type="button" id="cancel" name="cancel" value="cancel" class = "cancelhider" />
                 <asp:Button  ID = "save" runat = "server" Text = "save" onclick="save_Click"/>
                </span>
               

            </div>
            
            <h3>
                Last Name</h3>
            <div>
                <asp:Label ID="Label2" runat="server" Text="Last Name" ForeColor="#999999"></asp:Label>
                <input type="button" id="Button2" name="Edit" value="Edit" class = "editHider" />
                 <br />
                <asp:TextBox ID="lastname" runat="server"></asp:TextBox>
                <span class="disco">
                 <input type="button" id="Button3" name="cancel" value="cancel" class = "cancelhider" />
                 <asp:Button  ID = "Button4" runat = "server" Text = "save" 
                    onclick="Button4_Click"/>
                </span>
            </div>
            <h3>
                Working Location</h3>
            <div>
                <asp:Label ID="Label3" runat="server" Text="Working Location" ForeColor="#999999"></asp:Label>
                <input type="button" id="Button5" name="Edit" value="Edit" class = "editHider" />
                 <br />
                <asp:TextBox ID="workinglocation" runat="server"></asp:TextBox>
                <span class="disco">
                 <input type="button" id="Button6" name="cancel" value="cancel" class = "cancelhider" />
                 <asp:Button  ID = "Button7" runat = "server" Text = "save" 
                    onclick="Button7_Click"/>
                </span>
                
            </div>
             <h3>
                Address</h3>
            <div>
                <asp:Label ID="Label4" runat="server" Text="Address" ForeColor="#999999"></asp:Label>
                <input type="button" id="Button8" name="Edit" value="Edit" class = "editHider" />
                 <br />
                <asp:TextBox ID="empaddress" runat="server"></asp:TextBox>
                <span class="disco">
                 <input type="button" id="Button9" name="cancel" value="cancel" class = "cancelhider" />
                 <asp:Button  ID = "Button10" runat = "server" Text = "save" 
                    onclick="Button10_Click"/>
                </span>
                
            </div>
              <h3>
                Designation</h3>
            <div>
                <asp:Label ID="Label5" runat="server" Text="Designation" ForeColor="#999999"></asp:Label>
                <input type="button" id="Button11" name="Edit" value="Edit" class = "editHider" />
                 <br />
                <asp:TextBox ID="designation" runat="server"></asp:TextBox>
                <span class="disco">
                 <input type="button" id="Button12" name="cancel" value="cancel" class = "cancelhider" />
                 <asp:Button  ID = "Button13" runat = "server" Text = "save" 
                    onclick="Button13_Click"/>
                </span>
                
            </div>
              <h3>
                Manager</h3>
            <div>
                <asp:Label ID="Label6" runat="server" Text="Manager" ForeColor="#999999"></asp:Label>
                <input type="button" id="Button14" name="Edit" value="Edit" class = "editHider" />
                 <br />
                <asp:TextBox ID="manager" runat="server"></asp:TextBox>
                <span class="disco">
                 <input type="button" id="Button15" name="cancel" value="cancel" class = "cancelhider" />
                 <asp:Button  ID = "Button16" runat = "server" Text = "save" 
                    onclick="Button16_Click"/>
                </span>
                
            </div>
              <h3>
                Phone</h3>
            <div>
                <asp:Label ID="Label7" runat="server" Text="Phone" ForeColor="#999999"></asp:Label>
                <input type="button" id="Button17" name="Edit" value="Edit" class = "editHider" />
                 <br />
                <asp:TextBox ID="phone" runat="server"></asp:TextBox>
                <span class="disco">
                 <input type="button" id="Button18" name="cancel" value="cancel" class = "cancelhider" />
                 <asp:Button  ID = "Button19" runat = "server" Text = "save" 
                    onclick="Button19_Click"/>
                </span>
                
            </div>
           
        </div>
    </body>
   
   </asp:Content>
