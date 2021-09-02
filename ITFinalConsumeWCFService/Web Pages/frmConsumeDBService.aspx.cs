using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using ITFinalConsumeWCFService.ITFinalAjaxDBService;
using ITFinalConsumeWCFService.DBService;

namespace ITFinalConsumeWCFService
{
    public partial class frmConsumeDBService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            GVDetail.DataSource= GetItemsAll();
            GVDetail.DataBind();
        }
        public System.Data.DataSet GetItemsAll()
        {
            string connString = WebConfigurationManager.ConnectionStrings["connString"].ConnectionString;

            string queryString = "Select * From ItemDetail";

            DBServiceClient client = new DBServiceClient();

            return client.GetDataSet(connString, queryString);
            
        }
    }
}