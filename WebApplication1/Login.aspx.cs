using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            pwd.Attributes.Add("onkeydown", "SubmitKeyClick();");

            //this.Txtidcode.Attributes.Add("onkeydown", "BtnClick(this);");  

            Label1.Text = "";
            names.Focus();


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string yzm = Txtidcode.Value;
          
            string nm = names.Text;
            string pw = pwd.Text;
            nm = nm.Replace(" ", "");
            pw = pw.Replace(" ", "");

            System.Threading.Thread.Sleep(1000);//延迟3秒，防止暴力破解
            if (nm == "" || pw == "")
            {
                Label1.Text = "请输入用户名和密码！！！";
                Label1.Visible = true;
                return;
            }
            if (yzm == "")
            {
                Label1.Text = "请输入验证码";
                Label1.Visible = true;
                return;
            }
            int endTime = System.Environment.TickCount / 1000;

            if (Session["dlcs"] == null)
            {
                Session["dlcs"] = 1;
            }
            else
            {
                int dlcs = (int)Session["dlcs"];
                dlcs++;
                Session["dlcs"] = dlcs;
                if (dlcs >= 5)
                {
                    if (endTime - (int)Session["dlsj"] < 300)
                    {
                        Label1.Text = "登陆操作已被所定5分钟，请稍后再试。";
                        Label1.Visible = true;
                    }
                }
                System.Threading.Thread.Sleep(2000);//延迟3秒
            }
            Session["dlsj"] = endTime;

            int CpnID = 0;
            try
            {
                string iVd_con = "server=mssql.sql137.cdncenter.net;database=sq_ivdi;uid=sq_ivdi;pwd=xcD465869;";
                SqlConnection con = new SqlConnection(iVd_con);
                con.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select iViCpn_ID from iViCpn where iViCpn_nm = '" + nm + "' and iViCpn_pw = '" + pw + "'";

                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    CpnID = sdr.GetInt32(0);
                }
                con.Close();
            }
            catch { }
            if (CpnID <= 0)
            {
                Label1.Text = "用户名或密码错误，请重新输入";
                Label1.Visible = true;
                return;
            }
            Session.Timeout = 10;
            Session["dlcs"] = 1;

            Session["iViCpnLD"] = true;
            Session["iViCpnID"] = CpnID;
            Session["iViCpnNM"] = nm;


            Response.Redirect("List.aspx");//跳转页面
        }
    }
}
