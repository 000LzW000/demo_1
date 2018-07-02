package controller;

import com.jfinal.core.Controller;
import model.User;

import java.util.List;

public class UserController extends Controller {
    public void register(){
        renderFreeMarker("register.ftl");
    }
    public void registercheck(){
        String username=getPara("username");//姓名
        String password=getPara("password");//密码
        String nickname=getPara("nickname");//昵称
        String email=getPara("email");//邮箱
        User user=new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setNickname(nickname);
        user.setEmail(email);
        if(username.isEmpty()||password.isEmpty()){
            setAttr("errmsg","用户名或密码错误");
            renderFreeMarker("register.ftl");
        }else{
            user.save();
            redirect("/user/login");
        }
    }
    public void login(){
      renderFreeMarker("login.ftl");
    }
    public void logincheck(){
       String username= getPara("username");
       String password= getPara("password");
       String admin=getPara("admin");
    }
}
