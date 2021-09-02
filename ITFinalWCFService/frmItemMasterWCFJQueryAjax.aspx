<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmItemMasterWCFJQueryAjax.aspx.cs" Inherits="ITFinalWCFService.frmItemMasterWCFJQueryAjax" %>

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
            $("input:button").hover(function () {
                $(this).css("color", "#eb1f1f");
            }, function () {
                $(this).css("color", "white");
            });

            $('#tblItemMaster').hide();

            $('#btnGet').click(function () {
                var itemId = $("#txtItemID").val().trim();
                $('#paraMessage').html('');
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'ITFinalAjaxDBService.svc/GetItemDetailById',
                    data: JSON.stringify({ itemID: itemId }),
                    dataType: "json",
                    processData: false,
                    success: function (data) {  // parseJSON to be used
                        $('#txtItemName').val(data.d.ItemName);
                        $('#txtItemMake').val(data.d.ItemMake);
                        $('#txtItemSpecification').val(data.d.ItemSpecification);
                        $('#tblItemMaster').fadeIn(1500);
                    },
                    error: function (result) {
                        alert(result.status);
                    }
                });
            });

            $('#btnSave').click(function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'ITFinalAjaxDBService.svc/UpdateItemDetail',
                    data: JSON.stringify({
                        itemID: $("#txtItemID").val(),
                        itemName: $("#txtItemName").val(),
                        itemMake: $("#txtItemMake").val(),
                        itemSpec: $("#txtItemSpecification").val()
                    }),
                    dataType: "json",
                    processData: false,
                    success: function (data) {
                        $('#paraMessage').html('<b>' + data.d + '</b>');
                        $('#tblItemMaster').fadeOut(1500);
                    },
                    error: function (data) {
                        if (data.status == 500)
                            alert('Internal Server Error: ' + data.status);
                        else if (data.status = 404) {
                            alert('Required URL Not Found: ' + data.status);
                        }
                    }
                });
            });

            $('#btnReset').click(function () {
                $("#frmItemMaster").find('input:text').val('');
                $('input:text').val('');
                $('#paraMessage').html('');
                $('#tblItemMaster').fadeOut(1000);
            });

        });
    </script>

    <form id="frmItemMaster" runat="server">
        <div>
            <table id="tblForm" class="formTable">
                <tr>
                    <th class="top" colspan="2">Item Detail</th>
                </tr>
                <tr>
                    <td class="tdleft">Enter ItemID:</td>
                    <td>
                        <input type="text" id="txtItemID" /></td>
                </tr>
                <tr>
                    <td class="tdleft"></td>
                    <td>
                        <input type="button" id="btnGet" value="Get Data" class="button" /></td>
                </tr>
                <tr>
                    <td class="tdleft">&nbsp;</td>
                    <td>
                        <p id="paraMessage"></p></td>
                </tr>
            </table>
            <table id="tblItemMaster" class="formTable">
                <tr>
                    <td class="tdleft">Enter Name:</td>
                    <td>
                        <input type="text" id="txtItemName" /></td>
                </tr>
                <tr>
                    <td class="tdleft">Enter Make:</td>
                    <td>
                        <input type="text" id="txtItemMake" /></td>
                </tr>
                <tr>
                    <td class="tdleft">Enter Specification:</td>
                    <td>
                        <input type="text" id="txtItemSpecification" /></td>
                </tr>
                <tr>
                    <td class="tdleft"></td>
                    <td>
                        <input type="button" id="btnSave" value="Save" class="button" />
                        <input type="button" id="btnReset" value="Reset" class="button" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
