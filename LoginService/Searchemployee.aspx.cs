using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;

public partial class Searchemployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        table2.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        retriveemp.EmployeService retrieveemp1 = new retriveemp.EmployeService();
       var retrecord = retrieveemp1.RetriveEmployee(Convert.ToInt32(txtSearchId.Text));
       ArrayList retrievedRecord = new ArrayList(retrecord);
       if (retrievedRecord.Count == 0)
       {
           Response.Write("please enter valid id");
       }
       else
       {
           byte[] imageretrived = (byte[])retrievedRecord[0];
           MemoryStream mem = new MemoryStream(imageretrived);
           string base64String = string.Format("data:image/PNG;base64,{0}", Convert.ToBase64String(mem.ToArray()));
           Image1.Attributes.Add("src", base64String);
           Label0.Text = retrievedRecord[1].ToString();
           Label1.Text = retrievedRecord[2].ToString();
           Label2.Text = retrievedRecord[3].ToString();
           Label3.Text = retrievedRecord[4].ToString();
           Label4.Text = retrievedRecord[5].ToString();
           Label5.Text = retrievedRecord[6].ToString();
           Label6.Text = retrievedRecord[7].ToString();
          
           table2.Visible = true;

       }

    }
}