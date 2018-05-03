package zyj.biyesheji0425.pojo;

import java.util.Date;

public class HistoryView {
    String personId;
    String personName;
    float personX;
    float personY;
    String roomId;
    Date date;

    public HistoryView() {
    }

    public HistoryView(String personId, String personName, float personX, float personY, String roomId, Date date) {
        this.personId = personId;
        this.personName = personName;
        this.personX = personX;
        this.personY = personY;
        this.roomId = roomId;
        this.date = date;
    }

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId;
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public float getPersonX() {
        return personX;
    }

    public void setPersonX(float personX) {
        this.personX = personX;
    }

    public float getPersonY() {
        return personY;
    }

    public void setPersonY(float personY) {
        this.personY = personY;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "HistoryView{" +
                "personId='" + personId + '\'' +
                ", personName='" + personName + '\'' +
                ", personX=" + personX +
                ", personY=" + personY +
                ", roomId='" + roomId + '\'' +
                ", date=" + date +
                '}';
    }
}
