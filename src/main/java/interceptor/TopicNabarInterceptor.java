package interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;

public class TopicNabarInterceptor implements Interceptor {
    @Override
    public void intercept(Invocation invocation) {
        Controller c = invocation.getController();
        String replies = Db.getSql("getRepliesByTopicId");


    }
}
