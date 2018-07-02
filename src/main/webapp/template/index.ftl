<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Index</title>
</head>
<body>

<table border="1" cellspacing="0">
    <thead>
    <tr>
        <th>Title</th>
        <th>Category</th>
    </tr>
    </thead>
    <tbody>
    <#list page.getList() as topic>
    <tr>
        <td><a href="${base}/topic/${topic.id}">${topic.title}</a></td>
        <td><a href="${base}/category/${topic.category_id}">${topic.category_name}</a></td>
    </tr>
    </#list>
    </tbody>
</table>



<div>

<#if page.getPageNumber() !=1 >
    <a href="?page=${page.getPageNumber()-1}">上一页</a>
</#if>

${page.getPageNumber()}/${page.getTotalPage()}
<#if page.getPageNumber() != page.getTotalPage() >
    <a href="?page=${page.getPageNumber()+1}">下一页</a>
</#if>

</div>


</body>
</html>