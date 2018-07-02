package interceptor;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class CategoryFormValidator extends Validator {

    @Override
    protected void validate(Controller controller) {
       String name= controller.getPara("name");
       if(name.isEmpty()){
           addError("error","版块名称不能为空");
       }
    }

    @Override
    protected void handleError(Controller controller) {
            controller.renderHtml("版块名称不能为空" + "<br><a href='/category/list'> 返回板块列表</a>");
    }
}
