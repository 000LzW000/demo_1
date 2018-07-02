<#-- @ftlvariable name="categories" type="java.util.List<model.Category>" -->
<@override name="title">
    增加板块
</@override>
<@override name="content">
    <div style="margin-bottom:180px;margin-top: 50px;margin-left:250px">
        <div class="ui grid container" id="mian-container" >
            <div class="twelve wides column">
                <table class="ui selectable inverted table">
                    <thead>
                        <tr>
                            <th>板块名称</th>
                            <th>管理板块</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#list categories as category>
                            <tr>
                                <td >
                                  <div class="ui ribbon label">${category.name}</div>
                                </td>
                                <td>
                                    <a href="${base}/category/modify/${category.id}">更新板块</a> |
                                    <a href="${base}/category/delete/${category.id}">删除板块</a>
                                </td>
                            </tr>
                        </#list>
                    </tbody>
                </table>
                <div class="ui two  blue  button">
                <a href="/category/add" style="text-align: center;color: greenyellow " > 增加板块 </a>
                </div>
            </div>
        </div>
    </div>
</@override>
<@override name="additional">
<script>
    $('.dropdown').dropdown();
    $('#sidebar-icon').click(function () {
        $('.sidebar.menu').sidebar('toggle');
    });
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