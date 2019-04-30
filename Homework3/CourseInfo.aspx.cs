using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CourseInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource4.Insert();
        }
        catch (System.Data.SqlClient.SqlException)
        {
            lblRegisterStudent.Text = "The selected student has already been registered to the course!";  
        }
            GridView1.DataBind();
    }
}