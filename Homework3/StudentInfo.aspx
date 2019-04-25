<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentInfo.aspx.cs" Inherits="StudentInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DetailsView 
            ID="DetailsView1" 
            runat="server"  
            DataSourceID="SqlDataSource1" 
            Height="50px" 
            Width="125px">
        </asp:DetailsView>
        <asp:SqlDataSource
            ID="SqlDataSource1" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [Students] WHERE ([StudentID] = @StudentID)">
            <SelectParameters>
                <asp:QueryStringParameter 
                    Name="StudentID" 
                    QueryStringField="id" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseID" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="CourseCode" HeaderText="CourseCode" SortExpression="CourseCode" />
                    <asp:HyperLinkField DataNavigateUrlFormatString="CourseInfo?aspx?id={0}" DataTextField="CourseName" HeaderText="Course Name" DataNavigateUrlFields="CourseID" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Courses] WHERE ([CourseID] = @CourseID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="CourseID" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
