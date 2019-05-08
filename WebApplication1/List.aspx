<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="WebApplication1.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="stylesheet" href="LayUI/css/layui.css" media="all" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <title>楚多科技</title>
    <style type="text/css">
        .layui-nav
        {
            background: #016EB1 !important;
        }

        .layui-body
        {
            left: 50px !important;
        }

        /*.layui-container
        {
            padding: 0px !important;
        }*/

        .layui-col-mdd3
        {
            width: 19% !important;
        }

        .d-num
        {
            color: #FF6501;
            font-size: 20px;
        }

        .margin-md3
        {
            margin-left: 1.25%;
        }

        .layui-card
        {
            height: 94px;
        }
    </style>
    <link rel="stylesheet" href="LayUI/css/bootstrap.css" />
    <link rel="stylesheet" href="LayUI/css/layui.css" />
    <script src="LayUI/layui.js"></script>
</head>

<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header" style="background: #016EB1;">
            <div class="layui-logo" style="color: #fff; margin-left: 15px; width: 280px;">
                <img src="LayUI/img/logo1.jpg" style="margin-right: 15px;" />楚多智能刀具柜管理系统
            </div>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <div class="layui-form-select">
                        <div class="layui-select-title">
                            <input type="text" placeholder="搜索" value="" class="layui-input"><i class="layui-edge"></i>
                        </div>
                        <dl class="layui-anim layui-anim-upbit">
                            <dd lay-value="" class="layui-select-tips">搜索</dd>
                        </dl>
                    </div>
                </li>
                <li class="layui-nav-item">
                    <a href="" style="text-decoration: none;">
                        <img src="LayUI/img/tu1.png" class="layui-nav-img">
                        <asp:Label ID="LableGS" runat="server" Text="公司名称"></asp:Label>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="ChangePasswor.aspx" style="text-decoration: none;">修改密码</a></dd>
                        <dd><a href="javascript:;" style="text-decoration: none;">详细信息</a></dd>
                        <dd><a href="javascript:;" style="text-decoration: none;">安全退出</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item">
                    <a href="" style="text-decoration: none;">客服</a>
                </li>
                <li class="layui-nav-item">
                    <a href="" style="text-decoration: none;">帮助</a>
                </li>
                <li class="layui-nav-item">
                    <a href="Login.aspx" style="text-decoration: none;">退出系统</a>
                </li>
            </ul>
        </div>

        <%-- class="layui-nav layui-nav-tree layui-bg-cyan layui-inline" lay-filter="demo"--%>

        <div class="layui-side" style="width: 80px; background: #016EB1;">
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree " lay-filter="demo">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="List.aspx">
                            <img src="LayUI/img/tmt1.png" />
                        </a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <img src="LayUI/img/tmt2.png" />
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;">报表下载</a></dd>
                            <dd><a href="javascript:;">视频上传</a></dd>
                            <dd><a href="javascript:;">更多....</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="">
                            <img src="LayUI/img/tmt3.png" />
                        </a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="">
                            <img src="LayUI/img/tmt4.png" />
                        </a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="">
                            <img src="LayUI/img/tmt5.png" />
                        </a>
                    </li>
                    <li class="layui-nav-item">
                        <a href="">
                            <img src="LayUI/img/tmt6.png" />
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="layui-body" style="background-color: #F2F2F2;">
            <!-- 内容主体区域 -->
            <div style="padding: 3% 5%;">
                <div class="layui-container" style="margin: 0px auto;">
                    <div class="layui-row" style="margin: 15px auto;">
                        <div class="layui-col-mdd3 layui-col-xs3">
                            <div class="layui-card">
                                <div class="layui-card-body">
                                    <div class="layui-row text-center" style="padding-top: 20px">
                                        <div class="layui-col-xs6">
                                            <img src="LayUI/img/tmt7.png" />
                                        </div>
                                        <div class="layui-col-xs6 text-left">
                                            <div class="d-title">单位数量</div>
                                            <div><span class="d-num" runat="server" id="dwsl"></span>&nbsp; 个</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-mdd3 margin-md3 layui-col-xs3">
                            <div class="layui-card">
                                <div class="layui-card-body">
                                    <div class="layui-row text-center" style="padding-top: 20px">
                                        <div class="layui-col-xs6">
                                            <img src="LayUI/img/tmt10.png" />
                                        </div>
                                        <div class="layui-col-xs6 text-left">
                                            <div class="d-title" >刀具柜数</div>
                                            <div><span class="d-num" runat="server" id="djgs">1281</span>&nbsp;个</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-mdd3 margin-md3 layui-col-xs3">
                            <div class="layui-card">
                                <div class="layui-card-body">
                                    <div class="layui-row text-center" style="padding-top: 20px">
                                        <div class="layui-col-xs6">
                                            <img src="LayUI/img/tmt9.png" />
                                        </div>
                                        <div class="layui-col-xs6 text-left">
                                            <div class="d-title" >刀具总数</div>
                                            <div><span class="d-num" runat="server" id="djzs">1281</span>&nbsp;个</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-mdd3 margin-md3 layui-col-xs3">
                            <div class="layui-card">
                                <div class="layui-card-body">
                                    <div class="layui-row text-center" style="padding-top: 20px">
                                        <div class="layui-col-xs6">
                                            <img src="LayUI/img/tmt10.png" />
                                        </div>
                                        <div class="layui-col-xs6 text-left">
                                            <div class="d-title" >在线状态</div>
                                            <div><span class="d-num" runat="server" id="zxzt">1281</span>&nbsp;在线</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-mdd3 margin-md3 layui-col-xs3">
                            <div class="layui-card">
                                <div class="layui-card-body">
                                    <div class="layui-row text-center" style="padding-top: 20px">
                                        <div class="layui-col-xs6">
                                            <img src="LayUI/img/tmt11.png" />
                                        </div>
                                        <div class="layui-col-xs6 text-left">
                                            <div class="d-title">库存预警</div>
                                            <div><span class="d-num" runat="server" id="kcyj">1281</span>&nbsp;个</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <%-- 中间内容数据加载 --%>
                    <form id="form2" runat="server">
                        <div align="center" style="padding-top: 15px">
                            <table>
                                <tr>
                                    <td>
                                        <asp:GridView ID="dGv1" runat="server" AutoGenerateColumns="False"
                                            DataSourceID="SqlDataSource1" Font-Names="宋体" Font-Size="Large"
                                            CellPadding="5" DataMember="DefaultView" EnableViewState="False" Width="1144px">
                                            <Columns>
                                                <asp:BoundField DataField="iViDjg_ID" HeaderText="iViDjg_ID" ReadOnly="True"
                                                    Visible="False" />
                                                <asp:BoundField DataField="iViCpn_nm" HeaderText="公司名称" ReadOnly="True">
                                                    <ItemStyle Font-Names="新宋体" Font-Size="Medium" Width="220px" />
                                                </asp:BoundField>

                                                <asp:HyperLinkField DataNavigateUrlFields="iViDjg_ID"
                                                    DataNavigateUrlFormatString="Index.aspx?mDu=1&amp;gId={0}" DataTextField="iViDjg_rm"
                                                    HeaderText="刀具柜" NavigateUrl="~/Login.aspx" Target="djkxx">
                                                    <ItemStyle Font-Names="新宋体" Font-Size="Medium" Width="150px" />
                                                </asp:HyperLinkField>

                                                <asp:BoundField DataField="zxzht" HeaderText="在线状态" ReadOnly="True">
                                                    <ItemStyle Font-Names="新宋体" Font-Size="Medium" HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:HyperLinkField DataNavigateUrlFields="iViDjg_ID"
                                                    DataNavigateUrlFormatString="Index.aspx?mDu=2&amp;gId={0}"
                                                    DataTextField="kcyj" HeaderText="库存预警" Target="kcyjxx">
                                                    <ItemStyle Font-Names="新宋体" Font-Size="Medium" ForeColor="#CC0000"
                                                        HorizontalAlign="Right" />
                                                </asp:HyperLinkField>
                                                <asp:BoundField HeaderText="当日取料" ReadOnly="True" DataField="drql">
                                                    <ItemStyle Font-Names="新宋体" Font-Size="Medium" HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="当月取料" ReadOnly="True" DataField="dyql">
                                                    <ItemStyle Font-Names="新宋体" Font-Size="Medium" HorizontalAlign="Right" />
                                                </asp:BoundField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                    </form>


                </div>
            </div>
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            <nav aria-label="...">
                <ul class="pagination">
                    <li class="disabled">
                        <a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                    </li>
                    <li class="active">
                        <a href="#">1 <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

</body>
</html>

<script src="LayUI/js/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
