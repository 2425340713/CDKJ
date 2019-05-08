using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["iViCpnLD"] == null || Session["iViCpnID"] == null)
            {
                Label1.Text = "请重新登陆";
                Response.Redirect("Login.aspx"); //回到登陆界面
            }
            else
            {
                if ((bool)Session["iViCpnLD"] && (int)Session["iViCpnID"] > 0)
                {
                    return;
                }
                else
                {
                    Response.Redirect("Login.aspx"); //回到登陆界面
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            string OldPw = oldpw.Text;
            string NewPw = newpw.Text;
            string SurePw = surepw.Text;

            if (OldPw == "" || NewPw == "" || SurePw == "")
            {
                Tishi.Text = "请输入要修改的密码";
                Tishi.Visible = true;
                return;
            }
            if (NewPw != SurePw)
            {
                Tishi.Text = "两次输入密码不一致，请重新输入";
                Tishi.Visible = true;
                return;
            }
            int NowUserID = (int)Session["iViCpnID"];
            string iViCpn_pw = "";

            if (OldPw != null && NewPw != null && SurePw != null)
            {
                string iVd_con = "server=mssql.sql137.cdncenter.net;database=sq_ivdi;uid=sq_ivdi;pwd=xcD465869;";
                SqlConnection con = new SqlConnection(iVd_con);
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select iViCpn_pw from iViCpn where iViCpn_ID= " + NowUserID;

                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    iViCpn_pw = sdr.GetString(0);//原始密码   
                }
                sdr.Close();

                if (iViCpn_pw == OldPw)
                {
                    cmd.CommandText = "update iViCpn set iViCpn_pw='" + NewPw + "'where iViCpn_ID= " + NowUserID;
                    cmd.ExecuteNonQuery();

                }
                else
                {
                    Tishi.Text = "旧密码错误，请重新出入旧密码";
                    Tishi.Visible = true;
                    return;
                }
                con.Close();
            }
            Response.Write("<script>alert('密码修改成，请重新登陆!');window.location.href ='Login.aspx'</script>"); 
            //Response.Redirect("Login.aspx");//跳转页面

        }
    }
}