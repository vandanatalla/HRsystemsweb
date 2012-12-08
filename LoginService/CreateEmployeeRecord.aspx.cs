using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateEmployeeRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        table2.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            byte[] imageB = new byte[FileUpload1.PostedFile.ContentLength];
            imageB = FileUpload1.FileBytes;
            string selected = State.SelectedItem.Text;
            createemployee.CommonLogonService createemprec = new createemployee.CommonLogonService();
           string status = createemprec.Createemployee(imageB,txtFirstName.Text,txtLastName.Text,State.SelectedItem.Text,txtAddress.Text,txtDesignation.Text,txtManager.Text,txtPhone.Text);
           //Response.Write(status);
           Table1.Visible = false;
           lblMessage.Text = status;
           table2.Visible = true;
           //Tabl.Visible = false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}