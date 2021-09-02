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
            $('#btnGetAll').click(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'ITFinalAjaxDBService.svc/GetItemDetailAll',
                    data: JSON.stringify({itemID: $("#txtItemID").val() }),
                    dataType: "json",
                    processData: false,
                    success: function (data) {
                        $("#tblDetails tbody").empty();
                        $($.parseJSON(data.d)).each(function (index, value) {
                            $("#tblDetails").append("<tr><td>" + value.ItemId + "</td><td>" + value.ItemName + "</td><td>" + value.ItemMake + "</td><td>" + value.ItemSpecification + "</td></tr>");
                        });
                        $('#tblDetails').show();
                    },
                    error: function (result) {
                        alert(result.status + ' - ' + result.statusText);
                    }
                });
            });

            $('#tblDetails').hide();
            $('#btnGetByID').click(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'ITFinalAjaxDBService.svc/GetItemDetailById',
                    data: JSON.stringify({ itemID: $("#txtItemID").val() }),
                    dataType: "json",
                    processData: false,
                    success: function (data) {
                        $("#tblDetails tbody").empty();
                        $($.parseJSON(data.d)).each(function (index, value) {
                            $("#tblDetails").append("<tr><td>" + value.ItemId + "</td><td>" + value.ItemName + "</td><td>" + value.ItemMake + "</td><td>" + value.ItemSpecification + "</td></tr>");
                        });
                        $('#tblDetails').show();
                    },
                    error: function (result) {
                        alert(result.status + ' - ' + result.statusText);
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
                    <td>
                        <input type="button" id="btnGetAll" value="Get Data All" class="button"/>
                        <input type="button" id="btnGetByID" value="Get Data By ID" class="button"/>
                    </td>
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
