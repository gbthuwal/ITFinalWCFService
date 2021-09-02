<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAccessControlsJQuery.aspx.cs" Inherits="ITFinalConsumeWCFService.Web_Pages.frmAccessControlsJQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .text {
            color: #fdf5e6
        }
    </style>
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
</head>
<body>
    <script type="text/javascript">
        $(document).ready(function () {
            $('document').css("background-color", "#fdf5e6");
            $('td.tdLeft').css('width', '50%').css('text-align', 'right');
            $('input[type="text"], select').css('width', '70%');
            $('table').css('width', '80%').css("background-color", "#b6d483");
            $('table').css('border-collapse', 'collapse');
            $('thead td').attr('colspan', '3').css(
                {
                    "background-color": "#1b2a90",
                    "text-align": "center",
                    "color": "white"
                }
            );
            $('tfoot td').attr('colspan', '3').css(
                {
                    "background-color": "#1b2a90",
                    "text-align": "center",
                    "font-size": "10px",
                    "color": "white"
                }
            );

            $('input[type="text"], select').focus(function () {
                $(this).css('background-color', '#f5fcb1').css('color', "#be1212");
            });
            $('#txtName, select').blur(function () {
                $(this).css('background-color', 'white').css('color', 'black');
            });

            $('#btnReset').click(function () {
                $('#divDetails').html('');
                $('#frmStudent').find('input:text').val('');
                $('#frmStudent').find('select').val('0');
                $('#frmStudent').find('input:radio, input:checkbox').prop('checked', false).prop('selected', false);
            });

            $('input[type="button"]').hover(function () {
                $(this).css("color", "red");
            }, function () {
                $(this).css("color", "black")
            });


            $('#btnSave').click(function () {
                var JSONObj = {};
                JSONObj.name = $('#txtName').val();
                JSONObj.gender = $('input[name="Gender"]:checked').val();

                var cbQlf = $('input[name="Qlf"]:checked');

                var valQlf = '';

                if (cbQlf.length > 0) {
                    cbQlf.each(function (index, item) {
                        valQlf += $(item).val() + ",";
                    });
                    valQlf = valQlf.substring(0, valQlf.length - 1);
                }

                JSONObj.qulification = valQlf;

                JSONObj.specialization = $('#ddlSpec option:selected').val() + "-" + $('#ddlSpec option:selected').text();

                var ddlSelectedProgLang = $('#ddlProgLang option:selected');
                var ddlProgLangValues = '';

                if (ddlSelectedProgLang.length > 0) {
                    ddlSelectedProgLang.each(function () {
                        ddlProgLangValues += $(this).val() + " - " + $(this).text() + ",";
                    });
                    var ddlProgLangValues = ddlProgLangValues.substring(0, ddlProgLangValues.length - 1);
                }

                JSONObj.ProgLanguages = ddlProgLangValues;

                $('#divDetails').html(JSON.stringify(JSONObj));

                $.ajax({
                    url: "frmJQueryClient.aspx/SaveStudent",
                    method: 'post',
                    contentType: 'application/json',
                    data: JSON.stringify(JSONObj),
                    dataType: 'json',
                    success: function (data) {
                        alert(data.d);
                    },
                    error: function (error) {
                        alert('An Error Occured' + error.status);
                    }
                });

            });
        });
    </script>

    <form id="frmStudent" runat="server">
        <div id="divTable">
            <table id="tblOld" class="tblForm">
                <thead>
                    <tr>
                        <td>Student Master</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td style="color:#b6d483; font-size:10px">:</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="tdLeft">Name</td>
                        <td>:</td>
                        <td>
                            <input type="text", id="txtName"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdLeft">Gender</td>
                        <td>:</td>
                        <td>
                            <input type="radio", id="rdMale" value="M" name="Gender" /> Male
                            <input type="radio", id="rdFemale" value="F" name="Gender" /> FeMale
                            <input type="radio", id="rdThirdGen" value="T" name="Gender" /> Third Gender
                        </td>
                    </tr>
                        <tr>
                        <td class="tdLeft">Qualification</td>
                        <td>:</td>
                        <td>
                            <input type="checkbox", id="cbBTech" value="1" name="Qlf" /> B.Tech
                            <input type="checkbox", id="rdMTech" value="2" name="Qlf" /> M.Tech
                            <input type="checkbox", id="rdPHD" value="3" name="Qlf" /> P.H.D
                        </td>
                    </tr>
                        <tr>
                        <td class="tdLeft">M.Tech Specialization</td>
                        <td>:</td>
                        <td>
                            <select id="ddlSpec">
                                <option value="0">Select Specialization</option>
                                <option value="1">Advance Computing</option>
                                <option value="2">Artificial Intelligence</option>
                                <option value="3">Data Science</option>
                                <option value="4">Embedded Systems</option>
                                <option value="5">Internet of Things</option>
                            </select>
                        </td>
                    </tr>
                        <tr>
                        <td class="tdLeft">Programming Languages</td>
                        <td>:</td>
                        <td>
                            <select id="ddlProgLang" multiple="multiple">
                                <option value="1">Cotlin</option>
                                <option value="2">C# .Net</option>
                                <option value="3">Embedded C/C++</option>
                                <option value="4">Python</option>
                                <option value="5">R</option>
                                <option value="6">Java</option>
                            </select>
                        </td>
                    </tr>
                        <tr>
                        <td class="tdLeft"></td>
                        <td>:</td>
                        <td>
                            <input type="button", id="btnSave" value="Save" />
                            <input type="button", id="btnReset" value="Reset" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div id="divDetails">
                            </div>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td>Government Polytechnic Lohaghat</td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </form>
</body>
</html>
