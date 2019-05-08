using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;


namespace WebApplication1
{
    public partial class List : System.Web.UI.Page
    {

        string iVd_con = "server=mssql.sql137.cdncenter.net;database=sq_ivdi;uid=sq_ivdi;pwd=xcD465869;";
        int iViCpnID = 0;

        #region 页面加载事件
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["iViCpnLD"] == null || Session["iViCpnID"] == null)
            {
                Response.Redirect("Login.aspx"); //回到登陆界面
            }
            else
            {
                iViCpnID = (int)Session["iViCpnID"];
                if ((bool)Session["iViCpnLD"] && iViCpnID > 0)
                {

                    string gsName = Session["iViCpnNM"].ToString();
                    if (LableGS.Text != gsName)
                    {
                        LableGS.Text = gsName;
                        Chaxun();
                        GongsiNumb();
                    }

                }
                else
                {
                    Response.Redirect("Login.aspx"); //回到登陆界面
                }
            }


        }
        #endregion

        #region 页面加载查询的方法---小杨---2018年6 月28 日
        protected void Chaxun()
        {
            string sql = "SELECT iViDjg.iViDjg_ID, iViDjg.iViDjg_cp, iViDjg.iViDjg_ag, iViCpn.iViCpn_nm, iViDjg.iViDjg_rm, "
                + "    CASE WHEN DATEDIFF(minute, iViDjg.iViDjg_ld, GETDATE()) > 5 THEN '离线' ELSE '在线' END AS zxzht, "
                + "(SELECT COUNT(wlk_wID) AS yj FROM wlk WHERE (wlk_gID = iViDjg.iViDjg_ID) AND (wlk_ak > wlk_kc)) AS kcyj, "
                + "(SELECT ISNULL(SUM(wld_sl), 0) AS sl FROM wld WHERE (DATEDIFF(day, wld_rq, GETDATE()) = 0) AND (wld_gID = iViDjg.iViDjg_ID) AND (wld_lx = 2)) AS drql,"
                + "(SELECT ISNULL(SUM(wld_sl), 0) AS sl FROM wld WHERE (DATEDIFF(month, wld_rq, GETDATE()) = 0) AND (wld_gID = iViDjg.iViDjg_ID) AND (wld_lx = 2)) AS dyql "
                + "FROM iViDjg INNER JOIN iViCpn ON iViDjg.iViDjg_cp = iViCpn.iViCpn_ID  "
                + "WHERE (iViDjg.iViDjg_cp = " + iViCpnID.ToString() + " OR iViDjg.iViDjg_ag = " + iViCpnID.ToString() + ")";

            SqlDataSource1.ConnectionString = iVd_con;
            SqlDataSource1.SelectCommand = sql;

        }
        #endregion

        #region 查询显示的数量---小杨---2018年7月17日
        protected void GongsiNumb()
        {
            SqlConnection con = new SqlConnection(iVd_con);
            con.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select count(iViCpn_ID) from iViCpn "
                 + "WHERE (iViCpn_ID = " + iViCpnID.ToString() + " OR  iViCpn_ag = " + iViCpnID.ToString() + ")";
            dwsl.InnerText = "0";
            djgs.InnerText = "0";
            djzs.InnerText = "0";
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                dwsl.InnerText = sdr.GetInt32(0).ToString();
            }
            sdr.Close();

            cmd.CommandText = "select count(iViDjg_ID) from iViDjg " + "WHERE (iViDjg_cp = " + iViCpnID.ToString() + " OR iViDjg_ag = " + iViCpnID.ToString() + ")";

            sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                djgs.InnerText = sdr.GetInt32(0).ToString();
            }
            sdr.Close();

            cmd.CommandText = "SELECT SUM(wlk_kc) FROM  wlk" + " WHERE  (wlk_gID IN  (SELECT     iViDjg_ID FROM    iViDjg" + " WHERE (iViDjg_cp =" + iViCpnID.ToString() + "OR iViDjg_ag =" + iViCpnID.ToString() + ")))";
            sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                djzs.InnerText = sdr.GetInt32(0).ToString();
            }
            sdr.Close();

            con.Close();
        }
        #endregion


    }

}