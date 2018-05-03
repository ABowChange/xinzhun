package zyj.biyesheji0425.pojo;

import java.util.Date;

public class HistoryKey {
    private String personId;

    private Date date;

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId == null ? null : personId.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}