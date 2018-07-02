<@override name="title">
    增加板块
</@override>
<@override name="content">
    <div class="ui grid container">
        <div class="ui centered twelve wide column " style="margin-top:100px;" >
            <h2 class="header centered six wide column ">增加板块</h2>
                <form  method="post" class="ui fluid form" id="category-form">
                    <div class="field">
                        <input type="text" name="name" placeholder="请输入版块名称" autocomplete="off">
                    </div>
                    <div class="ui error message"></div>
                    <div class="ui field ten wide column" style="margin-bottom:339px">
                    <input type="button" value="添加板块" class="ui two primary yellow button" onclick="addCategory()">
                    <a type="button" href='${base}/category/list' class="ui two yellow button">返回板块列表</a>
                    </div>
                </form>
        </div>
    </div>
</@override>
<@override name="additional">
    <@super />
<script>
    $('#category-form')
            .form({
                        fields:{
                            name:{
                                rules:[
                                    {
                                        type:'empty',
                                        prompt:'版块名称不能为空'
                                    }
                                ]
                            }
                        }
                    }
            );
    function addCategory() {
        $('#category-form').form('validate form');
        if($('#category-form').form('is valid')){
            $.ajax({
                url:'${base}/category/save',
                type:'post',
                data:$('#category-form').serialize(),
                success:function (res) {
                    alert(res.message);
                }
            })
        }
    }
</script>
</@override>
<@extends name="../parent.ftl">
</@extends>