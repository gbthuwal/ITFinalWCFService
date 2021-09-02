<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmJQueryVisualEffects.aspx.cs" Inherits="ITFinalConsumeWCFService.Web_Pages.frmITFinalJQueryVisualEffects" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        .txtClass {
            color : #eb1f1f;
        }
    </style>
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

            $('#btnShow').click(function () {
                $('#tblItemMaster').show(1000);
            });

            $('#btnHide').click(function () {
                $('#tblItemMaster').hide(1000);
            });

            $('#btnFade').click(function () {
                if ($(this).val() == 'FadeIn') {
                    $('#tblItemMaster').fadeIn(1500);
                    $(this).val('FadeOut');
                }
                else {
                    $('#tblItemMaster').fadeOut(1500);
                    $(this).val('FadeIn');
                }
            });

            $('#btnSlide').click(function () {
                $('#tblItemMaster').slideToggle('slow');
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
                    <td class="tdleft"></td>
                    <td>
                        <input type="button" id="btnHide" value="Hide" class="button" />
                        <input type="button" id="btnShow" value="Show" class="button" />
                        <input type="button" id="btnSlide" value="Slide" class="button" />
                        <input type="button" id="btnFade" value="Fade Out" class="button" />
                    </td>
                </tr>
                <tr>
                    <td class="tdleft"></td>
                    <td>
                        <p id="paraMessage"></p>
                    </td>
                </tr>
            </table>
            <table id="tblItemMaster" class="formTable">
                <tr>
                    <th class="top" colspan="2">Item Insert Update Master</th>
                </tr>
                <tr>
                    <td class="tdleft"></td>
                    <td></td>
                </tr>
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
                        &nbsp;</td>
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
