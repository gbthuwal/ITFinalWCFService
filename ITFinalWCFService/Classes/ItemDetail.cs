using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ITFinalWCFService.Classes
{
    public class ItemDetail
    {
        public int ItemId{ get; set; }
        public string ItemName { get; set; }
        public string ItemSpecification { get; set; }
        public string ItemMake { get; set; }
        public short ItemMFDYear { get; set; }
        public string ItemPurchasedOn { get; set; }
        public float ItemUnitPrice { get; set; }
    }
}