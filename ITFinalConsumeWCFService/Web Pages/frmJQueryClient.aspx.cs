using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using ITFinalConsumeWCFService.Classes;

namespace ITFinalConsumeWCFService.Web_Pages
{
    public partial class frmJQueryClient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //GetEmployeeById(1);
        }

        [System.Web.Services.WebMethod]
        public static Employee GetEmployeeById(string empId)
        {
            Employee employee = new Employee();

            string ConString = WebConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            SqlConnection con = new SqlConnection(ConString);

            con.Open();

            SqlCommand cmd = new SqlCommand("SPSelectEmployeeByID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@empID", Convert.ToInt32(empId)));

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                employee.FirstName = reader[0].ToString();
                employee.LastName = reader[1].ToString();
                employee.Gender = reader[2].ToString();
                employee.Address = reader[3].ToString();
                employee.Institute = reader[4].ToString();
            }
            else
            {
                employee.FirstName = "Not";
                employee.LastName = "Found";
                employee.Gender = "NA";
                employee.Address = "NA";
                employee.Institute = "NA";
            }
            con.Close();
            //List<Employee> list = new List<Employee>();
            return employee;
        }

        [System.Web.Services.WebMethod]
        public static List<string> SaveStudent(string name, string gender, string qulification, 
            string specialization, string ProgLanguages)
        {
            List<string> listStudent = new List<string>();
            listStudent.Add(name);
            listStudent.Add(gender);
            listStudent.Add(qulification);
            listStudent.Add(specialization);
            listStudent.Add(ProgLanguages);

            return listStudent;
        }
    }
}