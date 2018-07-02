package interceptor;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.validate.Validator;
public class LoginValidator extends Validator {
    private String errorKey = "error";
    @Override
    protected void validate(Controller c) {
        //用户名不为空
        if (c.getPara("username").isEmpty()) {
            addError(errorKey, "用户名为空");
        }
        if (c.getPara("password").isEmpty()) {
            addError(errorKey, "密码为空");
        }
        validateCaptcha("captcha", errorKey, "验证码不正确");
    }
    @Override
    protected void handleError(Controller c) {
        String message = c.getAttr(errorKey);
        Kv result = Kv.by("success", false).set("message", message);
        c.renderJson(result);
    }
}
