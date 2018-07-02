package controller;

import com.jfinal.aop.Before;
import com.jfinal.captcha.CaptchaRender;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.POST;
import com.jfinal.kit.HashKit;
import com.jfinal.kit.Kv;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.Db;
import interceptor.CategoryNabarInterceptor;
import interceptor.Login;
import interceptor.LoginValidator;
import model.User;
import java.util.List;


public class MainController extends Controller {
    @Before(CategoryNabarInterceptor.class)
    public void index() {
       renderFreeMarker("parent.ftl");
    }
    @Before({Login.class,CategoryNabarInterceptor.class})
    public void main() {
        renderFreeMarker("parent.ftl");
    }

   @Before(CategoryNabarInterceptor.class)
    public void login() {
        renderFreeMarker("login.ftl");
    }

   @Before({POST.class, LoginValidator.class})
    public void loginCheck() {
        String username = getPara("username");
        String password = getPara("password");
        String passwordmd5 = HashKit.md5(password).toLowerCase();
        boolean  success=false;
        String message;
        String sql = Db.getSql("checkLoginUser");
        List<User> users = User.dao.find(sql, username, passwordmd5);

        //登录成功
        if (users.size() != 0) {
            //跳转到主页面
            redirect("/main");
            //往session中放入一个key为username的变量，值为用户登录的用户名
            setSessionAttr("user", users.get(0));
            message="登陆成功";
            success=true;
        } else {
            //登录失败
            setAttr("errmsg", "用户名或密码错误");
            message="用户名或者密码错误";
           // renderFreeMarker("login.ftl");
        }
       Kv result = Kv.by("success", success).set("message", message);
       renderJson(result);
    }

    public void logout() {
        removeSessionAttr("user");
        redirect("/index");
    }

    @Before(CategoryNabarInterceptor.class)
    public void register() {
        renderFreeMarker("register.ftl");
    }


    public void doRegister() {
        String username = getPara("username");
        String password = getPara("password");
        String nickname = getPara("nickname");
        String email = getPara("email");
        boolean success = false;
      if(username.isEmpty()){
          renderHtml("用户名为空");
          return ;
      }else {
          User user = new User();
          user.setUsername(email);
          user.setUsername(username);
          user.setPassword(password);
          user.setNickname(nickname);
          try {
              user.save();
              success = true;
          } catch (Exception e) {
              LogKit.error("用户注册失败，原因是:" + e.getMessage());
          }
      }
       String message = success ?"注册成功":"注册失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }

    public void captcha(){
        render(
                new CaptchaRender()
        );
    }

    @Before(CategoryNabarInterceptor.class)
    public void demo(){
        renderFreeMarker("demo.ftl");
    }

}
