<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication1.Index" %>

<!DOCTYPE html >

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>楚多科技</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <link rel="stylesheet" type="text/css" href="LayUI/tcal.css" />
    <script type="text/javascript" src="LayUI/tcal.js"></script>

    <script src="LayUI/datatime/WdatePicker.js"></script>

    <style type="text/css">
        .tcal
        {
        }

        .layui-nav
        {
            background: #016EB1 !important;
        }

        .layui-body
        {
            left: 50px !important;
        }

        .layui-container
        {
            padding: 0px !important;
        }

        .layui-col-md3
        {
            width: 20% !important;
        }

        .d-num
        {
            color: #FF6501;
            font-size: 20px;
        }

        .w-input
        {
            width: 15%;
            margin-left: 1%;
        }

        .btnsel
        {
            margin-left: 2%;
            padding: 0px 2%;
            background: darkorange;
            color: white;
            border: none;
            border-radius: 3px;
        }
    </style>
    <link rel="stylesheet" href="LayUI/css/bootstrap.css" />
    <link rel="stylesheet" href="LayUI/css/layui.css" />
</head>

<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header" style="background: #016EB1;">
            <div class="layui-logo" style="color: #fff; margin-left: 30px; width: 227px">
                <img src="LayUI/img/logo1.jpg" style="margin-right: 10px;" />楚多智能刀具柜管理系统
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
                    <a href="javascript:;">
                        <img src="LayUI/img/tu1.png" class="layui-nav-img">
                        <asp:Label ID="GSname" runat="server" Text="公司名称"></asp:Label>
                    </a>
                </li>
                <li class="layui-nav-item">
                    <a href="">客服</a>
                </li>
                <li class="layui-nav-item">
                    <a href="">帮助</a>
                </li>
                <li class="layui-nav-item">
                    <a href="Login.aspx">退出系统</a>
                </li>
            </ul>
        </div>

        <div class="layui-side" style="width: 80px; background: #016EB1;" runat="server">
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
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
                            <%-- <a href="javascript: void(0) onclick">报表下载</a>--%>
                            <dd><a href="javascript: void(0) onclick">报表下载</a></dd>
                            <dd><a href="javascript:;">视频上传</a></dd>
                            <dd><a href="javascript:;">更多</a></dd>
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
            <%-- 表单部分 --%>
            <form id="form1" runat="server" style="margin-left: 60px;">
                <div>

                    <asp:Panel ID="Panel1" runat="server" Style="width: 950px; padding: 38px 0px 17px 10px;">
                        <div style="font-family: 新宋体; font-size: small;">
                            日期范围：
                  <input id="Text1" type="text" runat="server" class="text" onclick="WdatePicker()" style="width:186px" />
                            ～
                            <input id="Text2" type="text" runat="server" class="text" onclick="WdatePicker()"  style="width:186px"/>
                            <asp:CheckBox ID="rBn1" runat="server" Checked="True" Text="取料单" />
                            <asp:CheckBox ID="rBn2" runat="server" Text="加料单" />
                            <br />
                            <br />
                            姓名： 
            <asp:TextBox ID="tBx1" runat="server" Height="19px" Width="100px"></asp:TextBox>
                            &nbsp; 料号： 
            <asp:TextBox ID="tBx2" runat="server" Width="100px"></asp:TextBox>
                            &nbsp; 品名： 
            <asp:TextBox ID="tBx3" runat="server" Width="100px"></asp:TextBox>
                            &nbsp; 规格： 
            <asp:TextBox ID="tBx4" runat="server" Width="100px"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查询" Style="width: 70px; background: #f7b905; margin-left: 10px;" />
                            <asp:Button ID="Button2" runat="server" OnClick="Download_Click" Text="报表下载" Style="margin-left: 16px; background: #06d0f3;" />
                        </div>

                    </asp:Panel>

                    <br />
                    <div>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="新宋体"
                            Font-Size="Large" ForeColor="#000099" Style="padding-left: 10px" Text="Label"></asp:Label>
                    </div>
                    <br />
                    <div>
                    <asp:GridView ID="dGv1" runat="server" CellPadding="5"
                        DataMember="DefaultView" DataSourceID="SqlDataSource1" HorizontalAlign="Center"
                        PageSize="300" EnableViewState="False" Width="1600px">
                        <HeaderStyle Font-Names="新宋体" Font-Size="Large" HorizontalAlign="Center"
                            VerticalAlign="Middle" />
                        <RowStyle Font-Names="新宋体" Font-Size="Medium" HorizontalAlign="Center" />
                    </asp:GridView>
                        </div>
                </div>
            </form>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
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
                    ...
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

