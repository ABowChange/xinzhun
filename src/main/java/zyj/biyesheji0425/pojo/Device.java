package zyj.biyesheji0425.pojo;

public class Device {
    private String deviceId;

    private Float deviceX;

    private Float deviceY;

    private String roomId;

    private Integer deviceState;

    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId == null ? null : deviceId.trim();
    }

    public Float getDeviceX() {
        return deviceX;
    }

    public void setDeviceX(Float deviceX) {
        this.deviceX = deviceX;
    }

    public Float getDeviceY() {
        return deviceY;
    }

    public void setDeviceY(Float deviceY) {
        this.deviceY = deviceY;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId == null ? null : roomId.trim();
    }

    public Integer getDeviceState() {
        return deviceState;
    }

    public void setDeviceState(Integer deviceState) {
        this.deviceState = deviceState;
    }
}