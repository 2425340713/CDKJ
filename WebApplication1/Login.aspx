<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>楚多智能道具管理系统登录</title>
    <!-- Bootstrap -->
    <style type="text/css">
        /* ------系统登录------*/

        ul,
        li
        {
            list-style: none outside none;
        }

        body
        {
            padding: 0px;
            margin: 0px;
            background: #001220;
        }

        .body_dl
        {
            width: 100%;
            height: 644px;
            background-image: url(LayUI/img/body_dl.jpg);
            margin: 0 auto;
            overflow: hidden;
            background-attachment: scroll;
            background-repeat: no-repeat;
            background-position: center top;
        }

        .logo
        {
            margin: 50px 30px;
            padding: 0px;
            width: 1200px;
        }

        .denglu_bj
        {
            width: 1200px;
            margin: auto;
            height: 400px;
        }

        .denglu_div
        {
            width: 445px;
            height: 370px;
            margin: 0px 680px;
            padding-top: 20px;
            background-image: url(LayUI/img/denglu_bj.png);
        }

        .biaot_dl
        {
            font-family: "微软雅黑";
            font-size: 28px;
            color: #FFFFFF;
            height: 40px;
            text-align: center;
            margin-top: 130px;
        }

        .biaoge
        {
            color: #fff;
            font-family: "微软雅黑";
            font-size: 28px;
            text-align: center;
            padding-bottom: 10px;
        }

        .input_dl
        {
            margin-left: 5px;
            width: 235px;
            height: 37px;
            background-color: #001422;
            border: 1px solid #405462;
            font-size: 20px;
            margin-bottom: 2px;
            line-height: 38px;
            border-radius: 5px;
            color: #fff;
            padding-left: 10px;
        }

        .input_xg
        {
            width: 22px;
            height: 22px;
            background-color: #3a669a;
            border: 1px solid #FFFFFF;
            border-radius: 3px;
            color: #FFFFFF;
        }

        .denglu
        {
            margin-top: 58px;
        }

            .denglu a
            {
                font-family: "微软雅黑";
                font-size: 17px;
                color: #fff;
                width: 235px;
                height: 40px;
                text-align: center;
                background-color: #1187ca;
                display: block;
                line-height: 36px;
                margin: 20px 0px 20px 127px;
                text-decoration: none;
                border-radius: 5px;
            }

            .denglu li a:hover
            {
                font-family: "微软雅黑";
                font-size: 17px;
                color: #fff;
                width: 235px;
                height: 40px;
                text-align: center;
                background-color: #139fee;
                display: block;
                line-height: 36px;
                margin: 20px 0px 20px 127px;
                text-decoration: none;
                border-radius: 5px;
            }

        .denglu_bq
        {
            color: #b4b3b3;
            font-family: "微软雅黑";
            font-size: 12px;
            line-height: 22px;
            text-align: center;
            margin-top: 35px;
        }

        .input_biank
        {
            height: 40px;
            width: 400px;
            margin: 20px 55px;
            display: block;
        }

        .tishi
        {
            height: 1px;
            width: 400px;
            display: block;
        }

        #Label1
        {
            padding-left: 170px;
        }

        .input_biank li
        {
            font-size: 20px;
            margin: 0px;
            float: left;
            line-height: 40px;
            padding: 0px 0px 0px 20px;
            color: #fff;
        }

        #Txtidcode
        {
            width: 235px;
            height: 37px;
            background-color: #001422;
            border: 1px solid #405462;
            font-size: 20px;
            margin-bottom: 2px;
            line-height: 38px;
            border-radius: 5px;
            color: #fff;
            padding-left: 10px;
            margin-top: -3px;
            display: block;
            margin-left: -14px;
        }
    </style>
    <link rel="stylesheet" href="LayUI/css/jquery.idcode.css" />
    <script type="text/javascript" src="LayUI/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="LayUI/js/jquery.idcode.js"></script>

</head>

<body>
    <form id="form1" runat="server">
        <div class="body_dl">
            <div class="logo">
                <img src="LayUI/img/logo.png" />
            </div>
            <div class="denglu_bj">
                <div class="denglu_div">
                    <div class="biaoge">楚多智能刀具柜管理系统</div>
                    <div class="input_biank">
                        <li>账户</li>
                        <li>
                            <label>
                                <asp:TextBox ID="names" runat="server" class="input_dl"></asp:TextBox>
                            </label>
                        </li>
                    </div>
                    <div class="input_biank">
                        <li>密码</li>
                        <li>
                            <label>
                                <asp:TextBox ID="pwd" runat="server" class="input_dl" TextMode="Password"></asp:TextBox>
                            </label>
                        </li>
                    </div>
                    <div class="input_biank">
                        <li>验证码</li>
                        <li>
                            <label>
                                <input type="text" runat="server" name="name" placeholder="系统安全验证码" class="input-style txtVerification" id="Txtidcode" />
                                <span class="yzm" runat="server" id="idcode"></span>
                            </label>
                        </li>
                    </div>
                    <div class="tishi">
                        <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red" Visible="False" padding-left="140px" Font-Size="X-Small"></asp:Label>
                    </div>
                    <div class="denglu">
                        <li>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">登   陆</asp:LinkButton>
                        </li>
                    </div>
                </div>
            </div>
            <div class="denglu_bq">上海楚多智能科技有限公司　Copyright &copy; 2018Powered By　技术支持：021-57814615</div>
        </div>

        <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->

        <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    </form>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $.idcode.setCode();
        $("#btns").click(function () {
            var IsBy = $.idcode.validateCode();
            alert(IsBy);
            console.log(IsBy);
        });
    });
    //回车按钮事件
    //function SubmitKeyClick() {
    //    if (event.keyCode == 13) {
    //        event.keyCode = 9;
    //        event.returnValue = false;
    //        document.all[LinkButton1].click();
    //    }
    //}
    //回车按钮事件
    function SubmitKeyClick() {
        if (event.keyCode == 13)   //判断是否按下的是回车
        {
            event.keyCode = 9;
            event.returnValue = false; //屏蔽其默认的返回值
          
            document.getElementById("LinkButton1").click();
        }
    }

</script>
