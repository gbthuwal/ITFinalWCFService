using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.ServiceModel.Activation;

namespace ITFinalWCFService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "DBService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select DBService.svc or DBService.svc.cs at the Solution Explorer and start debugging.
    
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class DBService : IDBService
    {
        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }

        public DataSet GetDataSet(string connString, string queryString)
        {
            DataSet ds = new DataSet();
            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connString);
            conn.Open();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(queryString, conn);
            System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(cmd);
            da.Fill(ds);
            conn.Close();
            return ds;
        }

        public DataTable GetItemDetailAll()
        {
            string connString = WebConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            string queryString = "Select ItemId, ItemName, ItemMake, ItemSpecification From ItemDetail";

            DataSet ds = new DataSet();
            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connString);
            conn.Open();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(queryString, conn);
            System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(cmd);
            da.Fill(ds);
            conn.Close();
            return (ds.Tables[0]);
        }

        public string GetItemDetailsAll()
        {
            string connString = WebConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            string queryString = "Select ItemId, ItemName, ItemMake, ItemSpecification From ItemDetail";

            DataSet ds = new DataSet();
            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connString);
            conn.Open();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(queryString, conn);
            System.Data.SqlClient.SqlDataAdapter da = new System.Data.SqlClient.SqlDataAdapter(cmd);
            da.Fill(ds);
            conn.Close();

            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Serialize(ds.Tables[0]);
        }
    }
}
