<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmJQueryTableSelectors.aspx.cs" Inherits="ITFinalConsumeWCFService.Web_Pages.frmTableJQuerySelectors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .text {
            color:#abe995;
        }
    </style>
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
</head>
<body>
    <script type="text/javascript">
        $(document).ready(function () {
            $('document').css("background-color", "#fdf5e6");
            $('p').css({ "background-color": "#a2a73f", 'font-size': '25px' });
            $('p').css('width', '80%');

            $('p').click(function () {
                if ($(this).attr('id') == 'paraOld')
                    $('div #tblOld').slideToggle();
                if ($(this).attr('id') == 'paraGirls')
                    $('table#tblGirls').slideToggle();
                if ($(this).attr('id') == 'paraEngg')
                    $('table#tblEngg').fadeToggle(1000);
            });

            $('#tblOld tr:even').css('background-color', '#e0de96');
            $('#tblOld tr:odd').css('background-color','#abe995');

            $('#tblGirls tr:even').css('background-color', '#d9f321');
            $('#tblGirls tr:odd').css('background-color', '#ba92e1');

            $('#tblEngg tr:even').css('background-color', '#9fea99');
            $('#tblEngg tr:odd').css('background-color', '#4cd8e5');

            $('table').css('width', '80%')
            $('thead tr').css('font-size', '20px').css('background-color', '#5560d3');
        });
    </script>

    <form id="form1" runat="server">
        <div id="divTable1">
            <p id="paraOld"><b> First Government Polytechnics of Uttarakhand</b></p>
            <table id="tblOld">
                <thead>
                    <tr><td>Serial No</td><td>Name of Institute</td></tr>
                </thead>
                <tr>
                    <td>1</td><td>Govt Polytechnic Dwarahat</td>
                </tr>
                <tr>
                    <td>2</td><td>Govt Polytechnic Gauchar</td>
                </tr>
                <tr>
                    <td>3</td><td>Govt Polytechnic Kashipur</td>
                </tr>
                <tr>
                    <td>4</td><td>Govt Polytechnic Lohaghat</td>
                </tr>
                <tr>
                    <td>5</td><td>Govt Polytechnic Narendra Nagar</td>
                </tr>
                <tr>
                    <td>6</td><td>Govt Polytechnic Srinagar</td>
                </tr>
                <tr>
                    <td>7</td><td>Govt Polytechnic Uttarkashi</td>
                </tr>
            </table>
        </div>
        <div id="divTable2">
            <p id="paraGirls"><b> Government Girls Polytechnics</b></p>
           <table id="tblGirls">
               <thead>
                    <tr><td>Serial No</td><td>Name of Institute</td></tr>
                </thead>
                <tr>
                    <td>1</td><td>Govt Girls Polytechnic Almora</td>
                </tr>
                <tr>
                    <td>2</td><td>Govt Girls Polytechnic Dehradun</td>
                </tr>
            </table> 
        </div>
        <div id="divTable3">
            <p id="paraEngg"><b> Government Engineering Colleges of Uttarakhand</b></p>
            <table id="tblEngg">
                <thead>
                    <tr><td>Serial No</td><td>Name of Institute</td></tr>
                </thead>
                <tr>
                    <td>1</td><td>Kumaon Engineering College Dwarahat</td>
                </tr>
                <tr>
                    <td>2</td><td>GB Pant Engineering College Pauri</td>
                </tr>
                <tr>
                    <td>3</td><td>GB Pant College of Technology Pantnagar</td>
                </tr>
            </table>
        </div>
        <div id="divTable4">

        </div>
    </form>
</body>
</html>

