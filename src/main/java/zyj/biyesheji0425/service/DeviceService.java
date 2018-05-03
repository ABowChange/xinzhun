package zyj.biyesheji0425.service;

import zyj.biyesheji0425.mapper.DeviceMapper;
import zyj.biyesheji0425.pojo.Device;

import java.util.List;

public interface DeviceService {
    List<DeviceMapper> allDevice();
    int delectDevice(String jsonString);
    Device selectDeviceById(String device);
    List<Device> selectDeviceByState(String device);
    int insertDevice(String jsonString);
    int updateDevice(String jsonString);
}
