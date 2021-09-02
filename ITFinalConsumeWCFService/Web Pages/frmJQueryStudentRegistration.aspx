<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmJQueryStudentRegistration.aspx.cs" Inherits="ITFinalConsumeWCFService.Web_Pages.frmNewStudentRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        .ccc{
            color:#f5fcb1;
        }
    </style>
    <title></title>
    <link href="../CSS/ITFinalStyles.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.4.1.js"></script>
</head>
<body>
    <script type="text/javascript">
        jQuery(document).ready(function () {

            $('.trCert').hide();
            //$('.radioButton').click(function () {
            $('input[name="Category"]').click(function () {
                var catVal = $('input[name="Category"]:checked').val();

                if (catVal == '0')
                    $('.trCert').hide();
                else
                    $('.trCert').show();
            });

            $('#btnReset').click(function () {
                $("#frmGetEmpInfo").find('input:text, select').val('');
                $("#frmGetEmpInfo").find('input:radio, input:checkbox').prop('checked', false).prop('selected', false);
                $('.trCert').hide();
                $("#rdCatGen").prop('checked', true);
                $('input[type="text"]').prop("disabled", false);
                $('input[name = "txtCert"').prop("readonly", false);
            });

            $('#btnSubmit').click(function () {
                $('input[type="text"]').prop("disabled", false);
                $('input[name = "txtCert"').attr("readonly", true);
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnSubmit, #btnReset").hover(function () {
                $(this).css("color", "#eb1f1f");
            }, function () {
                $(this).css("color", "white");
            });

            //$('input:text').focus(function () {
            //    $(this).css('background-color', '#f5fcb1').css('color', "#be1212");
            //});
            //$('input:text').blur(function () {
            //    $(item).css('background-color', 'white').css('color', 'black');
            //});

            $('input:text').each(function (index, item) {
                $(item).focus(function () {
                    $(this).css('background-color', '#f5fcb1').css('color', "#be1212");
                });
                $(this).blur(function () {
                    $(item).css('background-color', 'white').css('color', 'black');
                });
            });
        });
    </script>

    <form id="frmGetEmpInfo" runat="server">
        <table class="formTable">
            <tr>
                <th class="top" colspan="2">Registration Form</th>
            </tr>
            <tr>
                <td class="tdleft">Employee ID</td>
                <td>
                    <input type="text" id="txtEmpID" class="textbox" />
                </td>
            </tr>
            <tr>
                <td class="tdleft">Name:</td>
                <td>
                    <input type="text" id="txtName" class="textbox" /></td>
            </tr>
            <tr>
                <td class="tdleft">Address:</td>
                <td>
                    <input type="text" id="txtAddress" class="textbox" />
                </td>
            </tr>
            <tr>
                <td class="tdleft">Institute Name:</td>
                <td>
                    <input type="text" id="txtInstitute" class="textbox" />
                </td>
            </tr>
            <tr>
                <td class="tdleft">Category:</td>
                <td class="tdright">
                    <input type="radio" id="rdCatGen" name="Category" value="0" checked="checked" class="radioButton" />
                    <label for="rdCatGen">GEN</label>
                    <input type="radio" id="rdCatSC" name="Category" value="1" class="radioButton" />
                    <label for="rdCatGen">SC</label>
                    <input type="radio" id="rdCatST" name="Category" value="2" class="radioButton" />
                    <label for="rdCatGen">ST</label>
                    <input type="radio" id="rdCatOBC" name="Category" value="3" class="radioButton" />
                    <label for="rdCatGen">OBC</label>
                    <input type="radio" id="rdCatEWS" name="Category" value="4" class="radioButton" />
                    <label for="rdCatGen">EWS</label>
                </td>
            </tr>
            <tr class="trCert">
                <td class="tdleft">Certificate Number:</td>
                <td>
                    <input type="text" id="txtCertNum" class="textbox" name="txtCert" /></td>
            </tr>
            <tr class="trCert">
                <td class="tdleft">Certificate Issue Date:</td>
                <td>
                    <input type="text" id="txtCertDate" class="textbox" name="txtCert" /></td>
            </tr>
            <tr class="trCert">
                <td class="tdleft">Certificate Issued From:</td>
                <td>
                    <input type="text" id="txtCertFrom" class="textbox" name="txtCert" /></td>
            </tr>
            <tr>
                <td class="tdleft"></td>
                <td>
                    <input type="button" value="Save" id="btnSubmit" class="button" />
                    <input type="button" value="Reset" id="btnReset" class="button" />
                </td>
            </tr>
            <tr>
                <th class="bottom" colspan="2">Government Polytechnic Lohaghat</th>
            </tr>
        </table>
    </form>
</body>
</html>
