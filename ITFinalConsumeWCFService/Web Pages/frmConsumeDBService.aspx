<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmConsumeDBService.aspx.cs" Inherits="ITFinalConsumeWCFService.frmConsumeDBService" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/ITFinalStyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <asp:GridView ID="GVDetail" runat="server" CssClass="myGridClass">
                </asp:GridView>
            </table>
        </div>
    </form>
</body>
</html>
