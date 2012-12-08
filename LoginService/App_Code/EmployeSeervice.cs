using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Services;

/// <summary>
/// Summary description for EmployeService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[ScriptService()] 
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class EmployeService : System.Web.Services.WebService
{

    public EmployeService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public ArrayList RetriveEmployee(int id)
    {

        string query = "SELECT * FROM EMP_DETAILS WHERE EMP_ID ='" + id + "'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbString"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand(query, conn);
        // int ID = 0;
        ArrayList al = new ArrayList();

        // string pass = "";
        SqlDataReader reader;

        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                for (int j = 0; j < reader.FieldCount; j++)
                    al.Add(reader[j]);


            }

        }
        return al;
        // reader.Dispose();
        //reader.Close();
        //   conn.Close();
    }
    

}
