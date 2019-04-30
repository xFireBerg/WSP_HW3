<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentInfo.aspx.cs" Inherits="StudentInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Student Info</h2>
        <asp:DetailsView 
            ID="DetailsView1" 
            runat="server"  
            DataSourceID="SqlDataSource1" 
            Height="50px" 
            Width="125px" AutoGenerateRows="False" DataKeyNames="StudentID" OnPageIndexChanging="DetailsView1_PageIndexChanging">
            <Fields>
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" InsertVisible="False" ReadOnly="True" SortExpression="StudentID" />
                <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" SortExpression="BirthDate" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource
            ID="SqlDataSource1" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [Students] WHERE ([StudentID] = @StudentID)" DeleteCommand="DELETE FROM [Students] WHERE [StudentID] = @StudentID" InsertCommand="INSERT INTO [Students] ([StudentName], [BirthDate]) VALUES (@StudentName, @BirthDate)" UpdateCommand="UPDATE [Students] SET [StudentName] = @StudentName, [BirthDate] = @BirthDate WHERE [StudentID] = @StudentID">
            <DeleteParameters>
                <asp:Parameter Name="StudentID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StudentName" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter 
                    Name="StudentID" 
                    QueryStringField="id" 
                    Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="StudentName" Type="String" />
                <asp:Parameter Name="BirthDate" Type="DateTime" />
                <asp:Parameter Name="StudentID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div>
            <br />
            <h2>Course Taken by the Student</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="CourseCode" 
                        HeaderText="CourseID" 
                        SortExpression="CourseID" 
                        DataFormatString="{0}" />
                    <asp:HyperLinkField DataTextField="CourseName"
                        DataNavigateUrlFormatString="CourseInfo.aspx?id={0}"
                        DataNavigateURLFields="CourseID"
                        HeaderText="Course Name" 
                        SortExpression="CourseName" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Enrolment], [Courses] WHERE [Courses].[CourseID] = [Enrolment].[CourseID] And [Enrolment].[StudentID] = @StudentID">
                <SelectParameters>
                    <asp:QueryStringParameter Name="StudentID" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
