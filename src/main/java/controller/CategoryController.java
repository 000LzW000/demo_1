package controller;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.SqlPara;
import interceptor.CategoryFormValidator;
import interceptor.CategoryNabarInterceptor;
import interceptor.Login;
import model.Category;
import model.Topic;
import java.util.List;

public class CategoryController extends Controller {
   //显示板块里的所有内容：
   // @Before(Login.class)
    public void list(){
         List<Category> categories= Category.dao.find("SELECT  * FROM t_category");
         setAttr("categories",categories);
         renderFreeMarker("list.ftl");
    }

   //增加板块
    @Before({Login.class,CategoryNabarInterceptor.class})
    public void add(){
        renderFreeMarker("add.ftl");
    }
    //保存：
    @Before({Login.class,CategoryFormValidator.class})
    public void save(){
        String name = getPara("name");
        Category category =new Category();
        category.setName(name);
        Boolean success=false;
        try {
            success=true;
            category.save();
        }catch (Exception e){
            LogKit.error("板块添加失败，原因是"+e.getMessage());
        }
        String message=success ? "添加成功":"添加失败";
        Kv result = Kv.by("success", success).set("message", message);
        renderJson(result);
    }

    //更新操作！
    @Before({CategoryNabarInterceptor.class})
    public void modify(){
      Integer id=  getParaToInt(0,-1);
      Category category=Category.dao.findById(id);
        if(category != null ){
            setAttr("category",category);
            renderFreeMarker("modify.ftl");
        }else{
            renderHtml("<h3>板块不存在！！</h3>");
        }
    }

  //update
    @Before({Login.class,CategoryFormValidator.class})
  public void update(){
        //固定操作取到板块的名称 和板块的id
      String name = getPara("name");
      Integer id=getParaToInt("id",-1);
      Category category =new Category();
      category.setId(id);
      category.setName(name);

      Boolean success=false;
      try {
          success=true;
          category.update();
      }catch (Exception e){
          LogKit.error("板块更新失败，原因是"+e.getMessage());
      }
      String message=success ? "更新成功":"更新失败";
      Kv result = Kv.by("success", success).set("message", message);
      renderJson(result);

  }
  //删除
    @Before({Login.class})
    public void delete(){
        Integer id=getParaToInt(0,-1);
        Boolean success=false;
        try {
            success=true;
           Category.dao.deleteById(id);
        }catch (Exception e){
            LogKit.error("板块删除失败，原因是"+e.getMessage());
        }
        String message=success ? "删除成功":"更新失败";
        renderHtml(message + "</br><a href='/category/list'>返回板块列表</a>");
    }

    public void index() {
        Integer categoryId = getParaToInt(0, -1);
        Integer pageNumber = getParaToInt("page", 1);
        SqlPara sqlPara = Db.getSqlPara("getTopicListByCategoryId");
        sqlPara.addPara(categoryId);
        Page<Topic> page = Topic.dao.paginate(pageNumber, 10, sqlPara);
        setAttr("page", page);
        renderFreeMarker("topic-list.ftl");
    }




}
