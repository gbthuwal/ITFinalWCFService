using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Script.Serialization;

namespace ITFinalConsumeWCFService
{
    public class ItemDetail
    {
        public int ItemId { get; set; }
        public string ItemName { get; set; }
        public string ItemSpecification { get; set; }
        public string ItemMake { get; set; }
        public short ItemMFDYear { get; set; }
        public string ItemPurchasedOn { get; set; }
        public float ItemUnitPrice { get; set; }
    }

    /// <summary>
    /// Summary description for ITFinalWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ITFinalWebService : System.Web.Services.WebService
    {
        [WebMethod]
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

        [WebMethod]
        public ItemDetail GetItemDetailById(int itemID)
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
            return item;
        }
    }
}

