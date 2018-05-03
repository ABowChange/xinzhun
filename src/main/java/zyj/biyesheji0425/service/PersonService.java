package zyj.biyesheji0425.service;

import zyj.biyesheji0425.pojo.Person;

import java.util.List;

public interface PersonService {
    List<Person> allPerson();
    List<Person> selectPersonnelManagementById(String jsonString);
}
