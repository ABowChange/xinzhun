package zyj.biyesheji0425.mapper;

import zyj.biyesheji0425.pojo.Person;

import java.util.List;

public interface PersonMapper {
    List<Person> allPerson();


    int deleteByPrimaryKey(String personId);

    int insert(Person record);

    int insertSelective(Person record);

    List<Person> selectByPrimaryKey(String personId);

    int updateByPrimaryKeySelective(Person record);

    int updateByPrimaryKey(Person record);
}