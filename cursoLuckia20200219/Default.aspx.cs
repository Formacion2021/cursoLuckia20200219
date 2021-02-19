using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            String[] arrayNombres = new string[3] { "Fulano", "Mengano", "Zutano" };
            Repeater1.DataSource = arrayNombres;
            Repeater1.DataBind();

            SqlDataAdapter adp = new SqlDataAdapter("select top 20 [Nombre],[Apellido],Password from [AdventureWorks2017]..EjercicioWebForms", ConfigurationManager.AppSettings["conString"]);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataAdapter adp = new SqlDataAdapter("select top 20 [Nombre],[Apellido],Password from [AdventureWorks2017]..EjercicioWebForms", ConfigurationManager.AppSettings["conString"]);
        DataSet ds = new DataSet();
        adp.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (lbNoUpdate.Text != "No has usado un updatePanel") { 
        lbNoUpdate.Text = "No has usado un updatePanel";
        }
        else
        {
            lbNoUpdate.Text = "";
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (lbUpdate.Text != "Has usado un updatePanel")
        {
            lbUpdate.Text = "Has usado un updatePanel";
        }
        else
        {
            lbUpdate.Text = "";
        }
    }
    protected void BtnGuardar_Click(object sender, EventArgs e)
    {
        using (SqlConnection c = new SqlConnection(ConfigurationManager.AppSettings["conString"]))
        {
            c.Open();
            string query = "insert into [AdventureWorks2017].[dbo].[EjercicioWebForms] ([Nombre],[Apellido],Password) values ('" + tbNombre.Text + "','" + tbApellido.Text + "','" + tbPassword.Text + "')";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Connection = c;
            cmd.ExecuteNonQuery();
            c.Close();
        }
    }

    public void BindData()
    {
        SqlDataAdapter da;
        SqlConnection con;
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        con = new SqlConnection(ConfigurationManager.AppSettings["conString"]);
        cmd.CommandText = "select [Nombre],[Apellido],Password from [AdventureWorks2017]..EjercicioWebForms";
        cmd.Connection = con;
        da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        con.Open();
        cmd.ExecuteNonQuery();
        GridView2.DataSource = ds;
        GridView2.DataBind();
        con.Close();
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        BindData();
    }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlDataAdapter da;
        SqlConnection con;
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        con = new SqlConnection(ConfigurationManager.AppSettings["conString"]);
        cmd.Connection = con;
    
        TextBox txtname = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtName");
        cmd.CommandText = "Delete from [AdventureWorks2017]..EjercicioWebForms where nombre='" + txtname.Text + "'";
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        BindData();
    }

    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        BindData();
    }

    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        SqlDataAdapter da;
        SqlConnection con;
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        con = new SqlConnection(ConfigurationManager.AppSettings["conString"]);

        TextBox txtname = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtName");
        TextBox txtApellido = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtApellido");
        TextBox txtPassword = (TextBox)GridView2.Rows[e.RowIndex].FindControl("txtPassword");
        
        cmd.Connection = con;
        cmd.CommandText = "Update [AdventureWorks2017]..EjercicioWebForms set nombre='" + txtname.Text + "',apellido='" + txtApellido.Text + "',password='" + txtPassword.Text + "' where nombre= '"+ txtname.Text + "'";
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        GridView2.EditIndex = -1;
        BindData();
        con.Close();
    }

  

    protected void Reset_Click1(object sender, EventArgs e)
    {
        BindData();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        GridView1.DataSource = new DataTable();
        GridView1.DataBind();
    }
}