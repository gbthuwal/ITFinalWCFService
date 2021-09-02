<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmJQuerySelectors.aspx.cs" Inherits="ITFinalConsumeWCFService.Web_Pages.frmJQuerySelectors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .text {
            color: #b11010
        }
    </style>
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
</head>
<body>
    <script type="text/javascript">
        $(document).ready(function () {
            $('document').css("background-color", "#fdf5e6");
            $('p').css({ "background-color": "#a2a73f", 'font-size': '25px' });
            $('p.paraHead').css('color', '#3125ec');
            $('p#paraHeading1').css('color', '#b11010');
            $('div.divSliding').hide();
            
            $('p.paraHead').click(function () {
                if ($(this).attr('id') == 'paraHeading1')
                    $('div #divHeading1').slideToggle(1000);
                if ($(this).attr('id') == 'paraHeading2')
                    $('div #divHeading2').slideToggle(1000);
                if ($(this).attr('id') == 'paraHeading3')
                    $('div #divHeading3').slideToggle(1000);
            });

        });
    </script>

    <form id="form1" runat="server">
        <div id="divPara1">
            <p id="paraHeading1"; class="paraHead">Software Defined Network</p>
            <div class="divSliding" id="divHeading1">
                Software defined network (SDN) is a network framework which involves in separating a network’s control functions from its data forwarding functions, 
                <br />
                centralizing its intelligence, and abstracting its underlying architecture from applications and services.
                Software defined network composed of two modules<br />
                <ol>
                    <li>Control Plane: The module which takes all decisions, basically an instructor. It runs routing algorithms and finds routes for destination.</li>
                    <li>Data Plane: The module which carries out tasks given by the control pane and it forwards packets.</li>
                </ol>
            </div>
        </div>
        <div id="divPara2">
            <p id="paraHeading2" class="paraHead">Features of software-defined networking </p>
            <div class="divSliding" id="divHeading2">
                There are 4 unique, defining features of software-defined networking:
                <ol>
                    <li>Agile: As business and application needs change, administrators can adjust network configuration without </li>
                    <li>Centrally Managed: SDN consolidates network intelligence, which provides a holistic view of the network configuration and activity </li>
                    <li>Programmable: The ability to directly program network features and configure network resources quickly and easily through automated SDN services. </li>
                    <li>Open Connectivity: SDN is based on and implemented via open standards. As a result, SDN streamlines network design and provides consistent networking in a vendor -neutral architecture. </li>
                </ol>
            </div>
        </div>
        <div id="divPara3">
            <p id="paraHeading3" class="paraHead">Advantages of SDN</p>
            <div class="divSliding" id="divHeading3">
                <ol>
                    <li>Reduced Operational Cost: Since SDN enables multi-tasking, the workload on the network operations reduces. This requires less time and equipment and reduces the need for expensive network switches.</li>
                    <li>Rich Features: Features are no longer limited to what the vendor provides.</li>
                    <li>Security: Improved security makes SDN a no-brainer for many businesses. In a software-defined network, security is centralized. In this central controller, an IT manager can create and distribute security policies throughout the enterprise with ease. </li>
                    <li>Context and Visibility: In a software-defined network, users can view the entire network through a centralized source, which simplifies provisioning and managing processes.</li>
                    <li>Cloud: SDN is an excellent way to help “cloudify” the data centre, ultimately helping to unify the components of a business’s infrastructure.</li>
                </ol>
            </div>
        </div>
        <div id="divPara4">
        </div>
    </form>
</body>
</html>
