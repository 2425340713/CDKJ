using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.IO;

namespace WebApplication1
{
    public partial class Index : System.Web.UI.Page
    {
        int iViCpnID = 0;
        int iViDjgID = 0;
        int iViModule = 0;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["iViCpnLD"] == null || Session["iViCpnID"] == null)
            {
                Response.Redirect("Login.aspx"); //回到登陆界面
            }
            else
            {

                iViCpnID = (int)Session["iViCpnID"];


                if ((bool)Session["iViCpnLD"] && (int)Session["iViCpnID"] > 0)
                {

                    string gId = Request.Params["gId"];
                    string mDu = Request.Params["mDu"];

                    int.TryParse(gId, out iViDjgID);
                    int.TryParse(mDu, out iViModule);

                    if (iViCpnID == 0 || iViModule == 0)
                    {

                        Label1.Text = "参数错误！！！";
                        return;
                    }
                    else
                    {
                        Panel1.Visible = false;
                        if (Text1.Value == "")
                        {
                            Text1.Value = DateTime.Now.Date.AddMonths(-1).ToString("yyyy-MM-dd");
                            Text2.Value = DateTime.Now.Date.ToString("yyyy-MM-dd");
                            Chaxun();

                           
                        }
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx"); //回到登陆界面
                }
            }

        }

        #region 查询数据--小杨--2018年7月10日12:48:04
        /// <summary>
        /// 数据查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            Chaxun();
        }
        #endregion

        #region 查询数据的方法--小杨--2018年7月10日12:48:04
        /// <summary>
        /// 数据查询
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        protected void Chaxun()
        {
            string iVd_con = "server=mssql.sql137.cdncenter.net;database=sq_ivdi;uid=sq_ivdi;pwd=xcD465869;";

            try
            {
                string Djgnm = "";
                SqlConnection conn = new SqlConnection(iVd_con);
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandText = "SELECT iViDjg_rm as sl FROM iViDjg "
                                + "WHERE (iViDjg_ID = " + iViDjgID.ToString() + " and (iViDjg_cp = " + iViCpnID.ToString()
                                + " or iViDjg_ag = " + iViCpnID.ToString() + "))";
                SqlDataReader sdr = comm.ExecuteReader();
                if (sdr.Read())
                {
                    Djgnm = sdr.GetString(0);
                }
                sdr.Close();
                if (Djgnm == "")
                {
                    Label1.Text = "获取刀具柜参数失败！！！";
                    return;
                }
                conn.Close();

                SqlDataSource1.ConnectionString = iVd_con;
                string sql = "";
                if (iViModule == 1)            ////刀具柜
                {
                    GSname.Text = Djgnm;

                    Label1.Text = Djgnm + " - 加取料明细";
                    Panel1.Visible = true;

                    DateTime dt1 = DateTime.Now;
                    string wrq = " and (wld_rq between '" + Text1.Value + "' AND '" + Text2.Value + " 23:59:59') ";

                    if ((!DateTime.TryParse(Text1.Value, out dt1)) || (!DateTime.TryParse(Text2.Value, out dt1)))
                    {
                        Response.Write("<script>alert('日期格式错误！！！    ')</script>");
                        return;
                    }


                    string wlx = " ";
                    if (!(rBn1.Checked && rBn2.Checked))
                        if (rBn1.Checked)                      //取料
                            wlx = "  and wld_lx in (2,4) ";
                        else if (rBn2.Checked)                 //加料
                            wlx = "  and wld_lx in (1,3,5) ";

                    string wchx = " ", s1 = "";
                    s1 = tBx1.Text.Replace(" ", "");
                    if (s1 != "") wchx = " and wld_xm = '" + s1 + "' ";
                    s1 = tBx2.Text.Replace(" ", "");
                    if (s1 != "") wchx += " and wld_wl like '%" + s1 + "%' ";
                    s1 = tBx3.Text.Replace(" ", "");
                    if (s1 != "") wchx += " and wld_pm like '%" + s1 + "%' ";
                    s1 = tBx4.Text.Replace(" ", "");
                    if (s1 != "") wchx += " and wld_gg like '%" + s1 + "%' ";


                    sql = "SELECT top 1000 (case when wld_lx = 1 then '加料单' when wld_lx = 3 then '归还单' when wld_lx = 4 then '修磨单' when wld_lx = 5 then '修磨归还' else '取料单' end) as 类型, "
                            + "wld_rq as 日期, wld_xm as 姓名, wld_bm as 部门,";
                    sql += "wld_jc as 机床,wld_tz as 图纸,wld_gx as 工艺, ";
                    sql += "wld_wl as 料号,wld_pm as 品名, wld_bh as 品牌, wld_gg as 规格型号, wld_dw as 单位, wld_ds as 单位数量, wld_dj as 单价,";
                    sql += "wld_kc as 库存, wld_js as 件数, wld_sl as 数量 FROM wld ";
                    sql += "Where wld_gID = " + iViDjgID.ToString() + wlx + wrq + wchx;
                    sql += " Order by wld_ID desc";

                    SqlDataSource1.SelectCommand = sql;

                }
                else if (iViModule == 2)      ////库存预警
                {
                    GSname.Text = Djgnm;

                    Label1.Text = Djgnm + " - 库存预警";

                    sql = "SELECT wlk_wl AS 料号, wlk_pm AS 品名, wlk_bh AS 品牌, wlk_gg AS 规格型号, wlk_dw AS 单位, "
                        + "    wlk_ds AS 单位数量, wlk_bz AS 备注, wlk_kc AS 库存, wlk_ak AS 安全库存,"
                        + "    (SELECT SUM(wld_sl) AS sl FROM wld WHERE (wld_gID = " + iViDjgID.ToString() + ") AND (wld_lx = 2) AND (wld_lh = wlk.wlk_lh)) AS 取料数量 "
                        + "FROM wlk WHERE (wlk_lx = 0) AND (wlk_kc > 0) AND (wlk_gID = " + iViDjgID.ToString() + ") ORDER BY wlk_kc - wlk_ak, 取料数量 DESC";

                    SqlDataSource1.SelectCommand = sql;

                }
            }
            catch { }

        }
        #endregion



        #region 导出Excel--小杨--2018年7月10日12:48:04
        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Download_Click(object sender, EventArgs e)
        {
            Chaxun();
            if (dGv1.Rows.Count > 0)
            {
                //调用导出方法  
                ExportGridViewForUTF8(dGv1, DateTime.Now.ToShortDateString() + ".xls");
            }
            else
            {
                // obo.Common.MessageBox.Show(this, "没有数据可导出，请先查询数据!");
                Label1.Text = "没有数据可导出，请先查询数据!";

            }
        }
        #endregion

        #region 导出Excel的方法--小杨--2018年7月10日12:48:04
        /// <summary>
        /// 导出Excel的方法
        /// </summary>
        /// <param name="gv"></param>
        private void ExportGridViewForUTF8(GridView GridView, string filename)
        {

            string attachment = "attachment; filename=" + filename;

            //清除客户端当前显示
            Response.ClearContent();
            Response.Buffer = true;

            Response.AddHeader("content-disposition", attachment);
            Response.Charset = "UTF-8";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-8");

            //输出类型为Exel
            Response.ContentType = "application/ms-excel";

            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView.RenderControl(htw);
            Response.Output.Write(sw.ToString());
            Response.Flush();


            Response.End();

        }
        #endregion



        #region 导出Excel--Konger2016年4月10日12:48:04
        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnExcel_Click(object sender, EventArgs e)
        {
            ExcelOut(dGv1);
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }
        #endregion

        #region 导出Excel的方法--王雷--2016年4月10日12:48:04
        /// <summary>
        /// 导出Excel的方法
        /// </summary>
        /// <param name="gv"></param>
        public void ExcelOut(GridView gv)
        {
            if (gv.Rows.Count > 0)
            {
                //attachment; filename =
                Response.Clear();
                Response.ClearContent();
                Response.AddHeader("Content-Disposition", "attachment; filename =志晟集团办公用品申购单" + DateTime.Now.ToString("_yyyy/MM/dd") + ".xls");
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                Response.ContentType = "application/ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(sw);
                gv.RenderControl(htw);
                Response.Write(sw.ToString());
                Response.Flush();
                Response.End();

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script lang='javascript' defer >alert('没有记录');</script>  ");
            }
        }
        #endregion




    }
}