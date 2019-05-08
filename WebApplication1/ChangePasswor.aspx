<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePasswor.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <link rel="stylesheet" href="LayUI/css/layui.css" media="all" />
    <title>修改密码</title>
    <style type="text/css">
        .layui-card
        {
            border-radius: 20px;
            width: 300px;
            margin: auto;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
    </style>
</head>
<body>
    <div class="layui-card">
        <div class="layui-card-header" style="font-size: 18px; padding: 0 100px;">
            <asp:Label ID="Label1" runat="server" Text="修改密码"></asp:Label>
        </div>
        <div class="layui-card-body">
            <form form id="form1" runat="server">

                <div class="layui-form-item">
                    <label class="layui-form-label" style="padding-left: 11px;">当前密码：</label> 
                    <div class="layui-input-inline" style="float: right">
                        <asp:TextBox ID="oldpw" runat="server" class="layui-input" Style="border-color: #333;" TextMode="Password"></asp:TextBox>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label" style="padding-left: 26px;">
                        新密码：</label>
                    <div class="layui-input-inline" style="float: right">
                        <asp:TextBox ID="newpw" runat="server" class="layui-input" Style="border-color: #333;" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认新密码：</label>
                    <div class="layui-input-inline" style="float: right">
                        <asp:TextBox ID="surepw" runat="server" class="layui-input" Style="border-color: #333;" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <asp:Label ID="Tishi" runat="server" Text="Label" ForeColor="Red" Visible="False" padding-left="140px" Font-Size="X-Small"></asp:Label>
                <div class="layui-form-item">
                    <div class="layui-input-block" style="float: right">
                        <asp:LinkButton ID="LinkButton1" runat="server" class="layui-btn" Style="margin-right: 10px;" OnClick="LinkButton1_Click">确认修改</asp:LinkButton>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
