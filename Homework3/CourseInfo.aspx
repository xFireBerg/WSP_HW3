<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CourseInfo.aspx.cs" Inherits="CourseInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Course Info<br />
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px">
            </asp:DetailsView>
            <br />
            Registered Students<br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            <br />
            Register a new student<br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
        </div>
    </form>
</body>
</html>
