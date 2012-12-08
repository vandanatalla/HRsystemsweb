using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Collections;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for EmpRecordsService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class EmpRecordsService : System.Web.Services.WebService
{

    public EmpRecordsService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string Createemployee(List<string> empdetails)
    {
        int length = empdetails.Count();
        try
        {
            string query = "INSERT INTO EMP_DETAILS VALUES('" + empdetails.ElementAt(0) + "','" + empdetails.ElementAt(1) + "','" + empdetails.ElementAt(2) + "','" + empdetails.ElementAt(3) + "','" + empdetails.ElementAt(4) + "','" + empdetails.ElementAt(5) + "','" + empdetails.ElementAt(6) + "')";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected == 1)
            {
                return "sucessfully updated";
            }
            else
            {
                return "error during transaction";
            }

        }
        catch (Exception ex)
        {
            return ex.Message.ToString();
        }
    }

}
