<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCallWCFServiceJQueryAjax.aspx.cs" Inherits="ITFinalConsumeWCFService.Web_Pages.frmCallWCFServiceJQueryAjax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/ITFinalStyles.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
</head>
<body>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tblDetails').hide();
            $('#btnClick').click(function () {
                $.ajax({
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    url: 'ITFinalAjaxDBService/GetItemDetailAll',
                    //data: '{"itemID": "' + $("#txtItemID").val() + '"}',
                    dataType: "json",
                    processData: false,
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            $("#tblDetails").append("<tr><td>" + data.d[i].ItemId + "</td><td>" + data.d[i].ItemName + "</td><td>" + data.d[i].ItemMake + "</td><td>" + data.d[i].ItemSpecification + "</td></tr>");
                        }
                        $('#tblDetails').show();
                    },
                    error: function (result) {
                        alert(result.status + " " + result.responseText);
                    }
                });

            });
        });
    </script>

    <form id="form1" runat="server">
        <div>
            <table id="tblForm" class="formTable">
                <tr>
                    <th class="top" colspan="2">Item Detail</th>
                </tr>
                <tr>
                    <td class="tdleft">Enter ItemID:</td>
                    <td><input type="text" id="txtItemID" /></td>
                </tr>
                <tr>
                    <td class="tdleft"></td>
                    <td><input type="button" id="btnClick" value="Get Data" class="button"/></td>
                </tr>
            </table>

            <table id="tblDetails" class="myGridClass myAltRowClass">
                <thead>
                    <tr>
                        <th>Item ID</th>
                        <th>Item Name</th>
                        <th>Item Make</th>
                        <th>Item Specification</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
