package zyj.biyesheji0425.mapper;

import zyj.biyesheji0425.pojo.Bluetooth;

public interface BluetoothMapper {
    int deleteByPrimaryKey(String bluetoothId);

    int insert(Bluetooth record);

    int insertSelective(Bluetooth record);

    Bluetooth selectByPrimaryKey(String bluetoothId);

    int updateByPrimaryKeySelective(Bluetooth record);

    int updateByPrimaryKey(Bluetooth record);
}