<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="${base}/scripts/jquery.min.js"></script>
    <script src="${base}/scripts/semantic.min.js"></script>
    <link rel="stylesheet" href="${base}/styles/semantic.min.css">
    <title>登录界面</title>
    <style type="text/css">
        .errmsg{
            color: red;
        }
    </style>
</head>
<body>
<div class="ui grid container">
    <div class="ui centered twelve wide column " style="margin-top:100px;" >
        <h2 class="header" align="center">登录</h2>
        <form class="ui fluid form" id="login-form">
            <div class="field">
                <label>用户名</label>
                <input type="text" name="username" autocomplete="off" placeholder="请输入用户名">
            </div>
            <div class="field">
                <label>密  码</label>
                <input type="password" name="password" autocomplete="off" placeholder="请输入用户名">
            </div>
                <div class="field">
                    <label>验证码</label>
                    <input type="text" name="captcha" autocomplete="off" placeholder="请输入验证码">
                    <img src="${base}/captcha" id="captcha-img"onclick="refreshCaptcha()">
                </div>

            <div class="ui error message">${errMsg!""}</div>
            <a class="ui fluid primary submit button">登录</a>
        </form>
    </div>
</div>

</body>
<script>
    $('#login-form').form({
       fields:{
           username:{
                 identifier:'username',
               rules:[
                   {
                       type:'empty',prompt:'用户名不能为空'
                   }
               ]
           },
           password:{
               identifier:'password',
               rules:[
                   { type:'empty', prompt:'密码不能为空'}
               ]
           }

       }
    }).api({
        method:'POST',
        url:'${base}/loginCheck',
        serializeForm:true,
        successTest:function(res){
            if(res && res.success){
                return res.success;
            }
            return false;
        },
        onSuccess:function (res) {
            window.location.href='${base}/main';
        },
       onFailure:function (res) {
           $(this).form('add errors',[res.message]);
       }
    });
    function refreshCaptcha(){
        $('#captcha-img').attr('src','${base}/captcha?'+Math.random())
    }
</script>
</html>