<#-- @ftlvariable name="topic" type="java.util.List<model.Topic>" -->
<@override name="head">
<script rel="stylesheet" src="/scripts/vue-resource.min.js"></script>
<script rel="stylesheet" src="/scripts/vue.min.js"></script>
</@override>
<@override name="title">欢迎来到这个论坛</@override>
<@override name="content">

       <h1>${(topic.title) ! '无标题'}</h1>
       <p>${topic.content ! "无内容"}</p>
    <#list replies as reply>
        <div>
            <div class="ui divider"></div>
            <img class="ui tiny images " src="${base}/images/tupian.jpg" >
            <span class="ui left blue" style="text-align: center;">${reply.user_nickname}</span>回复于 <span  style="min-height: 50px;">${reply.pub_date}
            ${reply.content}</span>
        </div>
    </#list>
    <div>
    	<#if (session.user)??>
    	<form action="${base}/topic/reply">
    		<input type="hidden" name="user_id" value="${session.user.id}">
    		<input type="hidden" name="topic_id" value="${topic.id}">
    	回复内容<textarea name="context" id="context" cols="30" rows="10"></textarea>
    		<input type="submit" value="回复">
    	</form>
    	<#else>
    	<span style="color:red;">请<a href="${base}/login">登录</a>后再回复</span>
    	</#if>
    </div>
</@override>

<@override name="additional">
<@super/>
</@override>
<@extends name="../parent.ftl"></@extends>
