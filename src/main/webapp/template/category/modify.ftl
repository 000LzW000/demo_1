<#-- @ftlvariable name="category" type="java.util.List<model.Category>" -->
<@override name="title">
    更新板块名称
</@override>
<@override name="content">
    <div class="ui grid container">
        <div class="ui centered twelve wide column " style="margin-top:100px;" >
            <h2 class="header centered six wide column ">更新板块名称</h2>
            <form  method="post" class="ui fluid form" id="category-form">
                <div class="field">
                    <input type="text" name="name" placeholder="更新版块名称" autocomplete="off" value="${category.name}">
                </div>
                <div class="ui error message"></div>
                <div class="ui field ten wide column" style="margin-bottom:339px">
                    <input type="hidden" name="id" value="${category.id}"/>
                   <input type="button"  name="name" class="ui two primary yellow button" onclick="updateCategory()" value="更新">
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
    function updateCategory() {
        $('#category-form').form('validate form');
        if($('#category-form').form('is valid')){
            $.ajax({
                url:'/category/update',
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