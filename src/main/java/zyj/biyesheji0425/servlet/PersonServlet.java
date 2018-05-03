package zyj.biyesheji0425.servlet;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import zyj.biyesheji0425.pojo.Person;
import zyj.biyesheji0425.service.PersonService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PersonServlet {
    @Resource
    PersonService personService;
    @RequestMapping("/person.action")
    public ModelAndView allPerson(HttpServletRequest request) {
        ModelAndView modelAndView=new ModelAndView("personnelManagement");
        List<Person> list=personService.allPerson();
        String jsonString= JSON.toJSONString(list);
        request.setAttribute("jsonString",jsonString);
        return modelAndView;
    }

    @RequestMapping("/selectPersonnelManagementById.action")
    public List<Person> selectPersonnelManagementById(@RequestBody String jsonString) {
        return null;
    }
}
