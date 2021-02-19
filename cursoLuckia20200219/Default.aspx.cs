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
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataAdapter adp = new SqlDataAdapter("select top 20 [Nombre],[Apellido],Password from [AdventureWorks2017].EjercicioWebForms", ConfigurationManager.AppSettings["conString"]);
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
}