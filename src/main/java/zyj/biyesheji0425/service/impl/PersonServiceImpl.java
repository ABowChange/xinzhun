package zyj.biyesheji0425.service.impl;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zyj.biyesheji0425.mapper.PersonMapper;
import zyj.biyesheji0425.pojo.Person;
import zyj.biyesheji0425.service.PersonService;

import java.util.List;
@Service
public class PersonServiceImpl implements PersonService {
    @Autowired
    PersonMapper personMapper;
    public Person jsonToObject(String jsonString){
        JSONObject jsonobject = JSONObject.parseObject(jsonString);
        Person person= (Person)JSONObject.toJavaObject(jsonobject,Person.class);
        return person;
    }

    @Override
    public List<Person> allPerson() {
        return personMapper.allPerson();
    }
    @Override
    public List<Person> selectPersonnelManagementById(String jsonString) {
        Person p =jsonToObject(jsonString);
        return personMapper.selectByPrimaryKey(p.getPersonId());
    }
}
