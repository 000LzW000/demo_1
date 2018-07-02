package interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import model.Category;
import model.Topic;

import java.util.List;

public class CategoryNabarInterceptor implements Interceptor {
    public void intercept(Invocation invocation){

        Controller c =invocation.getController();

        String sql = Db.getSql("getAllCategories");
        List<Category> categories = Category.dao.find(sql);
        c.setAttr("categories",categories);

        String sql1 = Db.getSql("getHotTopics");
        List<Topic> topics = Topic.dao.find(sql1);
        c.setAttr("topics",topics);
        invocation.invoke();
    }
}
