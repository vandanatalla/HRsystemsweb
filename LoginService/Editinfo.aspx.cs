using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.IO;

public partial class Editinfo : System.Web.UI.Page
{
    createemployee.CommonLogonService createemprec = new createemployee.CommonLogonService();
    retriveemp.EmployeService retrieveemp1 = new retriveemp.EmployeService();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
         if (txtSearchId.Text != "")
        {
            var retrecord = retrieveemp1.RetriveEmployee(Convert.ToInt32(txtSearchId.Text));
            ArrayList retrievedRecord = new ArrayList(retrecord);
            if (retrievedRecord.Count == 0)
            {
                Response.Write("invalid credentails");
            }
            else
            {
                byte[] imageretrived = (byte[])retrievedRecord[0];
                MemoryStream mem = new MemoryStream(imageretrived);
                string base64String = string.Format("data:image/PNG;base64,{0}", Convert.ToBase64String(mem.ToArray()));
                Image1.Attributes.Add("src", base64String);
                Label1.Text = retrievedRecord[1].ToString();
                Label2.Text = retrievedRecord[2].ToString();
                Label3.Text = retrievedRecord[3].ToString();
                Label4.Text = retrievedRecord[4].ToString();
                Label5.Text = retrievedRecord[5].ToString();
                Label6.Text = retrievedRecord[6].ToString();
                Label7.Text = retrievedRecord[7].ToString();
            }
        }
        else
        {
            int id = Convert.ToInt16(sender.ToString());
            var retrecord = retrieveemp1.RetriveEmployee(id);
            ArrayList retrievedRecord = new ArrayList(retrecord);
			txtSearchId.Text = id.ToString();
            if (retrievedRecord.Count == 0)
            {
                Response.Write("invalid credentails");
            }
            else
            {
			
                byte[] imageretrived = (byte[])retrievedRecord[0];
                MemoryStream mem = new MemoryStream(imageretrived);
                string base64String = string.Format("data:image/PNG;base64,{0}", Convert.ToBase64String(mem.ToArray()));
                Image1.Attributes.Add("src", base64String);
                Label1.Text = retrievedRecord[1].ToString();
                Label2.Text = retrievedRecord[2].ToString();
                Label3.Text = retrievedRecord[3].ToString();
                Label4.Text = retrievedRecord[4].ToString();
                Label5.Text = retrievedRecord[5].ToString();
                Label6.Text = retrievedRecord[6].ToString();
                Label7.Text = retrievedRecord[7].ToString();
            }
        }
    }
    protected void save_Click(object sender, EventArgs e)
    {
        createemprec.UpdateSinglevalue(Convert.ToInt32(txtSearchId.Text), "FIRST_NAME", firstname.Text);
        Button1_Click(sender,e);
        
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        createemprec.UpdateSinglevalue(Convert.ToInt32(txtSearchId.Text), "LAST_NAME", lastname.Text);
        Button1_Click(sender, e);
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        createemprec.UpdateSinglevalue(Convert.ToInt32(txtSearchId.Text), "EMP_LOCATION", workinglocation.Text);
        Button1_Click(sender, e);
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        createemprec.UpdateSinglevalue(Convert.ToInt32(txtSearchId.Text), "EMP_ADDRESS", empaddress.Text);
        Button1_Click(sender, e);
    }
    protected void Button13_Click(object sender, EventArgs e)
    {
        createemprec.UpdateSinglevalue(Convert.ToInt32(txtSearchId.Text), "EMP_DESIGNATION", designation.Text);
        Button1_Click(sender, e);
    }
    protected void Button16_Click(object sender, EventArgs e)
    {
        createemprec.UpdateSinglevalue(Convert.ToInt32(txtSearchId.Text), "EMP_MANAGER", manager.Text);
        Button1_Click(sender, e);
    }
    protected void Button19_Click(object sender, EventArgs e)
    {
        createemprec.UpdateSinglevalue(Convert.ToInt32(txtSearchId.Text), "EMP_PHONE", phone.Text);
        Button1_Click(sender, e);
    }
    protected void imgupload_Click(object sender, EventArgs e)
    {
        
    }
    protected void Submit(object sender, EventArgs e)
    {

        string customerName = Request.Form[txtSearch.UniqueID];
        string customerId = Request.Form[hfCustomerId.UniqueID];
       Button1_Click(customerId, e);
    }
}