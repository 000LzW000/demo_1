<#-- @ftlvariable name="topics" type="java.util.List<model.Topic>" -->
<#-- @ftlvariable name="categories" type="java.util.List<model.Category>" -->
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
    <@block name="head"></@block>
    <style type="text/css">
      li{
            display: inline;
        }

         li a{
            color:white;
        }

        li a:hover{
            background:turquoise;
        }

    </style>



    <title><@block name="title"></@block></title>

</head>
<body>
<nav>
    <div class="ui inverted menu">

                    <li class="item"><a href="#"></a></li>
                    <li class="item"><a href="${base}/main">主页</a></li>
                    <#list categories as category>
                    <li class="item"><a href="/category/${category.id}">${category.name!""}</a></li>
                    </#list>
                   <li class="item" id="today"></li>

        <div class="right menu">
            <div class="ui dropdown item"><i class="user icon"></i>
                <i class="icon dropdown"></i>
                <div class="menu">
                    <#if (session.user)??>
                        <a href="${base}/logout" class="item">退出</a>
                    <#else>
                        <a href="${base}/register" class="item">注册</a>
                        <a href="${base}/login" class="item">登录 </a>
                    </#if>
                </div>
            </div>
        </div>
    </div>
    <div style="font-size: 25px;text-decoration-color: #DFDFDF;text-align: center;font-family:微软雅黑" >

    </div>
</nav>
<@block name="content">
<div class="ui grid container " id="main-container" style="margin-top:20px;">
    <div class="twelve wides column">
        <div class="ui raised segment">
            <div class="ui divided list">
                <div>
                  <h2 style="color: #0ea432 " class="ui '黑体'" >热帖</h2>
                </div>
                <#list topics as topic>
                    <div class="item">
                        <div class="content">
                            <div class="header">
                                <a href="/topic/${topic.id}">${topic.title}</a>&nbsp;&nbsp;
                                <div class="ui mini circular blue label">
                                    回复
                                    <div class="detail" >${(topic.reply_count)!'0'}</div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="right floated content">
                                <span><a href="/category/${topic.category_id}">${topic.category_name !""}</a></span>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
        </div>
    </div>
</div>
<div>
</@block>
<footer >
    <div>
        <div class="ui inverted segment" id="footer">
            <div class="ui text center aligned container">宁夏大学 信息工程学院 李紫微  &copy;12015241968</div>
        </div>
    </div>
</footer>

</body>
<@block name="additional">
<script>
    $('.dropdown').dropdown();
    $('#sidebar-icon').click(function () {
        $('.sidebar.menu').sidebar('toggle');
    });
</script>
</@block>
</html>