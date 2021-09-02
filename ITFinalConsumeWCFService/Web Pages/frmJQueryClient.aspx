<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmJQueryClient.aspx.cs" Inherits="ITFinalConsumeWCFService.Web_Pages.frmJQueryClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/ITFinalStyles.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.4.1.js"></script>
</head>
<body>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnSubmit').click(function () {
                var empID = $('#txtEmpID').val();
                
                $.ajax({
                    url: "frmJQueryClient.aspx/GetEmployeeById",
                    method : 'post',
                    contentType : 'application/json',
                    data: '{empId:' + empID + '}',
                    dataType : 'json',
                    success: function (data)
                    {
                        $('#txtName').val(data.d.FirstName + " " + data.d.LastName);
                        $('#txtAddress').val(data.d.Address);
                        $('#txtInstitute').val(data.d.Institute);
                    },
                    error: function (error) {
                        alert('An Error Occured' + error.status);
                    }
                });
            });

            $('#btnReset').click(function () {
                $('#txtName').val('');
                $('#txtAddress').val('');
                $('#txtInstitute').val('');
            });

        });
    </script>

    <form id="frmGetEmpInfo" runat="server">
        <div>
            <table width="80%" class="formTable">
                <tr>
                    <th colspan="2">Registration Form</th>
                </tr>
                <tr>
                    <td class="tdleft">Employee ID</td>
                    <td>
                        <input type="text" id="txtEmpID" value="1" />
                        <input type="button" value="Get Employee" id="btnSubmit" class="button"/>
                    </td>
                </tr>
                <tr>
                    <td class="tdleft"></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tdleft">Name:</td>
                    <td><input type="text" id="txtName" class="textbox" /></td>
                </tr>
                <tr>
                    <td class="tdleft">Address:</td>
                    <td><input type="text" id="txtAddress" class="textbox"/></td>
                </tr>
                <tr>
                    <td class="tdleft">Institute Name:</td>
                    <td><input type="text" id="txtInstitute" class="textbox"/></td>
                </tr>
                <tr>
                    <td class="tdleft"></td>
                    <td>
                        <input type="button" value="Reset" id="btnReset" class="button"/></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
