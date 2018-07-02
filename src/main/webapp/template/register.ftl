<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="${base}/scripts/jquery.min.js"></script>
    <script src="${base}/scripts/semantic.min.js"></script>
    <link rel="stylesheet" href="${base}/styles/semantic.min.css"/>
    <title>注册页面</title>
    <style>
        .body{
            background: #dfd7ff;
        }
        .margintop{
            margin-top: 100px;
        }

    </style>

</head>
<body class="body">
<div class="margintop">
    <div class="ui grid container  ">
        <div class="eight wides  centered column" >
            <div class="ui inverted teal segment">
                <div class="blue" align="center">
                    注册新用户
                </div>
                <form  class="ui fluid form">
                    <div class="field">
                        <label>用户名</label>
                        <input type="text" name="username" id="username" placeholder="请输入用户名" autocomplete="off" >
                    </div>
                    <div class="field">
                        <label>密码</label>
                        <input type="password" name="password"id="password" placeholder="请输入密码" autocomplete="off">
                    </div>
                    <div class="field">
                        <label>重复密码</label>
                       <input type="password" name="password2"id="password2" placeholder="请再次输入密码" autocomplete="off">
                    </div>
                    <div class="field">
                        <label>昵名</label>
                       <input type="text" name="nickname" id="nickname" placeholder="请输入昵名" autocomplete="off">
                    </div>
                    <div class="field">
                        <label>邮箱</label>
                        <input type="text" name="email" id="email" placeholder="请输入email" autocomplete="off">
                    </div>
                    <div class="ui error message"></div>
                    <a class="ui primary fluid submit button"  onclick="register()" >注册</a><br>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    $('.ui.form').form({
        fields:{
            username:{
                rules:[{
                    type:'minLength[3]',
                    prompt:'用户名至少包含3个字符'
                }]
            },
            password:{
                rules:[{
                    type:'minLength[6]',
                    prompt:'密码至少包含6个字符'
                }]
            },
            password2:{
                rules:[{
                    type:'match[password]',
                    prompt:'密码不一致'
                }]
            },
            nickname:{
                rules:[{
                    type:'empty',
                    prompt:'昵称不能为空'
                }]
            },
            email:{
                rules:[{
                    type:'email',
                    prompt:'电子邮件格式不正确'
                }]
            }
        }
    }).api({
        method:'POST',
        url:'${base}/doRegister',
        serializeForm:true,
        success:function (res) {
            if(res.success){
                alert(res.message);
                window.location.href='${base}/login'
            }else{
                $('.ui.form').form('add errors',[res.message]);
            }
        }
    })
</script>
</html>