<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>帖子列表</title>
</head>
<body>

<table border="1" cellspacing="0">
    <thead>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>User</th>
        <th>Pubdate</th>
    </tr>
    </thead>
    <tbody>
    <#list page.getList() as topic>
    <tr>
        <td>${topic.id!''}</td>
        <td><a href="/topic/${topic.id!''}">${topic.title!''}</a></td>
        <td>${topic.nickname ! ''}</td>
        <td>${topic.pubDate!''}</td>
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