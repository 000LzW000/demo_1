package controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import interceptor.CategoryNabarInterceptor;
import model.Reply;
import model.Topic;
import java.util.List;

public class TopicController extends Controller {
    @Before(CategoryNabarInterceptor.class)
    public void index(){
        Integer id= getParaToInt(0,-1);
        Topic topic = Topic.dao.findById(id);
        setAttr("topic",topic);
        String sql = Db.getSql("getRepliesByTopicId");
        List<Reply> replies = Reply.dao.find(sql, id);
        setAttr("replies",replies);
        renderFreeMarker("view.ftl");
    }
    public void reply(){
        Integer userId = getParaToInt("user_id", -1);
        String content = getPara("context", "");
        Integer topicId = getParaToInt("topic_id", -1);
        Reply reply=new Reply();
        reply.setTopicId(topicId);
        reply.setContent(content);
        reply.setUserId(userId);
        reply.save();
        renderHtml("回复成功");
    }
}
