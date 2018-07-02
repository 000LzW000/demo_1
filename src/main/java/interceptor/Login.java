package interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

/**
 * Created by Administrator on 2018/4/13 0013.
 */
public class Login implements Interceptor {
    @Override
    public void intercept(Invocation invocation) {
        Controller controller = invocation.getController();

        //登录
        if (controller.getSessionAttr("user") != null) {
            invocation.invoke();
        } else { //未登录则跳转到登录页面
            controller.redirect("/login");
        }


    }
}
