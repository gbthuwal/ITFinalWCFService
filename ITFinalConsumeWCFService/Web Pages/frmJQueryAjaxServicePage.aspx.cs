using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Data;
using System.Data.SqlClient;

namespace ITFinalConsumeWCFService.Web_Pages
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

    public partial class frmJQueryServicePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(GetItemDetailAll());
            Response.Write("<br/><br/>Get Element By Id<br/>");
            
            ItemDetail items = GetItemDetailById(5);

            Response.Write(items.ItemId.ToString() + "<br/>" +
                            items.ItemName + "<br/>" + items.ItemMake + "<br/>" +
                            items.ItemSpecification + "<br/>" + items.ItemPurchasedOn
                            );
        }

        [System.Web.Services.WebMethod]
        public static string GetItemDetailAll()
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

        [System.Web.Services.WebMethod]
        public static ItemDetail GetItemDetailById(int itemID)
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
