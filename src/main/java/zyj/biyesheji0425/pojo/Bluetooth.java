package zyj.biyesheji0425.pojo;

public class Bluetooth {
    private String bluetoothId;

    private String personId;

    private Integer bluetoothState;

    public String getBluetoothId() {
        return bluetoothId;
    }

    public void setBluetoothId(String bluetoothId) {
        this.bluetoothId = bluetoothId == null ? null : bluetoothId.trim();
    }

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId == null ? null : personId.trim();
    }

    public Integer getBluetoothState() {
        return bluetoothState;
    }

    public void setBluetoothState(Integer bluetoothState) {
        this.bluetoothState = bluetoothState;
    }
}