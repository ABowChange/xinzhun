package zyj.biyesheji0425.pojo;

public class Person {
    private String personId;

    private String personName;

    private Double personTel;

    private String personSex;

    private Integer personState;

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId == null ? null : personId.trim();
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName == null ? null : personName.trim();
    }

    public Double getPersonTel() {
        return personTel;
    }

    public void setPersonTel(Double personTel) {
        this.personTel = personTel;
    }

    public String getPersonSex() {
        return personSex;
    }

    public void setPersonSex(String personSex) {
        this.personSex = personSex == null ? null : personSex.trim();
    }

    public Integer getPersonState() {
        return personState;
    }

    public void setPersonState(Integer personState) {
        this.personState = personState;
    }
}