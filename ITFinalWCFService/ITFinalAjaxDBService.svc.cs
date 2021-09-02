using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.Configuration;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using ITFinalWCFService.Classes;

namespace ITFinalWCFService
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class ITFinalAjaxDBService
    {
        // To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
        // To create an operation that returns XML,
        //     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //     and include the following line in the operation body:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        public string DoWork()
        {
            // Add your operation implementation here
            return "Hello Govind";
        }

        [OperationContract]
        public string GetItemDetailAll()
        {
            string connString = WebConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            string queryString = "Select ItemId, ItemName, ItemMake, ItemSpecification From ItemDetail";

            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(queryString, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            conn.Close();

            DataTable dt = ds.Tables[0];
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

            Dictionary<string, object> row;

            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows); 
        }

        [OperationContract]
        public string GetItemDetailById(int itemID)
        {
            string connString = WebConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            string queryString = "Select ItemId, ItemName, ItemMake, ItemUnitPrice, ItemSpecification, ItemMFDYear, ItemPurchasedOn From ItemDetail Where itemId = @itemId";

            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(queryString, conn);
            cmd.Parameters.Add(new SqlParameter("@itemId", Convert.ToInt32(itemID)));
            SqlDataReader reader = cmd.ExecuteReader();
            ItemDetail item = new ItemDetail();

            if (reader.Read())
            {
                item.ItemId = Convert.ToInt32(reader["ItemId"].ToString());
                item.ItemName = reader["ItemName"].ToString();
                item.ItemSpecification = reader["ItemSpecification"].ToString();
                item.ItemMake = reader["ItemMake"].ToString();
                item.ItemMFDYear = Convert.ToInt16(reader["ItemMFDYear"].ToString());
                item.ItemPurchasedOn = reader["ItemPurchasedOn"].ToString();
                item.ItemUnitPrice = Convert.ToSingle(reader["ItemUnitPrice"].ToString());
            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(item);
        }

        [OperationContract]
        public string UpdateItemDetail(int itemID, string itemName, string itemMake, string itemSpec)
        {
            string connString = WebConfigurationManager.ConnectionStrings["connString"].ConnectionString;
            string queryString = "Update  ItemDetail Set ItemName = @itemName, ItemMake = @itemMake, ItemSpecification = @itemSpecificationFrom  Where itemId = @itemId";

            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(queryString, conn);
            cmd.Parameters.Add(new SqlParameter("@itemId", itemID));
            cmd.Parameters.Add(new SqlParameter("@itemName", itemName));
            cmd.Parameters.Add(new SqlParameter("@itemMake", itemMake));
            cmd.Parameters.Add(new SqlParameter("@itemSpecificationFrom", itemSpec));
            
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize("Data Saved Successfully");
        }
    }
}
